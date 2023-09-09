unit _moss_PatientAddressEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer,
  cxEdit, dxSkinsCore, Menus, DBAccess, MSAccess, DB,
  MemDS, cxCheckBox, cxMemo, cxDBEdit, StdCtrls, cxButtons, ExtCtrls, cxLabel,
  cxImageComboBox, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver;

type
  TfrmEditPatientAddress = class(TForm)
    qRegion: TMSQuery;
    qPatAddress: TMSQuery;
    qPatAddressID: TIntegerField;
    qPatAddressPID: TIntegerField;
    qPatAddressIs_Main: TBooleanField;
    qPatAddressClass_ID: TIntegerField;
    qPatAddressCountry_ID: TIntegerField;
    qPatAddressAdderssStr: TStringField;
    qPatAddressPostCode: TStringField;
    qPatAddressHouse: TStringField;
    qPatAddressSubHouse: TStringField;
    qPatAddressBuildingType: TIntegerField;
    qPatAddressBuilding: TStringField;
    qPatAddressFlatType: TIntegerField;
    qPatAddressFlat: TStringField;
    qPatAddressCode: TStringField;
    qPatAddressOCATO: TStringField;
    qPatAddressMetro_id: TIntegerField;
    qPatAddressSegmentCode: TStringField;
    qPatAddressActive: TStringField;
    qPatAddressdate_modif: TDateTimeField;
    qPatAddresswho_modif: TStringField;
    qPatAddressdate_create: TDateTimeField;
    qPatAddresswho_create: TStringField;
    qPatAddressMetro_dream_id: TIntegerField;
    qPatAddressid_create: TIntegerField;
    qPatAddressid_modif: TIntegerField;
    qPatAddresstmp_PISK_ID: TIntegerField;
    qPatAddressMetro_id_new: TIntegerField;
    qAddrTypes: TMSQuery;
    qAddrTypesid: TIntegerField;
    qAddrTypesShortName: TStringField;
    dsPatAddress: TMSDataSource;
    dsAddrTypes: TMSDataSource;
    qDistrict: TMSQuery;
    qCity: TMSQuery;
    qPoint: TMSQuery;
    qStreet: TMSQuery;
    dsRegion: TMSDataSource;
    dsDistrict: TMSDataSource;
    dsCity: TMSDataSource;
    dsPoint: TMSDataSource;
    dsStreet: TMSDataSource;
    qPatAddressFull_Kladr_Code: TStringField;
    qPatAddressRegion: TStringField;
    qPatAddressDistrict: TStringField;
    qPatAddressCity: TStringField;
    qPatAddressPoint: TStringField;
    qPatAddressStreet: TStringField;
    cbRegion: TcxDBLookupComboBox;
    qRegionname: TStringField;
    qRegionCode: TStringField;
    qRegionsocr: TStringField;
    qRegionindex: TStringField;
    qDistrictLevel: TIntegerField;
    qDistrictname: TStringField;
    qDistrictPArent: TStringField;
    qDistrictCode: TStringField;
    qDistrictsocr: TStringField;
    qDistrictindex: TStringField;
    qCityLevel: TIntegerField;
    qCityname: TStringField;
    qCityPArent: TStringField;
    qCityCode: TStringField;
    qCitysocr: TStringField;
    qCityindex: TStringField;
    qPointLevel: TIntegerField;
    qPointname: TStringField;
    qPointPArent: TStringField;
    qPointCode: TStringField;
    qPointsocr: TStringField;
    qPointindex: TStringField;
    qStreetLevel: TIntegerField;
    qStreetname: TStringField;
    qStreetPArent: TStringField;
    qStreetCode: TStringField;
    qStreetsocr: TStringField;
    qStreetindex: TStringField;
    cbDistrict: TcxDBLookupComboBox;
    cbCity: TcxDBLookupComboBox;
    cbPoint: TcxDBLookupComboBox;
    cbStreet: TcxDBLookupComboBox;
    cbstatus: TcxDBImageComboBox;
    cxLabel1: TcxLabel;
    cbAddressType: TcxDBLookupComboBox;
    cbIs_Main: TcxDBCheckBox;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    cxLabel7: TcxLabel;
    Panel1: TPanel;
    btnOk: TcxButton;
    btnCancel: TcxButton;
    btnClear: TcxButton;
    edPostCode: TcxDBTextEdit;
    edSegmentCode: TcxDBTextEdit;
    Label6: TLabel;
    Label12: TLabel;
    edFlat: TcxDBTextEdit;
    edSubHouse: TcxDBTextEdit;
    Label9: TLabel;
    edBuilding: TcxDBTextEdit;
    edHouse: TcxDBTextEdit;
    Label8: TLabel;
    edBuildingType: TcxDBImageComboBox;
    edFlatType: TcxDBImageComboBox;
    cxLabel8: TcxLabel;
    cbMEtro: TcxDBLookupComboBox;
    cxLabel9: TcxLabel;
    qMetro: TMSQuery;
    dsMetro: TMSDataSource;
    qMetroId: TIntegerField;
    qMetroStation: TWideStringField;
    qMetroLine: TWideStringField;
    cbCountry: TcxDBImageComboBox;
    cxLabel10: TcxLabel;
    msAddAddress: TMSSQL;
    Shape11: TShape;
    cxLabel11: TcxLabel;
    edOnDoorPhone: TcxDBTextEdit;
    cxLabel12: TcxLabel;
    edEntrance: TcxDBTextEdit;
    cxLabel13: TcxLabel;
    cxLabel14: TcxLabel;
    qPatAddressEntrance: TStringField;
    qPatAddressFloor: TIntegerField;
    qPatAddressOnDoorPhone: TStringField;
    qRegionFullName: TStringField;
    qDistrictFullName: TStringField;
    qCityFullName: TStringField;
    qPointFullName: TStringField;
    qStreetFullName: TStringField;
    memAddressStr: TcxMemo;
    cbAddressByHand: TcxCheckBox;
    btnSetIndex: TcxButton;
    qHouses: TMSQuery;
    qHousesindex: TStringField;
    edFloor: TcxDBTextEdit;
    qPatAddresslat: TFloatField;
    qPatAddresslng: TFloatField;
    qPatAddressAddr_MD5: TStringField;
    qPatAddressAddr_proxy: TStringField;
    qPatAddressAddr_precision: TStringField;
    msGeocoder: TMSSQL;
    qPatAddressmap_sector_id: TIntegerField;
    qMapSectors: TMSQuery;
    qMapSectorsID: TIntegerField;
    qMapSectorsSector_name: TStringField;
    qMapSectorsproject_id: TIntegerField;
    qMapSectorsФилиал: TWideStringField;
    dsMapSectors: TMSDataSource;
    cbMapSector: TcxDBLookupComboBox;
    cxLabel15: TcxLabel;
    procedure qPatAddressRegionChange(Sender: TField);
    procedure qPatAddressDistrictChange(Sender: TField);
    procedure qPatAddressCityChange(Sender: TField);
    procedure qPatAddressPointChange(Sender: TField);
    procedure Button1Click(Sender: TObject);
    procedure qPatAddressBeforePost(DataSet: TDataSet);
    procedure qPatAddressAfterOpen(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure msAddAddressAfterExecute(Sender: TObject; Result: Boolean);
    procedure qPatAddressBeforeOpen(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure cbCountryPropertiesChange(Sender: TObject);
    procedure edBuildingTypePropertiesChange(Sender: TObject);
    procedure qPatAddressNewRecord(DataSet: TDataSet);
    procedure cbAddressByHandClick(Sender: TObject);
    procedure btnSetIndexClick(Sender: TObject);
    procedure edFloorKeyPress(Sender: TObject; var Key: Char);
    procedure memAddressStrPropertiesChange(Sender: TObject);
  private
   bOpened:Boolean;
    FPID: Integer;
    FAddr_ID: Integer;
    procedure SetAddr_ID(const Value: Integer);
    procedure SetPID(const Value: Integer);
    procedure SetAddrStr;
    function GetModified: Boolean;
  public
    property Addr_ID:Integer read FAddr_ID write SetAddr_ID;
    property PID:Integer read FPID write SetPID;
  end;

var
  frmEditPatientAddress: TfrmEditPatientAddress;

implementation

uses uCallMain;

{$R *.dfm}

procedure TfrmEditPatientAddress.btnSetIndexClick(Sender: TObject);
begin // пытаемся найти индекс по улице или дому
  if qHouses.Active  then
   qHouses.Close;
  qHouses.ParamByName('Code').AsString := String(qPAtAddressStreet.Value);
  qHouses.ParamByName('House').AsString := edHouse.Text;
  qHouses.Open;
  if not (qPAtAddress.State in [dsEdit,dsInsert]) then
    qPatAddress.Edit;
  qPatAddressPostCode.Value := qHousesIndex.Value;
end;

procedure TfrmEditPatientAddress.Button1Click(Sender: TObject);
begin
 try
 if qPAtAddress.State in [dsInsert, dsEdit] then
  qPatAddress.Post;
 modalResult := mrOK;
 except // чтобы "проглотить" Abort при вставке новой записи
  on E:Exception do
  begin
   if E.ClassName <> 'EAbort' then
    MessageDlg('Ошибка при сохранении данных:' + E.message,mtError,[mbOK],0);
   modalResult := mrOk;
  end;
 end;
end;

procedure TfrmEditPatientAddress.cbAddressByHandClick(Sender: TObject);
begin
 memAddressStr.Enabled := cbAddressBYHand.Checked;
 memAddressStr.TabStop := cbAddressBYHand.Checked;
end;

procedure TfrmEditPatientAddress.cbCountryPropertiesChange(Sender: TObject);
begin
 if not bOpened then
  Exit;
 if (Sender = cbCountry) and (cbCountry.EditingValue <> 1) then // не Россия
 begin
   cbREgion.Enabled := False;
   cbDistrict.Enabled := False;
   cbCity.Enabled := False;
   cbPoint.Enabled := False;
   cbStreet.Enabled := False;
   qPatAddressRegion.Clear;
   qPatAddressDistrict.Clear;
   qPatAddressCity.Clear;
   qPatAddressPoint.Clear;
   qPatAddressStreet.Clear;
   qPatAddressFull_Kladr_Code.Clear;
 end;
 SetAddrStr;
 // метро показываем только в Москве
 cbMEtro.enabled := (qPatAddressRegion.Value = '77000000000000000000000') or
  (qPatAddressRegion.Value = '50000000000000000000000');
 if (qPatAddressRegion.Value <> '77000000000000000000000') and (qPatAddressRegion.Value <> '50000000000000000000000') then
  qPatAddressMetro_id_new.Clear;
end;

procedure TfrmEditPatientAddress.edBuildingTypePropertiesChange(
  Sender: TObject);
begin
 SetAddrStr;
end;

procedure TfrmEditPatientAddress.edFloorKeyPress(Sender: TObject;
  var Key: Char);
begin
 case key of
   '0'..'9': ; // цифры
   #8: ; // забой
  else
   key:=#0;
 end; // case
end;

procedure TfrmEditPatientAddress.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
var
 mr:Integer;
begin
 CanClose := True;
 if not GetModified then
  Exit
 else
 begin
   if ModalREsult= mrCancel then
   begin
    mr := MEssageDlg('Сохранить изменения ?',mtConfirmation,mbYesNoCancel,0);
    case mr of
     mrYes:    if qPAtAddress.State in [dsEdit,dsInsert] then
       qPAtAddress.post;
     mrCancel: Canclose := False;
    end;
   end;
 end;
end;

// признак наличия изменений в форме
function TfrmEditPatientAddress.GetModified:Boolean;
var
 i:Integer;
begin
 if qPatAddress.Modified then
 begin
   Result := True;
   Exit;
 end;
 Result := False;
 for i := 0 to Self.ComponentCount - 1 do
 begin
   if assigned(Self.Components[i].FieldAddress('EditModified')) then
    Result := Result or Boolean(Self.Components[i].FieldAddress('EditModified')^);
 end;
end;

procedure TfrmEditPatientAddress.FormCreate(Sender: TObject);
begin
 FAddr_ID := 0;
 FPID := 0;
end;

procedure TfrmEditPatientAddress.FormShow(Sender: TObject);
begin
 qMapSectors.Open;
 qPatAddress.Open;
end;

procedure TfrmEditPatientAddress.memAddressStrPropertiesChange(Sender: TObject);
begin
 if not (qPataddress.State in [dsInsert,dsEdit]) then
  qPAtAddress.Edit;
end;

procedure TfrmEditPatientAddress.msAddAddressAfterExecute(Sender: TObject;
  Result: Boolean);
begin
 memAddressStr.properties.OnChange := nil;//memAddressStrPropertiesChange;
 if qPatAddress.Active then
  qPatAddress.Close;
 qRegion.Close;
 qDistrict.Close;
 qCity.Close;
 qPoint.Close;
 qstreet.Close;
 FAddr_ID := msAddAddress.ParamByName('ID').AsInteger;
 qPatAddress.Open;
 memAddressStr.properties.OnChange := memAddressStrPropertiesChange;
end;

procedure TfrmEditPatientAddress.qPatAddressAfterOpen(DataSet: TDataSet);
begin
 bOPened := False;
 qRegion.open;
 qPatAddressRegionChange(nil);
 qPatAddressDistrictChange(nil);
 qPatAddressCityChange(nil);
 qPatAddressPointChange(nil);
 qAddrTypes.Open;
 qMetro.Open;
 bOPened := True;
 if not qPatAddressPID.IsNull then
  FPID := qPatAddressPID.Value;
 if qPAtAddress.IsEmpty then
  qPatAddress.Insert;
 if qPatAddressBuildingType.IsNull then
  qPatAddressBuildingType.Value := 701;
 if qPatAddressFlatType.IsNull then
  qPAtAddressFlatType.Value := 801;
 memAddressStr.Text := String(qPatAddressAdderssStr.Value);
 memAddressStr.properties.OnChange := memAddressStrPropertiesChange;
end;

procedure TfrmEditPatientAddress.qPatAddressBeforeOpen(DataSet: TDataSet);
begin
 qPatAddress.ParamByName('Addr_ID').AsInteger := FAddr_ID;
end;

procedure TfrmEditPatientAddress.qPatAddressBeforePost(DataSet: TDataSet);
begin
 qPatAddressFull_Kladr_Code.Value := qPatAddressStreet.Value;
 qPatAddressAdderssStr.Value := AnsiString(memAddressStr.Text);
 if qPAtaddress.State = dsInsert then
 begin
 if FPID = 0 then
 begin
   MEssageDlg('Не задан PID пациента !!',mtError,[mbOK],0);
   Abort;
 end;
 msAddaddress.ParamByName('PID').AsInteger := FPID;
 msAddaddress.ParamByName('Is_Main').AsBoolean := qPatAddressIs_Main.Value;
 msAddaddress.ParamByName('Class_ID').AsInteger := qPatAddressClass_ID.Value;;
 msAddaddress.ParamByName('Country_ID').AsInteger := qPatAddressCountry_ID.Value;;
 msAddaddress.ParamByName('AdderssStr').Asstring := String(qPatAddressAdderssStr.Value);
 msAddaddress.ParamByName('PostCode').AsString := String(qPatAddressPostCode.Value);
 msAddaddress.ParamByName('House').AsString := String(qPatAddressHouse.Value);
 msAddaddress.ParamByName('SubHouse').AsString := String(qPatAddressSubHouse.Value);
 msAddaddress.ParamByName('BuildingType').AsInteger := qPatAddressBuildingType.Value;
 msAddaddress.ParamByName('Building').AsString := String(qPatAddressBuilding.Value);
 msAddaddress.ParamByName('FlatType').AsInteger := qPatAddressFlatType.Value;
 msAddaddress.ParamByName('Flat').AsString := String(qPatAddressFlat.Value);
 msAddaddress.ParamByName('SegmentCode').AsString := String(qPatAddressSegmentCode.value);
 msAddaddress.ParamByName('Full_KLADR_Code').AsString := String(qPatAddressFull_KLADR_Code.value);
 msAddaddress.ParamByName('Active').AsString := String(qPatAddressActive.value);
 msAddaddress.ParamByName('id_create').AsInteger :=  frmMain.StaffId;
 msAddaddress.ParamByName('id_modif').AsInteger :=  frmMain.StaffId;
 if (not qPatAddressMetro_id_new.ISNull) and   (qPatAddressMetro_id_new.Value <> 0) then
  msAddaddress.ParamByName('Metro_ID_new').AsInteger := qPatAddressMetro_id_new.value
 else
  msAddaddress.ParamByName('Metro_ID_new').Clear;
 msAddaddress.ParamByName('Entrance').AsString := String(qPatAddressEntrance.Value);
 if qPatAddressFloor.ISNull  then
  msAddaddress.ParamByName('Floor').Clear
 else
  msAddaddress.ParamByName('Floor').AsInteger := qPatAddressFloor.Value;
 msAddaddress.ParamByName('OnDoorPhone').AsString := String(qPatAddressOnDoorPhone.Value);
 msAddaddress.ParamByName('map_sector_id').AsInteger := qPatAddressMap_Sector_ID.Value;
 bOpened := False;
 if qPatAddress.state in [dsEdit,dsInsert] then
  qPataddress.Cancel;
 qPatAddress.Close;
 msAddaddress.Execute;
 Abort;
 end;
end;

procedure TfrmEditPatientAddress.qPatAddressCityChange(Sender: TField);
begin
 qPoint.Close;
 qPoint.ParamByName('Point').AsString := Copy(String(qPatAddressCity.Value),1,8);
 qPoint.Open;
 if bOpened  then
 begin
  qPatAddress.Edit;
  if qPoint.RecordCount > 0 then
   qPatAddressPoint.Value := qPointCode.Value
  else
   qPatAddressPoint.Clear;
 end;
 cbPoint.Enabled := (qPoint.RecordCount > 1) and (cbCountry.EditValue = 1);
end;

procedure TfrmEditPatientAddress.qPatAddressDistrictChange(Sender: TField);
begin
 qCity.Close;
 qCity.ParamByName('City').AsString := Copy(String(qPatAddressDistrict.Value),1,5);
 qCity.Open;
 if bOpened then
 begin
  qPatAddress.Edit;
  if qCity.RecordCount > 0 then
   qPAtAddressCity.Value := qCitycode.Value
  else
   qPatAddressCity.Clear;
 end;
 cbCity.Enabled := (qCity.RecordCount> 1) and (cbCountry.EditValue = 1);
end;

procedure TfrmEditPatientAddress.qPatAddressNewRecord(DataSet: TDataSet);
begin
 qPatAddressActive.Value := 'Y';
 qPatAddressIS_Main.Value := False;
 qPatAddressClass_ID.Value := 304422;
 qPatAddressCountry_ID.Value := 1;
 qPatAddressMetro_id_new.Value := 195;
// qPatAddressmap_sector_id.clear;
end;

procedure TfrmEditPatientAddress.qPatAddressPointChange(Sender: TField);
begin
 qStreet.Close;
 qStreet.ParamByName('Street').AsString := Copy(String(qPatAddressPoint.Value),1,11);
 qstreet.Open;
 if bOpened then
 begin
  qPatAddress.Edit;
  if qStreet.RecordCount > 0 then
   qPatAddressStreet.Value := qStreetCode.Value
  else
   qPatAddressStreet.Clear;
 end;
 cbStreet.Enabled := (qStreet.RecordCount > 1) and (cbCountry.EditValue = 1);
end;

procedure TfrmEditPatientAddress.qPatAddressRegionChange(Sender: TField);
begin
 qDistrict.Close;
 qDistrict.ParamByName('District').AsString := Copy(String(qPatAddressRegion.Value),1,2);
 qDistrict.Open;
 if bOpened then
 begin
  qPatAddress.Edit;
  if qDistrict.RecordCount  > 0 then
   qPataddressDistrict.Value := qDistrictCode.Value
  else
   qPatAddressDistrict.Clear;
 end;
 cbDistrict.Enabled := (qDistrict.RecordCount > 1) and (cbCountry.EditValue = 1);
end;

procedure TfrmEditPatientAddress.SetAddrStr;
var
 Len:Integer;
begin
  if cbAddressBYHand.Checked then
   Exit; // адрес вводят вручную
  if cbCountry.EditValue = 1 then // если Россия - добавляем все вплоть до улицы
   memAddressStr.Text := Trim(edPostCode.Text) + ',' + Trim(cbcountry.EditText) + ',' + Trim(cbRegion.Text) +
    ',' + Trim(cbDistrict.Text)  +  ',' + Trim(cbCity.Text) + ','  + Trim(cbPoint.Text)  +  ',' +   Trim(cbStreet.Text)
  else
   memAddressStr.Text := '';
  if Trim(edHouse.Text) <> '' then
    memAddressStr.Text :=  memAddressStr.Text + ', дом ' + edHouse.Text  ;
  if Trim(edSubHouse.Text) <> '' then
    memAddressStr.Text :=  memAddressStr.Text + ', корп.' + edSubHouse.Text ;
  if Trim(edBuilding.Text) <> '' then
    memAddressStr.Text :=  memAddressStr.Text + ',' + edBuildingType.Text + ' ' + edBuilding.Text;
  if Trim(edFlat.Text) <> '' then
    memAddressStr.Text :=  memAddressStr.Text + ',' + edFlatType.Text + ' ' + edFlat.Text;
  while Pos(',,',memAddressStr.Text) > 0 do // убираем лишнее
   memAddressStr.Text := StringReplace(memAddressStr.Text,',,',',',[rfReplaceAll]);
  // первая и последняя запятая
  len := Length(memAddressStr.Text);
  if Len = 0 then
   Exit;
  if (memAddressStr.Text[1] = ',') and (len > 1) then
   memAddressStr.Text := Copy(memAddressStr.Text,2,len - 1);
  len := Length(memAddressStr.Text);
  if (memAddressStr.Text[len] = ',')  and  (len > 1) then
   memAddressStr.Text := Copy(memAddressStr.Text,1,len-1);
end;

procedure TfrmEditPatientAddress.SetAddr_ID(const Value: Integer);
begin
  FAddr_ID := Value;
end;

procedure TfrmEditPatientAddress.SetPID(const Value: Integer);
begin
  FPID := Value;
end;

end.
