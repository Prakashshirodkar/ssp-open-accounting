unit CCDCForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxExEdtr, ElCaption, DBActns, ActnList, dxBar,
  dxLayoutLookAndFeels, dxLayoutControl, dxCntner, dxEdLib, dxTL, dxDBCtrl,
  dxDBGrid, ElXPThemedControl, ElBtnCtl, ElPopBtn, cxControls,dxTreeGridMenus;

type
  TCCDCFrm = class(TForm)
    dxLayoutControl1: TdxLayoutControl;
    btnIns: TElPopupButton;
    btnEdit: TElPopupButton;
    btnDel: TElPopupButton;
    btnHelp: TElPopupButton;
    btnClose: TElPopupButton;
    dxDBGrid1: TdxDBGrid;
    chkAutoHeight: TdxCheckEdit;
    btnRefresh: TElPopupButton;
    dxLayoutGroup1: TdxLayoutGroup;
    dxLayoutItem1: TdxLayoutItem;
    dxLayoutGroup2: TdxLayoutGroup;
    lciIns: TdxLayoutItem;
    lciDel: TdxLayoutItem;
    lciEdit: TdxLayoutItem;
    dxLayoutControl1Item2: TdxLayoutItem;
    dxLayoutControl1Item5: TdxLayoutItem;
    dxLayoutControl1Item6: TdxLayoutItem;
    dxLayoutControl1Item7: TdxLayoutItem;
    dxLayoutLookAndFeelList1: TdxLayoutLookAndFeelList;
    dxLayoutStandardLookAndFeel1: TdxLayoutStandardLookAndFeel;
    dxBarManager1: TdxBarManager;
    dxBarButton8: TdxBarButton;
    dxBarButton9: TdxBarButton;
    dxBarButton10: TdxBarButton;
    dxBarButton11: TdxBarButton;
    dxBarButton1: TdxBarButton;
    dxBarButton2: TdxBarButton;
    bbtnReadExcel: TdxBarButton;
    pmAsset: TdxBarPopupMenu;
    ActionList1: TActionList;
    acExcel: TAction;
    acHTML: TAction;
    acXML: TAction;
    acGenAmor: TAction;
    acDelete: TDataSetDelete;
    ElFormCaption1: TElFormCaption;
    dxDBGrid1OBJECT_ID: TdxDBGridColumn;
    dxDBGrid1OBJECT_NAME: TdxDBGridColumn;
    dxDBGrid1OBJECT_STATUS: TdxDBGridColumn;
    dxDBGrid1ACCOUNT_ID: TdxDBGridColumn;
    dxDBGrid1ALLOCATE_ACC: TdxDBGridColumn;
    dxDBGrid1AMORTISE_ACC: TdxDBGridColumn;
    dxDBGrid1NGUYENGIA: TdxDBGridColumn;
    dxDBGrid1HAOMON: TdxDBGridColumn;
    dxDBGrid1AMOR_VALUE: TdxDBGridColumn;
    dxDBGrid1USING_LIFE: TdxDBGridColumn;
    dxDBGrid1GTCL: TdxDBGridColumn;
    dxDBGrid1USEOBJECT_ID: TdxDBGridColumn;
    dxDBGrid1USEOBJECT_DETAIL: TdxDBGridColumn;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure dxDBGrid1DblClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnInsClick(Sender: TObject);
    procedure dxDBGrid1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnCloseClick(Sender: TObject);
    procedure bbtnReadExcelClick(Sender: TObject);
    procedure acExcelExecute(Sender: TObject);
    procedure acHTMLExecute(Sender: TObject);
    procedure acXMLExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CCDCFrm: TCCDCFrm;

implementation
 uses MainForm, MainDataMdl, AssetForm, GlobalUnit, LookupFrm,
  AssetHistoryForm, HtmlHlp, CCDCinf;
{$R *.dfm}

procedure TCCDCFrm.FormActivate(Sender: TObject);
begin
MainFrm.ElFormCaption1.Texts[2].Caption:=' - ' + ElFormCaption1.Texts[0].Caption;
end;

procedure TCCDCFrm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  MainDM.qryDTPBList.Close;
  MainFrm.ElFormCaption1.Texts[2].Caption:='';
  Action :=caFree;
end;

procedure TCCDCFrm.FormCreate(Sender: TObject);
begin
dxLayoutControl1.BeginUpdate;
  SetOnFormCreate(Self);
  dxLayoutControl1.EndUpdate;

  btnIns.Enabled := SSPUserRight[3].IR ;
  btnDel.Enabled := SSPUserRight[3].DR ;
  acGenAmor.Enabled:=SSPUserRight[3].ER;
  bbtnReadExcel.Enabled:=btnIns.Enabled and (CurrentPeriod=BeginPeriod);

  dxDBGrid1NGUYENGIA.SummaryFooterFormat:=TIENTE_FORMAT;
  dxDBGrid1HAOMON.SummaryFooterFormat:=TIENTE_FORMAT;
  dxDBGrid1GTCL.SummaryFooterFormat:=TIENTE_FORMAT;


  MainFrm.bbWindowList.Items.AddObject(ElFormCaption1.Texts[0].Caption, Self);
  MainFrm.ElFormCaption1.Texts[2].Caption:=' - ' + ElFormCaption1.Texts[0].Caption;
  MainFrm.MyMDIChildCount:= MainFrm.MyMDIChildCount+1;

 // tradtt: truyen tham so vao, sua loi 1711 - khong len nguyen gia, hao mon, gtcl
  MainDM.qryDTPBList.Prepare;
  MainDM.qryDTPBList.ParamByName('period_id').Value:= CurrentPeriod;
  MainDM.qryDTPBList.ParamByName('branch_id').Value:= vpBranch_id;

  MainDM.qryDTPBList.Open;
end;

procedure TCCDCFrm.FormDestroy(Sender: TObject);
begin
 with MainFrm.bbWindowList.Items do
    Delete(IndexOfObject(Self));
  with MainFrm do
    MyMDIChildCount:= MyMDIChildCount-1;
  CCDCFrm:=nil;
end;

procedure TCCDCFrm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key=VK_F1 then
    if HtmlHelp(Self.handle,'HDSDKT.chm::/Thaotacthuongdung.htm',HH_DISPLAY_TOPIC,0)=0 then
      ShowMessageUnicode(182);
  if Key=VK_F11 then
    CallErrorForm(Self.Name);
  if Key=VK_F10 then
    LoadCaptionFormInfo(Self);
end;

procedure TCCDCFrm.FormShow(Sender: TObject);
begin

 SetVisible(Self);
end;

procedure TCCDCFrm.dxDBGrid1DblClick(Sender: TObject);
begin
  btnEditClick(sender);
end;
procedure TCCDCFrm.btnEditClick(Sender: TObject);
begin
  if MainDM.qryDTPBList.RecordCount=0 then exit;
  DTPB_ID:=MainDM.qryDTPBListOBJECT_ID.Value;
  DTPB_OTYPE_ID:=MainDM.qryDTPBListOTYPE_ID.Value;
  with TCCDCINFFrm.Create(Self) do
  try
      ShowModal

  finally
    MainDM.qryDTPBList.Refresh;
    free;
  end;
end;

procedure TCCDCFrm.btnInsClick(Sender: TObject);
begin
  DTPB_ID:='';
  DTPB_OTYPE_ID := 0;
  AssetAccountID:='';
  AssetDocInID:='';
  AssetDocInDate:=WorkingDate;

  with TCCDCINFFrm.Create(Self) do
  try
      ShowModal;
      MainDM.qryDTPBList.Refresh;
  finally
    free;
  end;
end;

procedure TCCDCFrm.dxDBGrid1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button <> mbRight then exit;
  if TdxPopupMenuManager.Instance(TRUE).ShowGridPopupMenu(TdxDBGrid(Sender)) then exit;

  pmAsset.PopupFromCursorPos;
end;

procedure TCCDCFrm.btnCloseClick(Sender: TObject);
begin
  self.close;
end;

procedure TCCDCFrm.bbtnReadExcelClick(Sender: TObject);
begin
  if ShowMessageUnicode(264,'',4)=6 then
    MainDM.ImportCCDCFromExcel;
end;

procedure TCCDCFrm.acExcelExecute(Sender: TObject);
begin
  ExportToExcel(dxDBGrid1);
end;

procedure TCCDCFrm.acHTMLExecute(Sender: TObject);
begin
  ExportToHTML(dxDBGrid1);
end;

procedure TCCDCFrm.acXMLExecute(Sender: TObject);
begin
  ExportToXML(dxDBGrid1);
end;

end.
