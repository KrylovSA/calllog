unit _u_moss_PatientEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StrUtils, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  cxStyles, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage,
  DB, cxDBData, cxMemo, cxLabel, cxImageComboBox, cxCheckBox,
  cxDBExtLookupComboBox, cxDBLookupComboBox, dxSkinsdxBarPainter, MSAccess,
  DBAccess, Menus, AdvMenus, MemDS, ImgList, dxBarExtItems, dxBar, cxClasses,
  cxGridCardView, cxGridDBCardView, cxGroupBox, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridCustomView,
  cxGrid, cxDBEdit, cxLookupEdit, cxDBLookupEdit, cxDropDownEdit, cxDBLabel,
  cxTextEdit, cxMaskEdit, cxCalendar, ExtCtrls, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver;

type
  TfmPatientEdit = class(TForm)
    dxBarManager1: TdxBarManager;
    dxBarManager1Bar1: TdxBar;
    btnSave: TdxBarButton;
    imlSex16: TImageList;
    dsEditData: TDataSource;
    qryPatient: TMSQuery;
    cxFam: TcxDBTextEdit;
    cxNam: TcxDBTextEdit;
    cxOtch: TcxDBTextEdit;
    cxBirthdate: TcxDBDateEdit;
    cxSex: TcxDBImageComboBox;
    lbFam: TcxLabel;
    lbNam: TcxLabel;
    lbOtch: TcxLabel;
    lbBirthdate: TcxLabel;
    lbSex: TcxLabel;
    lbSourceInfo: TcxLabel;
    dsAddr: TDataSource;
    qAddr: TMSQuery;
    grdAddr: TcxGrid;
    tvAddr: TcxGridDBTableView;
    tvAddrID: TcxGridDBColumn;
    tvAddrSubject_ID: TcxGridDBColumn;
    tvAddrClass_ID: TcxGridDBColumn;
    tvAddrClassStr: TcxGridDBColumn;
    tvAddrCountry_ID: TcxGridDBColumn;
    tvAddrCountryStr: TcxGridDBColumn;
    tvAddrPostCode: TcxGridDBColumn;
    tvAddrAdderssStr: TcxGridDBColumn;
    tvAddrMetro_id: TcxGridDBColumn;
    tvAddrMetroStr: TcxGridDBColumn;
    tvAddrSegmentCode: TcxGridDBColumn;
    tvAddrIs_Main: TcxGridDBColumn;
    tvAddrActive: TcxGridDBColumn;
    tvAddrdate_modif: TcxGridDBColumn;
    tvAddrwho_modif: TcxGridDBColumn;
    tvAddrdate_create: TcxGridDBColumn;
    tvAddrwho_create: TcxGridDBColumn;
    tvAddrCard: TcxGridDBCardView;
    tvAddrCardClassStr: TcxGridDBCardViewRow;
    tvAddrCardIs_Main: TcxGridDBCardViewRow;
    tvAddrCardCountryStr: TcxGridDBCardViewRow;
    tvAddrCardAdderssStr: TcxGridDBCardViewRow;
    tvAddrCardPostCode: TcxGridDBCardViewRow;
    tvAddrCardSegmentCode: TcxGridDBCardViewRow;
    tvAddrCardActive: TcxGridDBCardViewRow;
    lvAddr: TcxGridLevel;
    qMetro: TMSQuery;
    dsMetro: TDataSource;
    tvAddrCardMetro_Id: TcxGridDBCardViewRow;
    msPatientInsert: TMSSQL;
    cxSourceInfoId: TcxDBLookupComboBox;
    qSourceInfo: TMSQuery;
    dsSourceInfo: TDataSource;
    qRequiredFields: TMSQuery;
    dsRequiredFields: TDataSource;
    pmContacts: TAdvPopupMenu;
    miContactAdd: TMenuItem;
    N8: TMenuItem;
    miContactDel: TMenuItem;
    q_delete_contact: TMSSQL;
    q_insert_cont_kontr: TMSSQL;
    dsContacts: TMSDataSource;
    qContacts: TMSQuery;
    grdContacts: TcxGrid;
    tvContacts: TcxGridDBTableView;
    tvContacts_moss_contacts_Name: TcxGridDBColumn;
    tvContacts_moss_contacts_doljnost: TcxGridDBColumn;
    tvContacts_moss_telephone_value: TcxGridDBColumn;
    tvContacts_moss_email_name: TcxGridDBColumn;
    tvContacts_moss_contacts_note: TcxGridDBColumn;
    lvContacts: TcxGridLevel;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    q_delete_all_contacts: TMSSQL;
    pmAddress: TAdvPopupMenu;
    miAddrInsert: TMenuItem;
    MenuItem2: TMenuItem;
    miAddrDel: TMenuItem;
    cmbMetro: TcxDBLookupComboBox;
    lbMetro: TcxLabel;
    cxCardNo: TcxDBLabel;
    lbCardNo: TcxLabel;
    cxNoSMS: TcxDBCheckBox;
    qAddrID: TIntegerField;
    qAddrPID: TIntegerField;
    qAddrIs_Main: TBooleanField;
    qAddrPostCode: TStringField;
    qAddrAdderssStr: TStringField;
    qAddrSegmentCode: TStringField;
    qAddrActive: TStringField;
    qAddrdate_modif: TDateTimeField;
    qAddrid_modif: TIntegerField;
    qAddrdate_create: TDateTimeField;
    qAddrid_create: TIntegerField;
    spSetAddrState: TMSStoredProc;
    spPatientInsert: TMSStoredProc;
    qAddrSector_name: TStringField;
    tvAddrCardSector_Name: TcxGridDBCardViewRow;
    lbAutoSex: TcxLabel;
    dxBarControlContainerItem1: TdxBarControlContainerItem;
    lblPatientFIO: TcxLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    gbAddress: TcxGroupBox;
    qAddrAddressType: TStringField;
    qAddrCountry: TStringField;
    qAddrMetroStation: TWideStringField;
    qryPatientPID: TIntegerField;
    qryPatientSurname: TWideStringField;
    qryPatientFirstName: TWideStringField;
    qryPatientSecName: TWideStringField;
    qryPatientBirthday: TDateTimeField;
    qryPatientintSex: TBooleanField;
    qryPatientFullName: TWideStringField;
    qryPatientSourceInfo_ID: TIntegerField;
    qryPatientMetro_dream_id: TIntegerField;
    qryPatientNoSMS: TBooleanField;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSaveClick(Sender: TObject);
    procedure qAddrAfterInsert(DataSet: TDataSet);
    procedure qAddrBeforePost(DataSet: TDataSet);
    procedure qryPatientBeforePost(DataSet: TDataSet);
    procedure cxCommonEditValueChanged(Sender: TObject);
    procedure miContactDelClick(Sender: TObject);
    procedure qContactsAfterPost(DataSet: TDataSet);
    procedure qContactsBeforeCancel(DataSet: TDataSet);
    procedure qContactsBeforeInsert(DataSet: TDataSet);
    procedure qContactsBeforePost(DataSet: TDataSet);
    procedure miContactAddClick(Sender: TObject);
    procedure tvContactsCellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure tvContactsCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure qContactsBeforeOpen(DataSet: TDataSet);
    procedure miAddrInsertClick(Sender: TObject);
    procedure miAddrDelClick(Sender: TObject);
    procedure tvAddrCardNavigatorButtonsButtonClick(Sender: TObject;
      AButtonIndex: Integer; var ADone: Boolean);
    procedure qContactsAfterInsert(DataSet: TDataSet);
    function IsHavePhone: Boolean;
    function CheckRequiredFields: Boolean;
    procedure dsEditDataDataChange(Sender: TObject; Field: TField);
    procedure qAddrAfterPost(DataSet: TDataSet);
    procedure tvAddrCardIs_MainPropertiesChange(Sender: TObject);
    procedure qAddrBeforeInsert(DataSet: TDataSet);
    procedure pmAddressPopup(Sender: TObject);
    procedure pmContactsPopup(Sender: TObject);
    procedure qContactsBeforeDelete(DataSet: TDataSet);
    procedure qryPatientAfterOpen(DataSet: TDataSet);
    procedure qryPatientBeforeOpen(DataSet: TDataSet);
    procedure cxSourceInfoIdPropertiesInitPopup(Sender: TObject);
    procedure qAddrNewRecord(DataSet: TDataSet);
    procedure tvAddrCardDblClick(Sender: TObject);
    procedure qryPatientAfterPost(DataSet: TDataSet);
    procedure edPrivateOfficeLoginKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    vMode: Integer; // 0 - Новый пациент, 1 - Просмотр/Редактирование.
    NewContact: Boolean;
    procedure TrimTextFields;
    function GetSexByName(const AName: string): Integer;
    procedure CheckSexByName;
    procedure SavePatient(QuetMode: Boolean = False);
    procedure UpdatePatientAge(const APID: Integer);
  public
    PID: Integer;
    QuietMode: Boolean;
  end;

var
  fmPatientEdit: TfmPatientEdit;

implementation

uses
  uCallMain, _u_moss_Patients, _moss_list_contact, _moss_PatientAddressEdit;

{$R *.dfm}

procedure TfmPatientEdit.pmAddressPopup(Sender: TObject);
begin
  miAddrDel.Enabled := (qAddr.RecordCount > 0);
end;

procedure TfmPatientEdit.pmContactsPopup(Sender: TObject);
begin
  miContactDel.Enabled := (qContacts.RecordCount > 0);
end;

procedure TfmPatientEdit.qAddrAfterInsert(DataSet: TDataSet);
begin
  qAddr.FieldByName('PID').Value := qryPatient.FieldByName('PID').Value;
end;

procedure TfmPatientEdit.qAddrAfterPost(DataSet: TDataSet);
begin
  spSetAddrState.ParamByName('pid').AsInteger := PID;
  spSetAddrState.ParamByName('address_id').AsInteger :=
    qAddr.FieldByName('ID').AsInteger;
  spSetAddrState.ParamByName('adress_state').AsBoolean :=
    qAddr.FieldByName('Is_Main').AsBoolean;
  spSetAddrState.ExecProc;

  qAddr.Refresh;
end;

procedure TfmPatientEdit.qAddrBeforeInsert(DataSet: TDataSet);
begin
  if vMode = 0 then
  begin
    SavePatient;
    Abort;
  end;
end;

procedure TfmPatientEdit.qAddrBeforePost(DataSet: TDataSet);
begin
  qAddr.FieldByName('id_create').Value := frmMain.StaffId;
  qAddr.FieldByName('id_modif').Value := frmMain.StaffId;

  if VarIsNull(qAddr.FieldByName('Class_ID').Value) or
    VarIsNull(qAddr.FieldByName('Country_ID').Value) then
  begin
    MessageDlg('Не заполнены обязательные поля адреса', mtWarning, [mbOK], 0);
    Abort;
  end;

  if qAddr.RecordCount = 0 then
    qAddr.FieldByName('Is_Main').Value := 1;
end;

procedure TfmPatientEdit.qAddrNewRecord(DataSet: TDataSet);
begin
  frmEditPatientAddress := TfrmEditPatientAddress.Create(nil);
  try
    frmEditPatientAddress.PID := PID;
    frmEditPatientAddress.ShowModal;
    qAddr.Close;
    qAddr.Open;
    Abort;
  finally
    frmEditPatientAddress.Free;
  end;
end;

procedure TfmPatientEdit.qContactsAfterInsert(DataSet: TDataSet);
var
  FIO: string;
begin
  qContacts.FieldByName('_moss_contacts_contact_type').Value := 1;
  FIO := VarToStr(cxFam.EditingValue);
  if VarToStr(cxNam.EditingValue) <> '' then
    FIO := FIO + ' ' + LeftStr(cxNam.EditingValue, 1) + '.';
  if VarToStr(cxOtch.EditingValue) <> '' then
    FIO := FIO + ' ' + LeftStr(cxOtch.EditingValue, 1) + '.';
  qContacts.FieldByName('_moss_contacts_Name').Value := FIO;
  qContacts.Post; // можно поменять в форме справочника, если необходимо
end;

procedure TfmPatientEdit.qContactsAfterPost(DataSet: TDataSet);
begin
  if (NewContact) then
  begin
    q_insert_cont_kontr.ParamByName('PID').Value := PID;
    q_insert_cont_kontr.ParamByName('ContId').Value :=
      qContacts.FieldByName('_moss_contacts_id').AsInteger;
    q_insert_cont_kontr.Execute();
    tvContacts.OptionsData.Editing := False;
    tvContacts.NewItemRow.Visible := False;
    NewContact := False;
  end;
end;

procedure TfmPatientEdit.qContactsBeforeCancel(DataSet: TDataSet);
begin
  tvContacts.OptionsData.Editing := False;
  tvContacts.NewItemRow.Visible := False;
end;

procedure TfmPatientEdit.qContactsBeforeDelete(DataSet: TDataSet);
begin
  if (MessageDlg('Удалить контакт?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
  begin // удаление контакта ( вернее связи с контрагентом)
    q_delete_contact.ParamByName('PID').Value := PID;
    q_delete_contact.ParamByName('ContId').Value :=
      qContacts.FieldByName('_moss_contacts_id').AsInteger;
    q_delete_contact.Execute();
    qContacts.Refresh;
  end;
  Abort;
end;

procedure TfmPatientEdit.qContactsBeforeInsert(DataSet: TDataSet);
begin
  if vMode = 0 then
    SavePatient(True);
  if PID <> 0 then
    tvContacts.NewItemRow.Visible := True
  else
    Abort;

  qContacts.ParamByName('PID').Value := PID;
  tvContacts.OptionsData.Editing := True;
end;

procedure TfmPatientEdit.qContactsBeforeOpen(DataSet: TDataSet);
begin
  qContacts.ParamByName('PID').Value := PID;
end;

procedure TfmPatientEdit.qContactsBeforePost(DataSet: TDataSet);
begin
  NewContact := False;
  if (DataSet.State = dsInsert) then
    NewContact := True;
  if (Trim(DataSet.FieldByName('_moss_contacts_Name').AsString) = '') then
  begin
    ShowMessage('Не указано название контакта! Сохранение невозможно.');
    Abort;
  end;
end;

procedure TfmPatientEdit.qryPatientAfterOpen(DataSet: TDataSet);
begin
  lblPatientFIO.Caption := qryPatientFullName.Value;
  lblPatientFIO.Style.TextColor := clGreen;
end;

procedure TfmPatientEdit.qryPatientAfterPost(DataSet: TDataSet);
begin
  if PID <> 0 then
    UpdatePatientAge(PID);
end;

procedure TfmPatientEdit.qryPatientBeforeOpen(DataSet: TDataSet);
begin
  qryPatient.ParamByName('PID').Value := PID;
end;

procedure TfmPatientEdit.qryPatientBeforePost(DataSet: TDataSet);
begin
  if VarIsNull(qryPatient.FieldByName('SourceInfo_Id').Value) then
    qryPatient.FieldByName('SourceInfo_Id').AsInteger := 321237; // Не спросили

  if PID = 0 then
  begin
    msPatientInsert.ParamByName('Surname').Value :=
      qryPatient.FieldByName('Surname').Value;
    msPatientInsert.ParamByName('FirstName').Value :=
      qryPatient.FieldByName('FirstName').Value;
    msPatientInsert.ParamByName('SecName').Value :=
      qryPatient.FieldByName('SecName').Value;
    // попробуем принудительно записать пол пациента
    if qryPatient.FieldByName('intSex').IsNull then
    begin
      if cxSex.EditValue = True then
        qryPatient.FieldByName('intSex').Value := 1;
      if cxSex.EditValue = False then
        qryPatient.FieldByName('intSex').Value := 0;
    end;
    msPatientInsert.ParamByName('intSex').Value :=
      qryPatient.FieldByName('intSex').Value;
    msPatientInsert.ParamByName('Birthday').Value :=
      qryPatient.FieldByName('Birthday').Value;
    msPatientInsert.ParamByName('StaffID').Value := frmMain.StaffId;
    msPatientInsert.ParamByName('Metro_dream_Id').Value :=
      qryPatient.FieldByName('Metro_dream_Id').Value;
    msPatientInsert.ParamByName('NoSMS').AsBoolean :=
      qryPatient.FieldByName('NoSMS').AsBoolean;
    msPatientInsert.ParamByName('SourceInfo_Id').Value :=
      qryPatient.FieldByName('SourceInfo_Id').Value;
    qryPatient.Cancel;
    msPatientInsert.Execute;
    PID := msPatientInsert.ParamByName('PID').AsInteger;
  end;
end;

procedure TfmPatientEdit.tvAddrCardDblClick(Sender: TObject);
var
  ID: Integer;
begin
  if qAddrID.IsNull then
    Exit;
  ID := qAddrID.Value;
  frmEditPatientAddress := TfrmEditPatientAddress.Create(nil);
  try
    frmEditPatientAddress.Addr_ID := ID;
    frmEditPatientAddress.ShowModal;
    qAddr.Close;
    qAddr.Open;
    Abort;
  finally
    frmEditPatientAddress.Free;
    qAddr.Locate('ID', ID, []);
  end;
end;

procedure TfmPatientEdit.tvAddrCardIs_MainPropertiesChange(Sender: TObject);
begin
  if qAddr.State in [dsEdit] then
    qAddr.Post;
end;

procedure TfmPatientEdit.tvAddrCardNavigatorButtonsButtonClick(Sender: TObject;
  AButtonIndex: Integer; var ADone: Boolean);
begin
  if AButtonIndex = 6 then
  begin
    miAddrInsertClick(self);
    ADone := True;
  end;
  if AButtonIndex = 8 then
  begin
    miAddrDelClick(self);
    ADone := True;
  end;
end;

procedure TfmPatientEdit.UpdatePatientAge(const APID: Integer);
var
  qry: TMSQuery;
begin
  qry := TMSQuery.Create(self);
  try
    qry.Connection := qryPatient.Connection;
    qry.SQL.Text :=
      'UPDATE dbo._moss_Patients '#13#10 +
      'SET Age = (datediff(year, Birthday, getdate()) + case '#13#10 +
      '         when datediff(day,dateadd(year, datediff(year, Birthday, getdate()), Birthday), getdate())<(0) then (-1) '#13#10 +
      '         else (0) end) '#13#10 +
      'WHERE PID = ' + IntToStr(PID);
    qry.ExecSQL;
  finally
    qry.Free
  end;
end;

function TfmPatientEdit.CheckRequiredFields: Boolean;
var
  i: Integer;
begin
  Result := True;
  // Проверяем обязательные поля
  for i := 0 to ComponentCount - 1 do
    if Components[i].Tag = 10 then
      if (VarIsNull((Components[i] as TcxCustomEdit).EditingValue) or
          (VarAsType((Components[i] as TcxCustomEdit).EditingValue, varString) = '')) then
        MessageDlg('Не заполнены обязательные поля', mtWarning, [mbOK], 0);
end;

procedure TfmPatientEdit.CheckSexByName;
var
  autoSex: Integer;
begin
  lbAutoSex.Visible := False;
  if Trim(cxNam.Text) = '' then
    Exit;
  autoSex := GetSexByName(Trim(cxNam.Text));
  // -1 не определен, 0 - мужчина, 1- женщина
  if autoSex = -1 then
  begin
    lbAutoSex.Visible := True;
    lbAutoSex.Style.Color := clYellow;
    lbAutoSex.Caption := 'Автоматически определить пол не удалось';
  end
  else
  begin
    if cxSex.ItemIndex = -1 then
    begin
      cxSex.ItemIndex := autoSex;
      if autoSex = 0 then
        cxSex.EditValue := True
      else
        cxSex.EditValue := False;
      Exit;
    end;
    if cxSex.ItemIndex <> autoSex then
    begin
      lbAutoSex.Visible := True;
      lbAutoSex.Style.Color := clRed;
      lbAutoSex.Caption := 'Пол не сответсвует автоматически определенному';
    end;
  end;
end;

procedure TfmPatientEdit.SavePatient(QuetMode: Boolean = False);
begin
  // Проверяем обязательные поля
  if not CheckRequiredFields then
    Exit;

  if qryPatient.State in [dsEdit, dsInsert] then
    try
      qryPatient.Post;
      // Рефрешим запись
      qryPatient.Close;
      qryPatient.Open;
    except
      on e: Exception do
      begin
        MessageDlg('Не удается сохранить данные пациента' + #10#13 +
            'Ошибка: ' + e.Message, mtWarning, [mbOK], 0);
        Exit;
      end;
    end;

  if (not IsHavePhone) and (not QuetMode) and (vMode = 0) then
  begin
    // if not QuetMode then // чтобы не выскакивало при вводе через контекстное меню
    MessageDlg('Необходимо указать хотя бы один основной контактный телефон',
      mtWarning, [mbOK], 0);
  end
  else
    vMode := 1; // Если были в режиме новой записи - переходим в режим редактирования

  // Сохраняем изменения
  if qAddr.State in [dsEdit, dsInsert] then
    try
      qAddr.Post;
    except
      MessageDlg('Не удается сохранить адрес', mtWarning, [mbOK], 0);
      Exit;
    end;
end;

procedure TfmPatientEdit.TrimTextFields;
var
  i: Integer;
begin
  for i := 0 to ControlCount - 1 do
    if Controls[i] is TcxDBTextEdit then
      TcxDBTextEdit(Controls[i]).Text := Trim(TcxDBTextEdit(Controls[i]).Text);
end;

procedure TfmPatientEdit.btnSaveClick(Sender: TObject);
begin
  TrimTextFields;
  SavePatient(QuietMode);
end;

procedure TfmPatientEdit.cxCommonEditValueChanged(Sender: TObject);
begin
  if ((Sender as TcxCustomEdit).Tag = 10) then
  begin
    if (VarIsNull((Sender as TcxCustomEdit).EditValue) or
        (VarAsType((Sender as TcxCustomEdit).EditValue, varString) = '')) then
      (Sender as TcxCustomEdit).Style.Color := $0099FFFF
    else
      (Sender as TcxCustomEdit).Style.Color := clWindow;
  end;
  CheckSexByName;
end;

procedure TfmPatientEdit.tvContactsCellClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  if (AButton = mbRight) then
    pmContacts.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y);
end;

procedure TfmPatientEdit.tvContactsCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
var
  fm: TfmContact;
begin
  if (ACellViewInfo.Item.Index = 0) then
  begin
    fm := TfmContact.Create(self);
    try
      fm.ContactId := qContacts.FieldByName('_moss_contacts_ID').AsInteger;
      fm.ShowModal;
      qContacts.Refresh;
    finally
      fm.Release;
    end;
  end;
end;

procedure TfmPatientEdit.cxSourceInfoIdPropertiesInitPopup(Sender: TObject);
begin
  qSourceInfo.FilterSQL := '(Active = 1) or (ID = ' + IntToStr
    (qryPatient.FieldByName('SourceInfo_Id').AsInteger) + ')';
end;

procedure TfmPatientEdit.dsEditDataDataChange(Sender: TObject; Field: TField);
begin
  Caption := 'Амбулаторная карта № ' + IntToStr(PID);
end;

procedure TfmPatientEdit.edPrivateOfficeLoginKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
    btnSaveClick(self);
end;

function TfmPatientEdit.IsHavePhone: Boolean;
begin
  Result := True;
end;

procedure TfmPatientEdit.FormClose(Sender: TObject; var Action: TCloseAction);
var
  mResult: Integer;
begin
  if (not IsHavePhone) and (not QuietMode) and (vMode = 0) then
    if MessageDlg('Отсутствует контактный телефон. Добавить?', mtWarning,
      mbYesNo, 0) = mrYes then
    begin
      Action := caNone;
      Exit;
    end;

  if (vMode = 0) or ((qryPatient.State in [dsEdit, dsInsert]) or
      (qAddr.State in [dsEdit, dsInsert]) or (qContacts.State in [dsEdit,
      dsInsert])) then
  begin
    mResult := MessageDlg('Сохранить изменения?', mtWarning, mbYesNoCancel, 0);
    if mResult = mrNo then
    begin
      qryPatient.Cancel;
      qAddr.Cancel;
      qContacts.Cancel;

      // Удаляем все контакты нового, не сохраненного пациента
      // (каскадное удаление выполнено на триггере)
      if (vMode = 0) and (PID <> 0) then
      begin
        q_delete_all_contacts.ParamByName('PID').AsInteger := PID;
        q_delete_all_contacts.Execute;
        // И самого туда же...
        if not qryPatient.IsEmpty then
          qryPatient.Delete;
      end;
    end
    else if mResult = mrYes then
    begin
      SavePatient(QuietMode);
      if not(qryPatient.State in [dsBrowse]) then
        Action := caNone;
    end
    else
      Action := caNone;
  end;
end;

procedure TfmPatientEdit.FormShow(Sender: TObject);
var
  i, j: Integer;
  RList: TStringList;
begin
  qMetro.Open;
  qSourceInfo.Open;

  vMode := 0; // Определяемся с режимом открытия формы.
  if (PID <> 0) then
    vMode := 1; // Редактирование

  // Читаем список обязательных полей
  RList := TStringList.Create;
  qRequiredFields.Open;
  qRequiredFields.First;
  while not qRequiredFields.EOF do
  begin
    RList.Add(qRequiredFields.FieldByName('FieldName').AsString);
    qRequiredFields.Next;
  end;

  // Подсвечиваем обязательные поля
  for i := 0 to ComponentCount - 1 do
  begin
    if (Components[i].ClassNameIs('TcxDBTextEdit') and RList.Find
        ((Components[i] as TcxDBTextEdit).DataBinding.DataField, j)) or
      (Components[i].ClassNameIs('TcxDBDateEdit') and RList.Find
        ((Components[i] as TcxDBDateEdit).DataBinding.DataField, j)) or
      (Components[i].ClassNameIs('TcxDBImageComboBox') and RList.Find
        ((Components[i] as TcxDBImageComboBox).DataBinding.DataField, j)) or
      (Components[i].ClassNameIs('TcxDBLookupComboBox') and RList.Find
        ((Components[i] as TcxDBLookupComboBox).DataBinding.DataField, j)) or
      (Components[i].ClassNameIs('TcxDBExtLookupComboBox') and RList.Find
        ((Components[i] as TcxDBExtLookupComboBox).DataBinding.DataField, j))
      or (Components[i].ClassNameIs('TcxDBButtonEdit') and RList.Find
        ((Components[i] as TcxDBButtonEdit).DataBinding.DataField, j)) or
      (Components[i].ClassNameIs('TcxDBCheckBox') and RList.Find
        ((Components[i] as TcxDBCheckBox).DataBinding.DataField, j)) then
    begin
      (Components[i] as TcxCustomEdit).Style.Color := $0099FFFF;
      (Components[i] as TcxCustomEdit).Tag := 10; // Обязательное
    end;
  end;

  RList.Free;

  qryPatient.Open;
  if vMode = 0 then
    qryPatient.Append;

  qAddr.Open;
  qContacts.Open;
end;

function TfmPatientEdit.GetSexByName(const AName: string): Integer;
// -1 не определен, 0 - мужчина, 1- женщина
var
  qry: TMSQuery;
  nmaxSex, nminSex: Integer;
begin
  Result := -1;
  if Length(Trim(AName)) < 3 then
    Exit;
  qry := TMSQuery.Create(self);
  try
    qry.Connection := qryPatient.Connection;
    // Таблица _moss_Patients_FirstName_Sex заполняется ежедневно Job'ом
    qry.SQL.Text :=
      'SELECT '#13#10 +
      '    p.FirstName, '#13#10 +
      '    p.Sex, '#13#10 +
      '    p.cnt '#13#10 +
      'FROM dbo._moss_Patients_FirstName_Sex AS p '#13#10 +
      'WHERE '#13#10 +
      '    p.FirstName = ' + QuotedStr(Trim(AName)) + #13#10 +
      'ORDER BY '#13#10 +
      '    3 DESC ';
    qry.Open;
    if qry.RecordCount < 1 then
      Exit;
    if qry.RecordCount = 1 then // если вернулся только один пол, то если таких более 3, то можем предположить что пол верный иначе нет
    begin
      if qry.FieldByName('cnt').AsInteger > 3 then
      begin
        if qry.FieldByName('Sex').AsBoolean then
          Result := 0
        else
          Result := 1;
      end;
    end
    else // если есть записи и с тем и с другим полом, то проверим отношение
    begin
      if qry.FieldByName('Sex').AsBoolean then
        Result := 0
      else
        Result := 1;
      nmaxSex := qry.FieldByName('cnt').AsInteger;
      qry.Next;
      nminSex := qry.FieldByName('cnt').AsInteger;
      if nmaxSex / nminSex < 2 then // если преобладание менее двух раз, то не понятно какой пол правильный
        Result := -1;
    end;
  finally
    qry.Free;
  end;
end;

procedure TfmPatientEdit.miAddrInsertClick(Sender: TObject);
begin
  qAddr.Insert;
end;

procedure TfmPatientEdit.miAddrDelClick(Sender: TObject);
begin
  if (MessageDlg('Удалить адрес?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
    qAddr.Delete;
end;

procedure TfmPatientEdit.miContactAddClick(Sender: TObject);
begin
  if qContacts.Active then
    qContacts.Insert;
end;

procedure TfmPatientEdit.miContactDelClick(Sender: TObject);
begin
  qContacts.Delete;
end;

end.
