unit DefRptTHKQHDKDFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,  
  Dialogs, dxLayoutLookAndFeels, dxLayoutControl, dxCntner, dxTL, dxDBCtrl,
  dxDBTL, cxControls, dxEditor, dxEdLib, dxDBELib, dxExEdtr, StdCtrls,
  Buttons, dxDBGrid, ExtCtrls, Forms, ElCaption, DBActns,
  ActnList, ElXPThemedControl, ElBtnCtl, ElPopBtn, DB, IBODataset ;

type
  TFrmDefRptTHKQHD = class(TForm)
    locFormGroup_Root: TdxLayoutGroup;
    locForm: TdxLayoutControl;
    dxDBGrid1: TdxDBGrid;
    locFormItem1: TdxLayoutItem;
    dxLayoutLookAndFeelList1: TdxLayoutLookAndFeelList;
    dxLayoutStandardLookAndFeel1: TdxLayoutStandardLookAndFeel;
    dxDBGrid1CHITIEU: TdxDBGridMaskColumn;
    dxDBGrid1MASO: TdxDBGridMaskColumn;
    ElFormCaption1: TElFormCaption;
    locFormItem5: TdxLayoutItem;
    btnDefine: TElPopupButton;
    locFormItem6: TdxLayoutItem;
    TntBitBtn5: TElPopupButton;
    locFormItem7: TdxLayoutItem;
    TntBitBtn6: TElPopupButton;
    locFormGroup1: TdxLayoutGroup;
    dxDBGrid1ID: TdxDBGridColumn;
    dxDBGrid1THANG_2: TdxDBGridColumn;
    dxDBGrid1THANG_1: TdxDBGridColumn;
    dxDBGrid1LUYKE: TdxDBGridColumn;
    dxDBGrid1LOAICHITIEU: TdxDBGridColumn;
    dxDBGrid1THANG_3: TdxDBGridColumn;
    dxDBGrid1THANG_4: TdxDBGridColumn;
    dxDBGrid1THANG_5: TdxDBGridColumn;
    dxDBGrid1Column12: TdxDBGridColumn;
    dxDBGrid1Column13: TdxDBGridColumn;
    dxDBGrid1Column14: TdxDBGridColumn;
    dxDBGrid1Column15: TdxDBGridColumn;
    dxDBGrid1Column16: TdxDBGridColumn;
    qrDefTongHopKQKD: TIBOQuery;
    dsDefTongHopKQKD: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dxDBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dxDBGrid1ChangeNode(Sender: TObject; OldNode,
      Node: TdxTreeListNode);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TntBitBtn5Click(Sender: TObject);
    procedure dxDBGrid1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnDefineClick(Sender: TObject);
    procedure dxDBGrid1DblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmDefRptTHKQHD: TFrmDefRptTHKQHD;

implementation

uses GlobalInterface, MainDataMdl, GlobalUnit, LookupFrm,
  dxTreeGridMenus, DK_THKQHDKDFrm, HtmlHlp;


{$R *.dfm}

procedure TFrmDefRptTHKQHD.FormCreate(Sender: TObject);
begin
  SetOnFormCreate(Sender as TControl);
  try
    qrDefTongHopKQKD.Open;
  except
    ShowMessageUnicode(101);
    exit;
  end;
end;

procedure TFrmDefRptTHKQHD.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with qrDefTongHopKQKD do
  begin
    if State in [dsInsert,dsEdit] then
      Post;
    close;
  end;
end;

procedure TFrmDefRptTHKQHD.dxDBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if ((Key=VK_Return) and (btnDefine.Enabled)) then
    btnDefineClick(Sender)
  else
    ProcessKeyDownInGrid(dxDBGrid1, Key, Shift,False);
end;

procedure TFrmDefRptTHKQHD.dxDBGrid1ChangeNode(Sender: TObject; OldNode,
  Node: TdxTreeListNode);
begin
  btnDefine.Enabled:=(qrDefTongHopKQKD.fieldByName('LOAICHITIEU').AsInteger=1);
end;

procedure TFrmDefRptTHKQHD.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=VK_F1 then
    if HtmlHelp(Self.handle,'HDSDKT.chm::/KetquahoatdongKD.htm',HH_DISPLAY_TOPIC,0)=0 then
      ShowMessageUnicode(182);
  if Key=VK_F11 then
    CallErrorForm(Self.Name);
  if Key=VK_F10 then
    LoadCaptionFormInfo(Self);
end;

procedure TFrmDefRptTHKQHD.TntBitBtn5Click(Sender: TObject);
begin
  if HtmlHelp(Self.handle,'HDSDKT.chm::/KetquahoatdongKD.htm',HH_DISPLAY_TOPIC,0)=0 then
    ShowMessageUnicode(182);
//  Application.HelpContext(10);
end;

procedure TFrmDefRptTHKQHD.dxDBGrid1MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbRight then
    TdxPopupMenuManager.Instance(TRUE).ShowGridPopupMenu(TdxDBGrid(Sender));
end;

procedure TFrmDefRptTHKQHD.btnDefineClick(Sender: TObject);
begin
  with TFrmDK_THKQHDKD.Create(Self, qrDefTongHopKQKD.fieldbyname('ID').AsInteger) do
  try
    ShowModal;
  finally
    Free;
  end;
end;

procedure TFrmDefRptTHKQHD.dxDBGrid1DblClick(Sender: TObject);
begin
  if btnDefine.Enabled then
    btnDefineClick(Sender);
end;

procedure TFrmDefRptTHKQHD.FormShow(Sender: TObject);
begin
  SetVisible(Self);
end;

end.
