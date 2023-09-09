unit uCallMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus,
  dxSkinsCore, cxControls, cxContainer, cxEdit, cxStyles,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage, DB,
  cxDBData, cxTextEdit, ImgList, DBAccess, MSAccess, ExeInfo, ActnList,
  ExtCtrls, dxSkinsForm, MemDS, StdCtrls, cxGroupBox, cxRadioGroup, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, cxButtons, uAddPhone, dxSkinOffice2007Pink,
  dxSkinOffice2007Green, dxSkinOffice2007Silver, cxMaskEdit, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, SvcMgr,
  dxSkinOffice2007Blue, OleDBAccess, cxCheckBox;

type
  TfrmMain = class(TForm)
    ConnToBase: TMSConnection;
    qUser: TMSQuery;
    qCallCat_II: TMSQuery;
    btClearPatient: TcxButton;
    lbPhoneNumber: TLabel;
    mComment: TMemo;
    dxSkinController1: TdxSkinController;
    edPatients: TcxTextEdit;
    btSaveAndClose: TcxButton;
    InsertCall: TMSSQL;
    aList: TActionList;
    actSelectPatient: TAction;
    actClearPatient: TAction;
    actAddPhone: TAction;
    actSaveExit: TAction;
    qFilial: TMSQuery;
    sqlPatToDream: TMSSQL;
    actExitP: TAction;
    EI: TExeInfo;
    qCallCat_I: TMSQuery;
    qAttach: TMSQuery;
    dsAttach: TMSDataSource;
    tvAttach: TcxGridDBTableView;
    lvAttach: TcxGridLevel;
    grAttach: TcxGrid;
    tvAttachName: TcxGridDBColumn;
    tvAttachDate_Begin: TcxGridDBColumn;
    tvAttachDate_End: TcxGridDBColumn;
    tvAttachIsVIPprog: TcxGridDBColumn;
    tvAttach_moss_spr_pat_status_ID: TcxGridDBColumn;
    tvAttach_moss_spr_pat_status_Name: TcxGridDBColumn;
    qFilialID: TIntegerField;
    qFilialName: TWideStringField;
    rgCallCat_II: TcxRadioGroup;
    rgCallCat_I: TcxRadioGroup;
    rgFilial: TcxRadioGroup;
    gbComments: TcxGroupBox;
    grRaspis: TcxGrid;
    tvRaspis: TcxGridDBTableView;
    lvRaspis: TcxGridLevel;
    lb1: TLabel;
    lb2: TLabel;
    lbPatientStatus: TLabel;
    lbServ_Project: TLabel;
    dsRaspis: TMSDataSource;
    qRaspis: TMSQuery;
    qRaspisRaspTime: TStringField;
    qRaspisProject: TWideStringField;
    qRaspisSpecialization: TWideStringField;
    tvRaspisRaspTime: TcxGridDBColumn;
    tvRaspisProject: TcxGridDBColumn;
    tvRaspisSpecialization: TcxGridDBColumn;
    qRaspisRaspis_date: TStringField;
    tvRaspisRaspis_date: TcxGridDBColumn;
    grPhones: TcxGrid;
    tvPhones: TcxGridDBTableView;
    lvPhones: TcxGridLevel;
    qPhones: TMSQuery;
    dsPhones: TMSDataSource;
    qPhonesPhone: TWideStringField;
    qPhonesIsMain: TBooleanField;
    qPhonesPhoneType: TWideStringField;
    tvPhonesPhone: TcxGridDBColumn;
    tvPhonesIsMain: TcxGridDBColumn;
    tvPhonesPhoneType: TcxGridDBColumn;
    btAddPhone: TcxButton;
    btSelectPatient: TcxButton;
    ilPhones: TImageList;
    btSMSAddress: TcxButton;
    tmrSMS: TTimer;
    sqlSMSSend: TMSSQL;
    lbIVRStatus: TLabel;
    tmrIVRStatus: TTimer;
    qFilialRoutes: TMSQuery;
    pmRoutes: TPopupMenu;
    N11: TMenuItem;
    N21: TMenuItem;
    ilRoutes: TImageList;
    qFilialRoutesLineNo: TWordField;
    qFilialRoutesStation: TWideStringField;
    qFilialRoutesRoute: TStringField;
    tmrSelectPat: TTimer;
    ilPatCards: TImageList;
    qPatCard: TMSQuery;
    imgPatCard: TImage;
    gbSpecialization: TcxGroupBox;
    qSpec: TMSQuery;
    qSpecId: TIntegerField;
    qSpecName: TWideStringField;
    dsSpec: TMSDataSource;
    cbSpecialization: TcxLookupComboBox;
    qMsgTemplates: TMSQuery;
    msSendWAmsg: TMSSQL;
    qMsgTemplatesid: TIntegerField;
    qMsgTemplatestempl_id: TIntegerField;
    qMsgTemplatesname: TWideStringField;
    qMsgTemplatestext: TWideStringField;
    qMsgTemplatestext_sms: TWideStringField;
    qMsgTemplatesAuthor_ID: TLargeintField;
    qMsgTemplatesisDel: TBooleanField;
    qMsgTemplatesdtEdit: TDateTimeField;
    qMsgTemplatesHeader: TWideStringField;
    qMsgTemplatesord: TIntegerField;
    qMsgTemplatesObject_ID: TIntegerField;
    btCreateTask: TcxButton;
    msCreateTask: TMSSQL;
    qLastVisitOver3years: TMSQuery;
    cbLastVisitOver3years: TcxCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure PatientsPropertiesEditValueChanged(Sender: TObject);
    procedure actSaveExitUpdate(Sender: TObject);
    procedure actClearPatientUpdate(Sender: TObject);
    procedure actAddPhoneExecute(Sender: TObject);
    procedure actExitPExecute(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure actSelectPatientExecute(Sender: TObject);
    procedure actClearPatientExecute(Sender: TObject);
    procedure actSaveExitExecute(Sender: TObject);
    procedure tvPhonesCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure rgFilialPropertiesChange(Sender: TObject);
    procedure tmrSMSTimer(Sender: TObject);
    procedure tmrIVRStatusTimer(Sender: TObject);
    procedure btSMSAddressClick(Sender: TObject);
    procedure tmrSelectPatTimer(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btCreateTaskClick(Sender: TObject);
  private
    TelForDream: string;
    FNeedSavePatientsPhone: Boolean;
    DefaulFormCaption: string;
    AllowCloseForm: Boolean;
    FComputerName: string;
    procedure InitCategory_I;
    procedure InitCategory_II;
    procedure InitFilials;
    procedure FillRadioGroupFromQuery(argb: TcxRadioGroup; aqry: TMSQuery;
      aIDName, aFieldName: string);
    function GetRadioGroupSelectedItemValue(argb: TcxRadioGroup): Integer;
    function GetUserIDByLogin: Integer;
    procedure SetNeedSavePatientsPhone(const Value: Boolean);
    procedure SendWAmsg;
    property NeedSavePatientsPhone: Boolean read FNeedSavePatientsPhone
      write SetNeedSavePatientsPhone;
    procedure SaveInputParametrs;
    procedure SendSMS(AText: string);
    procedure SetPatientCard(const APID: Integer);
    function GetComputerName: string;
    procedure Log(const AMessage: string; const AType, AID: Cardinal);
  public
    StaffId: Integer;
    function IsPhoneExists(const aNewPhone: String): Boolean;
  end;

var
  frmMain: TfrmMain;

implementation

uses _u_moss_Patients;

{$R *.dfm}

procedure TfrmMain.actAddPhoneExecute(Sender: TObject);
var
  p: TPoint;
begin
  if edPatients.Tag = 0 then
    Exit;
  if not Assigned(fmAddPhone) then
  begin
    fmAddPhone := TfmAddPhone.Create(Self);
    p.X := btAddPhone.Left;
    p.Y := btAddPhone.Top + btAddPhone.Height + 2;
    p := ClientToScreen(p);
    fmAddPhone.Left := p.X;
    fmAddPhone.Top := p.Y;
  end;
  if NeedSavePatientsPhone then
    fmAddPhone.Phone := TelForDream
  else
    fmAddPhone.Phone := '';
  if fmAddPhone.ShowModal = mrOK then
  begin
    qPhones.Refresh;
    NeedSavePatientsPhone := not IsPhoneExists(TelForDream);
  end;
end;

procedure TfrmMain.actClearPatientExecute(Sender: TObject);
begin
  edPatients.Tag := 0;
  edPatients.Text := 'Не определен';
  lbPatientStatus.Caption := 'Не определен';
  lbServ_Project.Caption := 'Не определен';
  NeedSavePatientsPhone := False;
  imgPatCard.Visible := False;
end;

procedure TfrmMain.actClearPatientUpdate(Sender: TObject);
begin
  actClearPatient.Enabled := (edPatients.Tag <> 0);
end;

procedure TfrmMain.actExitPExecute(Sender: TObject);
begin
  AllowCloseForm := True;
  Close;
end;

procedure TfrmMain.FillRadioGroupFromQuery(argb: TcxRadioGroup; aqry: TMSQuery;
  aIDName, aFieldName: string);
var
  rgi: TcxRadioGroupItem;
begin
  argb.Properties.Items.Clear;
  aqry.Open;
  aqry.First;
  while not aqry.Eof do
  begin
    rgi := argb.Properties.Items.Add;
    rgi.Caption := aqry.FieldByName(aFieldName).AsString;
    rgi.Tag := aqry.FieldByName(aIDName).AsInteger;
    aqry.Next;
  end;
end;

function TfrmMain.GetComputerName: string;
var
  pcComputer : PChar;
  dwCSize    : DWORD;
begin
  if FComputerName = '' then
  begin
    dwCSize := MAX_COMPUTERNAME_LENGTH + 1;
  //  {$IFDEF DELPHI_UNICODE}
    GetMem( pcComputer, dwCSize * 2); // allocate memory for the string
  //  {$ENDIF}
  //  {$IFNDEF DELPHI_UNICODE}
  //  GetMem( pcComputer, dwCSize ); // allocate memory for the string
  //  {$ENDIF}
    try
      if Windows.GetComputerName( pcComputer, dwCSize ) then
         FComputerName := StrPas(pcComputer);
    finally
      FreeMem( pcComputer ); // now free the memory allocated for the string
    end;
  end;
  Result := FComputerName;
end;

function TfrmMain.GetRadioGroupSelectedItemValue(argb: TcxRadioGroup): Integer;
begin
  Result := -1;
  if argb.ItemIndex <> -1 then
    Result := argb.Properties.Items[argb.ItemIndex].Tag;
end;

function TfrmMain.GetUserIDByLogin: Integer;
var
  stLogin: string;
  UName: array [0 .. 255] of Char;
  UNameSize: Cardinal;
begin
  UNameSize := 255;
  if not(Windows.GetUserName(@UName, UNameSize)) then
  begin
    ShowMessage('Не удалось определить Login оператора ' + 
      SysErrorMessage(Windows.GetLastError));
    ExitProcess(0);
  end;

  stLogin := string(UName);
  // Добавил для отладки по удаленке (вне домена)
  // Крылов С. 22.06.2021
  if DebugHook <> 0 then
   stLogin:='krylov_s';

  qUser.ParamByName('Login').AsString := stLogin;
  qUser.Open;
  if qUser.RecordCount <> 1 then
  begin
    ShowMessage('Не определен сотрудник по логину: ' + stLogin);
    ExitProcess(0);
  end;
  Result := qUser.FieldByName('Staff_Id').AsInteger;
  qUser.Close;
end;

procedure TfrmMain.FormActivate(Sender: TObject);
begin
  frmMain.FormStyle := fsNormal;
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Log('Closed', EVENTLOG_INFORMATION_TYPE, 2);
end;

procedure TfrmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := AllowCloseForm;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
var
  TelNo: string;
  stTime: string;
  OperName, OperPhone: string;
  CallId: string;
  nCallId: Integer;
  qry: TMSQuery;
  nIVR, nCSQ: Integer;
  ID: Integer;
begin
  dxSkinController1.SkinName := 'Office2007Silver';
  TelForDream := '';
  btSMSAddress.Enabled := False;
  NeedSavePatientsPhone := False;

  try
    // Добавил параметры для отладки по удаленке (вне домена)
    // Крылов С. 22.06.2021
    if DebugHook <> 0 then
    begin
        ConnToBase.Authentication := auServer;
        ConntoBase.UserName := 'dev';
        ConnToBase.Password := 'cooldev2011';
    end
    else
     ConnToBase.Authentication := auWindows;
    ConnToBase.Server := 'SQL.FDOCTOR.RU';
    ConnToBase.Database := 'NO_MOSS';
    ConnToBase.Connected := True;
    AllowCloseForm := False;
  except
    ShowMessage('Отсутствует подключение к ' + ConnToBase.Server + ' ' +
      ConnToBase.Database);
    ExitProcess(0);
  end;
  frmMain.ClientWidth := btSaveAndClose.Left + btSaveAndClose.Width + 8;

  StaffId := GetUserIDByLogin;

//  if FileExists(ChangeFileExt(Forms.Application.ExeName, '.ini')) then
  SaveInputParametrs; // логирование параметров вызова

  // Пример параметров (для отладки по аналогии с актуальными параметрами)
  // 4957078513 8293466/2 kuram 6060 17:46:31 1 1

  TelNo := ParamStr(1);
  CallId := ParamStr(2);
  OperName := ParamStr(3);
  OperPhone := ParamStr(4);
  stTime := ParamStr(5);

  InsertCall.ParamByName('IsUpdate').AsInteger := 0;
  if ParamCount > 5 then
    if TryStrToInt(ParamStr(6), nIVR) then
      InsertCall.ParamByName('IVRInput').AsInteger := nIVR
    else
    begin
      InsertCall.ParamByName('IVRInput').Clear;
      nIVR := 0;
    end;

  if ParamCount > 6 then
    if TryStrToInt(ParamStr(7), nCSQ) then
      InsertCall.ParamByName('CSQ').AsInteger := nCSQ
    else
      InsertCall.ParamByName('CSQ').Clear;

  if nIVR = 1 then // Новый пациент
  begin
    dxSkinController1.SkinName := 'Office2007Green';
    lbIVRStatus.Caption := 'Новый пациент';
    lbIVRStatus.Font.Color := clRed;
    tmrIVRStatus.Enabled := True; // "моргаем" сообщением
  end;

  if nIVR = 3 then // Страховой пациент
  begin
    dxSkinController1.SkinName := 'Office2007Blue';
    lbIVRStatus.Caption := 'Страховой пациент';
    lbIVRStatus.Font.Color := clBlue;
    tmrIVRStatus.Enabled := True; // "моргаем" сообщением
  end;

  if nIVR = 15 then // Виджет Перезвоните мне (Callback)
  begin
    dxSkinController1.SkinName := 'Office2007Pink';
  end;

  InsertCall.ParamByName('Phone').AsString := TelNo;
  InsertCall.ParamByName('OperName').AsString := OperName;
  InsertCall.ParamByName('OperStaffId').AsInteger := StaffId;
  InsertCall.ParamByName('OperPhone').AsString := OperPhone;
  try
    InsertCall.ParamByName('CallDate').AsDateTime := Trunc(Now()) + StrToTime(stTime);
  except

  end;
  InsertCall.ParamByName('OperComp').AsString := GetComputerName;

  // сохраним полученное значение CallId, а потом удалим из него всё после слеша
  InsertCall.ParamByName('CallIdStr').AsString := CallId;
  if Pos('/', CallId) > 0 then
    CallId := Copy(CallId, 0, Pos('/', CallId) - 1);

  if (Pos('NULL', CallId) > 0) then
    CallId := '0';
  try
    nCallId := StrToInt(CallId);
  except
    nCallId := 0;
  end;
  InsertCall.ParamByName('CallId').AsInteger := nCallId;

  // сохраним имеющуюся информацию о звонке
  InsertCall.Execute();
  InsertCall.ParamByName('IsUpdate').AsInteger := 1;
  ID := InsertCall.ParamByName('ID').AsInteger;
  InsertCall.ParamByName('RecID').AsInteger := ID;

  InitFilials;
  InitCategory_I;
  InitCategory_II;
  qSpec.Open;

  DefaulFormCaption := 'Звонок ' + TelNo + ' в ' + stTime + '     Версия - ' +
    EI.FileVersion;
  frmMain.Caption := DefaulFormCaption;

  frmPat := TfmPatients.Create(btSelectPatient);
  frmPat.Caption := frmPat.Caption + ' Звонок ' + TelNo + ' в ' + stTime;

  if (TelNo <> '') and (TelNo <> 'NULL') then
  begin
    if (Length(TelNo) = 12) and (Copy(TelNo, 1, 2) = '+7') then
      TelNo := Copy(TelNo, 3, 10);
    if (Length(TelNo) = 11) and (Copy(TelNo, 1, 1) = '8') then
      TelNo := Copy(TelNo, 2, 10);
    if (Length(TelNo) = 10) and (Copy(TelNo, 1, 1) <> '8') then
      TelForDream := '(' + Copy(TelNo, 0, 3) + ')' +
        Copy(TelNo, 4, 3) + '-' + Copy(TelNo, 7, 4);

    lbPhoneNumber.Caption := TelNo;
    if TelForDream <> '' then
    begin
      lbPhoneNumber.Caption := StringReplace(TelForDream, ' ', '', [rfReplaceAll]);
      // не будем сохранять номера, которые добавлены в исключения
      qry := TMSQuery.Create(Self);
      try
        qry.Connection := InsertCall.Connection;
        qry.SQL.Text :=
          'SELECT Phone, Comment '#13#10 +
          'FROM dbo._moss_spr_CallIgnorePhones WHERE IsDel = 0';
        qry.Open;
        if qry.Locate('Phone', TelNo, []) then
        begin
          TelForDream := '';
          lbPhoneNumber.Font.Color := clGray;
          lbPhoneNumber.Hint := qry.FieldByName('Comment').AsString;
          // если CallbackHunter, то поищем в таблице [Prego].[dbo].[callbackhunter] номер пациента
          if qry.FieldByName('Comment').AsString = 'CallbackHunter' then
          begin
            dxSkinController1.SkinName := 'Office2007Pink';
            edPatients.Text := 'CallbackHunter';
            qry.Close;
            qry.SQL.Text :=
              'SELECT c.id, c.datecall, c.phone_client as Phone, c.CallID '#13#10 +
              'FROM [Prego].[dbo].[callbackhunter] c '#13#10 +
              'WHERE c.[status] = ''None'' and c.CallID is NULL ';
            qry.Open;
            if qry.RecordCount = 1 then
            begin
              TelNo := StringReplace(qry.FieldByName('Phone').AsString, '+7', '', [rfReplaceAll]);
              if nCallId > 0 then
              begin
                qry.Edit;
                qry.FieldByName('CallID').AsInteger := nCallId;
                qry.Post;
              end;
              if (Length(TelNo) = 10) and (Copy(TelNo, 1, 1) <> '8') then
                TelForDream := '(' + Copy(TelNo, 0, 3) + ')' +
                  Copy(TelNo, 4, 3) + '-' + Copy(TelNo, 7, 4);

              lbPhoneNumber.Caption := StringReplace(TelForDream, ' ', '', [rfReplaceAll]);
              lbPhoneNumber.Font.Color := clWindowText;
              lbPhoneNumber.Hint := '';
            end;
          end;
        end;
      finally
        qry.Free;
      end;
    end;

    // параметры заполним, а запрос в БД сделаем по таймеру
    frmPat.Caption := frmPat.Caption + ' Звонок ' + TelNo + ' в ' + stTime;
    frmPat.qryPatients.ParamByName('Phone').Value := TelNo;
    frmPat.qryPatients.ParamByName('Flag').Value := 0;
    tmrSelectPat.Enabled := True;
  end;
end;

procedure TfrmMain.InitCategory_I;
begin
  FillRadioGroupFromQuery(rgCallCat_I, qCallCat_I, 'ID', 'Name');
end;

procedure TfrmMain.InitCategory_II;
begin
  FillRadioGroupFromQuery(rgCallCat_II, qCallCat_II, 'ID', 'Name');
end;

procedure TfrmMain.InitFilials;
begin
  FillRadioGroupFromQuery(rgFilial, qFilial, 'ID', 'Name');
end;

function TfrmMain.IsPhoneExists(const aNewPhone: String): Boolean;
var
  nID: Integer;
begin
  Result := True;
  if Trim(aNewPhone) = '' then
    Exit;
  if (edPatients.Tag <> 0) then
  begin
    if qPhones.Active then
    begin
      nID := qPhones.RecNo;
      qPhones.ControlsDisabled;
      if not qPhones.Locate('Phone', aNewPhone, []) then
        Result := False;
      qPhones.RecNo := nID;
      qPhones.EnableControls;
    end;
  end;
end;

procedure TfrmMain.Log(const AMessage: string; const AType, AID: Cardinal);
var
  Handle: string;
begin
  with TEventLogger.Create('CallCard') do
  begin
    try
      Handle := IntToStr(Forms.Application.Handle);
      LogMessage(Handle + #13#10 + AMessage, AType, 0, AID);
    finally
      Free;
    end;
  end;
end;

procedure TfrmMain.SaveInputParametrs;
var
//  qry: TMSQuery;
  i: Integer;
  st: string;
begin
  // логирование вызова
  st := '';
  for i := 0 to ParamCount do
    st := st + ' ' + ParamStr(i);
  Log('Started - ' + st, EVENTLOG_INFORMATION_TYPE, 1);

{  qry := TMSQuery.Create(Self);
  try
    qry.Connection := InsertCall.Connection;
    qry.SQL.Text :=
      'INSERT INTO dbo.tmp_svv_CiscoTest_Log (Staff_ID, ParamStr) ' + #13#10 +
      'VALUES ( :Staff_ID, :ParamStr );';
    qry.ParamByName('Staff_ID').AsInteger := StaffId;
    qry.ParamByName('ParamStr').AsString := QuotedStr(Trim(st));
    qry.ExecSQL;
  finally
    qry.Free;
  end; }
end;

procedure TfrmMain.PatientsPropertiesEditValueChanged(Sender: TObject);
begin
  frmMain.Caption := DefaulFormCaption;
  if edPatients.Tag <> 0 then
  begin
    frmMain.Caption := IntToStr(edPatients.Tag) + ' ' + frmMain.Caption;
    qAttach.Close;
    qAttach.ParamByName('pid').AsInteger := edPatients.Tag;
    qAttach.Open;
    qRaspis.Close;
    qRaspis.ParamByName('PID').AsInteger := edPatients.Tag;
    qRaspis.Open;
    qPhones.Close;
    qPhones.ParamByName('PID').AsInteger := edPatients.Tag;
    qPhones.Open;
    btAddPhone.Enabled := True;
    NeedSavePatientsPhone := not IsPhoneExists(TelForDream);
    SetPatientCard(edPatients.Tag);
  end
  else
  begin
    qAttach.Close;
    qRaspis.Close;
    qPhones.Close;
    btAddPhone.Enabled := False;
    imgPatCard.Visible := False;
  end;

  sqlPatToDream.ParamByName('OperId').AsInteger := StaffId;
  sqlPatToDream.ParamByName('PatId').AsInteger := edPatients.Tag;
  sqlPatToDream.ParamByName('IsUpdate').AsBoolean := True;
  sqlPatToDream.Execute();
  if sqlPatToDream.RowsAffected = 0 then
  begin
    sqlPatToDream.ParamByName('IsUpdate').AsBoolean := False; // вставка
    sqlPatToDream.Execute();
  end;
end;

procedure TfrmMain.rgFilialPropertiesChange(Sender: TObject);
var
  idProject: Integer;
  mn: TMenuItem;
begin
  btSMSAddress.Enabled := False;
  idProject := GetRadioGroupSelectedItemValue(rgFilial);
  if (idProject = 31) or (idProject = -1) then // Сеть или не выбрано
  begin
    btSMSAddress.Caption := 'Отправить СМС с адресом';
    btSMSAddress.Hint := '';
  end
  else
    if qFilial.Locate('ID', idProject, []) then
    begin
      if qFilialRoutes.ParamByName('Project_ID').AsInteger <> idProject then
      begin
        qFilialRoutes.Close;
        qFilialRoutes.ParamByName('Project_ID').AsInteger := idProject;
        qFilialRoutes.Open;
      end
      else
        qFilialRoutes.First;
      if qFilialRoutes.IsEmpty then
      begin
        btSMSAddress.Caption := 'Отправить СМС с адресом';
        btSMSAddress.Hint := '';
      end
      else
      begin
        btSMSAddress.Enabled := True;
        btSMSAddress.Tag := qFilialRoutes.RecordCount;
        if qFilialRoutes.RecordCount = 1 then
        begin
          btSMSAddress.Caption :=
            'Отправить СМС с адресом ' + qFilialName.AsString;
          btSMSAddress.Hint := qFilialRoutes.FieldByName('Route').AsString;
        end
        else
        begin
          btSMSAddress.Caption :=
            'Отправить СМС с адресом ' + qFilialName.AsString + '...';
          btSMSAddress.Hint := 'Найдено ' + IntToStr(qFilialRoutes.RecordCount) + ' маршрута';
          pmRoutes.Items.Clear;
          while not qFilialRoutes.Eof do
          begin
            mn := TMenuItem.Create(pmRoutes);
            mn.ImageIndex := qFilialRoutesLineNo.AsInteger - 1;
            mn.Caption := qFilialRoutesStation.AsString;
            mn.Hint := qFilialRoutesRoute.AsString;
            mn.OnClick := btSMSAddressClick;
            pmRoutes.Items.Add(mn);
            qFilialRoutes.Next;
          end;
        end;
      end;
    end;
end;

procedure TfrmMain.SendSMS(AText: string);
begin
  Self.SendWAmsg;
end;

// отправка через WhatsApp
// при невозможности - отправляем СМС, как обычно
// Крылов С. 23.06.2021
procedure TfrmMain.SendWAmsg();
var
  stPhone: string;
  tmpl_id:Integer;
  pr_id:Integer;
  AText:String;
begin
    // Шаблоны WhatApp с адресами филиалов
    if not qMsgTemplates.Active then
     qMsgTemplates.Open();

    stPhone := qPhonesPhone.AsString;
    if stPhone = '' then
      stPhone := lbPhoneNumber.Caption;

    // ИД филиала, а по нему ИД шаблона с адресом
    pr_id := GetRadioGroupSelectedItemValue(rgFilial);
    qMsgTemplates.locate('Object_id',pr_id,[]);
    tmpl_id := qMsgTemplatesid.value;
    AText := qMsgTemplatestext_sms.AsString;

    if MessageDlg('Отправить сообщение на номер ' + stPhone + ':' + #13#10 + AText,
      mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      // удаляем лишнее из номера телефона
      stPhone := StringReplace(stPhone, '(', '', [rfReplaceAll]);
      stPhone := StringReplace(stPhone, ')', '', [rfReplaceAll]);
      stPhone := StringReplace(stPhone, '-', '', [rfReplaceAll]);
      // Выбранный пациент
      msSendWAmsg.ParamByName('pid').AsInteger := edPatients.Tag;
      msSendWAmsg.ParamByName('phone').AsString := '7' + stPhone;

      msSendWAmsg.ParamByName('tmpl_id').AsInteger := tmpl_id;
      msSendWAmsg.ParamByName('staff_id').AsInteger := StaffId;

      try
       msSendWAmsg.Execute();

       btSMSAddress.Caption := 'Сообщение отправлено!';
       btSMSAddress.Enabled := False;
       tmrSMS.Enabled := True;
      except
       on E:Exception do
        MessageDlg('Ошибка при отправке сообщения: ' + E.Message,
                        mtInformation,[mbOK],0);
      end;
  end;
end;


procedure TfrmMain.SetNeedSavePatientsPhone(const Value: Boolean);
begin
  FNeedSavePatientsPhone := Value;
  if FNeedSavePatientsPhone then
  begin
    lbPhoneNumber.Font.Color := clRed;
    actAddPhone.ImageIndex := 1;
  end
  else
  begin
    if lbPhoneNumber.Font.Color <> clGray then
      lbPhoneNumber.Font.Color := clWindowText;
    actAddPhone.ImageIndex := 0;
  end;
end;

procedure TfrmMain.SetPatientCard(const APID: Integer);
var
  ImgIndex: Integer;
  status_new:Integer;
begin
  imgPatCard.Visible := False;
  qPatCard.Close;
  qPatCard.ParamByName('PID').AsInteger := APID;
  qPatCard.Open;
  if qPatCard.RecordCount = 1 then
  begin
    if qPatCard.FieldByName('ImgIndex').AsInteger >= 0 then
    begin
      ImgIndex := qPatCard.FieldByName('ImgIndex').AsInteger;
      ilPatCards.GetIcon(ImgIndex, imgPatCard.Picture.Icon);
      imgPatCard.Hint := qPatCard.FieldByName('CardName').AsString + ' карта';
      imgPatCard.Visible := True;
    end;
  end;
  // Пациент не был более 3-х лет
  if qLastVisitOver3years.Active then
   qLastVisitOver3years.Close;
  qLastVisitOver3years.ParamByName('PID').AsInteger := APID;
  qLastVisitOver3years.Open;
  status_new := qLastVisitOver3years.FieldByName('pat_status_new').AsInteger;
  cbLastVisitOver3years.Checked := status_new = 31; // статус "не был более 3-х лет"

end;

procedure TfrmMain.actSaveExitExecute(Sender: TObject);
var
  nCatCall_I, nCatCall_II, nFilial: Integer;
begin
  nFilial := GetRadioGroupSelectedItemValue(rgFilial);
  if nFilial = -1 then
  begin
    MessageDlg('Необходимо указать филиал!', mtError, [mbOK], 0);
    Exit;
  end;

  nCatCall_I := GetRadioGroupSelectedItemValue(rgCallCat_I);

  nCatCall_II := GetRadioGroupSelectedItemValue(rgCallCat_II);
  if nCatCall_II in [6, 15, 18] then // Запись на прием, Расписание, Цена услуги
  begin
    if cbSpecialization.ItemIndex = -1 then
    begin
      MessageDlg('Для данной категории необходимо выбрать специализацию!', mtError, [mbOK], 0);
      cbSpecialization.SetFocus;
      Exit;
    end;
  end;

  try
    InsertCall.ParamByName('PatId').AsInteger := edPatients.Tag;
    InsertCall.ParamByName('Komm').AsString := mComment.Text;

    if (TelForDream <> '') and (Pos('доб', TelForDream) = 0) then
      TelForDream := TelForDream + ' доб.(' + '    ' + ')';

    InsertCall.ParamByName('PhoneDream').AsString := TelForDream;

    if nFilial <> -1 then
      InsertCall.ParamByName('Filial').AsInteger := nFilial;

    if nCatCall_I <> -1 then
      InsertCall.ParamByName('CallCatIdI').AsInteger := nCatCall_I;

    if nCatCall_II <> -1 then
      InsertCall.ParamByName('CatId').AsInteger := nCatCall_II;

    if cbSpecialization.ItemIndex <> -1 then
    begin
      InsertCall.ParamByName('Specialization_ID').Value :=
        cbSpecialization.EditValue;
    end;

    InsertCall.Execute();
  finally
    AllowCloseForm := True;
    Close;
  end;
end;

procedure TfrmMain.actSaveExitUpdate(Sender: TObject);
var
  nCatCall_I, nCatCall_II: Integer;
  enbl: Boolean;
begin
  enbl := False;
  try
    nCatCall_I := GetRadioGroupSelectedItemValue(rgCallCat_I);
    nCatCall_II := GetRadioGroupSelectedItemValue(rgCallCat_II);
    if (nCatCall_I = -1) or (nCatCall_II = -1) then // не выбрали категории
      enbl := False
    else
      enbl := True;
  finally
    actSaveExit.Enabled := enbl;
  end;
end;

procedure TfrmMain.actSelectPatientExecute(Sender: TObject);
begin
  frmPat.Show;
  frmPat.BringToFront;
end;

procedure TfrmMain.btSMSAddressClick(Sender: TObject);
var
  p: TPoint;
begin
  if Sender is TMenuItem then
  begin
    SendSMS((Sender as TMenuItem).Hint);
    Exit;
  end;

  if btSMSAddress.Tag = 1 then
    SendSMS(btSMSAddress.Hint)
  else
  begin
    // показываем меню
    p.X := btSMSAddress.Left;
    p.Y := btSMSAddress.Top + btSMSAddress.Height;
    p := ClientToScreen(p);
    pmRoutes.Popup(p.X, p.Y);
  end;
end;

procedure TfrmMain.btCreateTaskClick(Sender: TObject);
var
 pr_id:Integer;
begin

 if InsertCall.ParamByName('RecID').isnull then
 begin
  MessageDlg('Не создана запись по данному звонку (RecID=null)!',mtInformation,[mbOK],0);
  Exit;
 end;

 if edPatients.Tag = 0 then
 begin
  MessageDlg('Пациент не выбран!',mtInformation,[mbOK],0);
  Exit;
 end;

 pr_id := GetRadioGroupSelectedItemValue(rgFilial);
 try
 msCreateTask.ParamByName('call_id').AsInteger := InsertCall.ParamByName('RecID').AsInteger;// -- ИД из no_moss.dbo._moss_call_log
 msCreateTask.ParamByName('pid').AsInteger := edPatients.Tag;
 msCreateTask.ParamByName('project_id').AsInteger := pr_id;
 msCreateTask.ParamByName('staff_id').AsInteger := StaffID;
 msCreateTask.ParamByName('comment').AsString := mComment.Lines.Text;
 msCreateTask.Execute;
 if msCreateTask.ParamByName('ret').AsInteger = 0 then
  MessageDlg('Задача по данному обращению создана успешно.',mtInformation,[mbOK],0)
 else
  MessageDlg('Ошибка при создании задачи по обращению!',mtInformation,[mbOK],0);

 except
  on E:Exception do
   MessageDlg('Ошибка при создании задачи по обращению: ' + E.Message,mtInformation,[mbOK],0);
 end;
end;

procedure TfrmMain.tmrSelectPatTimer(Sender: TObject);
begin
  tmrSelectPat.Enabled := False;
  Forms.Application.ProcessMessages;
  frmPat.qryPatients.Open;
  if frmPat.qryPatients.RecordCount = 1 then
  begin
    frmPat.qryPatients.First;
    frmPat.SelectPatient;
    frmPat.Hide;
  end
  else
  begin
    frmPat.Show;
    frmPat.Top := frmPat.Top + 220;
    frmPat.Left := frmPat.Left + 200;
    frmPat.BringToFront;
  end;
end;

procedure TfrmMain.tmrIVRStatusTimer(Sender: TObject);
begin
  lbIVRStatus.Visible := not lbIVRStatus.Visible;
  Forms.Application.ProcessMessages;
  tmrIVRStatus.Tag := tmrIVRStatus.Tag + 1;
  if tmrIVRStatus.Tag > 20 then
  begin
    tmrIVRStatus.Enabled := False;
    lbIVRStatus.Visible := True;
  end;
end;

procedure TfrmMain.tmrSMSTimer(Sender: TObject);
begin
  tmrSMS.Enabled := False;
  rgFilialPropertiesChange(rgFilial);
end;

procedure TfrmMain.tvPhonesCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
begin
  if not VarIsNull(AViewInfo.GridRecord.Values[tvPhonesIsMain.index]) then
    if AViewInfo.GridRecord.Values[tvPhonesIsMain.index] then
      ACanvas.Brush.Color := clMoneyGreen;
end;

end.
