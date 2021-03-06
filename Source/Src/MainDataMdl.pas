unit MainDataMdl;

interface

uses
  Windows, SysUtils, Variants, Classes, DB, IBCustomDataSet, IBDatabase, Controls,
  IB_Components, IBODataset, Dialogs, ppEndUsr, ppProd, ppClass,StrUtils,
  ppReport, ppComm, ppRelatv, ppDB, ppDBPipe, ppBands, ppCache, ppModule, Forms,
  ppVar, ppStrtch, ppSubRpt, ppCtrls, ppPrnabl, ppRegion,Registry,
  ActnList, IB_Process, IB_Script, IB_Dialogs, IB_Events,XLSReadWriteII,
  ImgList, DBActns, IdBaseComponent, IdComponent, IdTCPConnection,ExtActns,
  IdTCPClient, IdTelnet,
  //LicenseEngine,
  Graphics,
  IB_SyncCursor, IB_DataScan, IB_DataPump, IB_Monitor,dxdbctrl,dxtl,dxdbelib;
const
  Select_Log='SELECT LOG_ID, USER_ID, TIME_POINT, DOC_ID, PERIOD_ID, LOG_CONTENT, BRANCH_ID FROM DOC_LOG';
type

  TMainDM = class(TDataModule)
    cnMain: TIB_Connection;
    tsList: TIB_Transaction;
    qryWarehouse: TIBOQuery;
    dsWarehouse: TDataSource;
    qryHSCT: TIBOQuery;
    dsHSCT: TDataSource;
    qryHSCTLOGO: TBlobField;
    qryPAcc: TIBOQuery;
    dsPAcc: TDataSource;
    qryDocList: TIBOQuery;
    DsDocList: TDataSource;
    qryDocListDOC_DATE: TDateField;
    tsPopup: TIB_Transaction;
    tsMain: TIB_Transaction;
    qryAssetList: TIBOQuery;
    dsAssetList: TDataSource;
    qryRegTransfer: TIBOQuery;
    dsRegTransfer: TDataSource;
    qryRegAllocate: TIBOQuery;
    dsRegAllocate: TDataSource;
    qryPWare: TIBOQuery;
    dsPWare: TDataSource;
    SaveDlg: TSaveDialog;
    qryAccountArise: TIBOQuery;
    dsAccountArise: TDataSource;
    tsMain_2: TIB_Transaction;
    ActionList1: TActionList;
    qryGenDocNo: TIBOQuery;
    dsInstock: TDataSource;
    qryInstock: TIBOQuery;
    dsParams: TDataSource;
    acFormatData: TAction;
    qryRegKCLL: TIBOQuery;
    dsRegKCLL: TDataSource;
    dplHSCT: TppDBPipeline;
    qryDocListAnyWhere: TIBOQuery;
    dsDocListAnyWhere: TDataSource;
    qryRegForBills: TIBOQuery;
    dsRegForBills: TDataSource;
    qryPDocType: TIBOQuery;
    dsPDocType: TDataSource;
    qryProductInfo: TIBOQuery;
    dsProductInfo: TDataSource;
    qryDocListDOCTYPE_ID: TIntegerField;
    qryUser: TIBOQuery;
    dsUser: TDataSource;
    qryUserLAST_ACCESS: TDateTimeField;
    qryUserACCESSCOUNT: TIntegerField;
    qryUserRight: TIBOQuery;
    qryUserRightMODUL_ID: TSmallintField;
    qryUserRightALLOWREAD: TSmallintField;
    qryUserRightALLOWINSERT: TSmallintField;
    qryUserRightALLOWEDIT: TSmallintField;
    qryUserRightALLOWDELETE: TSmallintField;
    qryProductInfoTongcong: TFloatField;
    qryProductInfoCPNC: TFloatField;
    qryProductInfoCPNVL: TFloatField;
    qryProductInfoCPSXC: TFloatField;
    acUnlockData: TAction;
    qryEntrys: TIBOQuery;
    dsEntrys: TDataSource;
    qryEntrysNGAYLAP: TDateField;
    acLoadUserRight: TAction;
    qryObjectType: TIBOQuery;
    dsObjectType: TDataSource;
    qryObject: TIBOQuery;
    dsObject: TDataSource;
    qryObjectOTYPE_ID: TSmallintField;
    qryObjectOBJECT_STATUS: TSmallintField;
    qryCurrency: TIBOQuery;
    dsCurrency: TDataSource;
    qryBeginObj: TIBOQuery;
    dsBeginObj: TDataSource;
    qryRate: TIBOQuery;
    dsRate: TDataSource;
    qryRateTIME_POINT: TDateTimeField;
    qryRateEXCHANGERATE: TIBOFloatField;
    qryBeginObjOTYPE_ID: TSmallintField;
    qryProductInfoMALOAI: TSmallintField;
    dsBanana: TDataSource;
    qryAssetListOBJECT_STATUS: TSmallintField;
    qryAssetListOTYPE_ID: TSmallintField;
    tsTemplate: TIB_Transaction;
    tsMDIChild: TIB_Transaction;
    qryPCurrency: TIBOQuery;
    dsPCurrency: TDataSource;
    dsTemplateList: TDataSource;
    qryTemplateList: TIBOQuery;
    qryTemplateListTEMPLATE_TYPE: TIntegerField;
    qryRegForBillsLOAIPBH: TIntegerField;
    qryRegForBillsLOAIPXK: TIntegerField;
    qryUpdLoaiPhieu: TIBOQuery;
    qryTemplateListNHAPGIACOTHUE: TSmallintField;
    qryTemplateListHACHTOANNT: TSmallintField;
    qryDinhkhoan: TIBOQuery;
    dsDinhkhoan: TDataSource;
    qryDocListTEMPLATE_ID: TIntegerField;
    qryPDocTypeDOCTYPE_ID: TIntegerField;
    qryGenDocNoDOC_ID: TWideStringField;
    qryTemplateListTEMPLATE_ID: TIntegerField;
    acCalThanhtien: TAction;
    qryDefRptLCTT: TIBOQuery;
    dsDefRptLCTT: TDataSource;
    qryDefRptLCTTID: TIntegerField;
    qryDefRptLCTTSTATUSFLAG: TSmallintField;
    qryDefRptLCTTLOAILUUCHUYEN: TSmallintField;
    dsDefRptBCDKT: TDataSource;
    qryDefRptBCDKT: TIBOQuery;
    qryDefRptKQHDKDB: TIBOQuery;
    dsDefRptKQHDKDB: TDataSource;
    qryDefRptKQHDKDBID: TIntegerField;
    qryDefRptKQHDKDBSTATUSFLAG: TSmallintField;
    qryAriseNT: TIBOQuery;
    dsAriseNT: TDataSource;
    qryBeginFBal: TIBOQuery;
    dsBeginFBal: TDataSource;
    qryDocListPERIOD_ID: TSmallintField;
    qryBeginFBalPERIOD_ID: TSmallintField;
    qryProductInfoPERIOD_ID: TSmallintField;
    qryInstockPERIOD_ID: TSmallintField;
    qryBeginObjPERIOD_ID: TSmallintField;
    qryGiaBan: TIBOQuery;
    qryGiaBanPERIOD_ID: TSmallintField;
    qryGiaMua: TIBOQuery;
    qryGiaMuaPERIOD_ID: TSmallintField;
    qryMsg: TIBOQuery;
    qryMsgMESSAGE_ID: TIntegerField;
    qryTemplateListSHOTCUT_ID: TSmallintField;
    qryTemplateListKEY_VALUE: TSmallintField;
    qryTemplateListISSHIFT: TSmallintField;
    qryTemplateListISCTRL: TSmallintField;
    acFilterNormalAcc: TAction;
    qryTableList: TIBOQuery;
    qryFieldList: TIBOQuery;
    dsTableList: TDataSource;
    SaveBackupInfo: TSaveDialog;
    acBackupData: TAction;
    qryHSCTFULLNAME: TWideStringField;
    qryHSCTSHORTNAME: TWideStringField;
    qryHSCTTAXCODE: TWideStringField;
    qryHSCTTRADETYPE: TWideStringField;
    qryHSCTTRADEFIELD: TWideStringField;
    qryHSCTADDRESS: TWideStringField;
    qryHSCTEMAL: TWideStringField;
    qryHSCTWEBSITE: TWideStringField;
    qryHSCTDIRECTOR: TWideStringField;
    qryHSCTACCT_MANAGER: TWideStringField;
    qryHSCTCASHIER: TWideStringField;
    qryHSCTSTOREKEEPER: TWideStringField;
    qryHSCTOWNER_NAME: TWideStringField;
    qryHSCTFAXNUMBER: TWideStringField;
    qryHSCTTELPHONE: TWideStringField;
    qryPCurrencyCURRENCY_ID: TWideStringField;
    qryPCurrencyCURRENCY_NAME: TWideStringField;
    qryAriseNTSHTK: TWideStringField;
    qryAriseNTTENTK: TWideStringField;
    qryAriseNTCURRENCY_ID: TWideStringField;
    qryObjectOBJECT_ID: TWideStringField;
    qryObjectOBJECT_NAME: TWideStringField;
    qryObjectOTHER_NAME: TWideStringField;
    qryObjectSUBINFO_1: TWideStringField;
    qryObjectSUBINFO_2: TWideStringField;
    qryObjectOBJECT_NOTES: TWideStringField;
    qryDocListDOC_ID: TWideStringField;
    qryDocListDOC_PERSON: TWideStringField;
    qryDocListDOC_NOTES: TWideStringField;
    qryDocListOBJECT_NAME: TWideStringField;
    qryDocListOBJECT_ID: TWideStringField;
    qryDocListHASTEMPLATE: TWideStringField;
    qryAccountAriseSHTK: TWideStringField;
    qryAccountAriseTENTK: TWideStringField;
    qryWarehouseWAREHOUSE_ID: TWideStringField;
    qryWarehouseWAREHOUSE_NAME: TWideStringField;
    qryWarehouseWAREHOUSE_ADDR: TWideStringField;
    qryCurrencyCURRENCY_ID: TWideStringField;
    qryCurrencyCURRENCY_NAME: TWideStringField;
    qryRateCURRENCY_ID: TWideStringField;
    qryRegKCLLFROM_ACCOUNT: TWideStringField;
    qryRegKCLLTO_ACCOUNT: TWideStringField;
    qryRegKCLLLAILO_NOTE: TWideStringField;
    qryRegTransferFROM_ACCOUNT: TWideStringField;
    qryRegTransferTO_ACCOUNT: TWideStringField;
    qryRegTransferTRANSFER_NOTE: TWideStringField;
    qryRegAllocateFROM_ACCOUNT: TWideStringField;
    qryRegAllocateTO_ACCOUNT: TWideStringField;
    qryRegAllocateALLOCATE_NOTE: TWideStringField;
    qryRegForBillsTENLOAIPBH: TWideStringField;
    qryRegForBillsTENLOAIPXK: TWideStringField;
    qryEntrysMADTCO: TWideStringField;
    qryEntrysMADTNO: TWideStringField;
    qryEntrysNOIDUNG: TWideStringField;
    qryEntrysSOPHIEU: TWideStringField;
    qryEntrysTENDTCO: TWideStringField;
    qryEntrysTENDTNO: TWideStringField;
    qryEntrysTKCO: TWideStringField;
    qryEntrysTKNO: TWideStringField;
    qryBeginFBalACCOUNT_ID: TWideStringField;
    qryBeginFBalCURRENCY_ID: TWideStringField;
    qryBeginFBalACCOUNT_NAME: TWideStringField;
    qryAssetListOBJECT_ID: TWideStringField;
    qryAssetListOBJECT_NAME: TWideStringField;
    qryAssetListOTHER_NAME: TWideStringField;
    qryAssetListOBJECT_NOTES: TWideStringField;
    qryAssetListGROUP_ID: TWideStringField;
    qryAssetListACCOUNT_ID: TWideStringField;
    qryAssetListALLOCATE_ACC: TWideStringField;
    qryAssetListAMORTISE_ACC: TWideStringField;
    qryProductInfoPRODUCTION_ID: TWideStringField;
    qryProductInfoOBJECT_NAME: TWideStringField;
    qryProductInfoMAPX: TWideStringField;
    qryInstockACCOUNT_ID: TWideStringField;
    qryInstockWAREHOUSE_ID: TWideStringField;
    qryInstockOBJECT_NAME: TWideStringField;
    qryBeginObjOBJECT_ID: TWideStringField;
    qryBeginObjACCOUNT_ID: TWideStringField;
    qryBeginObjOBJECT_NAME: TWideStringField;
    qryUserUSER_NAME: TWideStringField;
    qryUserFULL_NAME: TWideStringField;
    qryTemplateListTEMPLATE_NAME: TWideStringField;
    qryTemplateListWAREHOUSE_ID: TWideStringField;
    qryTemplateListTEMPLATE_PERSON: TWideStringField;
    qryTemplateListTEMPLATE_ADDR: TWideStringField;
    qryTemplateListTEMPLATE_VOUCHER: TWideStringField;
    qryTemplateListTEMPLATE_NOTES: TWideStringField;
    qryTemplateListTKNO: TWideStringField;
    qryTemplateListTKCO: TWideStringField;
    qryTemplateListTKVAT: TWideStringField;
    qryTemplateListSHOTCUT_NAME: TWideStringField;
    qryPWareWAREHOUSE_ID: TWideStringField;
    qryPWareWAREHOUSE_NAME: TWideStringField;
    qryPWareWAREHOUSE_ADDR: TWideStringField;
    qryPDocTypeDOCTYPE_NAME: TWideStringField;
    qryFieldListTENFIELD: TWideStringField;
    qryDefRptLCTTCHITIEU: TWideStringField;
    qryDefRptLCTTMASO: TWideStringField;
    qryDefRptKQHDKDBCHITIEU: TWideStringField;
    qryDefRptKQHDKDBMASO: TWideStringField;
    qryDefRptKQHDKDBTAIKHOAN: TWideStringField;
    qryPCurrencyTYGIAHT: TIBOFloatField;
    qryGiaKH: TIBOQuery;
    qryGiaKHPERIOD_ID: TSmallintField;
    qryGetDoc: TIBOQuery;
    qryGetDocDOCTYPE_ID: TSmallintField;
    qryGetDocDOC_ID: TWideStringField;
    qryGetDocPERIOD_ID: TSmallintField;
    qryDocLog: TIBOQuery;
    dsDocLog: TDataSource;
    qryRateKF: TWideStringField;
    qryBeginFBalKEYFIELD: TWideStringField;
    qryDocLogLOG_ID: TIntegerField;
    qryDocLogUSER_ID: TWideStringField;
    qryDocLogTIME_POINT: TDateTimeField;
    qryDocLogDOC_ID: TWideStringField;
    qryDocLogPERIOD_ID: TSmallintField;
    qryInstockBEGIN_AMOUNT: TIBOFloatField;
    qryProductInfoPRODUCTION_AMOUNT: TIBOFloatField;
    qryTonkho: TIBOQuery;
    qryTonkhoSLTON: TIBOFloatField;
    qryPTyGia: TIBOQuery;
    dsPTyGia: TDataSource;
    qryPTyGiaTIME_POINT: TDateTimeField;
    qryPTyGiaEXCHANGERATE: TIBOFloatField;
    qryAssetListUSEOBJECT_ID: TWideStringField;
    qryAriseNTNODK: TIBOFloatField;
    qryAriseNTCODK: TIBOFloatField;
    qryAriseNTNOPS: TIBOFloatField;
    qryAriseNTCOPS: TIBOFloatField;
    qryAriseNTNOCK: TIBOFloatField;
    qryAriseNTCOCK: TIBOFloatField;
    qryDocListDOC_TOTAL: TIBOFloatField;
    qryAccountAriseNODK: TIBOFloatField;
    qryAccountAriseCODK: TIBOFloatField;
    qryAccountAriseNOPS: TIBOFloatField;
    qryAccountAriseCOPS: TIBOFloatField;
    qryAccountAriseNOCK: TIBOFloatField;
    qryAccountAriseCOCK: TIBOFloatField;
    qryEntrysSOTIEN: TIBOFloatField;
    qryBeginFBalBEGIN_DEBIT: TIBOFloatField;
    qryBeginFBalBEGIN_CREDIT: TIBOFloatField;
    qryAssetListNGUYENGIA: TIBOFloatField;
    qryAssetListHAOMON: TIBOFloatField;
    qryAssetListAMOR_VALUE: TIBOFloatField;
    qryAssetListGTCL: TIBOFloatField;
    qryTonkhoGTTON: TIBOFloatField;
    qryGiaKHPLANPRICE: TIBOFloatField;
    qryProductInfoLABOUR_COST: TIBOFloatField;
    qryProductInfoMATERIAL_COST: TIBOFloatField;
    qryProductInfoOTHER_COST: TIBOFloatField;
    qryProductInfoINPLANVALUE: TIBOFloatField;
    qryInstockBEGIN_VALUE: TIBOFloatField;
    qryBeginObjBEGIN_DEBIT: TIBOFloatField;
    qryBeginObjBEGIN_CREDIT: TIBOFloatField;
    qryRegKCLLDOANHTHU: TIBOFloatField;
    qryRegKCLLCHIPHI: TIBOFloatField;
    qryDefRptKQHDKDBSODK: TIBOFloatField;
    qryDefRptKQHDKDBSOPN: TIBOFloatField;
    qryDefRptKQHDKDBSODN: TIBOFloatField;
    qryDefRptKQHDKDBLKPN: TIBOFloatField;
    qryDefRptKQHDKDBLKDN: TIBOFloatField;
    qryDefRptKQHDKDBSOCK: TIBOFloatField;
    qryDefRptLCTTKYNAY: TIBOFloatField;
    qryDefRptLCTTKYTRUOC: TIBOFloatField;
    qryGiaBanSALEPRICE: TIBOFloatField;
    qryGiaBanSALE_MIN: TIBOFloatField;
    qryGiaBanSALE_MAX: TIBOFloatField;
    qryGiaMuaBUYPRICE: TIBOFloatField;
    qryGiaMuaBUY_MIN: TIBOFloatField;
    qryGiaMuaBUY_MAX: TIBOFloatField;
    qryProductInfoGIATHANHDV: TFloatField;
    tsDefault: TIB_Transaction;
    qryInvoiceList: TIBOQuery;
    dsInvoiceList: TDataSource;
    qryInvoiceListDOC_ID: TWideStringField;
    qryInvoiceListENTRY_ID: TSmallintField;
    qryInvoiceListPERIOD_ID: TSmallintField;
    qryInvoiceListSERIAL_NO: TWideStringField;
    qryInvoiceListINVOICE_NO: TWideStringField;
    qryInvoiceListINVOICE_DATE: TDateField;
    qryInvoiceListCUSNAME: TWideStringField;
    qryInvoiceListCUSADDR: TWideStringField;
    qryInvoiceListNOTTAX_VALUE: TIBOFloatField;
    qryInvoiceListTAX_VALUE: TIBOFloatField;
    qryInvoiceListMAUSO: TWideStringField;
    qryInvoiceListITEM_AMOUNT: TIBOFloatField;
    qryPAccACCOUNT_ID: TWideStringField;
    qryPAccPACCOUNT_ID: TWideStringField;
    qryPAccACCOUNT_NAME: TWideStringField;
    qryPAccOTYPE_ID: TSmallintField;
    qryPAccACCOUNT_TAG: TSmallintField;
    qryPAccBALANCE_TYPE: TSmallintField;
    qryPAccISMIN: TSmallintField;
    qryPAccISSELECT: TSmallintField;
    qryDinhkhoanDOC_ID: TWideStringField;
    qryDinhkhoanENTRY_ID: TSmallintField;
    qryDinhkhoanPERIOD_ID: TSmallintField;
    qryDinhkhoanDEBIT_ACC: TWideStringField;
    qryDinhkhoanCREDIT_ACC: TWideStringField;
    qryDinhkhoanDEBIT_OBJ: TWideStringField;
    qryDinhkhoanDEBIT_TYPE: TSmallintField;
    qryDinhkhoanCREDIT_OBJ: TWideStringField;
    qryDinhkhoanCREDIT_TYPE: TSmallintField;
    qryDinhkhoanENTRY_AMOUNT: TIBOFloatField;
    qryDinhkhoanENTRY_PRICE: TIBOFloatField;
    qryDinhkhoanENTRY_VALUE: TIBOFloatField;
    qryDinhkhoanCURRENCY_ID: TWideStringField;
    qryDinhkhoanTYGIANT: TIBOFloatField;
    qryDinhkhoanENTRY_NOTE: TWideStringField;
    qryDinhkhoanNGUOINHAP: TWideStringField;
    qryInvoiceListLOAIHD: TSmallintField;
    qryPDocTypePDOC_TYPE: TSmallintField;
    qryMsgList: TIBOQuery;
    dsMsgList: TDataSource;
    qryPComObj: TIBOQuery;
    dsPComObj: TDataSource;
    qryObjType: TIBOQuery;
    qryPComObjOBJECT_ID: TWideStringField;
    qryPComObjOTYPE_ID: TSmallintField;
    qryPComObjOBJECT_NAME: TWideStringField;
    qryPComObjOTHER_NAME: TWideStringField;
    qryPComObjSUBINFO_1: TWideStringField;
    qryPComObjSUBINFO_2: TWideStringField;
    qryPComObjOBJECT_NOTES: TWideStringField;
    qryPComObjOBJECT_STATUS: TSmallintField;
    qryObjTypeOTYPE_ID: TSmallintField;
    qryObjTypeOTYPE_NAME: TWideStringField;
    qryObjTypeID_CAPTION: TWideStringField;
    qryObjTypeNAME_CAPTION: TWideStringField;
    qryObjTypeOTHER_CAPTION: TWideStringField;
    qryObjTypeSUB1_CAPTION: TWideStringField;
    qryObjTypeSUB2_CAPTION: TWideStringField;
    qryObjTypeNOTE_CAPTION: TWideStringField;
    qryObjTypeOTYPE_NOTE: TWideStringField;
    dsObjType: TDataSource;
    qryPObjGrp: TIBOQuery;
    dsPObjGrp: TDataSource;
    qryPObjGrpOBJGRP_ID: TWideStringField;
    qryPObjGrpOTYPE_ID: TSmallintField;
    qryPObjGrpOBJGRP_NAME: TWideStringField;
    qryObjectOBJGRP_ID: TWideStringField;
    qryObjectOACCOUNT_ID: TWideStringField;
    qryPComObjOBJGRP_NAME: TWideStringField;
    qryPComObjOBJGRP_ID: TWideStringField;
    qryInvoiceListOBJECT_ID: TWideStringField;
    qryInvoiceListOTYPE_ID: TSmallintField;
    qryInstockOBJECT_ID: TWideStringField;
    qryInstockOTYPE_ID: TSmallintField;
    qryGiaBanOBJECT_ID: TWideStringField;
    qryGiaBanOTYPE_ID: TSmallintField;
    qryGiaMuaOBJECT_ID: TWideStringField;
    qryGiaMuaOTYPE_ID: TSmallintField;
    qryGiaKHOBJECT_ID: TWideStringField;
    qryGiaKHOTYPE_ID: TSmallintField;
    qryObjTypeSHORT_NAME: TWideStringField;
    qryTemplateListISALT: TSmallintField;
    qryTemplateListCTMOTNO: TSmallintField;
    qryObjectDEBT_LEN: TSmallintField;
    qryPComObjDEBT_LEN: TSmallintField;
    qryWorkList: TIBOQuery;
    dsWorkList: TDataSource;
    qryWorkListWORK_NAME: TWideStringField;
    qryWorkListWORK_ADDR: TWideStringField;
    qryWorkListWORK_STATUS: TSmallintField;
    qryPWork: TIBOQuery;
    dsPWork: TDataSource;
    qryPWorkWORK_NAME: TWideStringField;
    qryPWorkWORK_ADDR: TWideStringField;
    qryPWorkWORK_STATUS: TSmallintField;
    qryDefEntrys: TIBOQuery;
    dsDefEntrys: TDataSource;
    qryDefEntrysENTRYOPT_ID: TSmallintField;
    qryDefEntrysTKNO: TWideStringField;
    qryDefEntrysTKCO: TWideStringField;
    qryDefEntrysENTRY_NOTE: TWideStringField;
    qryMsgListMESSAGE_ID: TSmallintField;
    qryMsgListMESSAGE_ENG: TWideStringField;
    qryMsgListMESSAGE_VN: TWideStringField;
    qryMsgListTITLE_VN: TWideStringField;
    qryMsgListTITLE_ENG: TWideStringField;
    qryMsgListIMAGE_ID: TSmallintField;
    ImgLstMsgBox: TImageList;
    qryCommon: TIBOQuery;
    qryRegForBillsIS_ACTIVE: TSmallintField;
    qryAutoOut: TIBOQuery;
    dsAutoOut: TDataSource;
    qryAutoOutTK_DT: TWideStringField;
    qryAutoOutTK_HH: TWideStringField;
    qryAutoOutTK_GV: TWideStringField;
    qryAutoOutIS_ACTIVE: TSmallintField;
    qryParams: TIBOQuery;
    qryParamsPPXUATKHO: TSmallintField;
    qryParamsPPPBCPSXC: TSmallintField;
    qryParamsTYLECPNVL: TSmallintField;
    qryParamsTYLECPNC: TSmallintField;
    qryParamsSDGIABAN: TSmallintField;
    qryParamsCHOSUAGIABAN: TSmallintField;
    qryParamsSDGIAMUA: TSmallintField;
    qryParamsCHOSUAGIAMUA: TSmallintField;
    qryParamsSDGIAKH: TSmallintField;
    qryParamsCHOSUAGIAKH: TSmallintField;
    qryParamsSDGIABQ: TSmallintField;
    qryParamsCHOSUAGIABQ: TSmallintField;
    qryParamsCHOSUATHANHTIEN: TSmallintField;
    qryParamsALLOWCHANGETYPE: TSmallintField;
    qryParamsPTTHUEHDKD: TSmallintField;
    qryParamsPTTHUEHDTC: TSmallintField;
    qryParamsBEGIN_MONTH: TSmallintField;
    qryParamsBEGIN_YEAR: TSmallintField;
    qryParamsRANGBUOCNGAY: TSmallintField;
    qryParamsUSEDOCUMENTLOG: TSmallintField;
    qryParamsUSEUPPERCASE: TSmallintField;
    qryParamsDECIMALSL_LEN: TSmallintField;
    qryParamsDECIMALDG_LEN: TSmallintField;
    qryParamsDECIMALTT_LEN: TSmallintField;
    qryParamsTGSDCCDC: TSmallintField;
    acLoadFilterCond: TAction;
    qryEntryList: TIBOQuery;
    dsEntryList: TDataSource;
    qryEntryListDOC_ID: TWideStringField;
    qryEntryListDOC_DATE: TDateField;
    qryEntryListDOC_PERSON: TWideStringField;
    qryEntryListDOCTYPE_ID: TSmallintField;
    qryEntryListPERIOD_ID: TSmallintField;
    qryEntryListTEMPLATE_ID: TIntegerField;
    qryEntryListOBJECT_ID: TWideStringField;
    qryEntryListHASTEMPLATE: TWideStringField;
    qryEntryListDEBIT_ACC: TWideStringField;
    qryEntryListDEBIT_OBJ: TWideStringField;
    qryEntryListCREDIT_ACC: TWideStringField;
    qryEntryListCREDIT_OBJ: TWideStringField;
    qryEntryListENTRY_AMOUNT: TIBOFloatField;
    qryEntryListENTRY_PRICE: TIBOFloatField;
    qryEntryListENTRY_VALUE: TIBOFloatField;
    qryEntryListENTRY_NOTE: TWideStringField;
    qryEntryListENTRY_ID: TSmallintField;
    qryRegTransferPTKETCHUYEN: TIBOFloatField;
    qryRegTransferSOTTKC: TSmallintField;
    qryPKH: TIBOQuery;
    qryPHH: TIBOQuery;
    qryPHHOBJECT_ID: TWideStringField;
    qryPHHOTYPE_ID: TSmallintField;
    qryPHHOBJECT_NAME: TWideStringField;
    qryPHHOTHER_NAME: TWideStringField;
    qryPHHSUBINFO_1: TWideStringField;
    qryPHHSUBINFO_2: TWideStringField;
    qryPHHOBJECT_NOTES: TWideStringField;
    qryPHHOBJECT_STATUS: TSmallintField;
    qryPHHOBJGRP_NAME: TWideStringField;
    qryPHHOBJGRP_ID: TWideStringField;
    qryPHHDEBT_LEN: TSmallintField;
    qryPKHOBJECT_ID: TWideStringField;
    qryPKHOTYPE_ID: TSmallintField;
    qryPKHOBJECT_NAME: TWideStringField;
    qryPKHOTHER_NAME: TWideStringField;
    qryPKHSUBINFO_1: TWideStringField;
    qryPKHSUBINFO_2: TWideStringField;
    qryPKHOBJECT_NOTES: TWideStringField;
    qryPKHOBJECT_STATUS: TSmallintField;
    qryPKHOBJGRP_NAME: TWideStringField;
    qryPKHOBJGRP_ID: TWideStringField;
    qryPKHDEBT_LEN: TSmallintField;
    qryPTS: TIBOQuery;
    qryPNV: TIBOQuery;
    qryPTSOBJECT_ID: TWideStringField;
    qryPTSOTYPE_ID: TSmallintField;
    qryPTSOBJECT_NAME: TWideStringField;
    qryPTSOTHER_NAME: TWideStringField;
    qryPTSSUBINFO_1: TWideStringField;
    qryPTSSUBINFO_2: TWideStringField;
    qryPTSOBJECT_NOTES: TWideStringField;
    qryPTSOBJECT_STATUS: TSmallintField;
    qryPTSOBJGRP_NAME: TWideStringField;
    qryPTSOBJGRP_ID: TWideStringField;
    qryPTSDEBT_LEN: TSmallintField;
    qryPNVOBJECT_ID: TWideStringField;
    qryPNVOTYPE_ID: TSmallintField;
    qryPNVOBJECT_NAME: TWideStringField;
    qryPNVOTHER_NAME: TWideStringField;
    qryPNVSUBINFO_1: TWideStringField;
    qryPNVSUBINFO_2: TWideStringField;
    qryPNVOBJECT_NOTES: TWideStringField;
    qryPNVOBJECT_STATUS: TSmallintField;
    qryPNVOBJGRP_NAME: TWideStringField;
    qryPNVOBJGRP_ID: TWideStringField;
    qryPNVDEBT_LEN: TSmallintField;
    qryDocListDOC_VOUCHER: TWideStringField;
    qryPAccDTYPE_ID: TSmallintField;
    qryObjectMAKH: TWideStringField;
    qryObjectLOAIKH: TSmallintField;
    qryPComObjMAKH: TWideStringField;
    qryPComObjLOAIKH: TSmallintField;
    qryPKHMAKH: TWideStringField;
    qryPKHLOAIKH: TSmallintField;
    qryPTSMAKH: TWideStringField;
    qryPTSLOAIKH: TSmallintField;
    qryPHHMAKH: TWideStringField;
    qryPHHLOAIKH: TSmallintField;
    qryPNVMAKH: TWideStringField;
    qryPNVLOAIKH: TSmallintField;
    qryPQTSX: TIBOQuery;
    qryPQTSXOBJECT_ID: TWideStringField;
    qryPQTSXOTYPE_ID: TSmallintField;
    qryPQTSXOBJECT_NAME: TWideStringField;
    qryPQTSXOTHER_NAME: TWideStringField;
    qryPQTSXSUBINFO_1: TWideStringField;
    qryPQTSXSUBINFO_2: TWideStringField;
    qryPQTSXOBJECT_NOTES: TWideStringField;
    qryPQTSXOBJECT_STATUS: TSmallintField;
    qryPQTSXOBJGRP_NAME: TWideStringField;
    qryPQTSXOBJGRP_ID: TWideStringField;
    qryPQTSXDEBT_LEN: TSmallintField;
    qryPQTSXMAKH: TWideStringField;
    qryPQTSXLOAIKH: TSmallintField;
    qryPTMNH: TIBOQuery;
    qryPTMNHOBJECT_ID: TWideStringField;
    qryPTMNHOTYPE_ID: TSmallintField;
    qryPTMNHOBJECT_NAME: TWideStringField;
    qryPTMNHOTHER_NAME: TWideStringField;
    qryPTMNHSUBINFO_1: TWideStringField;
    qryPTMNHSUBINFO_2: TWideStringField;
    qryPTMNHOBJECT_NOTES: TWideStringField;
    qryPTMNHOBJECT_STATUS: TSmallintField;
    qryPTMNHOBJGRP_NAME: TWideStringField;
    qryPTMNHOBJGRP_ID: TWideStringField;
    qryPTMNHDEBT_LEN: TSmallintField;
    qryPTMNHMAKH: TWideStringField;
    qryPTMNHLOAIKH: TSmallintField;
    qryObjectCREATE_DATE: TDateField;
    qryPComObjCREATE_DATE: TDateField;
    qryPKHCREATE_DATE: TDateField;
    qryPQTSXCREATE_DATE: TDateField;
    qryPTSCREATE_DATE: TDateField;
    qryPNVCREATE_DATE: TDateField;
    qryPHHCREATE_DATE: TDateField;
    qryPTMNHCREATE_DATE: TDateField;
    qryCaption: TIBOQuery;
    dsCaption: TDataSource;
    qryCaptionFORM_NAME: TWideStringField;
    qryCaptionCONTROL_NAME: TWideStringField;
    qryCaptionCAPTION_VN: TWideStringField;
    qryCaptionCAPTION_ENG: TWideStringField;
    qryCNQuahan: TIBOQuery;
    dsCNQuahan: TDataSource;
    qryCNQuahanSHTK: TWideStringField;
    qryCNQuahanMADT: TWideStringField;
    qryCNQuahanTENDT: TWideStringField;
    qryCNQuahanSUB_1: TWideStringField;
    qryCNQuahanLOAIDT: TSmallintField;
    qryCNQuahanSOTUOI: TSmallintField;
    qryCNQuahanNGAYSOMNHAT: TDateField;
    qryCNQuahanNODK: TIBOFloatField;
    qryCNQuahanCODK: TIBOFloatField;
    qryCNQuahanNOPS: TIBOFloatField;
    qryCNQuahanCOPS: TIBOFloatField;
    qryCNQuahanSDNO: TIBOFloatField;
    qryCNQuahanSDCO: TIBOFloatField;
    qryCNQuahanDEBTTOTAL: TIBOFloatField;
    qryCNQuahanDEBTVALUE: TIBOFloatField;
    qryObjTypeLOAIDTTC: TSmallintField;
    qryObjectTypeOTYPE_ID: TSmallintField;
    qryObjectTypeOTYPE_NAME: TWideStringField;
    qryObjectTypeID_CAPTION: TWideStringField;
    qryObjectTypeNAME_CAPTION: TWideStringField;
    qryObjectTypeOTHER_CAPTION: TWideStringField;
    qryObjectTypeSUB1_CAPTION: TWideStringField;
    qryObjectTypeSUB2_CAPTION: TWideStringField;
    qryObjectTypeNOTE_CAPTION: TWideStringField;
    qryObjectTypeOTYPE_NOTE: TWideStringField;
    qryObjectTypeGROUP_NAME: TWideStringField;
    qryObjectTypeLOAIDTTC: TSmallintField;
    qryObjectTypeTENDTTC: TWideStringField;
    qryCNQuahanTENTK: TWideStringField;
    qryCNQuahanRNGAYXEM: TDateField;
    qryPBudget: TIBOQuery;
    dsPBudget: TDataSource;
    qryPBudgetBUDGET_NO: TIntegerField;
    qryPBudgetPBUDGET_NO: TIntegerField;
    qryPBudgetBUDGET_NAME: TWideStringField;
    qryPBudgetACCOUNT_ID: TWideStringField;
    qryPBudgetDIRECTION: TSmallintField;
    qryPAccENGLISH_NAME: TWideStringField;
    qryObjectTypeDATE_CAPTION: TWideStringField;
    qryPAccFOLLOW_BAL: TSmallintField;
    qryAccOpt: TIBOQuery;
    qryAccOptOPTION_ID: TSmallintField;
    qryAccOptACCOUNT_ID: TWideStringField;
    qryAccOptOPTION_NOTE: TWideStringField;
    qryAccOptGROUP_NAME: TWideStringField;
    qryEntryListYEUTONO: TWideStringField;
    qryEntryListYEUTOCO: TWideStringField;
    qryObjectTypeVALUE_CAPTION: TWideStringField;
    qryObjectOBJECT_VALUE: TIBOFloatField;
    qryHSCTPAYMENT_ACC: TWideStringField;
    qryHSCTGENERAL_ACC: TWideStringField;
    qryPActicle: TIBOQuery;
    dsPActicle: TDataSource;
    qryPActicleACTICLE_ID: TWideStringField;
    qryPActiclePACTICLE_ID: TWideStringField;
    qryPActicleACTICLE_NO: TWideStringField;
    qryPActicleAGROUP_ID: TWideStringField;
    qryPActicleACTICLE_NAME: TWideStringField;
    qryPActicleACTICLE_LEVEL: TSmallintField;
    qryPActicleTKNO: TWideStringField;
    qryPActicleTKCO: TWideStringField;
    qryDefKQHDKD: TIBOQuery;
    dsDefKQHDKD: TDataSource;
    qryDefKQHDKDID: TSmallintField;
    qryDefKQHDKDCHITIEU: TWideStringField;
    qryDefKQHDKDMASO: TWideStringField;
    qryDefKQHDKDKYNAY: TIBOFloatField;
    qryDefKQHDKDKYTRUOC: TIBOFloatField;
    qryDefKQHDKDLUYKE: TIBOFloatField;
    qryDefKQHDKDLOAICHITIEU: TSmallintField;
    qryInvoiceListTONGCONG: TIBOFloatField;
    qryObjectTypeINT_CAPTION: TWideStringField;
    qryTemplateListDTNO: TWideStringField;
    qryTemplateListLOAINO: TSmallintField;
    qryTemplateListDTCO: TWideStringField;
    qryTemplateListLOAICO: TSmallintField;
    qryPDocBal: TIBOQuery;
    dsPDocBal: TDataSource;
    qryPDocBalMADT: TWideStringField;
    qryPDocBalLOAIDT: TSmallintField;
    qryPDocBalSOPHIEU: TWideStringField;
    qryPDocBalNGAYLAP: TDateField;
    qryPDocBalNOIDUNG: TWideStringField;
    qryPDocBalKYHT: TSmallintField;
    qryPDocBalNODK: TIBOFloatField;
    qryPDocBalCODK: TIBOFloatField;
    qryPDocBalNOPS: TIBOFloatField;
    qryPDocBalCOPS: TIBOFloatField;
    qryPDocBalNOCK: TIBOFloatField;
    qryPDocBalCOCK: TIBOFloatField;
    qryInvoiceListCUSTAXCODE: TWideStringField;
    qryParamsBBNHAPYT: TSmallintField;
    qryUserUSER_PWD: TWideStringField;
    qryDefRptLCTTMASONHOM: TSmallintField;
    qryPAccFOLLOW_DOCBAL: TSmallintField;
    qryPDocBalTIENHANG: TIBOFloatField;
    qryPDocBalTIENTHUE: TIBOFloatField;
    qryPDocBalSOSERI: TWideStringField;
    qryPDocBalSOHD: TWideStringField;
    qryPDocBalNGAYHD: TDateField;
    qryPDocBalTENHANG: TWideStringField;
    qryObjectSUBINFO_3: TWideStringField;
    qryObjectSUBINFO_4: TWideStringField;
    qryObjectSUBINFO_5: TWideStringField;
    qryObjectSUBINFO_6: TWideStringField;
    qryObjectTypeSUB3_CAPTION: TWideStringField;
    qryObjectTypeSUB4_CAPTION: TWideStringField;
    qryObjectTypeSUB5_CAPTION: TWideStringField;
    qryObjectTypeSUB6_CAPTION: TWideStringField;
    qryReport: TIBOQuery;
    dsReport: TDataSource;
    dsSub_1: TDataSource;
    qrySub_1: TIBOQuery;
    qrySub_2: TIBOQuery;
    dsSub_2: TDataSource;
    dsSub3: TDataSource;
    qrySub_3: TIBOQuery;
    tsReport: TIB_Transaction;
    qryHSCTLOGO_IMGCLASS: TWideStringField;
    qryObjectLASTUSER_MODIFY: TWideStringField;
    qryDefRptBCDKTID: TSmallintField;
    qryDefRptBCDKTTEN: TWideStringField;
    qryDefRptBCDKTMASO: TWideStringField;
    qryDefRptBCDKTDAUNAM: TIBOFloatField;
    qryDefRptBCDKTCUOIKY: TIBOFloatField;
    qryDefRptBCDKTHESO_GROUP: TIBOFloatField;
    qryDefRptBCDKTMANHOM: TWideStringField;
    qryDefRptBCDKTISMIN: TSmallintField;
    qryAutoOutTK_TL: TWideStringField;
    qrySysLog: TIBOQuery;
    qrySysLogPERIOD_ID: TSmallintField;
    qrySysLogSTATUS_LOG: TSmallintField;
    qryParamsGTCLKHAUHAO: TIBOFloatField;
    qryAssetListAMOR_PERCENT: TIBOFloatField;
    qryAssetListUSING_LIFE: TIBOFloatField;
    qryPInvType: TIBOQuery;
    dsPInvType: TDataSource;
    qryPInvTypeINVTYPE_ID: TWideStringField;
    qryPInvTypeINVTYPE_NAME: TWideStringField;
    qryInvoiceListINVTYPE_ID: TWideStringField;
    qryInvoiceListINVOICE_NOTE: TWideStringField;
    qryParamsALLOW_NEGINSTOCK: TSmallintField;
    qryInvoiceListITEM_NAME: TWideStringField;
    qryCaptionCAPTION_VISIBLE: TSmallintField;
    qryInvoiceListFEE_VALUE: TIBOFloatField;
    qryInvoiceListCONGTATCA: TIBOFloatField;
    qryGetBalObj: TIBOQuery;
    dsGetBalObj: TDataSource;
    qryGetBalObjOBJECT_ID: TWideStringField;
    qryGetBalObjOTYPE_ID: TSmallintField;
    qryGetBalObjVALUE_1: TIBOFloatField;
    qryGetBalObjVALUE_2: TIBOFloatField;
    qryTemplateListCHODUYET: TSmallintField;
    qryDocListDOCUMENT_TAG: TSmallintField;
    qrySysObj: TIBOQuery;
    dsSysObj: TDataSource;
    qrySysObjOBJECT_ID: TSmallintField;
    qrySysObjOBJECT_NAME: TWideStringField;
    qrySysObjACTIVE_OBJECT: TSmallintField;
    qrySysObjNOTES: TWideStringField;
    qrySysObjFUNCTION_ID: TSmallintField;
    qryPComObjDISCOUNT_DEF: TIBOFloatField;
    qryPKHDISCOUNT_DEF: TIBOFloatField;
    qryPQTSXDISCOUNT_DEF: TIBOFloatField;
    qryPTSDISCOUNT_DEF: TIBOFloatField;
    qryPHHDISCOUNT_DEF: TIBOFloatField;
    qryPNVDISCOUNT_DEF: TIBOFloatField;
    qryPTMNHDISCOUNT_DEF: TIBOFloatField;
    qryObjectDISCOUNT_DEF: TIBOFloatField;
    qryCountInVisible: TIBOQuery;
    qryCountInVisibleSL: TIntegerField;
    qryHSCTLPRODUCT_KEY: TWideStringField;
    qryHSCTLLICIENSE_KEY: TWideStringField;
    qryHSCTLCUSTMER_ID: TWideStringField;
    qryHSCTLCUSTUMER_NAME: TWideStringField;
    qryHSCTLCOMPANY_NAME: TWideStringField;
    qryHSCTLSERI_NUMBER: TIntegerField;
    qryABC: TIBOQuery;
    qryABCABC_ID: TSmallintField;
    qryABCP_KEY: TWideStringField;
    qryABCS_NO: TIntegerField;
    qryABCCUS_ID: TWideStringField;
    qryABCCUS_NAME: TWideStringField;
    qryABCCOM_NAME: TWideStringField;
    qryCountDoc: TIBOQuery;
    qryCountDocSLCT: TIntegerField;
    qryUserHASLICIENSE: TSmallintField;
    qryPDocTypeENGLISH_NAME: TWideStringField;
    qryParamsDIRECT_DISCOUNT: TSmallintField;
    qryDocLogLOG_CONTENT: TWideStringField;
    qryObjectTypeSHORT_NAME: TWideStringField;
    qryObjectOTHER_DATE: TDateField;
    qryInstockBEGIN_PRICE: TIBOFloatField;
    qrySubInfo: TIBOQuery;
    qrySubInfoOTYPE_ID: TSmallintField;
    qrySubInfoSUBINFO_ID: TSmallintField;
    qrySubInfoSUBINFO_NAME: TWideStringField;
    qrySubInfoSUBINFO_DATATYPE: TSmallintField;
    qryCaptionCAPTION_DEF: TWideStringField;
    spExe: TIBOStoredProc;
    qryWorkListWORK_ID: TWideStringField;
    qryPWorkWORK_ID: TWideStringField;
    qryPAccHAS_BALANCE: TSmallintField;
    qryBeginFBalTYGIA: TIBOFloatField;
    qryBeginFBalDEBIT_VND: TIBOFloatField;
    qryBeginFBalCREDIT_VND: TIBOFloatField;
    qryTableListTABLE_NAME: TWideStringField;
    qryHSCTCOMPANY_ID: TSmallintField;
    qryDocTypeList: TIBOQuery;
    qryDocTypeListDOCTYPE_ID: TIntegerField;
    qryDocTypeListPDOC_TYPE: TIntegerField;
    qryDocTypeListDOCTYPE_NAME: TWideStringField;
    qryDocTypeListKHRPH: TWideStringField;
    qryDocTypeListTEMPLATE_FILE: TWideStringField;
    qryDocTypeListCHIEUDAISTT: TSmallintField;
    qryDocTypeListTKNO: TWideStringField;
    qryDocTypeListTKCO: TWideStringField;
    qryDocTypeListTHUTUSAPXEP: TSmallintField;
    qryDocTypeListLOAIDT: TSmallintField;
    qryDocTypeListOTYPE_NAME: TWideStringField;
    qryDocTypeListCOTMANO: TWideStringField;
    qryDocTypeListCOTTENNO: TWideStringField;
    qryDocTypeListCOTMACO: TWideStringField;
    qryDocTypeListCOTTENCO: TWideStringField;
    qryDocTypeListWARE_FLAG: TSmallintField;
    qryDocTypeListTKNO_BDV: TWideStringField;
    qryDocTypeListTKCO_BDV: TWideStringField;
    qryDocTypeListTKNO_KBDV: TWideStringField;
    qryDocTypeListTKCO_KBDV: TWideStringField;
    qryDocTypeListCHEDOLAPLAI: TSmallintField;
    qryDocTypeListOBJECT_CAP: TWideStringField;
    qryDocTypeListPERSON_CAP: TWideStringField;
    qryDocTypeListENGLISH_NAME: TWideStringField;
    qryDocTypeListTKNOKHIIN: TWideStringField;
    qryDocTypeListTKCOKHIIN: TWideStringField;
    qryDocTypeListKYHIEUSAU: TSmallintField;
    qryDocTypeListKYHIEURIENG: TWideStringField;
    qryDocTypeListHIENTHI: TSmallintField;
    dsDocTypeList: TDataSource;
    dsDocType: TDataSource;
    qryDocType: TIBOQuery;
    qryDocTypeDOCTYPE_ID: TIntegerField;
    qryDocTypeDOCTYPE_NAME: TWideStringField;
    qryDocTypeENGLISH_NAME: TWideStringField;
    qryDocTypeALLOWREAD: TSmallintField;
    qryDocTypeALLOWINSERT: TSmallintField;
    qryDocTypeALLOWEDIT: TSmallintField;
    qryDocTypeALLOWDELETE: TSmallintField;
    qryDocTypeKYHIEURIENG: TWideStringField;
    qryDocTypeHASCHILD: TSmallintField;
    qryDocTypeTEMPLATE_FILE: TWideStringField;
    qryDocTypePDOC_TYPE: TIntegerField;
    qryDocTypeCHIEUDAISTT: TSmallintField;
    qryDocTypeTKNOKHIIN: TWideStringField;
    qryDocTypeTKCOKHIIN: TWideStringField;
    qryDocTypeTKCO: TWideStringField;
    qryDocTypeCHEDOLAPLAI: TSmallintField;
    qryDocTypeTKNO: TWideStringField;
    qryDocTypeCOTMACO: TWideStringField;
    qryDocTypeCOTMANO: TWideStringField;
    qryDocTypeCOTTENCO: TWideStringField;
    qryDocTypeCOTTENNO: TWideStringField;
    qryDocTypeTKCO_BDV: TWideStringField;
    qryDocTypeTKCO_KBDV: TWideStringField;
    qryDocTypeTKNO_BDV: TWideStringField;
    qryDocTypeTKNO_KBDV: TWideStringField;
    qryDocTypeLOAINO: TSmallintField;
    qryDocTypeWARE_FLAG: TSmallintField;
    qryDocTypeLOAICO: TSmallintField;
    qryDocTypeLOAIDT: TSmallintField;
    qryDocTypePERSON_CAP: TWideStringField;
    qryDocTypeOBJECT_CAP: TWideStringField;
    qryDocTypeTHUTUSAPXEP: TSmallintField;
    qryDocTypeKYHIEUSAU: TSmallintField;
    qryObjectOBJECT_HIDE: TSmallintField;
    IB_Monitor1: TIB_Monitor;
    qryObjectTypeID_FORMAT: TWideStringField;
    qryObjTypeID_FORMAT: TWideStringField;
    qryGetMaxObjID: TIBOQuery;
    qryGetMaxObjIDOBJECT_ID: TWideStringField;
    qryInvoiceListINVOICE_VAT: TIBOFloatField;
    qryInvoiceListVAT_ID: TSmallintField;
    qryInvoiceListVAT_NAME: TWideStringField;
    qryPObjGrpP_OBJGRP_ID: TWideStringField;
    qryWarehouseWAREHOUSE_TYPE: TSmallintField;
    qryInvoiceListBANKACC: TWideStringField;
    qryInvoiceListCONTRACTNO: TWideStringField;
    qryInvoiceListPXKVCNB: TWideStringField;
    qryInvoiceListDUEDATE: TDateField;
    qryInvoiceListPAYMENTMETHOD: TWideStringField;
    qryInvoiceListPERSONNAME: TWideStringField;
    qryPQTSXSUBINFO_3: TWideStringField;
    qryPTSSUBINFO_3: TWideStringField;
    qryPKHSUBINFO_3: TWideStringField;
    qryPComObjSUBINFO_3: TWideStringField;
    qryPHHSUBINFO_3: TWideStringField;
    qryPNVSUBINFO_3: TWideStringField;
    qryPTMNHSUBINFO_3: TWideStringField;
    qryDefRptBCDKTTHUYETMINH: TWideStringField;
    qryDefRptLCTTTHUYETMINH: TWideStringField;
    qryDefKQHDKDTHUYETMINH: TWideStringField;
    qryPAccDTYPE_ID_1: TSmallintField;
    qryPAccFOLLOW_BAL_1: TSmallintField;
    qryPPXK: TIBOQuery;
    dsPPXK: TDataSource;
    qryPPXKMS_PPXK: TSmallintField;
    qryPPXKTEN_PPXK: TWideStringField;
    qryObjectMS_PPXK: TSmallintField;
    qryWarehouseMS_PPXK: TIntegerField;
    qryDefaultParams: TIBOQuery;
    dsDefaultParams: TDataSource;
    qryDefaultParamsPPXUATKHO: TSmallintField;
    qryDefaultParamsPPPBCPSXC: TSmallintField;
    qryDefaultParamsTYLECPNVL: TSmallintField;
    qryDefaultParamsTYLECPNC: TSmallintField;
    qryDefaultParamsSDGIABAN: TSmallintField;
    qryDefaultParamsCHOSUAGIABAN: TSmallintField;
    qryDefaultParamsSDGIAMUA: TSmallintField;
    qryDefaultParamsCHOSUAGIAMUA: TSmallintField;
    qryDefaultParamsSDGIAKH: TSmallintField;
    qryDefaultParamsCHOSUAGIAKH: TSmallintField;
    qryDefaultParamsSDGIABQ: TSmallintField;
    qryDefaultParamsCHOSUAGIABQ: TSmallintField;
    qryDefaultParamsCHOSUATHANHTIEN: TSmallintField;
    qryDefaultParamsALLOWCHANGETYPE: TSmallintField;
    qryDefaultParamsPTTHUEHDKD: TSmallintField;
    qryDefaultParamsPTTHUEHDTC: TSmallintField;
    qryDefaultParamsBEGIN_MONTH: TSmallintField;
    qryDefaultParamsBEGIN_YEAR: TSmallintField;
    qryDefaultParamsRANGBUOCNGAY: TSmallintField;
    qryDefaultParamsUSEDOCUMENTLOG: TSmallintField;
    qryDefaultParamsUSEUPPERCASE: TSmallintField;
    qryDefaultParamsDECIMALSL_LEN: TSmallintField;
    qryDefaultParamsDECIMALDG_LEN: TSmallintField;
    qryDefaultParamsDECIMALTT_LEN: TSmallintField;
    qryDefaultParamsTGSDCCDC: TSmallintField;
    qryDefaultParamsBBNHAPYT: TSmallintField;
    qryDefaultParamsGTCLKHAUHAO: TIBOFloatField;
    qryDefaultParamsALLOW_NEGINSTOCK: TSmallintField;
    qryDefaultParamsDIRECT_DISCOUNT: TSmallintField;
    qryObjectTONKHOTT: TIntegerField;
    qryDonGiaXuat: TIBOQuery;
    qryDonGiaXuatDONGIA: TIBOFloatField;
    qryDonGiaXuatGTTON: TIBOFloatField;
    qryDonGiaXuatSLTON: TIBOFloatField;
    qryAssetListUSEOBJECT_DETAIL: TWideStringField;
    qryTonkhoSLTOITHIEU: TIBOFloatField;
    qryParamsALLOW_MIN_INSTOCK: TSmallintField;
    qryDefaultParamsALLOW_MIN_INSTOCK: TSmallintField;
    dsUnit: TDataSource;
    qryUnit: TIBOQuery;
    qryObjectDEFAULT_UNIT: TWideStringField;
    qryUnit_Scale: TIBOQuery;
    dsUnit_Scale: TDataSource;
    qryUnit_ScaleFROM_UNIT: TWideStringField;
    qryUnit_ScaleTO_UNIT: TWideStringField;
    qryUnit_ScaleSCALE: TIBOFloatField;
    qryUnitUNIT_ID: TWideStringField;
    qryUnitUNIT_NAME: TWideStringField;
    dsBranch: TDataSource;
    qryBranch: TIBOQuery;
    qryHSCTBRANCH_ID: TWideStringField;
    qryDocLogBRANCH_ID: TWideStringField;
    qryInvoiceListBRANCH_ID: TWideStringField;
    qryInstockBRANCH_ID: TWideStringField;
    qryDinhkhoanBRANCH_ID: TWideStringField;
    qryDocListBRANCH_ID: TWideStringField;
    qryEntryListBRANCH_ID: TWideStringField;
    dsTransferInfo: TDataSource;
    qryTransferInfo: TIBOQuery;
    qryTransferInfoAUTO_TRANSFER: TSmallintField;
    qryTransferInfoAUTO_TOTIME: TTimeField;
    qryTransferInfoAUTO_FROMTIME: TTimeField;
    qryTransferInfoAUTO_UPDATE_FROMTIME: TTimeField;
    qryTransferInfoAUTO_UPDATE_TOTIME: TTimeField;
    qryTransferInfoUPLOAD_DIR: TWideStringField;
    qryTransferInfoDOWNLOAD_DIR: TWideStringField;
    qryTransferInfoRECURR_DAILY: TSmallintField;
    qryTransferInfoRECURR_WEEKLY: TSmallintField;
    qryTransferInfoRECURR_MONTHLY: TSmallintField;
    qryTransferInfoMONDAY: TSmallintField;
    qryTransferInfoTUESDAY: TSmallintField;
    qryTransferInfoWEDNESDAY: TSmallintField;
    qryTransferInfoTHURSDAY: TSmallintField;
    qryTransferInfoFRIDAY: TSmallintField;
    qryTransferInfoSATURDAY: TSmallintField;
    qryTransferInfoSUNDAY: TSmallintField;
    qryTransferInfoREC_DAYINMONTH: TSmallintField;
    qryTransferInfoAUTO_UPDATE: TSmallintField;
    qryTransferInfoPK: TSmallintField;
    qryTransferInfoRECURR_TYPE: TSmallintField;
    qryTransferInfoUPDATE_RECURR_TYPE: TSmallintField;
    qryTransferInfoUPDATE_RECURR_DAILY: TSmallintField;
    qryTransferInfoUPDATE_RECURR_MONTHLY: TSmallintField;
    qryTransferInfoUPDATE_RECURR_WEEKLY: TSmallintField;
    qryTransferInfoUPDATE_REC_DAYINMONTH: TSmallintField;
    qryTransferInfoUPDATE_MONDAY: TSmallintField;
    qryTransferInfoUPDATE_TUESDAY: TSmallintField;
    qryTransferInfoUPDATE_THURSDAY: TSmallintField;
    qryTransferInfoUPDATE_FRIDAY: TSmallintField;
    qryTransferInfoUPDATE_SATURDAY: TSmallintField;
    qryTransferInfoUPDATE_SUNDAY: TSmallintField;
    qryTransferInfoUPDATE_WEDNESDAY: TSmallintField;
    qryTransferInfoLASTDAY_UPDATE: TDateField;
    qryTransferInfoLASTDAY_TRANSFER: TDateField;
    qryEntrysBRANCH_ID: TWideStringField;
    qryPDocBalBRANCH_ID: TWideStringField;
    qryDocListBRANCH_NAME: TWideStringField;
    qryBeginObjBRANCH_ID: TWideStringField;
    qryBeginFBalBRANCH_ID: TWideStringField;
    qryGetDocBRANCH_ID: TWideStringField;
    qryEntryListBRANCH_NAME: TWideStringField;
    qryBranchBRANCH_ID: TWideStringField;
    qryBranchFULLNAME: TWideStringField;
    qryBranchSHORTNAME: TWideStringField;
    qryBranchISMIN: TSmallintField;
    qryDinhkhoanCREDIT_DETAIL: TWideStringField;
    qryDinhkhoanDEBIT_DETAIL: TWideStringField;
    qryAutoDocOut: TIBOQuery;
    dsAutoDocOut: TDataSource;
    qryAutoDocOutIS_ACTIVE: TSmallintField;
    qryTransferInfoACTIVETRIGGER: TSmallintField;
    qryDefRptBCDKTBRANCH_ID: TWideStringField;
    qryDefRptLCTTBRANCH_ID: TWideStringField;
    qryBranchPBRANCH_ID: TWideStringField;
    qryBranchCOMPANY_ID: TSmallintField;
    qryBranchMain: TIBOQuery;
    dsBranchMain: TDataSource;
    qryBranchMainBRANCH_ID: TWideStringField;
    qryBranchMainFULLNAME: TWideStringField;
    qryBranchMainSHORTNAME: TWideStringField;
    qryBranchMainISMIN: TSmallintField;
    qryBranchMainPBRANCH_ID: TWideStringField;
    qryBranchMainCOMPANY_ID: TSmallintField;
    qryAssetListOBRANCH_ID: TWideStringField;
    qryBranchHAS_RIGHT_REPORT: TSmallintField;
    qryBranchHAS_RIGHT_DOCTYPE: TSmallintField;
    qryBranchHAS_RIGHT_MODUL: TSmallintField;
    qryPDocBalSODUNO: TIBOFloatField;
    qryPDocBalSODUCO: TIBOFloatField;
    qryPDocBalCHECK_FIELD: TIntegerField;
    qryMaxDocType: TIBOQuery;
    qryMaxDocTypeMAX: TSmallintField;
    qryDinhkhoanPTTHUENK: TIBOFloatField;
    qryDinhkhoanENTRY_QUANTITY: TIBOFloatField;
    qryExe: TIBOQuery;
    qryEntryListYEUTONO2: TWideStringField;
    qryEntryListYEUTOCO2: TWideStringField;
    qryInvoiceListCURRENCY_ID: TWideStringField;
    qryInvoiceListTYGIA: TIBOFloatField;
    qryInvoiceListOTHER_ID: TWideStringField;
    qryObjectOBJREF_ID: TWideStringField;
    qryObjectOREFTYPE_ID: TSmallintField;
    qryObjectTypeLOAIDTTC2: TSmallintField;
    qryVATList: TIBOQuery;
    dsVATList: TDataSource;
    qryVATListVAT_ID: TSmallintField;
    qryVATListVAT_NAME: TWideStringField;
    qryVATListVAT_PER: TIBOFloatField;
    qryVATListOTHER_ID: TWideStringField;
    qryVATListMETHOD_ID: TSmallintField;
    qryDinhkhoanTENDTNO: TWideStringField;
    qryDinhkhoanTENDTCO: TWideStringField;
    qryThongbao: TIBOQuery;
    dsThongbao: TDataSource;
    qryThongbaoOBJECT_ID: TWideStringField;
    qryThongbaoOBJECT_NAME: TWideStringField;
    qryThongbaoOBJGRP_ID: TWideStringField;
    qryThongbaoOTYPE_ID: TSmallintField;
    qryThongbaoSUBINFO_1: TWideStringField;
    qryThongbaoSUBINFO_2: TWideStringField;
    qryThongbaoDEBT_LEN: TSmallintField;
    qryThongbaoOBJECT_VALUE: TIBOFloatField;
    qryThongbaoOTHER_DATE: TDateField;
    qryDocListDOC_PERSONADDR: TWideStringField;
    qryObjectTypeTENDTTC2: TWideStringField;
    qryPKHOBJREF_ID: TWideStringField;
    qryPKHOREFTYPE_ID: TSmallintField;
    qryPQTSXOBJREF_ID: TWideStringField;
    qryPQTSXOREFTYPE_ID: TSmallintField;
    qryPTMNHOBJREF_ID: TWideStringField;
    qryPTMNHOREFTYPE_ID: TSmallintField;
    qryPHHOBJREF_ID: TWideStringField;
    qryPHHOREFTYPE_ID: TSmallintField;
    qryPComObjOBJREF_ID: TWideStringField;
    qryPComObjOREFTYPE_ID: TSmallintField;
    qryPNVOBJREF_ID: TWideStringField;
    qryPNVOREFTYPE_ID: TSmallintField;
    qryPTSOBJREF_ID: TWideStringField;
    qryPTSOREFTYPE_ID: TSmallintField;
    dsDMDinhmuc: TDataSource;
    qryDMDinhmuc: TIBOQuery;
    qryDMDinhmucMATERIAL_NORM_ID: TIntegerField;
    qryDMDinhmucMAPX: TWideStringField;
    qryDMDinhmucOBJECT_ID: TWideStringField;
    qryDMDinhmucMATERIAL_ID: TWideStringField;
    qryPComObjSUBINFO_4: TWideStringField;
    qryPComObjSUBINFO_5: TWideStringField;
    qryPComObjSUBINFO_6: TWideStringField;
    qryAssetListUSEOBJECT_DETAIL_1: TWideStringField;
    qryDTPBList: TIBOQuery;
    dsDTPBList: TDataSource;
    qryDTPBListOBJECT_ID: TWideStringField;
    qryDTPBListOTYPE_ID: TSmallintField;
    qryDTPBListOBJECT_NAME: TWideStringField;
    qryDTPBListOTHER_NAME: TWideStringField;
    qryDTPBListOBJECT_NOTES: TWideStringField;
    qryDTPBListOBJECT_STATUS: TSmallintField;
    qryDTPBListGROUP_ID: TWideStringField;
    qryDTPBListACCOUNT_ID: TWideStringField;
    qryDTPBListNGUYENGIA: TIBOFloatField;
    qryDTPBListHAOMON: TIBOFloatField;
    qryDTPBListAMOR_VALUE: TIBOFloatField;
    qryDTPBListALLOCATE_ACC: TWideStringField;
    qryDTPBListAMORTISE_ACC: TWideStringField;
    qryDTPBListUSING_LIFE: TIBOFloatField;
    qryDTPBListGTCL: TIBOFloatField;
    qryDTPBListUSEOBJECT_ID: TWideStringField;
    qryDTPBListUSEOBJECT_DETAIL: TWideStringField;
    qryDTPBListGROUP_NAME: TWideStringField;
    qryDTPBListAMOR_PERCENT: TIBOFloatField;
    qryAccountAriseTENTA: TWideStringField;
    qryAriseNTTENTK_TA: TWideStringField;
    qryPAccACC_MAP_ID: TWideStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure qryWarehouseBeforePost(DataSet: TDataSet);
    procedure qryWarehousePostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure qryHSCTBeforePost(DataSet: TDataSet);
    procedure qryHSCTPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure DatasetBeforeDelete(DataSet: TDataSet);
    procedure qryResourceBeforeDelete(DataSet: TDataSet);
    procedure qryRegTransferBeforeDelete(DataSet: TDataSet);
    procedure qryRegTransferBeforePost(DataSet: TDataSet);
    procedure qryRegTransferPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure qryRegAllocateBeforeDelete(DataSet: TDataSet);
    procedure qryRegAllocateBeforePost(DataSet: TDataSet);
    procedure qryRegAllocatePostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure qryDocListBeforeDelete(DataSet: TDataSet);
    function phatsinhstt(stt:Integer):WideString;
    procedure qryBeginCusPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure qryInstockBeforePost(DataSet: TDataSet);
    procedure qryInstockPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure qryParamsPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure qryParamsTYLECPNVLChange(Sender: TField);
    procedure qryParamsTYLECPNCChange(Sender: TField);
    procedure acFormatDataExecute(Sender: TObject);
    procedure qryRegKCLLBeforePost(DataSet: TDataSet);
    procedure qryRegKCLLPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);

    procedure Suachungtu(Soct:WideString; Kyht:Smallint;Branch_id: WideString;AShowNavigator:Boolean=False);
    function  GetVATPercent(ASoct:WideString; AKyht:Smallint;ASoTT:Smallint;Var ATenhang:WideString):Smallint;
    function TKHangChothue(SHTK:WideString):Boolean;
    function  KiemtraTonkhoAm(AKYHT:Smallint; AMaKho:WideString; AMaHH:WideString;ASHTK:WideString):Boolean;
    function  DonGiaBinhQuan(AMaKH:WideString;AMaCT:WideString;AMaKho:WideString; AMaHH:WideString;ASHTK:WideString; SLXuat:Double; var RGTXuat:Double):Double;
    function  DonGiaXuat(AMaKH:WideString;AMaCT:WideString;AMaKho:WideString; AMaHH:WideString;ASHTK:WideString;APhieuXuat:WideString;ASoTT:SmallInt;SLXuat:Double; var RGTXuat:Double;var SLTON:Double):Double;
    function  DonGiaBinhQuanHangThue(AMaKH:WideString;AMaCT:WideString;AMaHH:WideString;ASHTK:WideString;SLXuat:Double;var GTXuat:Double):Double;
    procedure ImportDataFromExcel(ALOAICT:Boolean=True);
    procedure ImportTSCDFromExcel;
    procedure ImportCCDCFromExcel;    
    procedure Xemnhatky(Soct:WideString; Kyht:Smallint;Branch_id:Widestring);
    function CheckRequireField(DataSet: TDataSet):Boolean;
    procedure XemnhatkyCacphieubiXoa();
    procedure Xemnhatkynguoidung(AUserName:WideString);

    procedure qryRegForBillsBeforePost(DataSet: TDataSet);
    procedure qryRegForBillsPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure qryProductInfoCalcFields(DataSet: TDataSet);
    procedure qryWarehouseBeforeDelete(DataSet: TDataSet);
    procedure qryInstockBeforeDelete(DataSet: TDataSet);
    procedure qryWarehouseBeforeEdit(DataSet: TDataSet);
    procedure qryWarehouseBeforeInsert(DataSet: TDataSet);
    procedure qryInstockBeforeEdit(DataSet: TDataSet);
    procedure qryInstockBeforeInsert(DataSet: TDataSet);
    procedure qryHSCTBeforeEdit(DataSet: TDataSet);
    procedure qryRegForBillsBeforeDelete(DataSet: TDataSet);
    procedure qryRegForBillsBeforeEdit(DataSet: TDataSet);
    procedure qryRegForBillsBeforeInsert(DataSet: TDataSet);
    procedure qryRegTransferBeforeEdit(DataSet: TDataSet);
    procedure qryRegTransferBeforeInsert(DataSet: TDataSet);
    procedure qryRegAllocateBeforeEdit(DataSet: TDataSet);
    procedure qryRegAllocateBeforeInsert(DataSet: TDataSet);
    procedure qryRegKCLLBeforeEdit(DataSet: TDataSet);
    procedure qryRegKCLLBeforeInsert(DataSet: TDataSet);
    procedure qryParamsBeforeEdit(DataSet: TDataSet);
    procedure qryWarehouseDeleteError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure qryInstockFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure qryWarehouseAfterInsert(DataSet: TDataSet);
    procedure qryRegKCLLAfterInsert(DataSet: TDataSet);
    procedure qryRegTransferAfterInsert(DataSet: TDataSet);
    procedure qryRegAllocateAfterInsert(DataSet: TDataSet);
    procedure qryRegForBillsAfterInsert(DataSet: TDataSet);
    procedure qryInstockAfterInsert(DataSet: TDataSet);
    procedure acUnlockDataExecute(Sender: TObject);
    procedure qryDocListBeforeEdit(DataSet: TDataSet);
    procedure acLoadUserRightExecute(Sender: TObject);
    procedure qryCurrencyAfterInsert(DataSet: TDataSet);
    procedure qryCurrencyBeforeDelete(DataSet: TDataSet);
    procedure qryCurrencyDeleteError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure qryCurrencyPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure qryCurrencyBeforePost(DataSet: TDataSet);
    procedure qryObjectTypeNewRecord(DataSet: TDataSet);
    procedure qryBeginObjBeforeDelete(DataSet: TDataSet);
    procedure qryBeginObjBeforeEdit(DataSet: TDataSet);
    procedure qryBeginObjBeforeInsert(DataSet: TDataSet);
    procedure qryBeginObjBeforePost(DataSet: TDataSet);
    function KiemtrahopleBeginObj:Boolean;
    function KiemtrahopleTKBeginFBal:Boolean;
    function KiemtrahopleTTBeginFBal:Boolean;
    function KiemtrahopleInstock:Boolean;

    function KiemtraTKNO:Boolean;
    function KiemtraTKCO:Boolean;
    function KiemtraTKVAT:Boolean;
    function KiemtraKhohang:Boolean;

    procedure qryBeginObjAfterInsert(DataSet: TDataSet);
    procedure qryObjectNewRecord(DataSet: TDataSet);
    procedure qryObjectAfterInsert(DataSet: TDataSet);
    procedure qryObjectBeforePost(DataSet: TDataSet);
    procedure qryObjectPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure qryObjectDeleteError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure qryObjectTypeDeleteError(DataSet: TDataSet;
      E: EDatabaseError; var Action: TDataAction);
    procedure qryObjectTypeAfterOpen(DataSet: TDataSet);
    procedure qryRateNewRecord(DataSet: TDataSet);
    procedure qryRateAfterInsert(DataSet: TDataSet);
    procedure qryRateBeforeDelete(DataSet: TDataSet);
    procedure qryRateBeforePost(DataSet: TDataSet);
    procedure qryRatePostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure qryObjectTypeBeforeDelete(DataSet: TDataSet);
    procedure qryCurrencyBeforeEdit(DataSet: TDataSet);
    procedure qryCurrencyBeforeInsert(DataSet: TDataSet);
    procedure qryRateBeforeEdit(DataSet: TDataSet);
    procedure qryRateBeforeInsert(DataSet: TDataSet);
    procedure qryAssetListDeleteError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure qryAssetListCalcFields(DataSet: TDataSet);
    procedure qryTemplateListBeforeDelete(DataSet: TDataSet);
    procedure qryTemplateListNewRecord(DataSet: TDataSet);
    procedure qryTemplateListPostError(DataSet: TDataSet;
      E: EDatabaseError; var Action: TDataAction);
    procedure qryTemplateListAfterInsert(DataSet: TDataSet);
    procedure qryTemplateListBeforePost(DataSet: TDataSet);
    function Phatsinhsophieu():WideString;
    function ReadTemplateInfo:Boolean;
    procedure qryObjectTypeBeforeEdit(DataSet: TDataSet);
    procedure qryObjectTypeBeforeInsert(DataSet: TDataSet);
    procedure qryDefRptLCTTBeforeEdit(DataSet: TDataSet);
    procedure qryDefRptBCDKTBeforeEdit(DataSet: TDataSet);
    procedure qryBeginFBalBeforePost(DataSet: TDataSet);
    procedure qryBeginFBalAfterInsert(DataSet: TDataSet);
    procedure qryBeginFBalBeforeDelete(DataSet: TDataSet);
    procedure qryBeginFBalBeforeEdit(DataSet: TDataSet);
    procedure qryBeginFBalBeforeInsert(DataSet: TDataSet);
    procedure qryBeginFBalPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure qryObjectBeforeDelete(DataSet: TDataSet);
    procedure qryObjectBeforeEdit(DataSet: TDataSet);
    procedure qryObjectBeforeInsert(DataSet: TDataSet);
    procedure qryPAccFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure qryObjectTypeBeforePost(DataSet: TDataSet);
    procedure acFilterNormalAccExecute(Sender: TObject);
    procedure qryCommonError(Sender: TObject; const ERRCODE: Integer;
      ErrorMessage, ErrorCodes: TStringList; const SQLCODE: Integer;
      SQLMessage, SQL: TStringList; var RaiseException: Boolean);
    procedure acBackupDataExecute(Sender: TObject);
    procedure qryObjectTypeAfterInsert(DataSet: TDataSet);
    procedure qryBeginObjNewRecord(DataSet: TDataSet);
    procedure qryInstockNewRecord(DataSet: TDataSet);
    procedure qryBeginFBalNewRecord(DataSet: TDataSet);
    function CheckObject(AMASO :WideString;ALOAIDT:Integer; LocateOpt:Boolean=True):Boolean;
    function CheckWareHouse(AField :TField):Boolean;
    function CheckObjectField(AField :TField;ObjType:SmallInt):Boolean;
    function CheckCurrency(AField :TField):Boolean;
    procedure qryDocTypeListAfterDelete(DataSet: TDataSet);
    procedure qryDocTypeListAfterInsert(DataSet: TDataSet);
    procedure qryDocTypeListAfterPost(DataSet: TDataSet);
    procedure qryDocTypeListBeforeDelete(DataSet: TDataSet);
    procedure qryDocTypeListBeforeEdit(DataSet: TDataSet);
    procedure qryDocTypeListBeforeInsert(DataSet: TDataSet);
    procedure qryDocTypeListBeforePost(DataSet: TDataSet);
    procedure qryDocTypeListDeleteError(DataSet: TDataSet;
      E: EDatabaseError; var Action: TDataAction);
    procedure qryDocTypeListNewRecord(DataSet: TDataSet);
    procedure qryInvoiceListBeforeDelete(DataSet: TDataSet);
    procedure qryInvoiceListBeforePost(DataSet: TDataSet);
    procedure qryInvoiceListNewRecord(DataSet: TDataSet);
    procedure qryInvoiceListPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure qryInvoiceListINVOICE_VATChange(Sender: TField);
    procedure qryInvoiceListITEM_AMOUNTChange(Sender: TField);
    procedure qryInvoiceListNOTTAX_VALUEChange(Sender: TField);
    procedure qryObjectAfterPost(DataSet: TDataSet);
    procedure qryObjectAfterDelete(DataSet: TDataSet);
    procedure qryObjectTypeAfterPost(DataSet: TDataSet);
    procedure qryObjectTypeAfterDelete(DataSet: TDataSet);
    procedure qryPComObjFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    function CheckAllowInsert(RightID:smallint):Boolean;
    function CheckAllowDelete(DataSet: TDataSet;RightID:smallint):Boolean;
    function CheckAllowEdit(RightID:smallint):Boolean;
    procedure qryWorkListNewRecord(DataSet: TDataSet);
    procedure qryWorkListAfterInsert(DataSet: TDataSet);
    procedure qryWorkListBeforePost(DataSet: TDataSet);
    procedure qryWorkListDeleteError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure qryWorkListPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure qryDefEntrysAfterInsert(DataSet: TDataSet);
    procedure qryDefEntrysBeforePost(DataSet: TDataSet);
    procedure qryDefEntrysPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure qryAutoOutAfterInsert(DataSet: TDataSet);
    procedure qryAutoOutBeforePost(DataSet: TDataSet);
    procedure qryAutoOutPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure acLoadFilterCondExecute(Sender: TObject);
    procedure qryPAccFilterBenNORecord(DataSet: TDataSet;var Accept: Boolean);
    procedure qryPAccFilterBenCORecord(DataSet: TDataSet;var Accept: Boolean);
    procedure qryGiaMuaBeforeOpen(DataSet: TDataSet);
    procedure qryGiaBanBeforeOpen(DataSet: TDataSet);
    procedure qryGiaKHBeforeOpen(DataSet: TDataSet);
    procedure qryDocTypeListPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure qryRegTransferNewRecord(DataSet: TDataSet);
    procedure qryWarehouseAfterPost(DataSet: TDataSet);
    procedure qryWarehouseAfterDelete(DataSet: TDataSet);
    procedure qryWorkListAfterDelete(DataSet: TDataSet);
    procedure qryWorkListAfterPost(DataSet: TDataSet);
    procedure GetCurObjInfo;
    procedure qryObjectMAKHChange(Sender: TField);
    procedure qryCaptionBeforePost(DataSet: TDataSet);
    procedure qryObjectTypePostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure qryAssetListAfterDelete(DataSet: TDataSet);
    procedure qryPObjGrpFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure qryInvoiceListTAX_VALUEChange(Sender: TField);
    procedure qryObjectOBJGRP_IDChange(Sender: TField);
    procedure qryTemplateListTKNOChange(Sender: TField);
    procedure qryTemplateListTKCOChange(Sender: TField);
    procedure qryMsgBeforeEdit(DataSet: TDataSet);
    procedure qryTemplateListDeleteError(DataSet: TDataSet;
      E: EDatabaseError; var Action: TDataAction);
    procedure qryAssetListBeforeDelete(DataSet: TDataSet);
    procedure qryDefRptBCDKTAfterInsert(DataSet: TDataSet);
    procedure qryDefRptBCDKTBeforeDelete(DataSet: TDataSet);
    procedure qryDefRptBCDKTBeforeInsert(DataSet: TDataSet);
    procedure qryCurrencyAfterPost(DataSet: TDataSet);
    procedure qryCurrencyAfterDelete(DataSet: TDataSet);
    procedure qryDefRptBCDKTPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure qryDefKQHDKDPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure qryDefRptLCTTPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure qryDefRptKQHDKDBPostError(DataSet: TDataSet;
      E: EDatabaseError; var Action: TDataAction);
    procedure qryDefKQHDKDBeforePost(DataSet: TDataSet);
    procedure qryDefKQHDKDAfterInsert(DataSet: TDataSet);
    procedure qryDefRptLCTTAfterInsert(DataSet: TDataSet);
    procedure qryDefRptLCTTBeforePost(DataSet: TDataSet);
    procedure qryDefRptBCDKTBeforePost(DataSet: TDataSet);
    procedure qryDefRptKQHDKDBAfterInsert(DataSet: TDataSet);
    procedure qryDefRptKQHDKDBBeforePost(DataSet: TDataSet);
    procedure SSPIdTelnet1Received(Success: Boolean);
    procedure qryDefRptLCTTBeforeInsert(DataSet: TDataSet);
    procedure qryDefRptLCTTBeforeDelete(DataSet: TDataSet);
    procedure qryDefKQHDKDBeforeDelete(DataSet: TDataSet);
    procedure qryDefKQHDKDBeforeInsert(DataSet: TDataSet);
    procedure sspLicense1ApplyLanguage(Sender: TObject);
    procedure qryInvoiceListFEE_VALUEChange(Sender: TField);
    procedure OpenBalanceObj(AccID,WareID:WideString;AtDate:TDate);
    procedure qryGetBalObjBeforeOpen(DataSet: TDataSet);
    procedure qryDocListAnyWhereBeforeOpen(DataSet: TDataSet);
    procedure qrySysObjBeforeDelete(DataSet: TDataSet);
    procedure qrySysObjBeforeEdit(DataSet: TDataSet);
    procedure qrySysObjBeforeInsert(DataSet: TDataSet);
    procedure qryDocListBeforeOpen(DataSet: TDataSet);
    procedure qryEntryListBeforeOpen(DataSet: TDataSet);
    procedure LoadLicenseDB(Sender: TObject);
    procedure SaveLicenseDB(Sender: TObject);
    procedure sspLicense1Error(Sender: TObject);
    procedure qryParamsNewRecord(DataSet: TDataSet);
    procedure qryDocListDeleteError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure qryInvoiceListDeleteError(DataSet: TDataSet;
      E: EDatabaseError; var Action: TDataAction);
    procedure qryDocListAfterDelete(DataSet: TDataSet);
    procedure qryInvoiceListAfterPost(DataSet: TDataSet);
    procedure qryInvoiceListAfterDelete(DataSet: TDataSet);
    procedure qryObjectCREATE_DATEChange(Sender: TField);
    procedure qryInstockBEGIN_AMOUNTChange(Sender: TField);
    procedure qryInstockBEGIN_PRICEChange(Sender: TField);
    procedure qryBeginFBalTYGIAChange(Sender: TField);
    procedure qryBeginFBalBEGIN_DEBITChange(Sender: TField);
    procedure qryBeginFBalBEGIN_CREDITChange(Sender: TField);
    procedure cnMainError(Sender: TObject; const ERRCODE: Integer;
      ErrorMessage, ErrorCodes: TStringList; const SQLCODE: Integer;
      SQLMessage, SQL: TStringList; var RaiseException: Boolean);
    procedure IB_Monitor1MonitorOutputItem(Sender: TObject;
      const NewString: String);
    procedure qryWarehouseNewRecord(DataSet: TDataSet);
    procedure qryDocTypeListNewRecordParent(DataSet: TDataSet);
    procedure qryUnitAfterInsert(DataSet: TDataSet);
    procedure qryUnitBeforeDelete(DataSet: TDataSet);
    procedure qryUnitBeforeEdit(DataSet: TDataSet);
    procedure qryUnitBeforeInsert(DataSet: TDataSet);
    procedure qryUnitBeforePost(DataSet: TDataSet);
    procedure qryUnitDeleteError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure qryUnitPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure qryBranchBeforeOpen(DataSet: TDataSet);
    // Thinh
    Function TransferUpdateAction: smallint;
    function PeriodToString(Period : smallint):WideString;
    procedure qryBranchNewRecord(DataSet: TDataSet);
    procedure qryDocTypeBeforeOpen(DataSet: TDataSet);
    procedure qryBranchFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure qryBranchMainBeforeOpen(DataSet: TDataSet);
    procedure qryAssetListBeforeOpen(DataSet: TDataSet);
    procedure qryHSCTBeforeOpen(DataSet: TDataSet);
    procedure qryPDocBalFilterRecordBENNO(DataSet: TDataSet;
      var Accept: Boolean);
    procedure qryPDocBalFilterRecordBENCO(DataSet: TDataSet;
      var Accept: Boolean);
    procedure qryBeginObjAfterPost(DataSet: TDataSet);
    procedure qryDefRptBCDKTNewRecord(DataSet: TDataSet);
    procedure qryPComObjBeforeOpen(DataSet: TDataSet);
    procedure qryObjectOBJREF_IDChange(Sender: TField);
    procedure qryDTPBListBeforeDelete(DataSet: TDataSet);

  private
    { Private declarations }

    MaLoaiDTLN:Smallint;//Ma loai doi tuong lon nhat, dung lam default khi them loai moi

    PDocTypeID, PChieudaiSTT: integer;//Dung de khi insert loai phieu moi
    PTemplateFile, PTKNO, PTKCO, PKHR : WideString;//Ten file template cua loai cha
    PWareFlag,PChedoLaplai:Smallint;
    PMaCotNo, PTenCotNo,PMaCotCo, PTenCotCo : WideString;
    PTKNO_BDV,PTKNO_KBDV,PTKCO_BDV,PTKCO_KBDV : WideString;

    pCurObjTypeID:Integer;
    pCheckingLicienseDB:Boolean;
    HasLicense:Boolean;
    //ProductID=�rbAdv�;
    procedure WCurObjTypeID(AValue:integer);
  public
    CurObjID,CurObjName,CurObjSub1,CurObjSub2,RefObjID,RefObjID2 : WideString;
    CurObjDisCntDef:Double;
    RefObjType,RefObjType2:Smallint;
    MaxRegTranferID:Integer;
    { Public declarations }
    property CurObjTypeID:Integer Read pCurObjTypeID Write WCurObjTypeID;
  end;
  function BuildPeriod(AThang :Integer; ANam:integer):Smallint;
  function AllowLogin(AThang :Integer; ANam:integer):Boolean;
  function XulyTaikhoan(SHTK :WideString ):WideString ;
  procedure GhiNhatKyXoaPhieu(SOPHIEU :WideString;AKYHT:Smallint;NOIDUNG :String);
  function KiemtraKhoaNgoai(AqryMain:TIBODataset;AqryList:TIBODataset;AMainFieldName:String;AListFieldName:String;AMainName:String;ABatbuoc:Boolean=True):Boolean;

// ==== Cua cu Khiem=========================
  procedure HintBox(AOwner: TComponent; X, Y: Integer; Promt, Title: WideString;
    IConID: integer = 0); overload;
  procedure HintBox(AOwner: TComponent; Sender: TObject; Promt, Title: WideString;
    IConID: integer = 0); overload;
  procedure HintBox(DBMsgId: Integer; AOwner: TComponent; Sender: TObject);
  overload;
  procedure HintBox(AOwner: TComponent; X, Y: Integer; DBMsgID: integer);
  overload;

  function ShowHintBoxInComponent(comp: TComponent; Dataset: TDataSet; FieldName:
    string; MsgID: integer): boolean;
  function ShowHintBoxInTreeGrid(ATreeGrid: TCustomdxDBTreeListControl;
    ANode: TdxTreeListNode; FieldName: string; MsgID: integer): boolean;

  function GetLicenseKey(MST:string):string;
  function GetComCode:string;
  function CheckLicense:boolean;
//===========================================

var
  MainDM: TMainDM;
  qryBgDocList: TIBOQuery;
  DocIDFieldName,PeriodFieldName, BranchIDFieldName:string;

  DeletedDocID:WideString;//Luu lai thong tin dang xoa dung de ghi nhat ky (LOG)
  DeletedPeriod:Smallint;//Luu lai thong tin dang xoa dung de ghi nhat ky (LOG)
  DeletedComment:String;//Luu lai thong tin dang xoa dung de ghi nhat ky (LOG)

  qryCurDocEntry:TIBOQuery;

  CurBalAccID,CurBalWareID:WideString;
  CurBalAtDate : TDate;

  CurrentPeriod:Smallint;//Ky dang nhap
  CurMonth,CurYear:Smallint;//Thang nam dang dang nhap
  BeginPeriod:Smallint; //Ky dau tien su dung
  CurrentUser:WideString;//Ten user dang nhap
  WorkingDate:TDateTime;//Ngay lam viec
  CurrentGroup:WideString;//Ten cua group ma user dang nhap
  FullUserName:WideString;//Ten day du cua nguoi su dung
  CurrentDomain:WideString;//Bo phan dang nhap
  UserPwd:WideString;//Password dang nhap

  strFKName:WideString;//Ten cua Ralationship duoc cat tu msg
  
  MaxOtherType:integer;//Gia tri lon nhat cua loai danh muc khac>=10
  
  SohieuTSCD:Widestring;//So hieu cua tai san dang lam viec dang sua hoac dang them

  AllowSelectParent:Boolean;//Cho phep chon tai khoan cha hay khong tron popup
  AllowSelectBudgetParent:Boolean;//Cho phep chon khoan muc ngan sach cha?
  //Mac dinh la khong cho

  //Dung de ghi nho ma so va ten cua tai san co dinh dang duoc tang
  AssetAccountID:WideString;//Dung de ghi nho tai khoan no cua tscd khi tang
  AssetDocInID:WideString;//So phieu tang
  AssetDocInDate:TDate; //Ngay cua phieu tang

  //phan hach toan chenh lech ty gia, + tang thi ghi ben No, - ghi ben co

  isLoginOK, IsShowLoginForm:Boolean; //cho biet co thuc hien login hay login thanh cong khong
  IsSystemPost:Boolean;//Khi Chuong trinh Post khoi phai kiem tra nay no
  HasLicense:Boolean;
  const ProductID='rbAdv';
  const Key2 = '123' ;

implementation

uses GlobalInterface, Functions, LoginForm,
  PopupForm, InvoiceForm, GlobalUnit, SimpleSecurityLibrary,
  MainForm, DateUtils, SelectAccForm, MsgDlgForm, DocLogForm,
  SheetData, Math, DocFullForm, SplashForm,HintBoxDlg, cpuid,md5;

{$R *.dfm}

procedure TMainDM.WCurObjTypeID(AValue:integer);
begin
  pCurObjTypeID:=AValue;
  {qryPKH.open;
  qryPHH.open;
  qryPTS.open;
  qryPTMNH.open;
  qryPQTSX.open}
  case pCurObjTypeID of
    1:  dsPComObj.DataSet:=qryPKH;
    2:  dsPComObj.DataSet:=qryPHH;
    3:  dsPComObj.DataSet:=qryPTS;
    4:  dsPComObj.DataSet:=qryPNV;
    5:  dsPComObj.DataSet:=qryPTMNH;
    6:  dsPComObj.DataSet:=qryPQTSX;
    else dsPComObj.DataSet:=qryPComObj;
  end;

end;

procedure TMainDM.GetCurObjInfo;
begin
  dsPComObj.DataSet.Open;
  if dsPComObj.DataSet.FieldByName('OBJECT_ID').IsNull then
    CurObjID := ''
  else
    CurObjID := dsPComObj.DataSet.FieldByName('OBJECT_ID').Value;
  if dsPComObj.DataSet.FieldByName('OBJECT_NAME').IsNull then
    CurObjName := ''
  else
    CurObjName := dsPComObj.DataSet.FieldByName('OBJECT_NAME').Value;
  if dsPComObj.DataSet.FieldByName('SUBINFO_1').IsNull then
    CurObjSub1 :=''
  else
    CurObjSub1 := dsPComObj.DataSet.FieldByName('SUBINFO_1').Value;
  if dsPComObj.DataSet.FieldByName('SUBINFO_2').IsNull then
    CurObjSub2 := ''
  else
    CurObjSub2 := dsPComObj.DataSet.FieldByName('SUBINFO_2').Value;
  if dsPComObj.DataSet.FieldByName('MAKH').IsNull then
    RefObjID := ''
  else
    RefObjID := dsPComObj.DataSet.FieldByName('MAKH').Value;
  if dsPComObj.DataSet.FieldByName('OBJREF_ID').IsNull then
    RefObjID2 := ''
  else
    RefObjID2 := dsPComObj.DataSet.FieldByName('OBJREF_ID').Value;

  RefObjType := dsPComObj.DataSet.FieldByName('LOAIKH').AsInteger;
  RefObjType2 := dsPComObj.DataSet.FieldByName('OREFTYPE_ID').AsInteger;
  CurObjDisCntDef:= dsPComObj.DataSet.FieldByName('DISCOUNT_DEF').AsFloat;
end;

function TMainDM.phatsinhstt(stt:Integer):WideString;
var
  i,lgt,cd:Smallint;
  tmp:WideString;
  Str:String;
begin
  tmp := IntToStr(stt);
  lgt := Length(tmp);
  cd := qryDocTypeCHIEUDAISTT.AsInteger;
  if cd<2 then
    cd:=4;
  for i:=1 to cd - lgt do
    tmp := '0' + tmp ;
  if IsHasData(qryDocTypeKYHIEURIENG) then
  begin
    Str:=UTF8Encode(qryDocTypeKYHIEURIENG.Value);

    Str:=StringReplace(Str,'''dd''',FormatDateTime('dd',WorkingDate),[]);
    Str:=StringReplace(Str,'''d''',FormatDateTime('d',WorkingDate),[]);
    Str:=StringReplace(Str,'''MM''',FormatDateTime('MM',WorkingDate),[]);
    Str:=StringReplace(Str,'''M''',FormatDateTime('M',WorkingDate),[]);
    Str:=StringReplace(Str,'''yyyy''',FormatDateTime('yyyy',WorkingDate),[]);
    Str:=StringReplace(Str,'''yy''',FormatDateTime('yy',WorkingDate),[]);

    if qryDocTypeKYHIEUSAU.AsInteger=1 then
      tmp := tmp + UTF8Decode(Str)
    else
      tmp := UTF8Decode(Str)+tmp;
  end;

  Result := tmp;
end;

procedure GhiNhatKyXoaPhieu(SOPHIEU :WideString;AKYHT:Smallint; NOIDUNG :String);
begin
  with MainDM.qryCommon do
  begin
    Close;
    SQL.Clear;
    Params.Clear;
    SQL.Text :='insert into doc_log(user_id,doc_id,period_id,log_content,branch_id) values(:nguoilap,:doc_id,:period_id,:noidung,:branch_id)';
    Prepare;

    ParamByName('nguoilap').Value := CurrentUser;
    ParamByName('noidung').Value := UTF8Decode(NOIDUNG);
    ParamByName('doc_id').Value := SOPHIEU;
    ParamByName('branch_id').Value := vpBranch_id;
    if AKYHT<>0 then
      ParamByName('period_id').Value := AKYHT;
    ExecSQL;
    Close;
  end;
end;

function TMainDM.Phatsinhsophieu():WideString;
VAR
  TUKY, DENKY, cddangky:Smallint;
  OldDocNo, GenDocNo:WideString;
  OldOrder, mflag, SoTTHople:integer;
begin
  Result:='';
  if optAutoGenDocNo=0 then exit;

  if qryDocTypeCHEDOLAPLAI.AsInteger=0 then//lap theo thang
  begin
    TUKY := CurrentPeriod;
    DENKY := CurrentPeriod;
  end
  else
  begin
    TUKY := CurYear*12 + 1;
    DENKY := CurYear*12 + 12;
  end;
  SoTTHople:=0;
  cddangky :=qryDocTypeCHIEUDAISTT.AsInteger;
  if cddangky<2 then
    cddangky:=4;
  with qryGenDocNo do
  begin
    ParamByName('LoaiPhieu').AsInteger := qryDocTypeDOCTYPE_ID.AsInteger;
    ParamByName('TUKY').Value:= TUKY;
    ParamByName('DENKY').Value:= DENKY;
    Open;
    mflag:=1;
    if RecordCount=0 then
      OLDDOCNO :=''
    else
    while (Not Eof) and (SoTTHople=0) do
    begin
      OLDDOCNO := FIELDBYNAME('DOC_ID').Value;
      if qryDocTypeKYHIEUSAU.AsInteger=1 then
        GenDocNo := Copy(OLDDOCNO,1, cddangky)
      else
        GenDocNo := RightStr(OLDDOCNO,cddangky);

      val(GenDocNo, OldOrder,mflag);
      if ((mflag=0) and (OldOrder>SoTTHople)) then//Hop le
        SoTTHople := OldOrder;

      Next;
    end;
    Close;
  end;
  GenDocNo := MainDM.phatsinhstt(SoTTHople+1);
  Result := GenDocNo;
end;

procedure TMainDM.DataModuleCreate(Sender: TObject);
begin
  Randomize;
  pCheckingLicienseDB := False;

  IsSearching := False;
  DocFullFormCount := 0;
  IsShowLoginForm := True;

  PreDocTypeLoadFilter := -1;
  isExpired := False;
  PreObjTypeID := -1;
  CurObjTypeID := 1;
  IsSystemPost := False;
  InitGlobalValueReg;

  { // Bo phan nay, dung license moi 2007-10
  sspLicense1.SetAppKey('QLKTFU');
  sspLicense1.UROK;
  }

  SplashFrm := TSplashFrm.Create(Self);
  SplashFrm.Show;
  SplashFrm.Update;

  AllowSelectParent := False;
  CurrentGroup := '';

  ApplicationDir := ExtractFileDir(Application.ExeName);
  TemplatePath := ApplicationDir + '\Templates\';

  acFormatData.Execute;

  with TLoginFrm.Create(Application) do
    try
      if IsShowLoginForm then
      if ShowModal = mrCancel then
      begin
        Application.Terminate;
        SplashFrm.Close;
        SplashFrm.Free;
        isLoginOK:=False;
        exit;
      end;
    finally
      Free;
    end;
  SplashFrm.Close;
  SplashFrm.Free;

 // Thinh bo - xai license moi
 //if sspLicense1.SerialNumber <> 0 then Exit;

 {qryABC.Open;
 if qryABCP_KEY.AsString = '' then
 begin
   qryCountDoc.Open;
   if (qryCountDocSLCT.AsInteger = 0) then
   begin
     SaveLicenseDB(Sender);
     Exit;
   end
   else
   begin
     ShowMessageUnicode(205);
     Application.Terminate;
     Exit;
   end
 end;

 pCheckingLicienseDB := True;
 }
 //Thinh bo - xai license moi
 {sspLicense1.OnSave2 := SaveLicenseDB;
 sspLicense1.OnLoad2 := LoadLicenseDB;
 pCheckingLicienseDB := False;}

end;

procedure TMainDM.qryWarehouseBeforePost(DataSet: TDataSet);
begin
  if ImportingFromXLS then exit;

  if IsNotHasData(qryWarehouseWAREHOUSE_ID) then
  begin
    ShowMessageUnicode(15);

    qryWarehouseWAREHOUSE_ID.FocusControl;
    Abort;
  end;
  LastModifyItemID:=qryWarehouseWAREHOUSE_ID.Value;
end;

procedure TMainDM.qryWarehousePostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  Action := daAbort;

  ErrImportMsg:=e.Message;
  if ImportingFromXLS then Exit;

  if ProcessErr(E,'kho hàng')=-803 then
    qryWarehouseWAREHOUSE_ID.FocusControl
  else
    ShowMessageUnicode(201,e.Message,0);
end;

procedure TMainDM.qryHSCTBeforePost(DataSet: TDataSet);
begin
  if IsNotHasData(qryHSCTFULLNAME) then
  begin
    ShowMessageUnicode(16);
    qryHSCTFULLNAME.FocusControl;
    Abort;
  end;
end;

procedure TMainDM.qryHSCTPostError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin 
  Action := daAbort;
  ErrImportMsg := e.Message;
  if ImportingFromXLS then Exit;
  ProcessErr(E, '');
end;

procedure TMainDM.DatasetBeforeDelete(DataSet: TDataSet);
begin
  if DataSet.RecordCount=0 then
  begin
    ShowMessageUnicode(17);
    exit;
  end;
  if optConfirmDelete = 1 then
  if ShowMessageUnicode(23,'', 4) = 7 then
    Abort;
end;

function AllowLogin(AThang :Integer; ANam:integer):Boolean;
var
  KyMoi : Smallint;
begin
  Result:=False;
  KyMoi := ANam * 12 + AThang;

  if KyMoi < BeginPeriod then
  begin
    ShowMessageUnicode(18);
    exit;
  end;
  MainDM.qrySysLog.Open;
  if MainDM.qrySysLog.Locate('PERIOD_ID',KyMoi,[]) then
  begin
    if MainDM.qrySysLogSTATUS_LOG.AsInteger>0 then
    begin
      if SSPUserRight[14].RR =False then
      begin
        ShowMessageUnicode(19);
        exit;
      end;
      LockingData := True;
    end
    else
      LockingData := False;
  end
  else
    LockingData := False;

  CurrentPeriod:=KyMoi;
  CurMonth:=AThang;
  CurYear:=ANam;
  Result:=True;
end;

function BuildPeriod(AThang :Integer; ANam:integer):smallint;
begin
    Result := ANam * 12 + AThang;
end;

function XulyTaikhoan(SHTK :WideString ):WideString ;
begin
  SHTAIKHOAN := SHTK;
  with TSelectAccFrm.Create(Application) do
  try
    ShowModal;
  finally
    Free;
  end;
  Result := SHTIEUKHOAN;
  //if SHTIEUKHOAN = '' then
  //  ShowMessageUnicode(27);
end;


procedure TMainDM.qryResourceBeforeDelete(DataSet: TDataSet);
begin
  if optConfirmDelete=1 then
  if ShowMessageUnicode(23,'', 4)=7 then
    Abort;
end;

procedure TMainDM.qryRegTransferBeforeDelete(DataSet: TDataSet);
begin
  if Not CheckAllowDelete(DataSet,6) then Abort;
end;

procedure TMainDM.qryRegTransferBeforePost(DataSet: TDataSet);
begin
  if Not MainDM.CheckRequireField(DataSet) then
    Abort;
end;

procedure TMainDM.qryRegTransferPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
var
  kq:Integer;
begin
  Action := daAbort;
  ErrImportMsg:=e.Message;
  if ImportingFromXLS then Exit;
  kq:=ProcessErr(E,'"từ tài khoản"');
  if kq=-803 then
    qryRegTransferSOTTKC.FocusControl;

  if kq=-530 then
  begin
    ShowMessageUnicode(42,e.Message,0);
  end;
  if kq=-836 then
  begin
    ShowMessageUnicode(27,e.Message,0);
    exit;
  end;
end;

procedure TMainDM.qryRegAllocateBeforeDelete(DataSet: TDataSet);
begin
  if Not CheckAllowDelete(DataSet,6) then Abort;
end;

procedure TMainDM.qryRegAllocateBeforePost(DataSet: TDataSet);
begin
  if Not MainDM.CheckRequireField(DataSet) then
    Abort;
end;

procedure TMainDM.qryRegAllocatePostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
var
  kq:integer;
begin
  Action := daAbort;
  ErrImportMsg:=e.Message;
  if ImportingFromXLS then Exit;
  kq:=ProcessErr(E,'"từ tài khoản"');
  if kq=-803 then
    qryRegAllocateFROM_ACCOUNT.FocusControl;

  if kq=-530 then
    ShowMessageUnicode(42,e.Message,0);
end;

procedure TMainDM.qryDocListBeforeDelete(DataSet: TDataSet);
begin
  if NotUnLockData(qryDocListPERIOD_ID.AsInteger,2) then Abort;

  if optConfirmDelete=1 then
  if ShowMessageUnicode(23,'', 4)= 7 then
    Abort;


  if prmUseDocumentLog then
  begin
    DeletedDocID:=qryDocListDOC_ID.Value;
    DeletedPeriod:=0;
    DeletedComment:='Delete voucher : '+ UTF8Encode(qryDocListDOC_ID.Value);
  end;
end;

procedure TMainDM.qryBeginCusPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
var
  rs:Integer;
begin
  Action := daAbort;
  ErrImportMsg:=e.Message;
  if ImportingFromXLS then Exit;

  rs:=ProcessErr(E,'',0);
  case rs of
    -803://Trung khoa
    begin
      ShowMessageUnicode(45,e.Message,0);
    end;
    -530://Trung khoa
    begin
      ShowMessageUnicode(46,e.Message,0);
    end;
  end;
end;

procedure TMainDM.qryInstockBeforePost(DataSet: TDataSet);
begin
  if ImportingFromXLS then exit;
  
  if qryInstockOBJECT_ID.IsNull then
  begin
    ShowMessageUnicode(47);
    qryInstockOBJECT_ID.FocusControl;
    Abort;
    exit;
  end;
  if qryPWareWAREHOUSE_ID.IsNull then
  begin
    ShowMessageUnicode(48);
    qryPWareWAREHOUSE_ID.FocusControl;
    Abort;
    exit;
  end;
  if qryPAccACCOUNT_ID.IsNull then
  begin
    ShowMessageUnicode(49);
    qryPAccACCOUNT_ID.FocusControl;
    Abort;
    exit;
  end;
  if qryPAccISMIN.AsInteger<>1 then
  begin
    ShowMessageUnicode(27);
    qryPAccACCOUNT_ID.FocusControl;
    Abort;
    exit;
  end;
  if KiemtrahopleInstock=False then
  begin
    qryInstockOBJECT_ID.FocusControl;
    Abort;
    exit;
  end;

  qryInstockWAREHOUSE_ID.Value := qryPWareWAREHOUSE_ID.Value;
  qryInstockACCOUNT_ID.Value := qryPAccACCOUNT_ID.Value;
  qryInstockPERIOD_ID.Value := CurrentPeriod;
  qryInstockBRANCH_ID.Value := vpBranch_id;
end;

procedure TMainDM.qryInstockPostError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
var
  rs:Integer;
begin
  Action := daAbort;

  ErrImportMsg:=e.Message;
  if ImportingFromXLS then Exit;

  rs:=ProcessErr(E,'',0);
  case rs of
    -803://Trung khoa
    begin
      ShowMessageUnicode(50,e.Message,0);
    end;
    -530://khoa ngoai
    begin
      ShowMessageUnicode(51,e.Message,0);
    end;
  end;
end;

procedure TMainDM.qryParamsPostError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
  Action := daAbort;
  ErrImportMsg:=e.Message;
  if ImportingFromXLS then Exit;
  ProcessErr(E,'');
end;

procedure TMainDM.qryParamsTYLECPNVLChange(Sender: TField);
begin
  if qryParamsTYLECPNC.AsInteger <> 100-qryParamsTYLECPNVL.AsInteger then
    qryParamsTYLECPNC.AsInteger := 100-qryParamsTYLECPNVL.AsInteger;
end;

procedure TMainDM.qryParamsTYLECPNCChange(Sender: TField);
begin
  if qryParamsTYLECPNVL.AsInteger <> 100-qryParamsTYLECPNC.AsInteger then
    qryParamsTYLECPNVL.AsInteger:= 100-qryParamsTYLECPNC.AsInteger ;
end;

procedure TMainDM.acFormatDataExecute(Sender: TObject);
var
  i:integer;
begin
  //Set cac format cua cac field. Field kieu ngay tu dong format roi
  for i:=0 to ComponentCount-1 do
  if  Components[i].InheritsFrom(TField) then
  if Components[i].Tag>-1 then
  begin
    if Components[i] is TDateField  then
    begin
      if Components[i].Tag <>1 then
        (Components[i] as TDateField).DisplayFormat := NGAYTHANG_FORMAT;
    end
    else
    if  (Components[i] is TFloatField)  then
    begin
      if Components[i].Tag =1 then//So luong
        (Components[i] as TFloatField).DisplayFormat := SOLUONG_FORMAT
      else if Components[i].Tag =3 then//Ngoai te
        (Components[i] as TFloatField).DisplayFormat := NGOAITE_FORMAT
      else if Components[i].Tag =4 then//Cac he so
        (Components[i] as TFloatField).DisplayFormat := CACHESO_FORMAT
      else
        (Components[i] as TFloatField).DisplayFormat := TIENTE_FORMAT;
    end;
  end;
end;

procedure TMainDM.qryRegKCLLBeforePost(DataSet: TDataSet);
begin
  if Not MainDM.CheckRequireField(DataSet) then
    Abort;
end;

procedure TMainDM.qryRegKCLLPostError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
var
  kq:integer;
begin
  Action := daAbort;
  ErrImportMsg:=e.Message;
  if ImportingFromXLS then Exit;
  kq:=ProcessErr(E,'"từ tài khoản"');
  if kq=-803 then
    qryRegKCLLFROM_ACCOUNT.FocusControl;
    
  if kq=-530 then
  begin
    ShowMessageUnicode(42,e.Message,0);
    exit;
  end;
  if kq=-836 then
  begin
    ShowMessageUnicode(27,e.Message,0);
    exit;
  end;
end;

function TMainDM.TKHangChothue(SHTK:WideString):Boolean;
begin
  qryCommon.Close;
  qryCommon.SQL.Text:='SELECT DEBIT_ACC FROM OUT_TYPE';
  qryCommon.Open;
  Result:= qryCommon.Locate('DEBIT_ACC',SHTK,[]);
  qryCommon.Close;
end;

function  TMainDM.KiemtraTonkhoAm(AKYHT:Smallint; AMaKho:WideString; AMaHH:WideString;ASHTK:WideString):Boolean;
var
  SLTT : Double;
begin
  if vpBranch_IsMin = 0 then exit;

  qryTonkho.Close;
  qryTonkho.ParamByName('MAKHO').Value := AMaKho;
  qryTonkho.ParamByName('MAHH').Value  := AMaHH;
  qryTonkho.ParamByName('SHTK').Value  := ASHTK;
  qryTonkho.ParamByName('TUKY').Value  := AKYHT;
  qryTonkho.ParamByName('DENKY').Value := AKYHT;
  qryTonkho.ParamByName('BRANCH_ID').value := vpBranch_id;
  qryTonkho.Open;

  Result := True;
  if qryTonkhoSLTON.AsFloat < 0 then
    ShowMessageUniText(GetMessage(54) + FormatFloat(SOLUONG_FORMAT, -qryTonkhoSLTON.AsFloat))
    {QuynhND - Qui dinh ton kho toi thieu}
  else if qryTonkhoSLTON.AsFloat - qryTonkhoSLTOITHIEU.AsFloat < 0 then
    ShowMessageUniText(GetMessage(222) + FormatFloat(SOLUONG_FORMAT, (qryTonkhoSLTON.AsFloat - qryTonkhoSLTOITHIEU.AsFloat)))
  else
    Result := False;

  qryTonkho.Close;
end;

function  TMainDM.DonGiaBinhQuan(AMaKH:WideString;AMaCT:WideString;AMaKho:WideString; AMaHH:WideString;ASHTK:WideString;SLXuat:Double;var RGTXuat:Double):Double;
var
  SLTon:Double;
begin
  if vpBranch_IsMin = 0 then exit;

  RGTXuat:=0;
  if TKHangChothue(ASHTK) then
  begin
    Result:=DonGiaBinhQuanHangThue(AMaKH,AMaCT,AMaHH,ASHTK,SLXuat,RGTXuat);
    exit;
  end;
  qryTonkho.Close;
  qryTonkho.ParamByName('MAKHO').Value:=AMaKho;
  qryTonkho.ParamByName('MAHH').Value:=AMaHH;
  qryTonkho.ParamByName('SHTK').Value:=ASHTK;
  qryTonkho.ParamByName('TUKY').Value:=CurrentPeriod;
  qryTonkho.ParamByName('DENKY').Value:=CurrentPeriod;
  qryTonkho.ParamByName('BRANCH_ID').value := vpBranch_id;
  qryTonkho.Open;
  SLTon := qryTonkhoSLTON.AsFloat;
  if SLTon=0 then
    Result:=0
  else
    Result:=RoundTo(qryTonkhoGTTON.AsFloat/SLTon,-prmDECIMALDG_LEN);
  if SLXuat= qryTonkhoSLTON.AsFloat then
    RGTXuat:=qryTonkhoGTTON.AsFloat
  else
    RGTXuat:=0;
  qryTonkho.Close;
end;

function TMainDM.DonGiaXuat(AMaKH : WideString; AMaCT : WideString;
         AMaKho : WideString; AMaHH : WideString;
         ASHTK : WideString; APhieuXuat : WideString;
         ASoTT : SmallInt; SLXuat : Double; var RGTXuat : Double;
         var SLTon : Double) : double;
begin
  SLTon := 0;
  RGTXuat := 0;
  if TKHangChothue(ASHTK) then
  begin
    Result := DonGiaBinhQuanHangThue(AMaKH, AMaCT, AMaHH, ASHTK, SLXuat, RGTXuat);
    Exit;
  end;
  qryDonGiaXuat.Close;
  qryDonGiaXuat.ParamByName('MAKHO').Value := AMaKho;
  qryDonGiaXuat.ParamByName('MAHH').Value  := AMaHH;
  qryDonGiaXuat.ParamByName('SHTK').Value  := ASHTK;
  qryDonGiaXuat.ParamByName('KYHT').Value  := CurrentPeriod;
  qryDonGiaXuat.ParamByName('PHIEUXUAT').Value := APhieuXuat;
  qryDonGiaXuat.ParamByName('SLXUAT').Value := SLXUAT;
  qryDonGiaXuat.ParamByName('STT').Value := ASoTT;
  qryDonGiaXuat.ParamByName('BRANCH_ID').value := vpBranch_id;
  qryDonGiaXuat.Open;
  SLTon := qryDonGiaXuatSLTON.AsFloat;
  if SLTon = 0 then
    Result := 0
  else
    Result := RoundTo({qryDonGiaXuatGTTON.AsFloat / SLTon}
      qryDonGiaXuatDONGIA.Value, -prmDECIMALDG_LEN);
  if SLXuat = qryDonGiaXuatSLTON.AsFloat then
    RGTXuat := qryDonGiaXuatGTTON.AsFloat
  else
    RGTXuat:= 0;
  qryDonGiaXuat.Close;
end;

function  TMainDM.DonGiaBinhQuanHangThue(AMaKH:WideString;AMaCT:WideString;AMaHH:WideString;ASHTK:WideString;SLXuat:Double;var GTXuat:Double):Double;
var
  SLTon:Double;
begin
  { Khong con su dung nua
  qryCommon.Close;
  qryCommon.SQL.Text:='select slcuoiky, gtcuoiky from macro_soduchothue(:makh,:mact,:mahh,:shtk,:kyht,:kyht)';
  qryCommon.ParamByName('MAKH').Value:=AMaKH;
  qryCommon.ParamByName('MACT').Value:=AMaCT;
  qryCommon.ParamByName('MAHH').Value:=AMaHH;
  qryCommon.ParamByName('SHTK').Value:=ASHTK;
  qryCommon.ParamByName('KYHT').Value:=CurrentPeriod;
  qryCommon.Open;

  SLTon := qryCommon.FieldByName('slcuoiky').AsFloat;
  if SLTon=0 then
    Result:=0
  else
    Result:=RoundTo(qryCommon.FieldByName('gtcuoiky').AsFloat/SLTon,-prmDECIMALDG_LEN);
  if SLXuat= qryCommon.FieldByName('slcuoiky').AsFloat then
    GTXuat:=qryCommon.FieldByName('gtcuoiky').AsFloat
  else
    GTXuat:=0;
  qryCommon.Close;}
end;

procedure TMainDM.ImportDataFromExcel(ALOAICT:Boolean=True);
var
  i,ImportCount, ErrorCount:Integer;
  XLSRead:TXLSReadWriteII;
  XLSWriteLog:TXLSReadWriteII;
  OpenDialog1:TOpenDialog;
  SubMsgText:WideString;
begin
  OpenDialog1:=TOpenDialog.Create(nil);
  OpenDialog1.Filter:='Excel Files|*.xls';
  OpenDialog1.DefaultExt:='xls';

  if not OpenDialog1.Execute then exit;

  XLSRead:=TXLSReadWriteII.Create(nil);
  //XLSWriteLog:=TXLSReadWriteII.Create(nil);

  XLSRead.Filename:=OpenDialog1.FileName;
  //XLSWriteLog.Filename:=OpenDialog1.FileName;
  try
    XLSRead.Read;
  except
    XLSRead.Free;
    //XLSWriteLog.Free;
    OpenDialog1.Free;
    ShowMessageUnicode(55);
    Exit;
  end;

  //----DeActive triggers Insert------------------
  qryCommon.Close;
  qryCommon.SQL.Text :='execute procedure sp_change_trigger_active(1,0)';
  qryCommon.ExecSQL;
  //-------------------------

  ImportCount:=XLSRead.Sheets.Items[0].LastRow;
  ErrorCount:=0;

  {qryCommon.Close;
  qryCommon.SQL.Clear;
  qryCommon.Params.Clear;

  spExe.StoredProcName :='sp_importdata';
  //qryCommon.SQL.Text :='execute procedure sp_importdata (:sophieu,:loaict,:ngaylap,:khohang,:ghichu,:tkno,:dtno,:tkco,:dtco,:soluong,:dongia,:thanhtien)';
  spExe.Prepare;
  for i:=1 to ImportCount do
  begin
    try
      spExe.ParamByName('sophieu').Value:= XLSRead.Sheets.Items[0].AsWideString[0,i];
      if ALOAICT then
        spExe.ParamByName('loaict').AsInteger:= qryDocTypeDOCTYPE_ID.AsInteger
      else
        spExe.ParamByName('loaict').Clear;

      spExe.ParamByName('ngaylap').AsDate:= FloatToDateTime(XLSRead.Sheets.Items[0].AsFloat[1,i]);
      if XLSRead.Sheets.Items[0].AsWideString[2,i]<>'' then
        spExe.ParamByName('khohang').Value:= XLSRead.Sheets.Items[0].AsWideString[2,i]
      else
        spExe.ParamByName('khohang').Clear;
      spExe.ParamByName('noidung').Value:= XLSRead.Sheets.Items[0].AsWideString[3,i];
      spExe.ParamByName('tkno').Value:= XLSRead.Sheets.Items[0].AsWideString[4,i];
      if XLSRead.Sheets.Items[0].AsWideString[5,i]<>'' then
        spExe.ParamByName('dtno').Value:= XLSRead.Sheets.Items[0].AsWideString[5,i]
      else
        spExe.ParamByName('dtno').Clear;
      if XLSRead.Sheets.Items[0].AsWideString[6,i]<>'' then
        spExe.ParamByName('ytno').Value:= XLSRead.Sheets.Items[0].AsWideString[6,i]
      else
        spExe.ParamByName('ytno').Clear;
      spExe.ParamByName('tkco').Value:= XLSRead.Sheets.Items[0].AsWideString[7,i];
      if XLSRead.Sheets.Items[0].AsWideString[8,i]<>'' then
        spExe.ParamByName('dtco').Value:= XLSRead.Sheets.Items[0].AsWideString[8,i]
      else
        spExe.ParamByName('dtco').Clear;
      if XLSRead.Sheets.Items[0].AsWideString[9,i]<>'' then
        spExe.ParamByName('ytco').Value:= XLSRead.Sheets.Items[0].AsWideString[9,i]
      else
        spExe.ParamByName('ytco').Clear;
      if XLSRead.Sheets.Items[0].AsWideString[10,i]<>'' then
        spExe.ParamByName('tiente').Value:= XLSRead.Sheets.Items[0].AsWideString[10,i]
      else
        spExe.ParamByName('tiente').Clear;
      spExe.ParamByName('tygia').AsFloat:= XLSRead.Sheets.Items[0].AsFloat[11,i];
      spExe.ParamByName('soluong').AsFloat:= XLSRead.Sheets.Items[0].AsFloat[12,i];
      spExe.ParamByName('dongia').AsFloat:= XLSRead.Sheets.Items[0].AsFloat[13,i];
      spExe.ParamByName('thanhtien').AsFloat:= XLSRead.Sheets.Items[0].AsFloat[14,i];
      spExe.ParamByName('ghichu').Value:= XLSRead.Sheets.Items[0].AsWideString[15,i];
      spExe.ParamByName('branch_id_in').Value := vpBranch_id;
      spExe.ParamByName('YTNO2').AsFloat:= XLSRead.Sheets.Items[0].AsFloat[16,i];
      spExe.ParamByName('YTCO2').Value:= XLSRead.Sheets.Items[0].AsWideString[17,i];
    except
      ErrorCount:=ErrorCount+1;
      spExe.Close;
      Continue;
    end;

    try
      spExe.ExecProc;
    except
      ErrorCount:=ErrorCount+1;
      spExe.Close;
    end;
  }

  //qryCommon.SQL.Text :='select Ret from sp_importdata (:sophieu,:loaict,:ngaylap,:khohang,:noidung,:tkno,:dtno,:ytno,:tkco,:dtco,:ytco,:tiente,:soluong,:dongia,:thanhtien,:ghichu)';
  qryExe.SQL.Text :='execute procedure sp_importdata (:SOPHIEU ,:LOAICT ,:NGAYLAP ,:KHOHANG ,:NOIDUNG ,:TKNO ,:DTNO ,'
        +':YTNO ,:TKCO ,:DTCO ,:YTCO ,:TIENTE ,:TYGIA ,:SOLUONG ,:DONGIA ,'
        +':THANHTIEN ,:GHICHU ,:BRANCH_ID_IN ,:YTNO2 ,:YTCO2 ,:ENTRY_QUANTITY,:CHUNGTU)';
  qryExe.Prepare;
  for i:=1 to ImportCount do
  begin
    try
      qryExe.ParamByName('sophieu').Value:= XLSRead.Sheets.Items[0].AsWideString[0,i];
      qryExe.ParamByName('loaict').AsInteger:= qryDocTypeDOCTYPE_ID.AsInteger;
      qryExe.ParamByName('ngaylap').AsDate:= FloatToDateTime(XLSRead.Sheets.Items[0].AsFloat[1,i]);
      if XLSRead.Sheets.Items[0].AsWideString[2,i]<>'' then
        qryExe.ParamByName('khohang').Value:= XLSRead.Sheets.Items[0].AsWideString[2,i]
      else
        qryExe.ParamByName('khohang').Clear;
      qryExe.ParamByName('noidung').Value:= XLSRead.Sheets.Items[0].AsWideString[3,i];
      qryExe.ParamByName('tkno').Value:= XLSRead.Sheets.Items[0].AsWideString[4,i];
      if XLSRead.Sheets.Items[0].AsWideString[5,i]<>'' then
        qryExe.ParamByName('dtno').Value:= XLSRead.Sheets.Items[0].AsWideString[5,i]
      else
        qryExe.ParamByName('dtno').Clear;
      if XLSRead.Sheets.Items[0].AsWideString[6,i]<>'' then
        qryExe.ParamByName('ytno').Value:= XLSRead.Sheets.Items[0].AsWideString[6,i]
      else
        qryExe.ParamByName('ytno').Clear;
      qryExe.ParamByName('tkco').Value:= XLSRead.Sheets.Items[0].AsWideString[7,i];
      if XLSRead.Sheets.Items[0].AsWideString[8,i]<>'' then
        qryExe.ParamByName('dtco').Value:= XLSRead.Sheets.Items[0].AsWideString[8,i]
      else
        qryExe.ParamByName('dtco').Clear;
      if XLSRead.Sheets.Items[0].AsWideString[9,i]<>'' then
        qryExe.ParamByName('ytco').Value:= XLSRead.Sheets.Items[0].AsWideString[9,i]
      else
        qryExe.ParamByName('ytco').Clear;
      if XLSRead.Sheets.Items[0].AsWideString[10,i]<>'' then
        qryExe.ParamByName('tiente').Value:= XLSRead.Sheets.Items[0].AsWideString[10,i]
      else
        qryExe.ParamByName('tiente').Clear;
      qryExe.ParamByName('tygia').AsFloat:= XLSRead.Sheets.Items[0].AsFloat[11,i];
      qryExe.ParamByName('soluong').AsFloat:= XLSRead.Sheets.Items[0].AsFloat[12,i];
      qryExe.ParamByName('dongia').AsFloat:= XLSRead.Sheets.Items[0].AsFloat[13,i];
      qryExe.ParamByName('thanhtien').AsFloat:= XLSRead.Sheets.Items[0].AsFloat[14,i];
      qryExe.ParamByName('ghichu').Value:= XLSRead.Sheets.Items[0].AsWideString[15,i];
      qryExe.ParamByName('branch_id_in').Value:= vpBranch_id;
      qryExe.ParamByName('ytno2').Value:= XLSRead.Sheets.Items[0].AsWideString[16,i];
      qryExe.ParamByName('ytco2').Value:= XLSRead.Sheets.Items[0].AsWideString[17,i];
      qryExe.ParamByName('ENTRY_QUANTITY').AsFloat:= XLSRead.Sheets.Items[0].AsFloat[18,i];
      qryExe.ParamByName('CHUNGTU').AsFloat:= XLSRead.Sheets.Items[0].AsFloat[19,i];

    except
      ErrorCount:=ErrorCount+1;
      qryExe.Close;
      //XLSWriteLog.Sheets.Items[0].AsWideString[18,i]:=UTF8Decode('Format cell error');
      //XLSWriteLog.Write;
    end;

    try
      qryExe.ExecSQL;
      //XLSWriteLog.Sheets.Items[0].AsWideString[18,i]:=UTF8Decode('Successful');
      //XLSWriteLog.write;
    except
      ErrorCount:=ErrorCount+1;
      qryExe.Close;
      //XLSWriteLog.Sheets.Items[0].AsWideString[18,i]:=UTF8Decode('Insert Error');
      //XLSWriteLog.write;
    end;
    {if qryCommon.Active then
      if qryCommon.FieldByName('Ret').AsInteger=0 then
        XLSWriteLog.Sheets.Items[0].AsWideString[0,i]:=UTF8Decode('Bị lỗi');}

    qryExe.Close;
  end;

  //----Active triggers Insert------------------
  qryCommon.Close;
  qryCommon.SQL.Text :='execute procedure sp_change_trigger_active(1,1)';
  qryCommon.ExecSQL;
  //-------------------------

  ImportCount:=ImportCount-ErrorCount;
  SubMsgText:=UTF8Decode('(Thành công : ') + IntToStr(ImportCount)+ UTF8Decode(' dòng, Bị lỗi : ')+ IntToStr(ErrorCount)+ UTF8Decode(' dòng)');
  {try
    XLSWriteLog.Sheets.Items[0].AsWideString[1,0]:=UTF8Decode('Tóm tắt :');
    XLSWriteLog.Sheets.Items[0].AsWideString[1,1]:=IntToStr(ImportCount)+ UTF8Decode(' Dòng thành công');
    XLSWriteLog.Sheets.Items[0].AsWideString[1,2]:=IntToStr(ErrorCount)+ UTF8Decode(' Dòng bị lỗi');
    XLSWriteLog.Filename:=ApplicationDir +'\importlog.xls';
    XLSWriteLog.Write;
  except
    ShowMessageUnicode(30);
  end;}
  XLSRead.Free;
  //XLSWriteLog.Free;

  OpenDialog1.Free;
  ShowMessageUniText(GetMessage(56)+ SubMsgText);
  if ImportCount>0 then
    qryDocList.Refresh;
end;

procedure TMainDM.ImportCCDCFromExcel;
var
  i,ImportCount, ErrorCount:Integer;
  XLSRead:TXLSReadWriteII;
  XLSWriteLog:TXLSReadWriteII;
  OpenDialog1:TOpenDialog;
  SubMsgText:WideString;
begin
  OpenDialog1:=TOpenDialog.Create(nil);
  OpenDialog1.Filter:='Excel Files|*.xls';
  OpenDialog1.DefaultExt:='xls';

  if not OpenDialog1.Execute then exit;

  XLSRead:=TXLSReadWriteII.Create(nil);
  XLSWriteLog:=TXLSReadWriteII.Create(nil);

  XLSRead.Filename:=OpenDialog1.FileName;
  try
    XLSRead.Read;
  except
    XLSRead.Free;
    OpenDialog1.Free;
    ShowMessageUnicode(555);
    Exit;
  end;

  ImportCount:=XLSRead.Sheets.Items[0].LastRow;
  ErrorCount:=0;

  {spExe.Close;
  spExe.StoredProcName :='sp_importtscd';
  spExe.Prepare;}
  for i:=1 to ImportCount do
  begin
      qryExe.close;
      qryExe.sql.Clear;
      qryExe.Params.Clear;
      qryExe.sql.Text := 'execute procedure SP_IMPORTCCDC(:MACCDC, :tkccdc, :doituong_ng,:yeuto_ng,:TKPB, :TKTT, :SOPHIEUTANG,'
          +':NGAYTANG, :PHUONGTHUCPB, :THOIGIANSD, :DTPB, :YTPB,:YT2PB, :THANGBATDAUPB, :NAMBDPB,'
          +':BRANCH_ID_IN, :ghichu,:nguyengia,:haomonlk,:kypsng)';
      qryExe.prepare;

    try
      qryExe.ParamByName('MACCDC').Value:= XLSRead.Sheets.Items[0].AsWideString[0,i];
      qryExe.ParamByName('TKCCDC').Value:= XLSRead.Sheets.Items[0].AsWideString[1,i];

      if XLSRead.Sheets.Items[0].AsWideString[2,i]<>'' then
        qryExe.ParamByName('doituong_ng').Value := XLSRead.Sheets.Items[0].AsWideString[2,i]
      else
        qryExe.ParamByName('doituong_ng').Clear;
      if XLSRead.Sheets.Items[0].AsWideString[3,i]<>'' then
        qryExe.ParamByName('yeuto_ng').Value := XLSRead.Sheets.Items[0].AsWideString[3,i]
      else
        qryExe.ParamByName('yeuto_ng').Clear;

      qryExe.ParamByName('TKPB').Value:= XLSRead.Sheets.Items[0].AsWideString[4,i];
      qryExe.ParamByName('TKTT').Value := XLSRead.Sheets.Items[0].AsWideString[5,i];
      if XLSRead.Sheets.Items[0].AsWideString[6,i]<>'' then
        qryExe.ParamByName('SOPHIEUTANG').Value := XLSRead.Sheets.Items[0].AsWideString[6,i]
      else
        qryExe.ParamByName('SOPHIEUTANG').Clear;

      if XLSRead.Sheets.Items[0].AsWideString[7,i]<>'' then
        qryExe.ParamByName('NGAYTANG').Value:= FloatToDateTime(XLSRead.Sheets.Items[0].AsInteger[7,i])
      else
        qryExe.ParamByName('NGAYTANG').Clear;
      qryExe.ParamByName('PHUONGTHUCPB').Value:= XLSRead.Sheets.Items[0].AsInteger[8,i];
      qryExe.ParamByName('THOIGIANSD').Value:= XLSRead.Sheets.Items[0].AsInteger[9,i];
      if XLSRead.Sheets.Items[0].AsWideString[10,i]<>'' then
        qryExe.ParamByName('DTPB').Value:= XLSRead.Sheets.Items[0].AsWideString[10,i]
      else
        qryExe.ParamByName('DTPB').Clear;
      if XLSRead.Sheets.Items[0].AsWideString[11,i]<>'' then
        qryExe.ParamByName('YTPB').Value:= XLSRead.Sheets.Items[0].AsWideString[11,i]
      else
        qryExe.ParamByName('YTPB').Clear;
      if XLSRead.Sheets.Items[0].AsWideString[12,i]<>'' then
        qryExe.ParamByName('YT2PB').Value:= XLSRead.Sheets.Items[0].AsWideString[12,i]
      else
        qryExe.ParamByName('YT2PB').Clear;
      if XLSRead.Sheets.Items[0].AsWideString[13,i]<>'' then
        qryExe.ParamByName('THANGBATDAUPB').Value:= XLSRead.Sheets.Items[0].AsInteger[13,i]
      else
        qryExe.ParamByName('THANGBATDAUPB').Clear;
      if XLSRead.Sheets.Items[0].AsWideString[14,i]<>'' then
        qryExe.ParamByName('NAMBDPB').Value:= XLSRead.Sheets.Items[0].AsInteger[14,i]
      else
        qryExe.ParamByName('NAMBDPB').Clear;
      qryExe.ParamByName('BRANCH_ID_IN').Value:= vpBranch_id;
      if XLSRead.Sheets.Items[0].AsWideString[15,i]<>'' then
        qryExe.ParamByName('GHICHU').Value:= XLSRead.Sheets.Items[0].AsWideString[15,i]
      else
        qryExe.ParamByName('GHICHU').Clear;
      if XLSRead.Sheets.Items[0].AsWideString[16,i]<>'' then
        qryExe.ParamByName('nguyengia').Value:= XLSRead.Sheets.Items[0].AsInteger[16,i]
      else
        qryExe.ParamByName('nguyengia').Clear;
      if XLSRead.Sheets.Items[0].AsWideString[17,i]<>'' then
        qryExe.ParamByName('haomonlk').Value:= XLSRead.Sheets.Items[0].AsInteger[17,i]
      else
        qryExe.ParamByName('haomonlk').Clear;

      qryExe.ParamByName('kypsng').AsSmallint:= CurrentPeriod;
    except
      ErrorCount:=ErrorCount+1;
      qryExe.Close;
      Continue;
    end;
    try
      qryExe.ExecSQL;
      //qryCommon.ExecSQL;
    except
      ErrorCount:=ErrorCount+1;
    end;

    qryExe.Close;
  end;

  ImportCount:=ImportCount-ErrorCount;
  SubMsgText:=UTF8Decode('(Thành công : ') + IntToStr(ImportCount)+ UTF8Decode(' dòng, Bị lỗi : ')+ IntToStr(ErrorCount)+ UTF8Decode(' dòng)');
  try
    XLSWriteLog.Sheets.Items[0].AsWideString[1,0]:=UTF8Decode('Tóm tắt :');
    XLSWriteLog.Sheets.Items[0].AsWideString[1,1]:=IntToStr(ImportCount)+ UTF8Decode(' Dòng thành công');
    XLSWriteLog.Sheets.Items[0].AsWideString[1,2]:=IntToStr(ErrorCount)+ UTF8Decode(' Dòng bị lỗi');
    XLSWriteLog.Filename:=ApplicationDir+'\importlog.xls';
    XLSWriteLog.Write;
  except
    ShowMessageUnicode(30);
  end;
  XLSRead.Free;
  XLSWriteLog.Free;

  OpenDialog1.Free;
  ShowMessageUniText(GetMessage(56)+ SubMsgText);
  if ImportCount>0 then
    qryDTPBList.Refresh;
end;

procedure TMainDM.ImportTSCDFromExcel;
var
  i,ImportCount, ErrorCount:Integer;
  XLSRead:TXLSReadWriteII;
  XLSWriteLog:TXLSReadWriteII;
  OpenDialog1:TOpenDialog;
  SubMsgText:WideString;
begin
  OpenDialog1:=TOpenDialog.Create(nil);
  OpenDialog1.Filter:='Excel Files|*.xls';
  OpenDialog1.DefaultExt:='xls';

  if not OpenDialog1.Execute then exit;

  XLSRead:=TXLSReadWriteII.Create(nil);
  XLSWriteLog:=TXLSReadWriteII.Create(nil);

  XLSRead.Filename:=OpenDialog1.FileName;
  try
    XLSRead.Read;
  except
    XLSRead.Free;
    OpenDialog1.Free;
    ShowMessageUnicode(55);
    Exit;
  end;

  ImportCount:=XLSRead.Sheets.Items[0].LastRow;
  ErrorCount:=0;

  {spExe.Close;
  spExe.StoredProcName :='sp_importtscd';
  spExe.Prepare;}
  for i:=1 to ImportCount do
  begin

      qryExe.close;
      qryExe.sql.Clear;
      qryExe.Params.Clear;
      qryExe.sql.Text := 'execute procedure sp_importtscd(:SOHIEU,:TENTSCD,:SHTK,:NHOMTS,:BPSD,:TGBDSD,:NUOCSX ,'
            + ':GHICHU,:NGUYENGIA,:KHLUYKE,:PTKHNAM,:TGSD,:MUCKH,:TKPHANBO ,'
            + ':DTPHANBO,:ytphanbo,:YTPHANBO_2,:TKKHAUHAO,:BRANCH_ID)';
      qryExe.prepare;

    try
      qryExe.ParamByName('sohieu').Value:= XLSRead.Sheets.Items[0].AsWideString[0,i];
      qryExe.ParamByName('tentscd').Value:= XLSRead.Sheets.Items[0].AsWideString[1,i];
      qryExe.ParamByName('shtk').Value := XLSRead.Sheets.Items[0].AsWideString[2,i];
      if XLSRead.Sheets.Items[0].AsWideString[3,i]<>'' then
        qryExe.ParamByName('nhomts').Value := XLSRead.Sheets.Items[0].AsWideString[3,i]
      else
        qryExe.ParamByName('nhomts').Clear;
      if XLSRead.Sheets.Items[0].AsWideString[4,i] <> '' then
        qryExe.ParamByName('bpsd').Value:= XLSRead.Sheets.Items[0].AsWideString[4,i]
      else
        qryExe.ParamByName('bpsd').clear;
      qryExe.ParamByName('tgbdsd').Value:= XLSRead.Sheets.Items[0].AsWideString[5,i];
      qryExe.ParamByName('nuocsx').Value:= XLSRead.Sheets.Items[0].AsWideString[6,i];
      qryExe.ParamByName('ghichu').Value:= XLSRead.Sheets.Items[0].AsWideString[7,i];
      qryExe.ParamByName('nguyengia').AsFloat:= XLSRead.Sheets.Items[0].AsFloat[8,i];
      qryExe.ParamByName('khluyke').AsFloat:= XLSRead.Sheets.Items[0].AsFloat[9,i];
      if (XLSRead.Sheets.Items[0].AsString[10,i]='')then
        qryExe.ParamByName('PTKHNAM').Clear
      else
        qryExe.ParamByName('PTKHNAM').Value:= XLSRead.Sheets.Items[0].AsInteger[10,i];
      qryExe.ParamByName('TGSD').AsInteger:= XLSRead.Sheets.Items[0].AsInteger[11,i];
      qryExe.ParamByName('MUCKH').AsFloat:= XLSRead.Sheets.Items[0].AsFloat[12,i];
      qryExe.ParamByName('tkphanbo').Value:= XLSRead.Sheets.Items[0].AsWideString[13,i];
      if XLSRead.Sheets.Items[0].AsWideString[14,i]<>'' then
        qryExe.ParamByName('dtphanbo').Value:= XLSRead.Sheets.Items[0].AsWideString[14,i]
      else
        qryExe.ParamByName('dtphanbo').Clear;
      if XLSRead.Sheets.Items[0].AsWideString[15,i]<>'' then
        qryExe.ParamByName('ytphanbo').Value:= XLSRead.Sheets.Items[0].AsWideString[15,i]
      else
        qryExe.ParamByName('ytphanbo').Clear;
      if XLSRead.Sheets.Items[0].AsWideString[16,i]<>'' then
        qryExe.ParamByName('YTPHANBO_2').Value:= XLSRead.Sheets.Items[0].AsWideString[16,i]
      else
        qryExe.ParamByName('YTPHANBO_2').Clear;
      qryExe.ParamByName('tkkhauhao').Value:= XLSRead.Sheets.Items[0].AsWideString[17,i];
      qryExe.ParamByName('branch_id').Value:= vpBranch_id;

    except
      ErrorCount:=ErrorCount+1;
      qryExe.Close;
      Continue;
    end;

    try
      qryExe.ExecSQL;
      //qryCommon.ExecSQL;
    except
      ErrorCount:=ErrorCount+1;
    end;

    qryExe.Close;
  end;

  {qryCommon.Close;
  qryCommon.SQL.Clear;
  qryCommon.Params.Clear;

  qryCommon.SQL.Text :='select ret from sp_importtscd (:SOHIEU,:TENTSCD,:SHTK,:NHOMTS,:BPSD,:TGBDSD,:NUOCSX,:GHICHU,:NGUYENGIA,:KHLUYKE,:PTKHNAM,:TGSD,:MUCKH,:TKPHANBO,:DTPHANBO,:TKKHAUHAO)';
  //qryCommon.SQL.Text :='execute procedure sp_importtscd (:SOHIEU,:TENTSCD,:SHTK,:NHOMTS,:BPSD,:TGBDSD,:NUOCSX,:GHICHU,:NGUYENGIA,:KHLUYKE,:PTKHNAM,:TGSD,:MUCKH,:TKPHANBO,:DTPHANBO,:TKKHAUHAO)';
  qryCommon.Prepare;

  for i:=1 to ImportCount do
  begin
    try
      qryCommon.ParamByName('sohieu').Value:= XLSRead.Sheets.Items[0].AsWideString[0,i];
      qryCommon.ParamByName('tentscd').Value:= XLSRead.Sheets.Items[0].AsWideString[1,i];
      qryCommon.ParamByName('shtk').Value := XLSRead.Sheets.Items[0].AsWideString[2,i];
      if XLSRead.Sheets.Items[0].AsWideString[3,i]<>'' then
        qryCommon.ParamByName('nhomts').Value := XLSRead.Sheets.Items[0].AsWideString[3,i]
      else
        qryCommon.ParamByName('nhomts').Clear;
      qryCommon.ParamByName('bpsd').Value:= XLSRead.Sheets.Items[0].AsWideString[4,i];
      qryCommon.ParamByName('tgbdsd').Value:= XLSRead.Sheets.Items[0].AsWideString[5,i];
      qryCommon.ParamByName('nuocsx').Value:= XLSRead.Sheets.Items[0].AsWideString[6,i];
      qryCommon.ParamByName('ghichu').Value:= XLSRead.Sheets.Items[0].AsWideString[7,i];
      qryCommon.ParamByName('nguyengia').AsFloat:= XLSRead.Sheets.Items[0].AsFloat[8,i];
      qryCommon.ParamByName('khluyke').AsFloat:= XLSRead.Sheets.Items[0].AsFloat[9,i];
      qryCommon.ParamByName('PTKHNAM').AsInteger:= XLSRead.Sheets.Items[0].AsInteger[10,i];
      qryCommon.ParamByName('TGSD').AsInteger:= XLSRead.Sheets.Items[0].AsInteger[11,i];
      qryCommon.ParamByName('MUCKH').AsFloat:= XLSRead.Sheets.Items[0].AsFloat[12,i];
      qryCommon.ParamByName('tkphanbo').Value:= XLSRead.Sheets.Items[0].AsWideString[13,i];
      if XLSRead.Sheets.Items[0].AsWideString[14,i]<>'' then
        qryCommon.ParamByName('dtphanbo').Value:= XLSRead.Sheets.Items[0].AsWideString[14,i];
      qryCommon.ParamByName('tkkhauhao').Value:= XLSRead.Sheets.Items[0].AsWideString[15,i];

      qryCommon.Prepare;
      qryCommon.Open;
      //qryCommon.ExecSQL;
    except
      ErrorCount:=ErrorCount+1;
      qryCommon.Close;
      XLSWriteLog.Sheets.Items[0].AsWideString[0,i]:=UTF8Decode('Bị lỗi');
    end;
    if qryCommon.Active then
      if qryCommon.FieldByName('Ret').AsInteger=0 then
        XLSWriteLog.Sheets.Items[0].AsWideString[0,i]:=UTF8Decode('Bị lỗi');

    qryCommon.Close;
  end;}

  ImportCount:=ImportCount-ErrorCount;
  SubMsgText:=UTF8Decode('(Thành công : ') + IntToStr(ImportCount)+ UTF8Decode(' dòng, Bị lỗi : ')+ IntToStr(ErrorCount)+ UTF8Decode(' dòng)');
  try
    XLSWriteLog.Sheets.Items[0].AsWideString[1,0]:=UTF8Decode('Tóm tắt :');
    XLSWriteLog.Sheets.Items[0].AsWideString[1,1]:=IntToStr(ImportCount)+ UTF8Decode(' Dòng thành công');
    XLSWriteLog.Sheets.Items[0].AsWideString[1,2]:=IntToStr(ErrorCount)+ UTF8Decode(' Dòng bị lỗi');
    XLSWriteLog.Filename:=ApplicationDir+'\importlog.xls';
    XLSWriteLog.Write;
  except
    ShowMessageUnicode(30);
  end;
  XLSRead.Free;
  XLSWriteLog.Free;

  OpenDialog1.Free;
  ShowMessageUniText(GetMessage(56)+ SubMsgText);
  if ImportCount>0 then
    qryAssetList.Refresh;
end;

function  TMainDM.GetVATPercent(ASoct:WideString; AKyht:Smallint;ASoTT:Smallint; Var ATenhang:WideString):Smallint;
begin
  with qryCommon do
  begin
    Close;
    SQL.Clear;
    Params.Clear;
    SQL.Text :='select invoice_vat,ITEM_NAME from invoice_info where doc_id=:doc_id and period_id=:period_id and entry_id=:entry_id';
    Prepare;

    ParamByName('entry_id').Value := ASoTT;
    ParamByName('period_id').Value := AKyht;
    ParamByName('doc_id').Value := ASoct;
    Open;
    Result := FieldByName('invoice_vat').AsInteger;
    ATenhang := FieldByName('ITEM_NAME').Value;
    Close;
  end;
end;

//Dung de goi sua  1 phieu nao do tu ben ngoai , truoc khi goi nho
procedure TMainDM.Suachungtu(Soct:WideString; Kyht:Smallint; Branch_id: WideString;AShowNavigator:Boolean=False);
begin
  if Soct='' then exit;
  Screen.Cursor := crHourGlass;

  qryGetDoc.Close;
  qryGetDoc.ParamByName('PERIOD_ID').Value:=Kyht;
  qryGetDoc.ParamByName('DOC_ID').Value:=Soct;
  qryGetDoc.ParamByName('BRANCH_ID').Value := Branch_id;

  qryGetDoc.Open;
  if qryGetDoc.RecordCount=0 then
  begin
    Screen.Cursor := crDefault;
    ShowMessageUnicode(57);
    qryGetDoc.Close;
    exit;
  end;
  if qryDocType.Locate('DOCTYPE_ID', qryGetDocDOCTYPE_ID.AsInteger,[])=False then
  begin
    qryGetDoc.Close;
    Screen.Cursor := crDefault;
    ShowMessageUnicode(28);
    Exit;
  end;

  BeginLoadDocID:=Soct;
  BeginLoadPeriodID:=Kyht;
  BeginLoadBranchID:=Branch_id;

      with TDocFullFrm.Create(Application) do
      try
        //locbtnIns.Visible:=False;
        //locBtnCopy.Visible:=False;
        //TODO navigator
        locFirst.Visible:=AShowNavigator;
        locBack.Visible:=AShowNavigator;
        locNext.Visible:=AShowNavigator;
        locEnd.Visible:=AShowNavigator;

        Screen.Cursor := crDefault;
        ShowModal;
      finally
        Free;
      end;
end;

function TMainDM.CheckRequireField(DataSet: TDataSet):Boolean;
var
  i: Smallint;
begin
  Result:=True;
  for i:=0 to DataSet.FieldCount-1 do
  if DataSet.Fields[i].ReadOnly=False then //Bo cac truong Keyfield ra, truong cong lai, truong tinh toan...
  if DataSet.Fields[i].Required then
    if IsNotHasData(DataSet.Fields[i]) then
    begin
      Result:=False;
      ShowMessageUnicode(20);
      DataSet.Fields[i].FocusControl;
      Exit;
    end
end;

procedure TMainDM.Xemnhatky(Soct:WideString; Kyht:Smallint; Branch_id:widestring);
begin
  if Soct='' then exit;
  Screen.Cursor := crHourGlass;

  qryDocLog.Close;
  qryDocLog.SQL.Text:= Select_Log + ' where DOC_ID=:DOC_ID and PERIOD_ID=:PERIOD_ID and BRANCH_ID = :BRANCH_ID order by log_id';
  qryDocLog.Prepare;
  qryDocLog.ParamByName('PERIOD_ID').Value:=Kyht;
  qryDocLog.ParamByName('DOC_ID').Value:=Soct;
  qryDocLog.ParamByName('BRANCH_ID').Value := Branch_id;
  qryDocLog.Open;
  if qryDocLog.RecordCount=0 then
  begin
    Screen.Cursor := crDefault;
    qryDocLog.Close;
    ShowMessageUnicode(58);
    exit;
  end;

  with TDocLogFrm.Create(Application) do
  try
    HistoryType:=HistoryOfADoc;
    Screen.Cursor := crDefault;
    dxDBGrid1SOPHIEU.Visible:=False;
    btnXemPhieu.Visible:=False;
    ShowModal;
  finally
    Free;
  end;
end;

procedure TMainDM.XemnhatkyCacphieubiXoa();
begin
  Screen.Cursor := crHourGlass;

  qryDocLog.Close;
  qryDocLog.SQL.Text:= Select_Log + ' where PERIOD_ID is Null and BRANCH_ID = :BRANCH_ID order by log_id';
  qryDocLog.ParamByName('BRANCH_ID').Value := vpBranch_id;
  qryDocLog.Prepare;
  qryDocLog.Open;
  if qryDocLog.RecordCount=0 then
  begin
    Screen.Cursor := crDefault;
    qryDocLog.Close;
    ShowMessageUnicode(58);
    exit;
  end;

  with TDocLogFrm.Create(Application) do
  try
    HistoryType:=HistoryOfDeleted;
    Screen.Cursor := crDefault;
    btnXemPhieu.Visible:=False;
    ShowModal;
  finally
    Free;
  end;
end;


procedure TMainDM.Xemnhatkynguoidung(AUserName:WideString);
begin
  if AUserName='' then exit;
  Screen.Cursor := crHourGlass;


  qryDocLog.Close;
  qryDocLog.SQL.Text:= Select_Log + ' where USER_ID=:USER_ID order by log_id';
  qryDocLog.Prepare;
  qryDocLog.ParamByName('USER_ID').Value:=AUserName;
 // qryDocLog.ParamByName('BRANCH_ID').Value := vpBranch_id;
  qryDocLog.Open;
  if qryDocLog.RecordCount=0 then
  begin
    Screen.Cursor := crDefault;
    qryDocLog.Close;
    ShowMessageUnicode(58);
    exit;
  end;

  with TDocLogFrm.Create(Application) do
  try
    HistoryType:=HistoryOfAnUser;
    Screen.Cursor := crDefault;
    dxDBGrid1USER_ID.Visible:=False;
    btnXemPhieu.Visible:=True;
    ShowModal;
  finally
    Free;
  end;
end;


procedure TMainDM.qryRegForBillsBeforePost(DataSet: TDataSet);
begin
  if qryRegForBillsLOAIPBH.IsNull then
  begin
    //get msg at here
    ShowMessageUnicode(59);
    qryRegForBillsLOAIPBH.FocusControl;
    Abort;
    exit;
  end;
  if qryRegForBillsLOAIPXK.IsNull then
  begin
    //get msg at here
    ShowMessageUnicode(60);
    qryRegForBillsLOAIPXK.FocusControl;
    Abort;
    exit;
  end;
end;

procedure TMainDM.qryRegForBillsPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
var
  rs:Integer;
begin
  Action := daAbort;
  ErrImportMsg:=e.Message;
  if ImportingFromXLS then Exit;
  rs := ProcessErr(E,'Loại phiếu bán hàng');
  if rs=-803 then
    qryRegForBillsTENLOAIPBH.FocusControl;
  if rs=-530 then
  begin
    ShowMessageUnicode(74,e.Message,0);
  end;
end;

procedure TMainDM.qryProductInfoCalcFields(DataSet: TDataSet);
begin
  qryProductInfoTongcong.AsFloat := qryProductInfoLABOUR_COST.AsFloat+qryProductInfoMATERIAL_COST.AsFloat+qryProductInfoOTHER_COST.AsFloat;
  if qryProductInfoPRODUCTION_AMOUNT.AsFloat<>0 then
  begin
    qryProductInfoGIATHANHDV.AsFloat := Round(qryProductInfoTongcong.AsFloat/qryProductInfoPRODUCTION_AMOUNT.AsFloat);
    qryProductInfoCPNC.AsFloat := Round(qryProductInfoLABOUR_COST.AsFloat/qryProductInfoPRODUCTION_AMOUNT.AsFloat);
    qryProductInfoCPNVL.AsFloat := Round(qryProductInfoMATERIAL_COST.AsFloat/qryProductInfoPRODUCTION_AMOUNT.AsFloat);
    qryProductInfoCPSXC.AsFloat := Round(qryProductInfoOTHER_COST.AsFloat/qryProductInfoPRODUCTION_AMOUNT.AsFloat);
  end;
end;

procedure TMainDM.qryWarehouseBeforeDelete(DataSet: TDataSet);
begin
  if Not CheckAllowDelete(DataSet,11) then Abort;
end;

procedure TMainDM.qryInstockBeforeDelete(DataSet: TDataSet);
begin
  if Not CheckAllowDelete(DataSet,1) then Abort;
end;

procedure TMainDM.qryWarehouseBeforeEdit(DataSet: TDataSet);
begin
  if Not CheckAllowEdit(11) then Abort;
end;

procedure TMainDM.qryWarehouseBeforeInsert(DataSet: TDataSet);
begin
  if Not CheckAllowInsert(11) then Abort;
end;

procedure TMainDM.qryInstockBeforeEdit(DataSet: TDataSet);
begin
  if Not CheckAllowEdit(1) then Abort;
end;

procedure TMainDM.qryInstockBeforeInsert(DataSet: TDataSet);
begin
  if Not CheckAllowInsert(1) then Abort;
end;

procedure TMainDM.qryHSCTBeforeEdit(DataSet: TDataSet);
begin
  if Not CheckAllowEdit(2) then Abort;
end;

procedure TMainDM.qryRegForBillsBeforeDelete(DataSet: TDataSet);
begin
  if Not CheckAllowDelete(DataSet,6) then Abort;
end;

procedure TMainDM.qryRegForBillsBeforeEdit(DataSet: TDataSet);
begin
  if Not CheckAllowEdit(6) then Abort;
end;

procedure TMainDM.qryRegForBillsBeforeInsert(DataSet: TDataSet);
begin
  if Not CheckAllowInsert(6) then Abort;
end;

procedure TMainDM.qryRegTransferBeforeEdit(DataSet: TDataSet);
begin
  if Not CheckAllowEdit(6) then Abort;
end;

procedure TMainDM.qryRegTransferBeforeInsert(DataSet: TDataSet);
begin
  if Not CheckAllowInsert(6) then Abort;
end;

procedure TMainDM.qryRegAllocateBeforeEdit(DataSet: TDataSet);
begin
  if Not CheckAllowEdit(6) then Abort;
end;

procedure TMainDM.qryRegAllocateBeforeInsert(DataSet: TDataSet);
begin
  if Not CheckAllowInsert(6) then Abort;
end;

procedure TMainDM.qryRegKCLLBeforeEdit(DataSet: TDataSet);
begin
  if Not CheckAllowEdit(6) then Abort;
end;

procedure TMainDM.qryRegKCLLBeforeInsert(DataSet: TDataSet);
begin
  if Not CheckAllowInsert(6) then Abort;
end;

procedure TMainDM.qryParamsBeforeEdit(DataSet: TDataSet);
begin
  if Not CheckAllowEdit(6) then Abort;
end;

procedure TMainDM.qryWarehouseDeleteError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  Action := daAbort;
  ShowMessageUnicode(62,e.Message,0);

  if DataSet.RecordCount=1 then
    DataSet.Refresh;
end;

procedure TMainDM.qryInstockFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  Accept := (qryInstockWAREHOUSE_ID.Value= qryPWareWAREHOUSE_ID.Value);
end;

procedure TMainDM.qryWarehouseAfterInsert(DataSet: TDataSet);
begin
  qryWarehouseWAREHOUSE_ID.FocusControl;
end;

procedure TMainDM.qryRegKCLLAfterInsert(DataSet: TDataSet);
begin
  qryRegKCLLFROM_ACCOUNT.FocusControl;
end;

procedure TMainDM.qryRegTransferAfterInsert(DataSet: TDataSet);
begin
  qryRegTransferFROM_ACCOUNT.FocusControl;
end;

procedure TMainDM.qryRegAllocateAfterInsert(DataSet: TDataSet);
begin
  qryRegAllocateFROM_ACCOUNT.FocusControl;
end;

procedure TMainDM.qryRegForBillsAfterInsert(DataSet: TDataSet);
begin
  qryRegForBillsTENLOAIPBH.FocusControl;
end;

procedure TMainDM.qryInstockAfterInsert(DataSet: TDataSet);
begin
  qryInstockOBJECT_ID.FocusControl;
end;

procedure TMainDM.acUnlockDataExecute(Sender: TObject);
begin
  with qryCommon do
  begin
    Close;
    SQL.Clear;
    Params.Clear;
    SQL.Text :='update system_log set status_log=0 where period_id=:kyht';
    Prepare;

    ParamByName('kyht').Value := CurrentPeriod;
    ExecSQL;
    Close;
  end;
  MainFrm.BarStaticStatus.Caption:='';
  MainDM.qrySysLog.Close;
  MainDM.qrySysLog.Open;
  LockingData:=False;
end;

procedure TMainDM.qryDocListBeforeEdit(DataSet: TDataSet);
begin
  if qryDocTypeALLOWEDIT.AsInteger=0 then
  begin
    ShowMessageUnicode(24);
    Abort;
    exit;
  end;
end;

procedure TMainDM.acLoadUserRightExecute(Sender: TObject);
begin
  with MainDM do
  begin
    qryUserRight.Close;
    qryUserRight.Prepare;
    qryUserRight.ParamByName('GROUP_ID').Value := CurrentGroup;
    qryUserRight.ParamByName('USERNAME').Value := CurrentUser;
    qryUserRight.ParamByName('BRANCH_ID').Value := vpBranch_id;
    qryUserRight.Prepare;
    qryUserRight.Open;
    qryUserRight.First;
    while not qryUserRight.Eof do
    begin
      SSPUserRight[qryUserRightMODUL_ID.AsInteger].RR :=(qryUserRightALLOWREAD.AsInteger=1);
      SSPUserRight[qryUserRightMODUL_ID.AsInteger].IR :=(qryUserRightALLOWINSERT.AsInteger=1);
      SSPUserRight[qryUserRightMODUL_ID.AsInteger].ER :=(qryUserRightALLOWEDIT.AsInteger=1);
      SSPUserRight[qryUserRightMODUL_ID.AsInteger].DR :=(qryUserRightALLOWDELETE.AsInteger=1);

      qryUserRight.Next;
    end;
  end;
end;

procedure TMainDM.qryCurrencyAfterInsert(DataSet: TDataSet);
begin
  qryCurrencyCURRENCY_ID.FocusControl;
end;

procedure TMainDM.qryCurrencyBeforeDelete(DataSet: TDataSet);
begin
  if Not CheckAllowDelete(DataSet,11) then Abort;
end;

procedure TMainDM.qryCurrencyDeleteError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  Action := daAbort;
  ShowMessageUnicode(63,e.Message,0);
  if DataSet.RecordCount=1 then
    DataSet.Refresh;
end;

procedure TMainDM.qryCurrencyPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  Action := daAbort;
  ErrImportMsg:=e.Message;
  if ImportingFromXLS then Exit;
  if ProcessErr(E,'ngoại tệ') =-803 then
    qryCurrencyCURRENCY_ID.FocusControl;
end;

procedure TMainDM.qryCurrencyBeforePost(DataSet: TDataSet);
begin
  if IsNotHasData(qryCurrencyCURRENCY_ID) then
  begin
    ShowMessageUnicode(64);
    Abort;
  end;
end;

procedure TMainDM.qryObjectTypeNewRecord(DataSet: TDataSet);
begin
  qryObjectTypeOTYPE_ID.AsInteger := MaLoaiDTLN;
  qryObjectTypeOTYPE_NOTE.Value :='User Define';
  MaLoaiDTLN:=MaLoaiDTLN+1;
end;

procedure TMainDM.qryBeginObjBeforeDelete(DataSet: TDataSet);
begin
  if Not CheckAllowDelete(DataSet,1) then Abort;
end;

procedure TMainDM.qryBeginObjBeforeEdit(DataSet: TDataSet);
begin
  if Not CheckAllowEdit(1) then Abort;
end;

procedure TMainDM.qryBeginObjBeforeInsert(DataSet: TDataSet);
begin
  if Not CheckAllowInsert(1) then Abort;
end;

procedure TMainDM.qryBeginObjBeforePost(DataSet: TDataSet);
begin
  if ImportingFromXLS then exit;
  
  if qryBeginObjOBJECT_ID.IsNull then
  begin
    ShowMessageUnicode(65);
    qryBeginObjOBJECT_ID.FocusControl;
    Abort;
    exit;
  end;
  if qryPAccISMIN.AsInteger<>1 then
  begin
    ShowMessageUnicode(27);
    qryPAccACCOUNT_ID.FocusControl;
    Abort;
    exit;
  end;
  if KiemtrahopleBeginObj=False then
  begin
    qryBeginObjOBJECT_ID.FocusControl;
    Abort;
    exit;
  end;

  qryBeginObjACCOUNT_ID.Value := qryPAccACCOUNT_ID.Value;
  qryBeginObjPERIOD_ID.Value := CurrentPeriod;
  qryBeginObjBRANCH_ID.Value := vpBranch_id;
end;

function TMainDM.KiemtrahopleBeginObj:Boolean;
begin
  Result:=True;
  if Not (qryBeginObj.State in [dsEdit, dsInsert]) then exit;
  if qryBeginObjOBJECT_ID.IsNull then exit;
  if IsNotHasData(qryBeginObjOBJECT_ID) then exit;

  Result:=False;
  if Not CheckObject(qryBeginObjOBJECT_ID.Value,CurObjTypeID) then
  begin
    ShowMessageUnicode(66);
    qryBeginObjOBJECT_ID.FocusControl;
    exit;
  end;
  if qryBeginObjOBJECT_ID.Value<>CurObjID then
    qryBeginObjOBJECT_ID.Value:=CurObjID;

  qryBeginObjOBJECT_NAME.Value := CurObjName;
  qryBeginObjOTYPE_ID.AsInteger:= CurObjTypeID;
  Result := True;
end;

function TMainDM.KiemtraTKNO:Boolean;
begin
  if Not (qryTemplateList.State in [dsInsert, dsEdit]) then
  begin
    Result:=True;
    exit;
  end;
  Result:=False;
  if IsNotHasData(qryTemplateListTKNO) then
  begin
    ShowMessageUnicode(67);
    qryTemplateListTKNO.FocusControl;
    exit;
  end;

  qryPAcc.Open;
  MainDM.qryPAcc.OnFilterRecord:=MainDM.qryPAccFilterBenNORecord;
  MainDM.qryPAcc.Filtered:=True;
  if qryPAccAccount_ID.Value<>qryTemplateListTKNO.Value then
  if Not qryPAcc.Locate('Account_ID',qryTemplateListTKNO.Value,[]) then
  begin
    ShowMessageUnicode(42);
    qryTemplateListTKNO.FocusControl;
    exit;
  end;
  if qryPAccISMIN.AsInteger <>1 then
  begin
    if XulyTaikhoan(qryTemplateListTKNO.Value)='' then
    begin
      qryTemplateListTKNO.FocusControl;
      exit;
    end
    else
    begin
      qryTemplateListTKNO.Value:=SHTIEUKHOAN;
      qryPAcc.Locate('ACCOUNT_ID', SHTIEUKHOAN,[]);
    end;
  end;

  Result:=True;
end;
function TMainDM.KiemtraTKCO:Boolean;
begin
  if Not (qryTemplateList.State in [dsInsert, dsEdit]) then
  begin
    Result:=True;
    exit;
  end;
  Result:=False;
  if IsNotHasData(qryTemplateListTKCO) then
  begin
    ShowMessageUnicode(67);
    qryTemplateListTKCO.FocusControl;
    exit;
  end;

  qryPAcc.Open;
  MainDM.qryPAcc.OnFilterRecord:=MainDM.qryPAccFilterBenCORecord;
  MainDM.qryPAcc.Filtered:=True;
  if qryPAccAccount_ID.Value<>qryTemplateListTKCO.Value then
  if Not qryPAcc.Locate('Account_ID',qryTemplateListTKCO.Value,[]) then
  begin
    ShowMessageUnicode(42);
    qryTemplateListTKCO.FocusControl;
    exit;
  end;
  if qryPAccISMIN.AsInteger <>1 then
  begin
    if XulyTaikhoan(qryTemplateListTKCO.Value)='' then
    begin
      qryTemplateListTKCO.FocusControl;
      exit;
    end
    else
    begin
      qryTemplateListTKCO.Value:=SHTIEUKHOAN;
      qryPAcc.Locate('ACCOUNT_ID', SHTIEUKHOAN,[]);
    end;
  end;

  Result:=True;
end;
function TMainDM.KiemtraTKVAT:Boolean;
begin
  Result:=True;
  if Not (qryTemplateList.State in [dsInsert, dsEdit]) then exit;
  if qryTemplateListTKVAT.IsNull then exit;
  if IsNotHasData(qryTemplateListTKVAT) then
  begin
    qryTemplateListTKVAT.Clear;
    exit;
  end;

  FilterAccType:=12;
  qryPAcc.OnFilterRecord := qryPAccFilterRecord;
  qryPAcc.Filtered := True;

  Result:=False;

  if qryPAccAccount_ID.Value<>qryTemplateListTKVAT.Value then
  if Not qryPAcc.Locate('Account_ID',qryTemplateListTKVAT.Value,[]) then
  begin
    ShowMessageUnicode(42);
    qryTemplateListTKVAT.FocusControl;
    exit;
  end;
  if qryPAccISMIN.AsInteger <>1 then
  begin
    if XulyTaikhoan(qryTemplateListTKVAT.Value)='' then
    begin
      qryTemplateListTKVAT.FocusControl;
      exit;
    end
    else
    begin
      qryTemplateListTKVAT.Value:=SHTIEUKHOAN;
      qryPAcc.Locate('ACCOUNT_ID', SHTIEUKHOAN,[]);
    end;
  end;
  Result:=True;
end;
function TMainDM.KiemtraKhoHang:Boolean;
begin
  Result := KiemtraKhoaNgoai(qryTemplateList,qryPWare,'WAREHOUSE_ID','WAREHOUSE_ID','kho hàng', False);
  if Result=False then
    qryTemplateListWAREHOUSE_ID.FocusControl;
end;
function TMainDM.KiemtrahopleInstock:Boolean;
begin
  Result:=True;
  if Not (qryInstock.State in [dsEdit, dsInsert]) then exit;
  if qryInstockOBJECT_ID.IsNull then exit;
  if IsNotHasData(qryInstockOBJECT_ID) then exit;

  Result:=False;

  if Not CheckObject(qryInstockOBJECT_ID.Value,2) then
  begin
    ShowMessageUnicode(68);
    qryInstockOBJECT_ID.FocusControl;
    exit;
  end;
  if qryInstockOBJECT_ID.Value<>CurObjID then
    qryInstockOBJECT_ID.Value:=CurObjID;
  qryInstockOBJECT_NAME.Value := CurObjName;
  Result := True;
end;



procedure TMainDM.qryBeginObjAfterInsert(DataSet: TDataSet);
begin
  qryBeginObjOBJECT_ID.FocusControl;
end;

procedure TMainDM.qryObjectNewRecord(DataSet: TDataSet);
begin
  qryObjectOBJECT_STATUS.AsInteger:=1;
  qryObjectCREATE_DATE.AsDateTime:=WorkingDate;
  qryObjectOTYPE_ID.AsInteger := qryObjectTypeOTYPE_ID.AsInteger;
  
end;

procedure TMainDM.qryObjectAfterInsert(DataSet: TDataSet);
var
  Str,MaxID:String;
  MaxValue,i,tmp:Integer;
begin
  qryObjectOBJECT_ID.FocusControl;

  if ImportingFromXLS then Exit;

  if ((CurObjIDFormat <> '') and (PosFirst <> 0)) then
  begin
    Str := UTF8Encode(CurObjIDFormat);
    qryGetMaxObjID.Close;
    if GenObjIDGrp and IsHasData(qryObjectOBJGRP_ID) then
    begin
      qryGetMaxObjID.SQL.Text := 'SELECT OBJECT_ID FROM OBJECT_LIST where OTYPE_ID=:OTYPE_ID and OBJGRP_ID=:GRPID';
      qryGetMaxObjID.ParamByName('GRPID').Value := qryObjectOBJGRP_ID.Value;
    end
    else
      qryGetMaxObjID.SQL.Text:='SELECT OBJECT_ID FROM OBJECT_LIST where OTYPE_ID=:OTYPE_ID';

    qryGetMaxObjID.ParamByName('OTYPE_ID').AsInteger:=CurObjTypeID;
    qryGetMaxObjID.Open;

    MaxValue:=0;
    while Not qryGetMaxObjID.Eof do
    begin
      MaxID:=UTF8Encode(qryGetMaxObjIDOBJECT_ID.Value);
      MaxID:=Copy(MaxID,PosFirst,PosLast-PosFirst+1);
      if TryStrToInt(MaxID,tmp) then
      if tmp>MaxValue then
        MaxValue:=tmp;

      qryGetMaxObjID.Next;
    end;

    qryGetMaxObjID.Close;

    MaxValue:=MaxValue+1;
    MaxID:=IntToStr(MaxValue);
    for i:=length(MaxID) to PosLast-PosFirst do
      MaxID:='0'+MaxID;

    MaxID:=Copy(Str,0,PosFirst-1)+MaxID+Copy(Str,PosLast+1,30);
    if IsHasData(qryObjectOBJGRP_ID) then
    begin
      MaxID:=StringReplace(MaxID,'$GRP$',UTF8Encode(qryObjectOBJGRP_ID.Value),[]);
      MaxID:=StringReplace(MaxID,'$GROUP$',UTF8Encode(qryObjectOBJGRP_ID.Value),[]);
    end
    else
    begin
      MaxID:=StringReplace(MaxID,'$GRP$','',[]);
      MaxID:=StringReplace(MaxID,'$GROUP$','',[]);
    end;

    qryObjectOBJECT_ID.Value:=UTF8Decode(MaxID);

  end;
end;

procedure TMainDM.qryObjectBeforePost(DataSet: TDataSet);
begin
  if prmUseDocumentLog then
    qryObjectLASTUSER_MODIFY.Value:=CurrentUser
  else
    qryObjectLASTUSER_MODIFY.Clear;
    
  if ImportingFromXLS then exit;

  if IsNotHasData(qryObjectOBJECT_ID) then
  begin
    ShowMessageUnicode(65);
    qryObjectOBJECT_ID.FocusControl;
    Abort;
    exit;
  end;
  LastModifyItemID:=qryObjectOBJECT_ID.Value;
end;

procedure TMainDM.qryObjectPostError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
var
  kq:Integer;
begin
  Action := daAbort;

  ErrImportMsg:=e.Message;
  if ImportingFromXLS then Exit;

  kq:= ProcessErr(E,'đối tượng');


  if kq=-803 then
    qryObjectOBJECT_ID.FocusControl
  else if kq=-530 then
  begin
    qryPObjGrp.Open;
    if Not qryObjectOBJGRP_ID.IsNull and Not qryPObjGrp.Locate('OBJGRP_ID',qryObjectOBJGRP_ID.Value,[]) then
    begin
      ShowMessageUnicode(185,E.Message,0);
      qryObjectOBJGRP_ID.FocusControl;
    end
    else
    begin
      ShowMessageUnicode(46,E.Message,0);
      qryObjectMAKH.FocusControl;
    end
  end
  else if kq = -836 then
    begin
    if (e.Message = 'Ten khong duoc trung') then
    begin
      ShowMessageUnicode(230, E.Message, 0);
      qryObjectOBJECT_NAME.FocusControl;
      end
    else if (e.Message = 'Dia chi khong duoc trung') then
    begin
      ShowMessageUnicode(231, E.Message, 0);
      qryObjectSUBINFO_1.FocusControl;
      end
    else if (e.Message = 'Ma so thue khong duoc trung') then
    begin
      ShowMessageUnicode(232, E.Message, 0);
      qryObjectSUBINFO_2.FocusControl;
    end
  end
  else ShowMessage(e.Message);

end;

procedure TMainDM.qryObjectDeleteError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  Action := daAbort;
  ShowMessageUnicode(29,e.Message,0);
  if DataSet.RecordCount=1 then
    DataSet.Refresh;
end;

procedure TMainDM.qryObjectTypeDeleteError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  Action := daAbort;
  ShowMessageUnicode(69,e.Message,0);
  if DataSet.RecordCount=1 then
    DataSet.Refresh;
end;

procedure TMainDM.qryObjectTypeAfterOpen(DataSet: TDataSet);
begin
  qryObjectType.Last;
  MaLoaiDTLN := qryObjectTypeOTYPE_ID.AsInteger + 1;
  qryObjectType.First;
  if MaLoaiDTLN<=100 then
    MaLoaiDTLN:=111;
end;

procedure TMainDM.qryRateNewRecord(DataSet: TDataSet);
begin
  qryRateTIME_POINT.AsDateTime:=Now;
end;

procedure TMainDM.qryRateAfterInsert(DataSet: TDataSet);
begin
  qryRateCURRENCY_ID.FocusControl;
end;

procedure TMainDM.qryRateBeforeDelete(DataSet: TDataSet);
begin
  if Not CheckAllowDelete(DataSet,11) then Abort;
end;

procedure TMainDM.qryRateBeforePost(DataSet: TDataSet);
begin
  if IsNotHasData(qryRateCURRENCY_ID) then
  begin
    //get msg at here
    ShowMessageUnicode(64);
    qryRateCURRENCY_ID.FocusControl;
    Abort;
    exit;
  end;
  if qryRateTIME_POINT.IsNull then
  begin
    //get msg at here
    ShowMessageUnicode(70);
    qryRateTIME_POINT.FocusControl;
    Abort;
  end;
end;

procedure TMainDM.qryRatePostError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
var
  kq:Integer;
begin
  Action := daAbort;
  ErrImportMsg:=e.Message;
  if ImportingFromXLS then Exit;
  kq:= ProcessErr(E,'');
  if kq=-803 then
    qryRateCURRENCY_ID.FocusControl
  else if kq=-530 then
  begin
    ShowMessageUnicode(71,e.Message,0);
    qryRateCURRENCY_ID.FocusControl;
  end;
end;

procedure TMainDM.qryObjectTypeBeforeDelete(DataSet: TDataSet);
begin
  if qryObjectTypeOTYPE_ID.AsInteger<=10 then
  begin
    ShowMessageUnicode(25);
    Abort;
    exit;
  end;
  if Not CheckAllowDelete(DataSet,8) then Abort;
end;

procedure TMainDM.qryCurrencyBeforeEdit(DataSet: TDataSet);
begin
  if Not CheckAllowEdit(11) then Abort;
end;

procedure TMainDM.qryCurrencyBeforeInsert(DataSet: TDataSet);
begin
  if Not CheckAllowInsert(11) then Abort;
end;

procedure TMainDM.qryRateBeforeEdit(DataSet: TDataSet);
begin
  if Not CheckAllowEdit(11) then Abort;
end;

procedure TMainDM.qryRateBeforeInsert(DataSet: TDataSet);
begin
  if Not CheckAllowInsert(11) then Abort;
end;

procedure TMainDM.qryAssetListDeleteError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  Action:=daAbort;
  ShowMessageUnicode(29,e.Message,0);
  if DataSet.RecordCount=1 then
    DataSet.Refresh;
end;

procedure TMainDM.qryAssetListCalcFields(DataSet: TDataSet);
begin
  qryAssetListGTCL.AsFloat:=qryAssetListNGUYENGIA.AsFloat-qryAssetListHAOMON.AsFloat;
end;

procedure TMainDM.qryTemplateListBeforeDelete(DataSet: TDataSet);
begin
  if ShowMessageUnicode(23,'',4)= 7 then
    Abort;
end;

procedure TMainDM.qryTemplateListNewRecord(DataSet: TDataSet);
begin
  qryTemplateListCHODUYET.AsInteger:= 0;
  qryTemplateListTEMPLATE_TYPE.AsInteger:= qryDocTypeDOCTYPE_ID.AsInteger;
  qryTemplateListNHAPGIACOTHUE.AsInteger:=0;
  qryTemplateListHACHTOANNT.AsInteger:=0;
  qryTemplateListSHOTCUT_ID.Value := 0;
end;

procedure TMainDM.qryTemplateListPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
var
  rs :Integer;
begin
  Action := daAbort;
  ErrImportMsg:=e.Message;
  if ImportingFromXLS then Exit;
  rs := ProcessErr(E,'',0);
  if rs=-803 then
  begin
    ShowMessageUnicode(74,e.Message,0);
    qryTemplateListTEMPLATE_NAME.FocusControl;
    exit;
  end;
  if rs=-530 then
  begin
    ShowMessageUnicode(75,e.Message,0);
    exit;
  end;
end;

procedure TMainDM.qryTemplateListAfterInsert(DataSet: TDataSet);
begin
  qryTemplateListTEMPLATE_NAME.FocusControl;
end;

procedure TMainDM.qryTemplateListBeforePost(DataSet: TDataSet);
begin
  if IsNotHasData(qryTemplateListTEMPLATE_NAME) then
  begin
    ShowMessageUnicode(76);
    qryTemplateListTEMPLATE_NAME.FocusControl;
    Abort;
    exit;
  end;
  if KiemtraTKNO=False then Abort;
  if KiemtraTKCO=False then Abort;
  if KiemtraTKVAT=False then Abort;
  if KiemtraKhohang=False then Abort;
end;

function TMainDM.ReadTemplateInfo:Boolean;
begin
  CurTemp.TempID := qryTemplateListTEMPLATE_ID.AsInteger;
  CurTemp.TempName:=qryTemplateListTEMPLATE_NAME.Value;
  CurTemp.Person_Name:=qryTemplateListTEMPLATE_PERSON.Value;
  CurTemp.Person_Addr:=qryTemplateListTEMPLATE_ADDR.Value;
  CurTemp.Voucher:=qryTemplateListTEMPLATE_VOUCHER.Value;
  CurTemp.Warehouse_ID:=qryTemplateListWAREHOUSE_ID.Value;
  CurTemp.SHTKNO:=qryTemplateListTKNO.Value;
  CurTemp.SHTKCO:=qryTemplateListTKCO.Value;
  CurTemp.MADTNO:=qryTemplateListDTNO.Value;
  CurTemp.MADTCO:=qryTemplateListDTCO.Value;
  CurTemp.CHODUYET := qryTemplateListCHODUYET.AsInteger;

  qryPAcc.Open;
  qryPAcc.Filtered:=False;
  qryPAcc.Locate('ACCOUNT_ID',CurTemp.SHTKNO,[]);
  CurTemp.LOAITKNO:=qryPAccOTYPE_ID.AsInteger;
  CurTemp.YEUTONO:=qryPAccDTYPE_ID.AsInteger;

  qryPAcc.Locate('ACCOUNT_ID',CurTemp.SHTKCO,[]);
  CurTemp.LOAITKCO:=qryPAccOTYPE_ID.AsInteger;
  CurTemp.YEUTOCO:=qryPAccDTYPE_ID.AsInteger;
  CurTemp.SHTKVAT:=qryTemplateListTKVAT.Value;
  CurTemp.Comment:=qryTemplateListTEMPLATE_NOTES.Value;
  CurTemp.NHAPGIACOTHUE:=(qryTemplateListNHAPGIACOTHUE.AsInteger=1);
  CurTemp.HACHTOANNT:=(qryTemplateListHACHTOANNT.AsInteger=1);
  CurTemp.CTMOTNO:=(qryTemplateListCTMOTNO.AsInteger=1);
  if CurTemp.CTMOTNO then
  begin
    CurTemp.LOAIDTCHINH:=CurTemp.LOAITKNO;
    CurTemp.LOAIDTPHU:=CurTemp.LOAITKCO;
  end
  else
  begin
    if CurTemp.LOAITKCO<>2 then
      CurTemp.LOAIDTCHINH:=CurTemp.LOAITKCO
    else
      CurTemp.LOAIDTCHINH:=0;

    CurTemp.LOAIDTPHU:=CurTemp.LOAITKNO;
  end;
  if CurTemp.LOAIDTCHINH=0 then
    CurTemp.LOAIDTCHINH:=qryDocTypeLOAIDT.AsInteger;
  
  CurTemp.TENDTCHINH:='';
  qryObjType.Open;
  if CurTemp.LOAIDTCHINH<>0 then
    if qryObjType.Locate('OTYPE_ID',CurTemp.LOAIDTCHINH,[]) then
      CurTemp.TENDTCHINH:=qryObjTypeSHORT_NAME.Value;
  CurTemp.TENDTPHU:='';
  if CurTemp.LOAIDTPHU<>0 then
    if qryObjType.Locate('OTYPE_ID',CurTemp.LOAIDTPHU,[]) then
      CurTemp.TENDTPHU:=qryObjTypeSHORT_NAME.Value;

  Result:=True;
end;

procedure TMainDM.qryObjectTypeBeforeEdit(DataSet: TDataSet);
begin
  if Not CheckAllowEdit(8) then Abort;
end;

procedure TMainDM.qryObjectTypeBeforeInsert(DataSet: TDataSet);
begin
  if Not CheckAllowInsert(8) then Abort;
end;

procedure TMainDM.qryDefRptLCTTBeforeEdit(DataSet: TDataSet);
begin
  if Not MainDM.CheckAllowEdit(6) then Abort;
end;

procedure TMainDM.qryDefRptBCDKTBeforeEdit(DataSet: TDataSet);
begin
  if Not CheckAllowEdit(6) then Abort;
end;

procedure TMainDM.qryBeginFBalBeforePost(DataSet: TDataSet);
begin
  if ImportingFromXLS then exit;
  if qryBeginFBalACCOUNT_ID.IsNull then
  begin
    ShowMessageUnicode(67);
    qryBeginFBalACCOUNT_ID.FocusControl;
    Abort;
    exit;
  end;
  if qryBeginFBalCURRENCY_ID.IsNull then
  begin
    ShowMessageUnicode(64);
    qryBeginFBalCURRENCY_ID.FocusControl;
    Abort;
    exit;
  end;
  if KiemtrahopleTKBeginFBal=False then
  begin
    qryBeginFBalACCOUNT_ID.FocusControl;
    Abort;
    exit;
  end;
  if KiemtrahopleTTBeginFBal=False then
  begin
    qryBeginFBalCURRENCY_ID.FocusControl;
    Abort;
    exit;
  end;

  qryBeginFBalPERIOD_ID.Value := CurrentPeriod;
  qryBeginFBalBRANCH_ID.Value := vpBranch_id;
end;

procedure TMainDM.qryBeginFBalAfterInsert(DataSet: TDataSet);
begin
  qryBeginFBalACCOUNT_ID.FocusControl;
end;

procedure TMainDM.qryBeginFBalBeforeDelete(DataSet: TDataSet);
begin
  if Not CheckAllowDelete(DataSet,1) then Abort;
end;

procedure TMainDM.qryBeginFBalBeforeEdit(DataSet: TDataSet);
begin
  if Not CheckAllowEdit(1) then Abort;
end;

procedure TMainDM.qryBeginFBalBeforeInsert(DataSet: TDataSet);
begin
  if Not CheckAllowInsert(1) then Abort;
end;

procedure TMainDM.qryBeginFBalPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
var
  rs:Integer;
begin
  Action := daAbort;
  ErrImportMsg:=e.Message;
  if ImportingFromXLS then Exit;
  rs:=ProcessErr(E,'',0);
  case rs of
    -803://Trung khoa
    begin
      ShowMessageUnicode(79,e.Message,0);
      qryBeginFBalACCOUNT_ID.FocusControl;
    end;
    -530://khoa ngoai
    begin
      ShowMessageUnicode(42,e.Message,0);
      qryBeginFBalACCOUNT_ID.FocusControl;
    end;
  end;
end;

procedure TMainDM.qryObjectBeforeDelete(DataSet: TDataSet);
begin
  if Not CheckAllowDelete(DataSet,9) then Abort;

  if prmUseDocumentLog then
  begin
    qryObjectType.Open;
    qryObjectType.Locate('OTYPE_ID',qryObjectOTYPE_ID.AsInteger,[]);
    DeletedComment:='Delete ' + UTF8Encode(qryObjectTypeSHORT_NAME.Value)+' : '+ UTF8Encode(qryObjectOBJECT_ID.Value);
    if Not qryObjectOBJECT_NAME.IsNull then
      DeletedComment:=DeletedComment+', '+ UTF8Encode(qryObjectOBJECT_NAME.Value);

    DeletedDocID:=qryObjectTypeSHORT_NAME.Value;
  end;
end;

procedure TMainDM.qryObjectBeforeEdit(DataSet: TDataSet);
begin
  if Not CheckAllowEdit(9) then Abort;
end;

procedure TMainDM.qryObjectBeforeInsert(DataSet: TDataSet);
begin
  if Not CheckAllowInsert(9) then Abort;
end;

procedure TMainDM.qryPAccFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
var
  strtmp:String;
begin
  case FilterAccType of
    -1:
      Accept := True;
    0://Tai khoan ngoai bang
    begin
      strtmp:=copy(qryPAccACCOUNT_ID.Value,1,1);
      Accept := (strtmp='0');
    end;
    1://Tai khoan binh thuong
    begin
      strtmp:=copy(qryPAccACCOUNT_ID.Value,1,1);
      Accept := (strtmp<>'0');
    end;
    2://TK Hang hoa
      Accept := (qryPAccOTYPE_ID.AsInteger=2) and (qryPAccACCOUNT_TAG.AsInteger=0);
{      and (((qryPAccPACCOUNT_ID.AsString <> '159') or (qryPAccPACCOUNT_ID.IsNull and (qryPAccACCOUNT_ID.AsString<>'159'))))
      and (((qryPAccPACCOUNT_ID.AsString <> '142') or (qryPAccPACCOUNT_ID.IsNull and (qryPAccACCOUNT_ID.AsString<>'142'))))
      and (((qryPAccPACCOUNT_ID.AsString <> '242') or (qryPAccPACCOUNT_ID.IsNull and (qryPAccACCOUNT_ID.AsString<>'242'))));}
    3://TK Cac doi tuong khac
      Accept := ((not (qryPAccOTYPE_ID.IsNull)) and (qryPAccOTYPE_ID.AsInteger<>2)
      or ((qryPAccPACCOUNT_ID.AsString = '159') or (qryPAccPACCOUNT_ID.IsNull and (qryPAccACCOUNT_ID.AsString='159')))
      or ((qryPAccPACCOUNT_ID.AsString = '142') or (qryPAccPACCOUNT_ID.IsNull and (qryPAccACCOUNT_ID.AsString='142')))
      or ((qryPAccPACCOUNT_ID.AsString = '242') or (qryPAccPACCOUNT_ID.IsNull and (qryPAccACCOUNT_ID.AsString='242'))));
    4://TK ts nguyen gia
    begin
      strtmp:=copy(qryPAccACCOUNT_ID.Value,1,3);
      Accept := ((qryPAccOTYPE_ID.AsInteger=3) and (strtmp<>'214'));
    end;
    5://TK ts khau hao
    begin
      strtmp:=copy(qryPAccACCOUNT_ID.Value,1,3);
      Accept := ((qryPAccOTYPE_ID.AsInteger=3) and (strtmp='214'));
    end;
    6://TK Chi phi san xuat
    begin
      strtmp:=copy(qryPAccACCOUNT_ID.Value,1,2);
      Accept := strtmp='62';
    end;
    9://Chi phi san xuat do dang
    begin
      strtmp:=copy(qryPAccACCOUNT_ID.Value,1,3);
      Accept := strtmp='154';
    end;
    10://TK Gia von
    begin
      strtmp:=copy(qryPAccACCOUNT_ID.Value,1,3);
      Accept := strtmp='632';
    end;
    11://TK chi phi
    begin
      strtmp:=copy(qryPAccACCOUNT_ID.Value,1,1);
      Accept := ((strtmp='6') or (strtmp='8'));
    end;
    12://TK VAt
    begin
      Accept := (qryPAccACCOUNT_TAG.AsInteger=1) or (qryPAccACCOUNT_TAG.AsInteger=-1);
    end;
    13://Tai khoan binh thuong khong phai la hang hoa
    begin
      strtmp:=copy(qryPAccACCOUNT_ID.Value,1,1);
      Accept:= ((strtmp<>'0') and (qryPAccOTYPE_ID.AsInteger<>2));
    end;
    14://Tai hang hoa binh thuong
    begin
      strtmp:=copy(qryPAccACCOUNT_ID.Value,1,1);
      Accept := ((strtmp<>'0') and (qryPAccOTYPE_ID.AsInteger=2) and (qryPAccACCOUNT_TAG.AsInteger=0));
    end;
    15://Tai khoan tien
    begin
      strtmp:=copy(qryPAccACCOUNT_ID.Value,1,2);
      Accept := (strtmp='11');
    end;
    16://Tai khoan DThu
    begin
      Accept := qryPAccACCOUNT_TAG.Value=2;
    end;
    17://Tai khoan co yeu to
    begin
      Accept := Not qryPAccDTYPE_ID.IsNull;
    end;
    18://Tai khoan co yeu to
    begin
      strtmp:=copy(qryPAccACCOUNT_ID.Value,1,2);
      Accept := ((strtmp='62') and (qryPAccOTYPE_ID.AsInteger<>6));
    end;
    20://
    begin
      Accept := (qryPAccOTYPE_ID.AsInteger=CurObjTypeID);
    end;
    21://TK theo doi so du yeu to
    begin
      Accept := (Not qryPAccDTYPE_ID.IsNull) and (qryPAccFOLLOW_BAL.AsInteger=1);
    end;
    22://TK theo doi so du yeu to, doi tuong
    begin
      Accept := (Not qryPAccDTYPE_ID.IsNull) and (Not qryPAccOTYPE_ID.IsNull);
    end;
    23://TK Cac doi tuong khac ma theo doi theo tu chung tu
      Accept := ((not (qryPAccOTYPE_ID.IsNull)) and (qryPAccOTYPE_ID.AsInteger<>2) and (qryPAccFOLLOW_DOCBAL.AsInteger=1));
    24://TK chi phi nhan cong va chi phi sxc
    begin
      strtmp:=copy(qryPAccACCOUNT_ID.Value,1,3);
      Accept := ((strtmp='622') or (strtmp='627'));
    end;
    25://TK theo doi hang hoa va co yeu to va co so du
      Accept := ((qryPAccOTYPE_ID.AsInteger=2) and (Not qryPAccDTYPE_ID.IsNull) and (qryPAccHAS_BALANCE.AsInteger=1));
    26://TK theo doi yeu to 1, YT 2 va co so du
      Accept := ((Not qryPAccDTYPE_ID.IsNull) and (Not qryPAccDTYPE_ID_1.IsNull) and (qryPAccHAS_BALANCE.AsInteger=1));
  end;
end;

procedure TMainDM.qryObjectTypeBeforePost(DataSet: TDataSet);
begin
  if Not MainDM.CheckRequireField(DataSet) then
    Abort;

  if IsNotHasData(qryObjectTypeTENDTTC) then
    qryObjectTypeLOAIDTTC.Clear;
end;

procedure TMainDM.acFilterNormalAccExecute(Sender: TObject);
begin
  qryPAcc.Open;
  if FilterAccType<>1 then
  with MainDM do
  begin
    FilterAccType:=1;
    qryPAcc.OnFilterRecord:= qryPAccFilterRecord;
    qryPAcc.Filtered := True;
  end;
end;

procedure TMainDM.qryCommonError(Sender: TObject; const ERRCODE: Integer;
  ErrorMessage, ErrorCodes: TStringList; const SQLCODE: Integer;
  SQLMessage, SQL: TStringList; var RaiseException: Boolean);
begin
  RaiseException:=False;
  case qryCommon.Tag of
    1://Gen Doc
    begin
      case SQLCode of
        -803:
          ShowMessageUnicode(81,ErrorMessage.Text,0);
        -530:
          ShowMessageUnicode(82,ErrorMessage.Text,0);
      end
    end;
  end;
  qryCommon.Tag:=SQLCODE;
end;

procedure TMainDM.acBackupDataExecute(Sender: TObject);
var
  MangFields:Array[0..255] of string;
  TenFile, StrSQL,sqlall,sqlContent,strtmp:String;
  CountRecord,CountFields,i:Smallint;
  IsError:Boolean;
begin
  if not SaveBackupInfo.Execute then Exit;

  Screen.Cursor:=crHourGlass;
  TenFile:= SaveBackupInfo.FileName;
  MainFrm.Refresh;
  qryTableList.Open;
  qryFieldList.Open;
  CountRecord:=0;
  sqlContent:='';
  sqlall:='';
  while Not qryTableList.Eof do
  begin
    StrSQL:='insert into '+ qryTableListTABLE_NAME.AsString;
    qryFieldList.First;
    CountFields:=qryFieldList.RecordCount;
    i:=0;
    while not qryFieldList.Eof do
    begin
      MangFields[i]:=Trim(qryFieldListTENFIELD.AsString);
      
      if i=0 then
        StrSQL:=StrSQL + ' (' + MangFields[i]
      else
        StrSQL:=StrSQL+', '+MangFields[i];

      i:=i+1;
      qryFieldList.Next;
    end;
    StrSQL:=StrSQL+') values(';
    qryCommon.Close;
    IsError:=False;
    qryCommon.SQL.Text:='select * from '+ qryTableListTABLE_NAME.AsString;
    try
      qryCommon.Prepare;
      qryCommon.Open;
    except
      IsError:=True;
    end;

    if Not IsError then
    while Not qryCommon.Eof do
    begin
      sqlContent:=sqlContent + StrSQL;
      for i:=0 to CountFields-1 do
      begin
        if qryCommon.FieldByName(MangFields[i]).IsNull then
            strtmp := 'null'
        else if qryCommon.FieldByName(MangFields[i]).IsBlob then
            strtmp := 'null'
        else if qryCommon.FieldByName(MangFields[i]).DataType =ftDate then
            strtmp := '''' + MyDateToStr(qryCommon.FieldByName(MangFields[i]).AsDateTime) + ''''
        else if qryCommon.FieldByName(MangFields[i]).DataType =ftDateTime then
            strtmp := '''' + MyDateTimeToStr(qryCommon.FieldByName(MangFields[i]).AsDateTime) + ''''
        else if qryCommon.FieldByName(MangFields[i]).DataType =ftWideString then
            strtmp := '''' + RepStr(qryCommon.FieldByName(MangFields[i]).Value) + ''''
        else if qryCommon.FieldByName(MangFields[i]).DataType in [ftSmallInt, ftInteger, ftWord, ftFloat,ftCurrency,ftBCD,ftLargeInt] then
          strtmp := qryCommon.FieldByName(MangFields[i]).AsString
        else
            strtmp := '''' + qryCommon.FieldByName(MangFields[i]).AsString + '''';

        if i=0 then
          sqlContent:=sqlContent+strtmp
        else
          sqlContent:=sqlContent+','+ strtmp;
      end;
      sqlContent:=sqlContent+'); '+ #13#10;

      CountRecord:=CountRecord+1;
      if CountRecord=500 then
      begin
        CountRecord:=0;
        sqlContent:=sqlContent + #13#10 + 'COMMIT WORK;' + #13#10;
        {if IsFirst then
        begin
          IsFirst:=False;
          SaveToTextFile(TenFile,sqlContent);
        end
        else
          AppendToTextFile(TenFile,sqlContent);}
        sqlall:=sqlall+sqlContent;
        sqlContent:='';
      end;

      MainDM.qryCommon.Next;
    end;

    qryTableList.Next;
  end;
  qryFieldList.Close;
  qryTableList.Close;
  if sqlContent<>'' then
  begin
    sqlContent:=sqlContent + #13#10 + 'COMMIT WORK;';
    {if IsFirst then
      SaveToTextFile(TenFile,sqlContent)
    else
      AppendToTextFile(TenFile,sqlContent);}

    sqlall:=sqlall+sqlContent;
  end;
  qryCommon.Close;
  sqlall:=SSPEncode(sqlall);
  SaveToTextFile(TenFile,sqlall);

  Screen.Cursor:=crDefault;
  ShowMessageUnicode(83);
end;

procedure TMainDM.qryObjectTypeAfterInsert(DataSet: TDataSet);
begin
  qryObjectTypeSHORT_NAME.FocusControl;
end;

procedure TMainDM.qryBeginObjNewRecord(DataSet: TDataSet);
begin
  qryBeginObjOTYPE_ID.AsInteger:=qryPAccOTYPE_ID.AsInteger;
  qryBeginObjACCOUNT_ID.Value := qryPAccACCOUNT_ID.Value;
  qryBeginObjPERIOD_ID.Value := CurrentPeriod;
  qryBeginObjBRANCH_ID.Value := vpBranch_id; 
end;

function TMainDM.KiemtrahopleTKBeginFBal:Boolean;
begin
  Result:=True;
  if Not (qryBeginFBal.State in [dsEdit, dsInsert]) then exit;
  if qryBeginFBalACCOUNT_ID.IsNull then exit;
  if IsNotHasData(qryBeginFBalACCOUNT_ID) then exit;

  Result:=False;

  qryPAcc.Open;
  if qryBeginFBalACCOUNT_ID.Value<>qryPAccACCOUNT_ID.Value then
  begin
    if Not qryPAcc.Locate('ACCOUNT_ID', qryBeginFBalACCOUNT_ID.Value,[]) then
    begin
      ShowMessageUnicode(42);
      exit;
    end;
  end;
  if qryPAccISMIN.AsInteger=0 then
  begin
    if XulyTaikhoan(qryPAccACCOUNT_ID.Value)='' then
      exit
    else
    begin
      qryPAcc.Locate('ACCOUNT_ID', SHTIEUKHOAN,[]);
      qryBeginFBalACCOUNT_ID.Value:=SHTIEUKHOAN;
    end;
  end;
  qryBeginFBalACCOUNT_NAME.Value := qryPAccACCOUNT_NAME.Value;
  Result:=True;
end;

function TMainDM.KiemtrahopleTTBeginFBal:Boolean;
begin
  Result:=True;
  if Not (qryBeginFBal.State in [dsEdit, dsInsert]) then exit;
  if qryBeginFBalCURRENCY_ID.IsNull then exit;
  if IsNotHasData(qryBeginFBalCURRENCY_ID) then exit;

  Result:=False;

  qryPCurrency.Open;
  if qryBeginFBalCURRENCY_ID.Value<>qryPCurrencyCURRENCY_ID.Value then
  begin
    if Not qryPCurrency.Locate('CURRENCY_ID', qryBeginFBalCURRENCY_ID.Value,[]) then
    begin
      ShowMessageUnicode(71);
      exit;
    end;
  end;
  Result:=True;
end;

function KiemtraKhoaNgoai(AqryMain:TIBODataset;AqryList:TIBODataset;AMainFieldName:String;AListFieldName:String;AMainName:String;ABatbuoc:Boolean=True):Boolean;
begin
  Result:=True;
  if Not (AqryMain.State in [dsInsert, dsEdit]) then exit;
  if ABatbuoc then
  begin
    if IsNotHasData(AqryMain.FieldByName(AMainFieldName)) then
    begin
      Result:=False;
      ShowMessageUnicode(84);
      exit;
    end;
  end
  else
  begin
    if AqryMain.FieldByName(AMainFieldName).IsNull then
      exit;

    if IsNotHasData(AqryMain.FieldByName(AMainFieldName)) then
    begin
      AqryMain.FieldByName(AMainFieldName).Clear;
      exit;
    end;
  end;
  Result:=False;

  AqryList.Open;
  if AqryMain.FieldByName(AMainFieldName).Value <> AqryList.FieldByName(AListFieldName).Value then
    if Not AqryList.Locate(AListFieldName, AqryMain.FieldByName(AMainFieldName).Value,[]) then
    begin
      ShowMessageUnicode(85);
      exit;
    end;
  Result:=True;
end;


procedure TMainDM.qryInstockNewRecord(DataSet: TDataSet);
begin
  qryInstockWAREHOUSE_ID.Value := qryPWareWAREHOUSE_ID.Value;
  qryInstockACCOUNT_ID.Value := qryPAccACCOUNT_ID.Value;
  qryInstockPERIOD_ID.Value := CurrentPeriod;
  qryInstockOTYPE_ID.AsInteger:=2;
  qryInstockBRANCH_ID.Value := vpBranch_id;
end;

procedure TMainDM.qryBeginFBalNewRecord(DataSet: TDataSet);
begin
  qryBeginFBalPERIOD_ID.Value := CurrentPeriod;
  qryBeginFBalBRANCH_ID.Value := vpBranch_id;
  
end;

function TMainDM.CheckWareHouse(AField :TField):Boolean;
begin
  qryPWare.Open;
  Result:= qryPWare.Locate('WAREHOUSE_ID',AField.Value,[]);
  if Not Result then
  begin
    ShowMessageUnicode(172);
    AField.FocusControl;
  end;
end;

function TMainDM.CheckObjectField(AField :TField;ObjType:SmallInt):Boolean;
begin
  Result:= CheckObject(AField.Value,ObjType);
  if Not Result then
  begin
    ShowMessageUnicode(46);
    AField.FocusControl;
  end
  else
  if AField.Value<>CurObjID then
  begin
    AField.DataSet.Edit;
    AField.Value:=CurObjID;
  end;
end;                     

function TMainDM.CheckCurrency(AField:TField):Boolean;
begin
  Result:= True;
  if AField.IsNull then exit;
  
  qryPCurrency.Open;

  Result:= qryPCurrency.Locate('CURRENCY_ID',AField.Value,[loCaseInsensitive,loPartialKey]);
  if Not Result then
  begin
    ShowMessageUnicode(71);
    AField.FocusControl;
    Exit;
  end;
  if AField.Value<>qryPCurrencyCURRENCY_ID.Value then
    AField.Value:=qryPCurrencyCURRENCY_ID.Value;
end;

function TMainDM.CheckObject(AMASO :WideString;ALOAIDT:Integer; LocateOpt:Boolean=True):Boolean;
var
  LcOpt:TLocateOptions;
begin
  if LocateOpt then
    LcOpt:=[loCaseInsensitive,loPartialKey]
  else
    LcOpt:=[];

  case ALOAIDT of
    1://Khach hang
    begin
      qryPKH.Open;
      if (qryPKHOBJECT_ID.Value=AMaSo) then
        Result:= True
      else
        Result:= qryPKH.Locate('OBJECT_ID',AMASO,LcOpt);
    end;
    2:
    begin
      qryPHH.Open;
      if (qryPHHOBJECT_ID.Value=AMaSo) then
        Result:= True
      else
        Result:= qryPHH.Locate('OBJECT_ID',AMASO,LcOpt);
    end;
    3:
    begin
      qryPTS.Open;
      if (qryPTSOBJECT_ID.Value=AMaSo) then
        Result:= True
      else
        Result:= qryPTS.Locate('OBJECT_ID',AMASO,LcOpt);
    end;
    4:
    begin
      qryPNV.Open;
      if (qryPNVOBJECT_ID.Value=AMaSo) then
        Result:= True
      else
        Result:= qryPNV.Locate('OBJECT_ID',AMASO,LcOpt);
    end;
    5:
    begin
      qryPTMNH.Open;
      if (qryPTMNHOBJECT_ID.Value=AMaSo) then
        Result:= True
      else
        Result:= qryPTMNH.Locate('OBJECT_ID',AMASO,LcOpt);
    end;
    6:
    begin
      qryPQTSX.Open;
      if (qryPQTSXOBJECT_ID.Value=AMaSo) then
        Result:= True
      else
        Result:= qryPQTSX.Locate('OBJECT_ID',AMASO,LcOpt);
    end;
    else
    begin
      CurObjTypeID := ALOAIDT;
      qryPComObj.close;
      qryPComObj.Open;
      if (qryPComObjOBJECT_ID.Value=AMaSo) and (qryPComObjOTYPE_ID.AsInteger=ALOAIDT) then
        Result:= True
      else
      begin
        qryPComObj.Filtered:=False;
        PreObjTypeID:=-1;

        Result:= qryPComObj.Locate('OBJECT_ID,OTYPE_ID',VarArrayOf([AMASO,ALOAIDT]),LcOpt);
      end;
    end;
  end;
  CurObjTypeID:=ALOAIDT;
  if Result then GetCurObjInfo;
end;

procedure TMainDM.qryDocTypeListAfterDelete(DataSet: TDataSet);
begin
  IsChangeDataDocType:=True;
end;

procedure TMainDM.qryDocTypeListAfterInsert(DataSet: TDataSet);
begin
  if qryDocTypeListDOCTYPE_ID.AsInteger<2001 then
    qryDocTypeListDOCTYPE_ID.AsInteger:=2001;
  qryDocTypeListDOCTYPE_NAME.FocusControl;
end;

procedure TMainDM.qryDocTypeListAfterPost(DataSet: TDataSet);
begin
  IsChangeDataDocType:=True;
  PreDocTypeLoadFilter:=-1;
end;

procedure TMainDM.qryDocTypeListBeforeDelete(DataSet: TDataSet);
begin
  if Not CheckAllowDelete(DataSet,19) then Abort;
end;

procedure TMainDM.qryDocTypeListBeforeEdit(DataSet: TDataSet);
begin
  if Not CheckAllowEdit(19) then Abort;
end;

procedure TMainDM.qryDocTypeListBeforeInsert(DataSet: TDataSet);
begin
  if Not CheckAllowInsert(19) then Abort;

  PWareFlag := qryDocTypeListWARE_FLAG.AsInteger;
  PChedoLaplai := qryDocTypeListCHEDOLAPLAI.AsInteger;

  PKHR := qryDocTypeListKYHIEURIENG.Value;
  PChieudaiSTT := qryDocTypeListCHIEUDAISTT.AsInteger;
  PTKNO := qryDocTypeListTKNO.Value;
  PTKCO := qryDocTypeListTKCO.Value;
  PDocTypeID := qryDocTypeListDOCTYPE_ID.AsInteger;
  PTemplateFile := qryDocTypeListTEMPLATE_FILE.Value;
  PMaCotNo:=qryDocTypeListCOTMANO.Value;
  PTenCotNo:=qryDocTypeListCOTTENNO.Value;
  PMaCotCo:=qryDocTypeListCOTMACO.Value;
  PTenCotCo:=qryDocTypeListCOTTENCO.Value;
  PTKNO_BDV:=qryDocTypeListTKNO_BDV.Value;
  PTKNO_KBDV:=qryDocTypeListTKNO_KBDV.Value;
  PTKCO_BDV:=qryDocTypeListTKCO_BDV.Value;
  PTKCO_KBDV:=qryDocTypeListTKCO_KBDV.Value;
end;

procedure TMainDM.qryDocTypeListBeforePost(DataSet: TDataSet);
begin
  if IsNotHasData(qryDocTypeListTKNO) then
    qryDocTypeListTKNO.Clear;
  if IsNotHasData(qryDocTypeListTKCO) then
    qryDocTypeListTKCO.Clear;
 
  MainDM.qryPAcc.Open;
  if FilterAccType<>1 then
  with MainDM do
  begin
    FilterAccType:=1;
    qryPAcc.OnFilterRecord := qryPAccFilterRecord;
    qryPAcc.Filtered := True;
  end;
  if not qryDocTypeListTKNO.IsNull then
  if MainDM.qryPAcc.Locate('ACCOUNT_ID',qryDocTypeListTKNO.Value,[])=False then
  begin
    ShowMessageUnicode(42);
    qryDocTypeListTKNO.FocusControl;
    Abort;
    Exit;
  end;
  if not qryDocTypeListTKCO.IsNull then
  if MainDM.qryPAcc.Locate('ACCOUNT_ID',qryDocTypeListTKCO.Value,[])=False then
  begin
    ShowMessageUnicode(42);
    qryDocTypeListTKCO.FocusControl;
    Abort;
    Exit;
  end;
end;

procedure TMainDM.qryDocTypeListDeleteError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  Action := daAbort;
  ShowMessageUnicode(29,e.Message,0);
  if DataSet.RecordCount=1 then
    DataSet.Refresh;
end;

procedure TMainDM.qryDocTypeListNewRecord(DataSet: TDataSet);
begin

  qryMaxDocType.Open;
  if qryMaxDocTypeMAX.Value >= 2000 then
    qryDocTypeListDOCTYPE_ID.Value := qryMaxDocTypeMAX.Value + 1
  else
    qryDocTypeListDOCTYPE_ID.Value := 2000;

  qryDocTypeListHIENTHI.AsInteger:=1;
  qryDocTypeListKYHIEUSAU.AsInteger := 1;
  if (PChieudaiSTT<1) then PChieudaiSTT:=4;
  if (PChieudaiSTT>10) then PChieudaiSTT:=10;
  qryDocTypeListCHIEUDAISTT.AsInteger := PChieudaiSTT;
  qryDocTypeListKYHIEURIENG.Value := PKHR+'-';
  if PTKNO<>'' then
    qryDocTypeListTKNO.Value := PTKNO;
  if PTKCO<>'' then
    qryDocTypeListTKCO.Value := PTKCO;
  qryDocTypeListPDOC_TYPE.AsInteger :=PDocTypeID;
  qryDocTypeListTEMPLATE_FILE.Value := PTemplateFile;
  qryDocTypeListCOTMANO.Value:=PMaCotNo;
  qryDocTypeListCOTTENNO.Value:=PTenCotNo;
  qryDocTypeListCOTMACO.Value:=PMaCotCo;
  qryDocTypeListCOTTENCO.Value:=PTenCotCo;
  qryDocTypeListTKNO_BDV.Value:=PTKNO_BDV;
  qryDocTypeListTKNO_KBDV.Value:=PTKNO_KBDV;
  qryDocTypeListTKCO_BDV.Value:=PTKCO_BDV;
  qryDocTypeListTKCO_KBDV.Value:=PTKCO_KBDV;

  qryDocTypeListWARE_FLAG.AsInteger:=PWareFlag;
  qryDocTypeListCHEDOLAPLAI.AsInteger:= PChedoLaplai;
end;


procedure TMainDM.qryInvoiceListBeforeDelete(DataSet: TDataSet);
begin
  if qryDocTypeALLOWEDIT.AsInteger=0 then
  begin
    ShowMessageUnicode(25);
    Abort;
    Exit;
  end;

  if optConfirmDelete=1 then
  if ShowMessageUnicode( 23,'', 4)=7 then
    Abort;
end;

procedure TMainDM.qryInvoiceListBeforePost(DataSet: TDataSet);
begin
  if Trim(qryInvoiceListOBJECT_ID.Value) = '' then
    qryInvoiceListOBJECT_ID.Clear;

  if Trim(qryInvoiceListCURRENCY_ID.Value) = '' then
    qryInvoiceListCURRENCY_ID.Clear;

  if not CheckCurrency(qryInvoiceListCURRENCY_ID) then
  begin
    ShowMessageUnicode(46);
    qryInvoiceListCURRENCY_ID.FocusControl;
    Abort;
    exit;
  end;
  if IsNotHasData(qryInvoiceListCUSNAME) then
  begin
    ShowMessageUnicode(86);
    qryInvoiceListOBJECT_ID.FocusControl;
    Abort;
    exit;
  end;

  if IsNotHasData(qryInvoiceListITEM_NAME) then
  begin
    ShowMessageUnicode(87);
    qryInvoiceListITEM_NAME.FocusControl;
    Abort;
    exit;
  end;

  if IsNotHasData(qryInvoiceListSERIAL_NO) then
  begin
    ShowMessageUnicode(88);
    qryInvoiceListSERIAL_NO.FocusControl;
    Abort;
    exit;
  end;
  if IsNotHasData(qryInvoiceListINVOICE_NO) then
  begin
    ShowMessageUnicode(89);
    qryInvoiceListINVOICE_NO.FocusControl;
    Abort;
    exit;
  end;
  if qryInvoiceListINVOICE_DATE.IsNull then
  begin
    ShowMessageUnicode(90);
    qryInvoiceListINVOICE_DATE.FocusControl;
    Abort;
    exit;
  end;
  {them sua bug 5.0 ID_1223}
  // tradtt: khong dung cho HD ban ra - loi 1758
  if qryInvoiceListLOAIHD.AsInteger<>-1 then
    if qryInvoiceListINVTYPE_ID.IsNull then
    begin
      ShowMessageUnicode(84);
      qryInvoiceListINVTYPE_ID.FocusControl;
      Abort;
      exit;
    end;
  {end them sua bug 5.0 ID_1223}
  qryInvoiceListBRANCH_ID.Value := vpBranch_id;
end;

procedure TMainDM.qryInvoiceListNewRecord(DataSet: TDataSet);
begin
  qryInvoiceListDOC_ID.Value := HDVAT_Sophieu;
  qryInvoiceListPERSONNAME.Value := HDVAT_Person;
  qryInvoiceListPERIOD_ID.Value := HDVAT_KyHT;
  qryInvoiceListENTRY_ID.AsInteger:=HDVAT_SoTTCT;

//thuyttb sua bug5.0
//  qryInvoiceListLOAIHD.AsInteger:=HDVAT_LOAIHD;
//end thuyttb sua bug5.0

  qryInvoiceListMAUSO.Value := optMauHDgTGTdefault;
  qryInvoiceListSERIAL_NO.Value := optSERINUMBER;
  qryInvoiceListINVOICE_DATE.AsDateTime := WorkingDate;
  qryInvoiceListNOTTAX_VALUE.AsFloat:=HDVAT_TriGia;
  qryInvoiceListITEM_NAME.Value:=HDVAT_Mathang;
  qryInvoiceListITEM_AMOUNT.Value:=HDVAT_Soluong;
  qryInvoiceListNOTTAX_VALUE.Value:=HDVAT_TriGia;
  qryInvoiceListINVOICE_VAT.Value:=HDVAT_PTGTGT;
  if HDVAT_ID <> 0 then
  begin
   { qryInvoiceListVAT_ID.Value := HDVAT_ID;
    qryVATList.Open;
    qryVATList.Locate('VAT_ID',inttostr(HDVAT_ID),[]);
    qryInvoiceListINVOICE_VAT.Value := qryVATListVAT_PER.Value;
    qryInvoiceListVAT_NAME.Value := qryVATListVAT_NAME.Value;
	}
	 qryVATList.Open;
   if (qryVATList.Locate('VAT_ID', inttostr(HDVAT_ID), [])) then //Hoaipt sua ngay 20090416
      begin
      qryInvoiceListINVOICE_VAT.Value := qryVATListVAT_PER.Value;
      qryInvoiceListVAT_ID.Value := HDVAT_ID;
      qryInvoiceListVAT_NAME.Value := qryVATListVAT_NAME.Value;
      end;

  end;
  
  qryInvoiceListTAX_VALUE.Value:=HDVAT_Tienthue;
  qryInvoiceListBRANCH_ID.Value := vpBranch_id;
  qryInvoiceListTYGIA.AsFloat := HDVAT_Tygia;
  qryInvoiceListCURRENCY_ID.Value := HDVAT_CURRENCY_ID;


  if HDVAT_MASODT<>'' then
  With MainDM do
  if CheckObject(HDVAT_MASODT,1,False) then
  begin
    if RefObjID2 <> '' then
      CheckObject(RefObjID2,1,False);

    qryInvoiceListOTYPE_ID.Value := 1;
    qryInvoiceListOBJECT_ID.Value := CurObjID;
    qryInvoiceListCUSNAME.Value := CurObjName;
    qryInvoiceListCUSADDR.Value := CurObjSub1;
    qryInvoiceListCUSTAXCODE.Value := CurObjSub2;
  end;
end;

procedure TMainDM.qryInvoiceListPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  Action := daAbort;
  ErrImportMsg:=e.Message;
  if ImportingFromXLS then Exit;
  if ProcessErr(E,'',0)=-530 then
  begin
    ShowMessageUnicode(91,e.Message,0);
    qryInvoiceListOBJECT_ID.FocusControl;
    exit;
  end
  else
  if ProcessErr(E,'',0)=-803 then
  begin
    ShowMessageUnicode(91,e.Message,0);
    qryInvoiceListOBJECT_ID.FocusControl;
    exit;
  end
  else
    ShowMessage(e.Message);
end;

procedure TMainDM.qryInvoiceListINVOICE_VATChange(Sender: TField);
begin

  qryInvoiceListTAX_VALUE.AsFloat := Round(qryInvoiceListNOTTAX_VALUE.AsFloat * qryInvoiceListINVOICE_VAT.AsFloat/100);
end;

procedure TMainDM.qryInvoiceListITEM_AMOUNTChange(Sender: TField);
begin
  if qryInvoiceListITEM_AMOUNT.IsNull then
    qryInvoiceListITEM_AMOUNT.AsFloat:=0;
end;

procedure TMainDM.qryInvoiceListNOTTAX_VALUEChange(Sender: TField);
begin
  qryInvoiceListTAX_VALUE.AsFloat := Round(qryInvoiceListNOTTAX_VALUE.AsFloat * qryInvoiceListINVOICE_VAT.AsFloat/100);
end;

procedure TMainDM.qryObjectAfterPost(DataSet: TDataSet);
begin
  IsChangeList:=True;
  qryPComObj.Close;
  if qryObjectTypeOTYPE_ID.AsInteger=1 then    qryPKH.Close;
  if qryObjectTypeOTYPE_ID.AsInteger=2 then    qryPHH.Close;
  if qryObjectTypeOTYPE_ID.AsInteger=3 then    qryPTS.Close;
  if qryObjectTypeOTYPE_ID.AsInteger=4 then    qryPNV.Close;
  if qryObjectTypeOTYPE_ID.AsInteger=5 then    qryPTMNH.Close;
  if qryObjectTypeOTYPE_ID.AsInteger=6 then    qryPQTSX.Close;
end;

procedure TMainDM.qryObjectAfterDelete(DataSet: TDataSet);
begin
  IsChangeList := True;
  qryPComObj.Close;
  if qryObjectTypeOTYPE_ID.AsInteger = 1 then    qryPKH.Close;
  if qryObjectTypeOTYPE_ID.AsInteger = 2 then    qryPHH.Close;
  if qryObjectTypeOTYPE_ID.AsInteger = 3 then    qryPTS.Close;
  if qryObjectTypeOTYPE_ID.AsInteger = 4 then    qryPNV.Close;
  if qryObjectTypeOTYPE_ID.AsInteger = 5 then    qryPTMNH.Close;
  if qryObjectTypeOTYPE_ID.AsInteger = 6 then    qryPQTSX.Close;

  if prmUseDocumentLog then
    GhiNhatKyXoaPhieu(DeletedDocID, 0, DeletedComment);
end;

procedure TMainDM.qryObjectTypeAfterPost(DataSet: TDataSet);
begin
  qryObjType.Close;
end;

procedure TMainDM.qryObjectTypeAfterDelete(DataSet: TDataSet);
begin
  qryObjType.Close;
end;

procedure TMainDM.qryPComObjFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  //Accept:=(qryPComObjOTYPE_ID.AsInteger=CurObjTypeID) ;
  //Thinh
  Accept:=((qryPComObjOTYPE_ID.AsInteger=CurObjTypeID));
          {and (qryPComObjOBJECT_ID.Value = vpObjectIdFilter));}
end;

function TMainDM.CheckAllowInsert(RightID:smallint):Boolean;
begin
  if SSPUserRight[RightID].IR=False then
  begin
    ShowMessageUnicode(26);
    Result:=False;
  end
  else
    Result:=True;
end;
function TMainDM.CheckAllowDelete(DataSet: TDataSet;RightID:smallint):Boolean;
begin
  if SSPUserRight[RightID].DR=False then
  begin
    ShowMessageUnicode(25);
    Result:=False;
  end
  else
  begin
    Result:=True;
    if optConfirmDelete=1 then
      if ShowMessageUnicode(23,'', 4)=7 then
        Result:=False;
  end;
  if Result then
    if DataSet.State =dsEdit then
      DataSet.Cancel;
end;

function TMainDM.CheckAllowEdit(RightID:smallint):Boolean;
begin
  if SSPUserRight[RightID].ER=False then
  begin
    ShowMessageUnicode(24);
    Result:=False;
  end
  else
    Result:=True;
end;

procedure TMainDM.qryWorkListNewRecord(DataSet: TDataSet);
begin
  qryWorkListWORK_STATUS.AsInteger:=0;
  qryWorkListWORK_ID.AsInteger:=qryWorkList.RecNo;
end;

procedure TMainDM.qryWorkListAfterInsert(DataSet: TDataSet);
begin
  qryWorkListWORK_NAME.FocusControl;
end;

procedure TMainDM.qryWorkListBeforePost(DataSet: TDataSet);
begin
  if ImportingFromXLS then exit;


  LastModifyItemID:=qryWorkListWORK_ID.AsString;

  if Not MainDM.CheckRequireField(DataSet) then
    Abort;
end;

procedure TMainDM.qryWorkListDeleteError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  Action := daAbort;
  ShowMessageUnicode(29,e.Message,0);

  if DataSet.RecordCount=1 then
    DataSet.Refresh;
end;

procedure TMainDM.qryWorkListPostError(DataSet: TDataSet;  E: EDatabaseError; var Action: TDataAction);
begin
  Action := daAbort;
  ErrImportMsg:=e.Message;
  if ImportingFromXLS then Exit;
  if ProcessErr(E,'công trình',0)=-803 then
  begin
    ShowMessageUnicode(92);
    //qryWorkListWORK_ID.AsInteger:=qryWorkListWORK_ID.AsInteger+1;
    qryWorkList.Post;
  end;
end;

procedure TMainDM.qryDefEntrysAfterInsert(DataSet: TDataSet);
begin
  qryDefEntrysENTRY_NOTE.FocusControl;
end;

procedure TMainDM.qryDefEntrysBeforePost(DataSet: TDataSet);
begin
  if qryDefEntrysTKNO.IsNull then
  begin
    ShowMessageUnicode(93);
    qryDefEntrysTKNO.FocusControl;
    Abort;
    exit;
  end;
  if qryDefEntrysTKCO.IsNull then
  begin
    ShowMessageUnicode(94);
    qryDefEntrysTKCO.FocusControl;
    Abort;
  end;
end;

procedure TMainDM.qryDefEntrysPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
var
  kq:Integer;
begin
  Action := daAbort;
  ErrImportMsg:=e.Message;
  if ImportingFromXLS then Exit;
  kq:=ProcessErr(E,'"bút toán"');
  if kq=-803 then
    qryDefEntrysTKNO.FocusControl;

  if kq=-530 then
  begin
    ShowMessageUnicode(42,e.Message,0);
  end;
  if kq=-836 then
  begin
    ShowMessageUnicode(27,e.Message,0);
    exit;
  end;
end;

procedure TMainDM.qryAutoOutAfterInsert(DataSet: TDataSet);
begin
  qryAutoOutTK_DT.FocusControl;
end;

procedure TMainDM.qryAutoOutBeforePost(DataSet: TDataSet);
begin
  if qryAutoOutTK_DT.IsNull then
  begin
    //get msg at here
    ShowMessageUnicode(67);
    qryAutoOutTK_DT.FocusControl;
    Abort;
    exit;
  end;
  if qryAutoOutTK_HH.IsNull then
  begin
    //get msg at here
    ShowMessageUnicode(67);
    qryAutoOutTK_HH.FocusControl;
    Abort;
    exit;
  end;
  if qryAutoOutTK_GV.IsNull then
  begin
    //get msg at here
    ShowMessageUnicode(67);
    qryAutoOutTK_GV.FocusControl;
    Abort;
    exit;
  end;   
end;

procedure TMainDM.qryAutoOutPostError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
var
  rs:Integer;
begin
  Action := daAbort;
  ErrImportMsg:=e.Message;
  if ImportingFromXLS then Exit;
  rs := ProcessErr(E,'Tài khoản doanh thu');
  if rs=-803 then
    qryAutoOutTK_DT.FocusControl;
  if rs=-530 then
  begin
    ShowMessageUnicode(42,e.Message,0);
    qryAutoOutTK_DT.FocusControl;
  end;

end;

procedure TMainDM.acLoadFilterCondExecute(Sender: TObject);
var
  str:String;
  p,i:Integer;
begin
  PreDocTypeLoadFilter:=qryDocTypeDOCTYPE_ID.AsInteger;
  for i:=1 to 5 do
  begin
    arrDKTKNO_BDV[i]:='';
    arrDKTKNO_KBDV[i]:='';
    arrDKTKCO_BDV[i]:='';
    arrDKTKCO_KBDV[i]:='';
  end;
  i:=1;
  str:=qryDocTypeTKNO_BDV.AsString;
  while ((str<>'') and (i<=5)) do
  begin
    p:=Pos(',',str);
    if p=0 then
    begin
      arrDKTKNO_BDV[i]:=Trim(str);
      str:='';
    end
    else
    begin
      arrDKTKNO_BDV[i]:=Trim(copy(str,1,p-1));
      str:=Copy(Str,p+1,Length(str));
    end;

    i:=i+1;
  end;
  i:=1;
  str:=qryDocTypeTKNO_KBDV.AsString;
  while ((str<>'') and (i<=5)) do
  begin
    p:=Pos(',',str);
    if p=0 then
    begin
      arrDKTKNO_KBDV[i]:=Trim(str);
      str:='';
    end
    else
    begin
      arrDKTKNO_KBDV[i]:=Trim(copy(str,1,p-1));
      str:=Copy(Str,p+1,Length(str));
    end;

    i:=i+1;
  end;
  i:=1;
  str:=qryDocTypeTKCO_BDV.AsString;
  while ((str<>'') and (i<=5)) do
  begin
    p:=Pos(',',str);
    if p=0 then
    begin
      arrDKTKCO_BDV[i]:=Trim(str);
      str:='';
    end
    else
    begin
      arrDKTKCO_BDV[i]:=Trim(copy(str,1,p-1));
      str:=Copy(Str,p+1,Length(str));
    end;

    i:=i+1;
  end;
  i:=1;
  str:=qryDocTypeTKCO_KBDV.AsString;
  while ((str<>'') and (i<=5)) do
  begin
    p:=Pos(',',str);
    if p=0 then
    begin
      arrDKTKCO_KBDV[i]:=Trim(str);
      str:='';
    end
    else
    begin
      arrDKTKCO_KBDV[i]:=Trim(copy(str,1,p-1));
      str:=Copy(Str,p+1,Length(str));
    end;

    i:=i+1;
  end;
end;

procedure TMainDM.qryPAccFilterBenCORecord(DataSet: TDataSet;var Accept: Boolean);
var
  BDV,KBDV:String;
  i:Smallint;
begin
  if qryDocTypeDOCTYPE_ID.AsInteger<>PreDocTypeLoadFilter then
    acLoadFilterCond.Execute;
    
  Accept:=True;
  for i:=1 to 5 do
  begin
    BDV:=arrDKTKCO_BDV[i];
    if (BDV='') then break
    else Accept:=(PosEx(BDV,qryPAccACCOUNT_ID.Value)=1);

    if Accept then break;
  end;
  if Accept then
  for i:=1 to 5 do
  begin
    KBDV:=arrDKTKCO_KBDV[i];
    if (KBDV='') then break
    else Accept:=Accept and (PosEx(KBDV,qryPAccACCOUNT_ID.Value)<>1);

    if Not Accept then break;
  end;
end;
procedure TMainDM.qryPAccFilterBenNORecord(DataSet: TDataSet;var Accept: Boolean);
var
  BDV,KBDV:String;
  i:Smallint;
begin
  if qryDocTypeDOCTYPE_ID.AsInteger<>PreDocTypeLoadFilter then
    acLoadFilterCond.Execute;

  Accept:=True;
  for i:=1 to 5 do
  begin
    BDV:=arrDKTKNO_BDV[i];
    if (BDV='') then break
    else Accept:= (PosEx(BDV,qryPAccACCOUNT_ID.Value)=1);

    if Accept then break;
  end;
  if Accept then
  for i:=1 to 5 do
  begin
    KBDV:=arrDKTKNO_KBDV[i];
    if (KBDV='') then break
    else Accept:=Accept and (PosEx(KBDV,qryPAccACCOUNT_ID.Value)<>1);

    if Not Accept then break;
  end;
end;

procedure TMainDM.qryGiaMuaBeforeOpen(DataSet: TDataSet);
begin
  qryGiaMua.ParamByName('PERIOD_ID').AsInteger:=CurrentPeriod;
end;

procedure TMainDM.qryGiaBanBeforeOpen(DataSet: TDataSet);
begin
  qryGiaBan.ParamByName('PERIOD_ID').AsInteger:=CurrentPeriod;
end;

procedure TMainDM.qryGiaKHBeforeOpen(DataSet: TDataSet);
begin
  qryGiaKH.ParamByName('PERIOD_ID').AsInteger:=CurrentPeriod;
end;

procedure TMainDM.qryDocTypeListPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
var
  rs:Integer;
begin
  Action := daAbort;
  ErrImportMsg:=e.Message;
  if ImportingFromXLS then Exit;
  rs:=ProcessErr(E,'',0);
  if rs=-803 then
  begin
    ShowMessageUnicode(31,e.Message,0);
    qryDocTypeListKYHIEURIENG.FocusControl;
  end;
end;

procedure TMainDM.qryRegTransferNewRecord(DataSet: TDataSet);
begin
  qryRegTransferPTKETCHUYEN.AsFloat:=100;
  qryRegTransferSOTTKC.AsFloat:=MaxRegTranferID;
  MaxRegTranferID:=MaxRegTranferID+1;
end;

procedure TMainDM.qryWarehouseAfterPost(DataSet: TDataSet);
begin
  qryPWare.Close;
end;

procedure TMainDM.qryWarehouseAfterDelete(DataSet: TDataSet);
begin
  qryPWare.Close;
end;

procedure TMainDM.qryWorkListAfterDelete(DataSet: TDataSet);
begin
  qryPWork.Close;
end;

procedure TMainDM.qryWorkListAfterPost(DataSet: TDataSet);
begin
  qryPWork.Close;
end;

procedure TMainDM.qryObjectMAKHChange(Sender: TField);
begin
  if IsNotHasData(qryObjectMAKH) then
    qryObjectLOAIKH.Clear
  else
    qryObjectLOAIKH.AsInteger:=qryObjectTypeLOAIDTTC.AsInteger;
end;

procedure TMainDM.qryCaptionBeforePost(DataSet: TDataSet);
begin
  if qryCaptionCAPTION_ENG.IsNull then
    qryCaptionCAPTION_ENG.Value:=qryCaptionCAPTION_VN.Value;
end;

procedure TMainDM.qryObjectTypePostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  Action := daAbort;
  ErrImportMsg:=e.Message;
  if ImportingFromXLS then Exit;
  if ProcessErr(E,'') =-530 then
    qryObjectTypeTENDTTC.FocusControl;
end;

procedure TMainDM.qryAssetListAfterDelete(DataSet: TDataSet);
begin
  qryPTS.Close;
end;

procedure TMainDM.qryPObjGrpFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  Accept:=(qryPObjGrpOTYPE_ID.AsInteger=CurObjTypeID);
end;

procedure TMainDM.qryInvoiceListTAX_VALUEChange(Sender: TField);
begin
  qryInvoiceListTONGCONG.AsFloat:=qryInvoiceListNOTTAX_VALUE.AsFloat+qryInvoiceListTAX_VALUE.AsFloat;
  qryInvoiceListCONGTATCA.AsFloat:=qryInvoiceListNOTTAX_VALUE.AsFloat+qryInvoiceListTAX_VALUE.AsFloat+qryInvoiceListFEE_VALUE.AsFloat;
end;

procedure TMainDM.qryObjectOBJGRP_IDChange(Sender: TField);
begin
  // tradtt: sua loi 1481 - khong bat buoc phai co Phan nhom
  if qryObjectOBJGRP_ID.IsNull then exit;
  
  qryPObjGrp.Open;
  if qryPObjGrpOTYPE_ID.AsInteger<>qryObjectOTYPE_ID.AsInteger then
  begin
    qryPObjGrp.OnFilterRecord:=qryPObjGrpFilterRecord;
    qryPObjGrp.Filtered:=True;
  end;
  
  if qryObjectOBJGRP_ID.Value<>qryPObjGrpOBJGRP_ID.Value then
  if qryPObjGrp.Locate('OBJGRP_ID',qryObjectOBJGRP_ID.Value,[loCaseInsensitive,loPartialKey]) then
  if qryObjectOBJGRP_ID.Value<>qryPObjGrpOBJGRP_ID.Value then
    qryObjectOBJGRP_ID.Value:=qryPObjGrpOBJGRP_ID.Value;

  if qryObject.State=dsInsert then
    qryObjectAfterInsert(nil);
end;

procedure TMainDM.qryTemplateListTKNOChange(Sender: TField);
begin
  qryPAcc.Open;
  if qryTemplateListTKNO.Value<>qryPAccACCOUNT_ID.Value then
    if Not qryPAcc.Locate('ACCOUNT_ID',qryTemplateListTKNO.Value,[]) then
      Exit;

  qryTemplateListLOAINO.AsInteger:=qryPAccOTYPE_ID.AsInteger;
end;

procedure TMainDM.qryTemplateListTKCOChange(Sender: TField);
begin
  qryPAcc.Open;
  if qryTemplateListTKCO.Value<>qryPAccACCOUNT_ID.Value then
    if Not qryPAcc.Locate('ACCOUNT_ID',qryTemplateListTKCO.Value,[]) then
      Exit;

  qryTemplateListLOAICO.AsInteger:=qryPAccOTYPE_ID.AsInteger;
end;

procedure TMainDM.qryMsgBeforeEdit(DataSet: TDataSet);
begin
  if Not CheckAllowEdit(6) then Abort;
end;

procedure TMainDM.qryTemplateListDeleteError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  Action := daAbort;
  ShowMessageUnicode(29,e.Message,0);
  if DataSet.RecordCount=1 then
    DataSet.Refresh;
end;

procedure TMainDM.qryAssetListBeforeDelete(DataSet: TDataSet);
begin
  if Not CheckAllowDelete(DataSet,11) then Abort;
  
  if prmUseDocumentLog then
    GhiNhatKyXoaPhieu('',0,'Xóa tài sản : '+ UTF8Encode(qryAssetListOBJECT_ID.Value));
end;

procedure TMainDM.qryDefRptBCDKTAfterInsert(DataSet: TDataSet);
begin
  qryDefRptBCDKTID.FocusControl;
end;

procedure TMainDM.qryDefRptBCDKTBeforeDelete(DataSet: TDataSet);
begin
  if Not CheckAllowDelete(DataSet,6) then Abort;
end;

procedure TMainDM.qryDefRptBCDKTBeforeInsert(DataSet: TDataSet);
begin
  if Not CheckAllowInsert(6) then Abort;
end;

procedure TMainDM.qryCurrencyAfterPost(DataSet: TDataSet);
begin
  qryPCurrency.Close;
end;

procedure TMainDM.qryCurrencyAfterDelete(DataSet: TDataSet);
begin
  qryPCurrency.Close;
end;

procedure TMainDM.qryDefRptBCDKTPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  Action:=daAbort;
  ProcessErr(E,'');
  qryDefRptBCDKTID.FocusControl;
end;

procedure TMainDM.qryDefKQHDKDPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  Action:=daAbort;
  ProcessErr(E,'');
  qryDefKQHDKDID.FocusControl;
end;

procedure TMainDM.qryDefRptLCTTPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  Action:=daAbort;
  ProcessErr(E,'');
  qryDefRptLCTTID.FocusControl;
end;

procedure TMainDM.qryDefRptKQHDKDBPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  Action:=daAbort;
  ProcessErr(E,'');
  qryDefRptKQHDKDBID.FocusControl;
end;

procedure TMainDM.qryDefKQHDKDBeforePost(DataSet: TDataSet);
begin
  if qryDefKQHDKDID.IsNull then
  begin
    ShowMessageUnicode(20);
    qryDefKQHDKDID.FocusControl;
    Abort;
  end;
end;

procedure TMainDM.qryDefKQHDKDAfterInsert(DataSet: TDataSet);
begin
  qryDefKQHDKDID.FocusControl;
end;

procedure TMainDM.qryDefRptLCTTAfterInsert(DataSet: TDataSet);
begin
  qryDefRptLCTTID.FocusControl;
end;

procedure TMainDM.qryDefRptLCTTBeforePost(DataSet: TDataSet);
begin
  if qryDefRptLCTTID.IsNull then
  begin
    ShowMessageUnicode(20);
    qryDefRptLCTTID.FocusControl;
    Abort;
  end;
end;

procedure TMainDM.qryDefRptBCDKTBeforePost(DataSet: TDataSet);
begin
  if qryDefRptBCDKTID.IsNull then
  begin
    ShowMessageUnicode(20);
    qryDefRptBCDKTID.FocusControl;
    Abort;
  end;
end;

procedure TMainDM.qryDefRptKQHDKDBAfterInsert(DataSet: TDataSet);
begin
  qryDefRptKQHDKDBID.FocusControl;
end;

procedure TMainDM.qryDefRptKQHDKDBBeforePost(DataSet: TDataSet);
begin
  if qryDefRptKQHDKDBID.IsNull then
  begin
    ShowMessageUnicode(20);
    qryDefRptKQHDKDBID.FocusControl;
    Abort;
  End;
end;

procedure TMainDM.SSPIdTelnet1Received(Success: Boolean);
begin
  //
  if Success then
  begin
    //SSPIdTelnet1.Server
    //
    {SSPIdTelnet1.DatabaseName
    SSPIdTelnet1.UserName
    SSPIdTelnet1.PassWord}
  end
  else
  begin
    //SSPIdTelnet1.ErrorCode//
    //3: sai user
    //2: Sai pss


    //SSPIdTelnet1.Messages;
  end
end;

procedure TMainDM.qryDefRptLCTTBeforeInsert(DataSet: TDataSet);
begin
  if Not CheckAllowInsert(6) then Abort;
end;

procedure TMainDM.qryDefRptLCTTBeforeDelete(DataSet: TDataSet);
begin
  if Not CheckAllowDelete(DataSet,6) then Abort;
end;

procedure TMainDM.qryDefKQHDKDBeforeDelete(DataSet: TDataSet);
begin
  if Not CheckAllowDelete(DataSet,6) then Abort;
end;

procedure TMainDM.qryDefKQHDKDBeforeInsert(DataSet: TDataSet);
begin
  if Not CheckAllowInsert(6) then Abort;
end;

procedure TMainDM.sspLicense1ApplyLanguage(Sender: TObject);
begin
//  SetOnFormCreate(TForm(Sender));
end;

procedure TMainDM.qryInvoiceListFEE_VALUEChange(Sender: TField);
begin
  qryInvoiceListCONGTATCA.AsFloat:=qryInvoiceListNOTTAX_VALUE.AsFloat+qryInvoiceListTAX_VALUE.AsFloat+qryInvoiceListFEE_VALUE.AsFloat;
end;
procedure TMainDM.OpenBalanceObj(AccID,WareID:WideString;AtDate:TDate);
begin
  if (CurBalAccID=AccID) and (CurBalWareID=WareID) and (CurBalAtDate=AtDate) then
    Exit;

  CurBalAccID:=AccID;
  CurBalWareID:=WareID;
  CurBalAtDate:=AtDate;

  qryGetBalObj.Close;
  qryGetBalObj.Prepare;
  qryGetBalObj.Open;
end;

procedure TMainDM.qryGetBalObjBeforeOpen(DataSet: TDataSet);
begin
  qryGetBalObj.ParamByName('CurAcc').Value:=CurBalAccID;
  qryGetBalObj.ParamByName('CurWare').Value:=CurBalWareID;
  qryGetBalObj.ParamByName('CurDate').Value:=CurBalAtDate;
  qryGetBalObj.ParamByName('OBJECT_ID').Value:=dsPComObj.DataSet.FieldByName('OBJECT_ID').Value;
  qryGetBalObj.ParamByName('BRANCH_ID').Value:= vpBranch_id;
end;

procedure TMainDM.qryDocListAnyWhereBeforeOpen(DataSet: TDataSet);
begin
  try
    qryDocListAnyWhere.ParamByName('username').Value:=CurrentUser;
    //qryDocListAnyWhere.ParamByName('branch_id').Value:=vpBranch_id;
  except
    //
  end;
end;

procedure TMainDM.qrySysObjBeforeDelete(DataSet: TDataSet);
begin
  if Not CheckAllowDelete(DataSet,6) then Abort;
end;

procedure TMainDM.qrySysObjBeforeEdit(DataSet: TDataSet);
begin
  if Not CheckAllowEdit(6) then Abort;
end;

procedure TMainDM.qrySysObjBeforeInsert(DataSet: TDataSet);
begin
  if Not CheckAllowInsert(6) then Abort;
end;

procedure TMainDM.qryDocListBeforeOpen(DataSet: TDataSet);
begin
  qryDocList.ParamByName('tungay').AsDate:=WorkingDate-optKhoangcachDL;
  qryDocList.ParamByName('denngay').AsDate:=WorkingDate+optKhoangcachDL;
  qryDocList.ParamByName('branch_id').value := vpBranch_id;
end;

procedure TMainDM.qryEntryListBeforeOpen(DataSet: TDataSet);
begin
  qryEntryList.ParamByName('tungay').AsDate:=WorkingDate-optKhoangcachDL;
  qryEntryList.ParamByName('denngay').AsDate:=WorkingDate+optKhoangcachDL;
  qryEntryList.ParamByName('branch_id').value := vpBranch_id;
end;

procedure TMainDM.LoadLicenseDB(Sender: TObject);
begin
{  if Not cnMain.Connected then exit;
  qryABC.Open;
  sspLicense1.SerialNumber:=qryABCS_NO.AsInteger;
  sspLicense1.ProductCode:=qryABCP_KEY.AsString;
  sspLicense1.CustomerNo:=qryABCCUS_ID.Value;
  sspLicense1.Customer:=qryABCCUS_NAME.Value;
  sspLicense1.CompanyName:=qryABCCOM_NAME.Value;
}
end;

procedure TMainDM.SaveLicenseDB(Sender: TObject);
begin
  if Not cnMain.Connected then exit;
  qryABC.Open;
  qryABC.Edit;
  {qryABCS_NO.AsInteger:=sspLicense1.SerialNumber;
  qryABCP_KEY.AsString:=sspLicense1.ProductCode;
  qryABCCUS_ID.Value:=sspLicense1.CustomerNo;
  qryABCCUS_NAME.Value:=sspLicense1.Customer;
  qryABCCOM_NAME.Value:=sspLicense1.CompanyName;
  }
  qryABC.Post;
end;

procedure TMainDM.sspLicense1Error(Sender: TObject);
begin
  if Not cnMain.Connected then
  begin
    Application.Terminate;
    exit;
  end;
{  
  if ((sspLicense1.CheckStage=2) and pCheckingLicienseDB ) then
  begin
    //Du lieu khong hop le
    ShowMessageUnicode(205);
    Application.Terminate;
  end
  else
    ShowMessageUnicode(207);
}
end;

procedure TMainDM.qryParamsNewRecord(DataSet: TDataSet);
begin
  qryParamsPPXUATKHO.AsInteger := 0;
  qryParamsPPPBCPSXC.AsInteger := 0;
  qryParamsTYLECPNVL.AsInteger := 0;
  qryParamsTYLECPNC.AsInteger  := 100;
  qryParamsSDGIABAN.AsInteger  := 1;
  qryParamsCHOSUAGIABAN.AsInteger := 1;
  qryParamsSDGIAMUA.AsInteger := 1;
  qryParamsCHOSUAGIAMUA.AsInteger := 1;
  qryParamsSDGIAKH.AsInteger := 1;
  qryParamsCHOSUAGIAKH.AsInteger := 1;
  qryParamsSDGIABQ.AsInteger := 1;
  qryParamsCHOSUAGIABQ.AsInteger := 1;
  qryParamsCHOSUATHANHTIEN.AsInteger := 1;
  qryParamsALLOWCHANGETYPE.AsInteger := 1;
  qryParamsPTTHUEHDKD.AsInteger := 28;
  qryParamsPTTHUEHDTC.AsInteger := 28;
  qryParamsBEGIN_MONTH.AsInteger := CurMonth;
  qryParamsBEGIN_YEAR.AsInteger := CurYear;
  qryParamsRANGBUOCNGAY.AsInteger  := 1;
  qryParamsUSEDOCUMENTLOG.AsInteger := 1;
  qryParamsUSEUPPERCASE.AsInteger  := 0;
  qryParamsDECIMALSL_LEN.AsInteger := 2;
  qryParamsDECIMALDG_LEN.AsInteger := 2;
  qryParamsDECIMALTT_LEN.AsInteger := 0;
  qryParamsTGSDCCDC.AsInteger  := 48;
  qryParamsBBNHAPYT.AsInteger  := 1;
  qryParamsGTCLKHAUHAO.AsFloat := 1000;
  qryParamsALLOW_NEGINSTOCK.AsInteger  := 0;
  qryParamsALLOW_MIN_INSTOCK.AsInteger := 0;
end;

procedure TMainDM.qryDocListDeleteError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  Action := daAbort;
  ShowMessageUnicode(29,e.Message,0);
end;

procedure TMainDM.qryInvoiceListDeleteError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  Action := daAbort;
  ShowMessageUnicode(29,e.Message,0);
end;

procedure TMainDM.qryDocListAfterDelete(DataSet: TDataSet);
begin
  if prmUseDocumentLog then
    GhiNhatKyXoaPhieu(DeletedDocID,DeletedPeriod,DeletedComment);
end;

procedure TMainDM.qryInvoiceListAfterPost(DataSet: TDataSet);
begin
  IsChangeInvoiceType:=qryInvoiceListLOAIHD.AsInteger;
{them sua bug 5.0 ID_1223}
  HDVAT_LOAIHD:=qryInvoiceListLOAIHD.AsInteger;
{end them sua bug 5.0 ID_1223}
  VATTaxTotal:=qryInvoiceListTAX_VALUE.AsFloat;
end;

procedure TMainDM.qryInvoiceListAfterDelete(DataSet: TDataSet);
begin
   //tradtt: Ko update lai tien thue khi xoa hoa don
   // VATTaxTotal := -1;
  IsChangeInvoiceType:=10;
end;

procedure TMainDM.qryObjectCREATE_DATEChange(Sender: TField);
begin
  qryObjectOTHER_DATE.AsDateTime:=qryObjectCREATE_DATE.AsDateTime;
end;

procedure TMainDM.qryInstockBEGIN_AMOUNTChange(Sender: TField);
begin
  qryInstockBEGIN_VALUE.AsFloat:=RoundTo(qryInstockBEGIN_AMOUNT.AsFloat*qryInstockBEGIN_PRICE.AsFloat,-prmDECIMALTT_LEN);
end;

procedure TMainDM.qryInstockBEGIN_PRICEChange(Sender: TField);
begin
  qryInstockBEGIN_VALUE.AsFloat:=RoundTo(qryInstockBEGIN_AMOUNT.AsFloat*qryInstockBEGIN_PRICE.AsFloat,-prmDECIMALTT_LEN);
end;

procedure TMainDM.qryBeginFBalTYGIAChange(Sender: TField);
begin
  qryBeginFBalDEBIT_VND.AsFloat:=RoundTo(qryBeginFBalTYGIA.AsFloat*qryBeginFBalBEGIN_DEBIT.AsFloat,-prmDECIMALTT_LEN);
  qryBeginFBalCREDIT_VND.AsFloat:=RoundTo(qryBeginFBalTYGIA.AsFloat*qryBeginFBalBEGIN_CREDIT.AsFloat,-prmDECIMALTT_LEN);
end;

procedure TMainDM.qryBeginFBalBEGIN_DEBITChange(Sender: TField);
begin
  qryBeginFBalDEBIT_VND.AsFloat:=RoundTo(qryBeginFBalTYGIA.AsFloat*qryBeginFBalBEGIN_DEBIT.AsFloat,-prmDECIMALTT_LEN);
end;

procedure TMainDM.qryBeginFBalBEGIN_CREDITChange(Sender: TField);
begin
  qryBeginFBalCREDIT_VND.AsFloat:=RoundTo(qryBeginFBalTYGIA.AsFloat*qryBeginFBalBEGIN_CREDIT.AsFloat,-prmDECIMALTT_LEN);
end;

procedure TMainDM.cnMainError(Sender: TObject; const ERRCODE: Integer;
  ErrorMessage, ErrorCodes: TStringList; const SQLCODE: Integer;
  SQLMessage, SQL: TStringList; var RaiseException: Boolean);
var
  rf: TCustomFileRun;
begin
  if cnMain.Connected then

  if ((SQLCODE=-901) or (SQLCODE=-902) or (ERRCODE=335544721) or (ERRCODE=335544741) or (ERRCODE=335544472)) then
  begin

    if pub_checking_report then exit; //Thinh them - dung de bo qua thong bao loi khi check report

    if ( SQLCODE=-902) and (ERRCODE= 335544569) then
    begin
      if CurLanguage=2 then
        ShowMessageUniText('Error raised while executing this operation. It may cause by different software version! The software need to be upgrade!')
      else
        ShowMessageUniText(utf8Decode('Có lỗi xảy ra khi thực hiện thao tác này! Chương trình cần được cập nhật mới!'));
      RaiseException:=False;
      exit;
    end;

    if CurLanguage=2 then
      ShowMessageUniText('Cannot connect to Database Server, program must shutdown. Please contact to administrator !')
    else
    begin
      ShowMessageUniText(utf8Decode('Đứt kết nối tới dữ liệu máy chủ, chương trình tạm kết thúc. Vui lòng liên hệ với người quản trị để biết thêm thông tin !'));
      ShowMessage(ErrorMessage.Text);
    end;

    RaiseException:=False;
    cnMain.Close;
    Application.Terminate;

    if optReConnectTime<>0 then
    begin
      rf:= TCustomFileRun.Create(nil);
      rf.FileName:=ExtractFilePath(Application.ExeName)+'\ReqConnect.exe';
      rf.Execute;
      rf.Free;
    end;
    Abort;
  end;
end;

procedure TMainDM.IB_Monitor1MonitorOutputItem(Sender: TObject;
  const NewString: String);
begin
  //AppendToTextFile('d:\test.txt',NewString);
end;

procedure TMainDM.qryWarehouseNewRecord(DataSet: TDataSet);
begin
  qryWarehouseWAREHOUSE_TYPE.Value:=0;
end;

procedure TMainDM.qryDocTypeListNewRecordParent(DataSet: TDataSet);
begin
  qryDocTypeListHIENTHI.AsInteger        := 1;
  qryDocTypeListKYHIEUSAU.AsInteger      := 1;
  if (PChieudaiSTT < 1)  then PChieudaiSTT := 4;
  if (PChieudaiSTT > 10) then PChieudaiSTT := 10;
  qryDocTypeListCHIEUDAISTT.AsInteger    := PChieudaiSTT;
  qryDocTypeListKYHIEURIENG.Value        := PKHR;
  if PTKNO<>'' then
    qryDocTypeListTKNO.Value := PTKNO;
  if PTKCO<>'' then
    qryDocTypeListTKCO.Value := PTKCO;
  qryDocTypeList.FieldByName('PDOC_TYPE').value :=null;
  qryDocTypeListTEMPLATE_FILE.Value := PTemplateFile;
  qryDocTypeListCOTMANO.Value:=PMaCotNo;
  qryDocTypeListCOTTENNO.Value:=PTenCotNo;
  qryDocTypeListCOTMACO.Value:=PMaCotCo;
  qryDocTypeListCOTTENCO.Value:=PTenCotCo;
  qryDocTypeListTKNO_BDV.Value:=PTKNO_BDV;
  qryDocTypeListTKNO_KBDV.Value:=PTKNO_KBDV;
  qryDocTypeListTKCO_BDV.Value:=PTKCO_BDV;
  qryDocTypeListTKCO_KBDV.Value:=PTKCO_KBDV;

  qryDocTypeListWARE_FLAG.AsInteger:=PWareFlag;
  qryDocTypeListCHEDOLAPLAI.AsInteger:= PChedoLaplai;
end;

procedure TMainDM.qryUnitAfterInsert(DataSet: TDataSet);
begin
  qryUnitUNIT_ID.FocusControl;
end;

procedure TMainDM.qryUnitBeforeDelete(DataSet: TDataSet);
begin
  if Not CheckAllowDelete(DataSet, 11) then Abort;
end;

procedure TMainDM.qryUnitBeforeEdit(DataSet: TDataSet);
begin
  if Not CheckAllowEdit(11) then Abort;
end;

procedure TMainDM.qryUnitBeforeInsert(DataSet: TDataSet);
begin
  if Not CheckAllowInsert(11) then Abort;
end;

procedure TMainDM.qryUnitBeforePost(DataSet: TDataSet);
begin
//thuyttb sua bug5.0 dong de sua loi them DVT va luu khong duoc
{  if IsNotHasData(qryUnit_ScaleFROM_UNIT) then
  begin
    ShowMessageUnicode(228);
    qryUnit_ScaleFROM_UNIT.FocusControl;
    Abort;
  end;
  if IsNotHasData(qryUnit_ScaleTO_UNIT) then
  begin
    ShowMessageUnicode(228);
    qryUnit_ScaleTO_UNIT.FocusControl;
    Abort;
  end;
  if IsNotHasData(qryUnit_ScaleSCALE) then
  begin
    ShowMessageUnicode(229);
    qryUnit_ScaleSCALE.FocusControl;
    Abort;
  end;}
//end thuyttb sua bug5.0
end;


procedure TMainDM.qryUnitDeleteError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
  Action := daAbort;
  ShowMessageUnicode(63, e.Message, 0);
  if DataSet.RecordCount = 1 then
    DataSet.Refresh;
end;

procedure TMainDM.qryUnitPostError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
  Action := daAbort;
  ErrImportMsg := e.Message;
  if ImportingFromXLS then Exit;
  if ProcessErr(E,'đơn vị tính') = -803 then
    qryUnitUNIT_ID.FocusControl;
end;

procedure HintBox(AOwner: TComponent; X, Y: Integer; Promt, Title: WideString;
  IconID: integer); overload;
begin
  try
    frmHintBox := TfrmHintBox.Create(AOwner, X, Y, Promt, Title, IConID);
    frmHintBox.Show;
  except
  end;
end;

procedure HintBox(AOwner: TComponent; Sender: TObject; Promt, Title: WideString;
  IConID: integer); overload;
var
  point: TPoint;
begin
  TWinControl(Sender).SetFocus;
  point := TControl(Sender).ClientOrigin;
  HintBox(AOwner, point.X + TControl(Sender).Width div 2, point.Y +
    TControl(Sender).Height div 2, Promt, Title, IConID);
end;

procedure HintBox(AOwner: TComponent; X, Y: Integer; DBMsgID: integer);
  overload;
var
  Msg, Title: WideString;
  IconID: integer;
begin
  if not Maindm.qryMsgList.Active then
    Maindm.qryMsgList.Open;
  if Maindm.qryMsgList.Locate('MESSAGE_ID', DBMsgId, []) then
  begin
    IconID := Maindm.qryMsgListIMAGE_ID.Value;

    if CurLanguage = 2 then
    begin
      Msg := Maindm.qryMsgListMESSAGE_ENG.Value;
      Title := Maindm.qryMsgListTITLE_ENG.Value;
    end
    else
      if CurLanguage = 1 then
    begin
      Msg := Maindm.qryMsgListMESSAGE_VN.Value;
      Title := Maindm.qryMsgListTITLE_VN.Value;
    end
    else
    begin
      Msg := Maindm.qryMsgListMESSAGE_VN.Value;
      Title := Maindm.qryMsgListTITLE_VN.Value;
    end;
    HintBox(AOwner, x, y, Msg, Title, IConID);
  end;
end;

procedure HintBox(DBMsgId: Integer; AOwner: TComponent; Sender: TObject);
  overload;
var
  Msg, Title: WideString;
  IconID: integer;
begin
  if not Maindm.qryMsgList.Active then
    Maindm.qryMsgList.Open;
  if Maindm.qryMsgList.Locate('MESSAGE_ID', DBMsgId, []) then
  begin
    IconID := Maindm.qryMsgListIMAGE_ID.Value;

    if curLanguage = 2 then
    begin
      Msg := Maindm.qryMsgListMESSAGE_ENG.Value;
      Title := Maindm.qryMsgListTITLE_ENG.Value;
    end
    else
      if curLanguage = 1 then
    begin
      Msg := Maindm.qryMsgListMESSAGE_VN.Value;
      Title := Maindm.qryMsgListTITLE_VN.Value;
    end
    else
    begin
      Msg := Maindm.qryMsgListMESSAGE_VN.Value;
      Title := Maindm.qryMsgListTITLE_VN.Value;
    end;
    HintBox(AOwner, Sender, Msg, Title, IConID);
  end;
end;

function ShowHintBoxInTreeGrid(ATreeGrid: TCustomdxDBTreeListControl;
  ANode: TdxTreeListNode; FieldName: string; MsgID: integer): boolean;
var
  rec: TRect;
  col: TdxDBTreeListColumn;
  x, y, i: integer;
  point_temp: TPoint;
begin
  col := ATreeGrid.ColumnByFieldName(FieldName);
  if not assigned(col) then
  begin
    result := false;
    exit;
  end;
  ATreeGrid.DataSource.DataSet.FieldByName(FieldName).FocusControl;
  rec := ATreeGrid.CellRect(ANode, col.Index);
  x := (rec.Left + rec.Right) div 2;
  y := (rec.Top + rec.Bottom) div 2;
  for i := 0 to col.Index do
    if ATreeGrid.Columns[i].Visible = false then
      x := x - ATreeGrid.Columns[i].Width;
  point_temp := ATreeGrid.ClientToScreen(Point(x, y));
  HintBox(ATreeGrid.Owner, point_temp.X, point_temp.Y, MsgID);
  result := true;
end;

function ShowHintBoxInComponent(comp: TComponent; DataSet: TDataset; FieldName:
  string; MsgID: integer): boolean;
var
  i, j, x, y: integer;
  tl: TCustomdxDBTreeListControl;
  rec: TRect;
  point_temp: TPoint;
begin
  result := false;
  for i := 0 to comp.ComponentCount - 1 do
  begin
    if (Comp.Components[i] is TdxDBEdit) then
    begin
      if ((Comp.Components[i] as TdxDBEdit).DataField = FieldName)
        and ((Comp.Components[i] as TdxDBEdit).DataSource.DataSet = DataSet)
        then
      begin
        HintBox(MsgID, comp, comp.Components[i]);
        result := true;
      end
    end
    else
      if (Comp.Components[i] is TdxDBMaskEdit) then
    begin
      if ((Comp.Components[i] as TdxDBMaskEdit).DataField = FieldName)
        and ((Comp.Components[i] as TdxDBMaskEdit).DataSource.Dataset = DataSet)
        then
      begin
        HintBox(MsgID, comp, comp.Components[i]);
        result := true;
      end
    end
    else
      if (Comp.Components[i] is TdxDBMemo) then
    begin
      if ((Comp.Components[i] as TdxDBMemo).DataField = FieldName)
        and ((Comp.Components[i] as TdxDBMemo).DataSource.Dataset = DataSet)
        then
      begin
        HintBox(MsgID, comp, comp.Components[i]);
        result := true;
      end
    end
    else
      if (Comp.Components[i] is TdxDBDateEdit) then
    begin
      if ((Comp.Components[i] as TdxDBDateEdit).DataField = FieldName)
        and ((Comp.Components[i] as TdxDBDateEdit).DataSource.Dataset = DataSet)
        then
      begin
        HintBox(MsgID, comp, comp.Components[i]);
        result := true;
      end
    end
    else
      if (Comp.Components[i] is TdxDBButtonEdit) then
    begin
      if ((Comp.Components[i] as TdxDBButtonEdit).DataField = FieldName)
        and ((Comp.Components[i] as TdxDBButtonEdit).DataSource.Dataset =
        DataSet) then
      begin
        HintBox(MsgID, comp, comp.Components[i]);
        result := true;
      end
    end
    else
      if (Comp.Components[i] is TdxDBCheckEdit) then
    begin
      if ((Comp.Components[i] as TdxDBCheckEdit).DataField = FieldName)
        and ((Comp.Components[i] as TdxDBCheckEdit).DataSource.Dataset = DataSet)
        then
      begin
        HintBox(MsgID, comp, comp.Components[i]);
        result := true;
      end
    end
    else
      if (Comp.Components[i] is TdxDBImageEdit) then
    begin
      if ((Comp.Components[i] as TdxDBImageEdit).DataField = FieldName)
        and ((Comp.Components[i] as TdxDBImageEdit).DataSource.Dataset = DataSet)
        then
      begin
        HintBox(MsgID, comp, comp.Components[i]);
        result := true;
      end
    end
    else
      if (Comp.Components[i] is TdxDBSpinEdit) then
    begin
      if ((Comp.Components[i] as TdxDBSpinEdit).DataField = FieldName)
        and ((Comp.Components[i] as TdxDBSpinEdit).DataSource.Dataset = DataSet)
        then
      begin
        HintBox(MsgID, comp, comp.Components[i]);
        result := true;
      end
    end
    else
      if (Comp.Components[i] is TdxDBPickEdit) then
    begin
      if ((Comp.Components[i] as TdxDBPickEdit).DataField = FieldName)
        and ((Comp.Components[i] as TdxDBPickEdit).DataSource.Dataset = DataSet)
        then
      begin
        HintBox(MsgID, comp, comp.Components[i]);
        result := true;
      end
    end
    else
      if (Comp.Components[i] is TdxDBCalcEdit) then
    begin
      if ((Comp.Components[i] as TdxDBCalcEdit).DataField = FieldName)
        and ((Comp.Components[i] as TdxDBCalcEdit).DataSource.Dataset = DataSet)
        then
      begin
        HintBox(MsgID, comp, comp.Components[i]);
        result := true;
      end
    end
    else
      if (Comp.Components[i] is TdxDBHyperLinkEdit) then
    begin
      if ((Comp.Components[i] as TdxDBHyperLinkEdit).DataField = FieldName)
        and ((Comp.Components[i] as TdxDBHyperLinkEdit).DataSource.Dataset =
        DataSet) then
      begin
        HintBox(MsgID, comp, comp.Components[i]);
        result := true;
      end
    end
    else
      if (Comp.Components[i] is TdxDBTimeEdit) then
    begin
      if ((Comp.Components[i] as TdxDBTimeEdit).DataField = FieldName)
        and ((Comp.Components[i] as TdxDBTimeEdit).DataSource.Dataset = DataSet)
        then
      begin
        HintBox(MsgID, comp, comp.Components[i]);
        result := true;
      end
    end
    else
      if (Comp.Components[i] is TdxDBCurrencyEdit) then
    begin
      if ((Comp.Components[i] as TdxDBCurrencyEdit).DataField = FieldName)
        and ((Comp.Components[i] as TdxDBCurrencyEdit).DataSource.Dataset =
        DataSet) then
      begin
        HintBox(MsgID, comp, comp.Components[i]);
        result := true;
      end
    end
    else
      if (Comp.Components[i] is TdxDBGraphicEdit) then
    begin
      if ((Comp.Components[i] as TdxDBGraphicEdit).DataField = FieldName)
        and ((Comp.Components[i] as TdxDBGraphicEdit).DataSource.Dataset =
        DataSet) then
      begin
        HintBox(MsgID, comp, comp.Components[i]);
        result := true;
      end
    end
    else
      if (Comp.Components[i] is TdxDBPopupEdit) then
    begin
      if ((Comp.Components[i] as TdxDBPopupEdit).DataField = FieldName)
        and ((Comp.Components[i] as TdxDBPopupEdit).DataSource.Dataset = DataSet)
        then
      begin
        HintBox(MsgID, comp, comp.Components[i]);
        result := true;
      end
    end
    else
      if (Comp.Components[i] is TdxDBTreeListColumn) then
    begin    //B3
      if ((Comp.Components[i] as TdxDBTreeListColumn).FieldName = FieldName) and
        (Comp.Components[i] as TdxDBTreeListColumn).Visible then
      begin //B2
        tl := TCustomdxDBTreeListControl((Comp.Components[i] as
          TdxDBTreeListColumn).ATreeList);
        if (tl.DataSource.DataSet = Dataset) and (tl.Tag <> -1) then
        begin // B1
          Dataset.FieldByName(FieldName).FocusControl;
          rec := tl.GetEditRect(tl.FocusedNode, (Comp.Components[i] as
              TdxDBTreeListColumn).colIndex);
          //rec := tl.CellRect(tl.FocusedNode, (Comp.Components[i] as
          //  TdxDBTreeListColumn).Index);
          x := (rec.Left + rec.Right) div 2;
          y := (rec.Top + rec.Bottom) div 2;
          point_temp := tl.ClientToScreen(Point(x, y));
          HintBox(Comp, point_temp.X, point_temp.Y, MsgID);
          result := true;
        end; //B1
      end;   //B2
    end     //B3

  end;
end;
procedure TMainDM.qryBranchBeforeOpen(DataSet: TDataSet);
begin
    //qryBranch.ParamByName('BRANCH_ID').value := vpLoginBranch;// vpBranch_id;
    qryBranch.ParamByName('USERNAME').value := CurrentUser;
end;

function TMainDM.TransferUpdateAction: smallint;
begin
  Result := 0;
  // Transfer
  if qryTransferInfoAUTO_TRANSFER.Value = 1 then
      if (Timeof(now) > qryTransferInfoAUTO_FROMTIME.Value) and
         (Timeof(now) < qryTransferInfoAUTO_TOTIME.Value)
      then
      begin
           //Lap theo khoang cach ngay
           if (qryTransferInfoRECURR_TYPE.Value = 1) and
              ((DateOf(now) - qryTransferInfoLASTDAY_TRANSFER.AsDateTime) = qryTransferInfoRECURR_DAILY.Value)
           then
              Result := 1;

           if ((qryTransferInfoRECURR_TYPE.Value = 3) and
              ((DateOf(now) - qryTransferInfoLASTDAY_TRANSFER.AsDateTime) = 30*qryTransferInfoRECURR_MONTHLY.Value)
              and (DayOfTheMonth(now) = qryTransferInfoREC_DAYINMONTH.Value))
              or (qryTransferInfoREC_DAYINMONTH.AsInteger =0)
           then
              result :=1;

           //Lap theo THU trong tuan-khoang cach tuan, thang-khoang cach thang
           if ((qryTransferInfoRECURR_TYPE.Value = 2)
              and ((DateOf(now) - qryTransferInfoLASTDAY_TRANSFER.AsDateTime) = 7*qryTransferInfoRECURR_WEEKLY.Value))
              then
           begin

              case DayOfTheWeek(now) of
                DayMonday   : if qryTransferInfoMONDAY.Value =1 then result:= 1;
                DayTuesday  : if qryTransferInfoTUESDAY.Value =1 then result:= 1;
                DayWednesday: if qryTransferInfoWednesday.Value =1 then result:= 1;
                DayThursday : if qryTransferInfoThursday.Value =1 then result:= 1;
                DayFriday   : if qryTransferInfoFriday.Value =1 then result:= 1;
                DaySaturday : if qryTransferInfoSaturday.Value =1 then result:= 1;
                DaySunday   : if qryTransferInfoSunday.Value =1 then result:= 1;
              end;  //End case
           end;     //End khoang cach tuan, thang
      end           // End if khoang cach thoi gian

    else if qryTransferInfoAUTO_UPDATE.Value = 1 then

      if (Timeof(now) > qryTransferInfoAUTO_UPDATE_FROMTIME.Value) and
         (Timeof(now) < qryTransferInfoAUTO_UPDATE_TOTIME.Value)
      then
      begin
           //Lap theo khoang cach ngay
           if (qryTransferInfoUPDATE_RECURR_TYPE.Value = 1) and
              ((DateOf(now) - qryTransferInfoLASTDAY_UPDATE.AsDateTime) = qryTransferInfoUPDATE_RECURR_DAILY.Value)
           then
              Result := 2;

           if ( (qryTransferInfoUPDATE_RECURR_TYPE.Value = 3) and
              ((DateOf(now) - qryTransferInfoLASTDAY_UPDATE.AsDateTime) = 30*qryTransferInfoUPDATE_RECURR_MONTHLY.Value) and
              (qryTransferInfoUPDATE_REC_DAYINMONTH.Value = DayOfTheMonth(now)) or
              (qryTransferInfoUPDATE_REC_DAYINMONTH.Value = 0))
           then
              Result := 2;

           //Lap theo THU trong tuan-khoang cach tuan, thang-khoang cach thang
           if ((qryTransferInfoUPDATE_RECURR_TYPE.Value = 2)
              and ((DateOf(now) - qryTransferInfoLASTDAY_UPDATE.AsDateTime) = 7*qryTransferInfoUPDATE_RECURR_WEEKLY.Value))
           then
           begin

              case DayOfTheWeek(now) of
                DayMonday   : if qryTransferInfoUPDATE_MONDAY.Value =1 then result:= 2;
                DayTuesday  : if qryTransferInfoUPDATE_TUESDAY.Value =1 then result:= 2;
                DayWednesday: if qryTransferInfoUPDATE_Wednesday.Value =1 then result:= 2;
                DayThursday : if qryTransferInfoUPDATE_Thursday.Value =1 then result:= 2;
                DayFriday   : if qryTransferInfoUPDATE_Friday.Value =1 then result:= 2;
                DaySaturday : if qryTransferInfoUPDATE_Saturday.Value =1 then result:= 2;
                DaySunday   : if qryTransferInfoUPDATE_Sunday.Value =1 then result:= 2;
              end;  //End case
           end;     //End khoang cach tuan, thang
      end;          // End if khoang cach thoi gian
end;


function TMainDM.PeriodToString(Period: smallint): WideString;
var nam, thang :integer;
begin
    nam := period div 12;
    thang := period - nam*12;
    if thang = 0 then
    begin
      thang := 12;
      nam := nam - 1;
    end;
    result := IntToStr(thang) + '/' + IntToStr(nam);

end;

procedure TMainDM.qryBranchNewRecord(DataSet: TDataSet);
var PBranch : widestring;
begin

end;

procedure TMainDM.qryDocTypeBeforeOpen(DataSet: TDataSet);
begin
    qryDocType.ParamByName('GROUP_ID').Value := CurrentGroup;
    qryDocType.ParamByName('USERNAME').Value := CurrentUser;
    qryDocType.ParamByName('BRANCH_ID').Value := vpBranch_id;
end;

procedure TMainDM.qryBranchFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin

    case vpBranch_Filter_Type of
      0:
        accept := TRUE;
      1:
        accept := (qryBranchISMIN.Value = 1);
      2: // filter report
        accept := (qryBranchHAS_RIGHT_REPORT.AsInteger > 0);
      3: // filter doctype
        accept := (qryBranchHAS_RIGHT_DOCTYPE.AsInteger > 0);
      4: // filter modul
        accept := (qryBranchHAS_RIGHT_MODUL.AsInteger > 0)
      else
        accept := (qryBranchISMIN.Value = 1);
    end;

end;

procedure TMainDM.qryBranchMainBeforeOpen(DataSet: TDataSet);
begin
    qryBranchMain.ParamByName('BRANCH_ID').Value := vpLoginBranch;
end;

procedure TMainDM.qryAssetListBeforeOpen(DataSet: TDataSet);
begin
  MainDM.qryAssetList.ParamByName('PERIOD_ID').Value := CurrentPeriod;
  MainDM.qryAssetList.ParamByName('BRANCH_ID').Value := vpBranch_id;
end;

procedure TMainDM.qryHSCTBeforeOpen(DataSet: TDataSet);
begin
  qryhsct.ParamByName('BRANCH_ID').Value := vpBranch_id;
end;

procedure TMainDM.qryPDocBalFilterRecordBENNO(DataSet: TDataSet;
  var Accept: Boolean);
begin
    accept := (qryPDocBalNOCK.Value > 0);
end;
procedure TMainDM.qryPDocBalFilterRecordBENCO(DataSet: TDataSet;
  var Accept: Boolean);
begin
    accept := (qryPDocBalCOCK.Value > 0);
end;
procedure TMainDM.qryBeginObjAfterPost(DataSet: TDataSet);
var begincredit , begindebit : double;
begin
    maindm.qryCommon.SQL.clear;
    maindm.qryCommon.params.clear;
    maindm.qryCommon.SQL.Text := 'delete from account_bal where period_id = :period_id and account_id = :account_id and branch_id = :branch_id';
    maindm.qryCommon.ParamByName('account_id').Value := MainDM.qryPAccACCOUNT_ID.Value;
    maindm.qryCommon.ParamByName('period_id').Value := CurrentPeriod;
    maindm.qryCommon.ParamByName('branch_id').Value := vpBranch_id;
    maindm.qryCommon.ExecSQL;

    maindm.qryCommon.SQL.clear;
    maindm.qryCommon.SQL.Text := 'select sum(begin_debit) begin_debit,sum(begin_credit) begin_credit from object_bal where period_id =:period_id and account_id = :account_id and branch_id = :branch_id';
    maindm.qryCommon.Prepare;
    maindm.qryCommon.open;
    begincredit := maindm.qryCommon.FieldByName('begin_credit').AsFloat;
    begindebit := maindm.qryCommon.FieldByName('begin_debit').AsFloat;

    maindm.qryCommon.SQL.clear;
    maindm.qryCommon.SQL.Text := 'insert into account_bal (account_id,begin_credit,begin_debit,period_id,branch_id) values (:account_id,:begin_credit,:begin_debit,:period_id,:branch_id)';
    maindm.qryCommon.ParamByName('begin_credit').value := begincredit;
    maindm.qryCommon.ParamByName('begin_debit').value :=  begindebit;
    maindm.qryCommon.ParamByName('branch_id').value := vpBranch_id;
    maindm.qryCommon.ExecSQL;
end;

procedure TMainDM.qryDefRptBCDKTNewRecord(DataSet: TDataSet);
begin
   qryDefRptBCDKTbranch_id.Value := qryBranchBRANCH_ID.Value;
end;

procedure TMainDM.qryPComObjBeforeOpen(DataSet: TDataSet);
begin
  //qryPComObj.ParamByName('OTYPE_ID').Value := MainDM.CurObjTypeID;
end;

procedure TMainDM.qryObjectOBJREF_IDChange(Sender: TField);
begin
  if IsNotHasData(qryObjectOBJREF_ID) then
    qryObjectOREFTYPE_ID.Clear
  else
    qryObjectOREFTYPE_ID.AsInteger:=qryObjectTypeLOAIDTTC2.AsInteger;
end;

function GetLicenseKey(MST:string):string;
var
  L:longint;
  cpuID:TCPUID;
  LicenseStr,LCN, License , FBPath ,CPUCODE :string;
begin
  cpuID :=GetCPUID;
  L:=cpuID[1] + StrToInt(Key2) + cpuID[3]+ cpuID[4];
  LicenseStr := LeftStr(IntToHex(L,1),6) + MST+ trim(MidStr(IntToHex(L,1),7,10));
  result := UpperCase(MD5Print(MD5String(LicenseStr)));
end;

function CheckLicense:boolean;
var L:longint;
  cpuID:TCPUID;
  LicenseStr,LCN, License , FBPath , MST,CPUCODE :string;
begin
    RESULT := FALSE;
    maindm.qryHSCT.Open;

                  MST := maindm.qryHSCTTAXCODE.value;

                  cpuID :=GetCPUID;
                  L:=cpuID[1] +  StrToInt(Key2) + cpuID[3]+ cpuID[4];
                  LicenseStr := LeftStr(IntToHex(L,1),6) + MST+ trim(MidStr(IntToHex(L,1),7,10));
                  License := UpperCase(MD5Print(MD5String(LicenseStr)));
                  LCN:=ReadValueFromInniFile('LicenseName','License','');
                  if (LCN <> License) then
                      HasLicense := false
                  else begin
                      HasLicense := TRUE;
                      RESULT := TRUE;
                  end

end;

function GetComCode:string;
var L:longint;
cpuID: TCPUID;
begin
  cpuID :=GetCPUID;
  L:=cpuID[1] +  StrToInt(Key2) + cpuID[3]+ cpuID[4];
  Result := LeftStr(IntToHex(L,1),6) + trim(MidStr(IntToHex(L,1),7,10));
end;
procedure TMainDM.qryDTPBListBeforeDelete(DataSet: TDataSet);
begin
  if optConfirmDelete=1 then
  if ShowMessageUnicode(23,'', 4)=7 then
  begin
    Abort;
    exit;
  end;
end;

end.
