unit _u_moss_Patients;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, dxSkinsCore, Menus, cxStyles,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage, DB,
  cxDBData, ActnList, DBAccess, MSAccess, MemDS, cxSplitter, cxGridLevel,
  cxGridCardView, cxGridDBCardView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, StdCtrls, cxButtons,
  cxTextEdit, cxLabel, cxGroupBox, cxCheckBox, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2007Blue;

type
  TfmPatients = class(TForm)
    cxGroupBox1: TcxGroupBox;
    lbSurName: TcxLabel;
    edSurname: TcxTextEdit;
    btClearSurname: TcxButton;
    btSearch: TcxButton;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    dsPatients: TDataSource;
    qryPatients: TMSQuery;
    lbFirstName: TcxLabel;
    edFirstName: TcxTextEdit;
    btClearFirstName: TcxButton;
    lbSecName: TcxLabel;
    edSecName: TcxTextEdit;
    btClearSecName: TcxButton;
    cxGrid1DBTableView1ID: TcxGridDBColumn;
    cxGrid1DBTableView1Surname: TcxGridDBColumn;
    cxGrid1DBTableView1FirstName: TcxGridDBColumn;
    cxGrid1DBTableView1SecName: TcxGridDBColumn;
    cxSplitter1: TcxSplitter;
    lbID: TcxLabel;
    edID: TcxTextEdit;
    btClearID: TcxButton;
    cxGrid1DBCardView1: TcxGridDBCardView;
    cxGrid1DBCardView1Sex: TcxGridDBCardViewRow;
    cxGrid1DBCardView1Birthday: TcxGridDBCardViewRow;
    cxGrid1DBTableView1Sex: TcxGridDBColumn;
    cxGrid1DBTableView1Birthday: TcxGridDBColumn;
    btClear: TcxButton;
    msPatComment: TMSSQL;
    btClose: TcxButton;
    ActionList1: TActionList;
    Cls: TAction;
    Search: TAction;
    Clear: TAction;
    ToMed: TAction;
    ToName: TAction;
    ToFam: TAction;
    ToOtc: TAction;
    Label7: TLabel;
    ClrM: TAction;
    ClrW: TAction;
    ClrE: TAction;
    ClrR: TAction;
    cxGrid1DBTableView1StatusColor: TcxGridDBColumn;
    btAddPatient: TcxButton;
    actAddPatient: TAction;
    cxStyleRepository1: TcxStyleRepository;
    cxStyleSelected: TcxStyle;
    lbMore100Patients: TLabel;
    PopupMenu1: TPopupMenu;
    pmiAdd: TMenuItem;
    pmiEdit: TMenuItem;
    actEditPatient: TAction;
    pmiSeparator: TMenuItem;
    pmiSelect: TMenuItem;
    chbFullPID: TcxCheckBox;
    procedure btClearSurnameClick(Sender: TObject);
    procedure btClearFirstNameClick(Sender: TObject);
    procedure btClearSecNameClick(Sender: TObject);
    procedure btSearchClick(Sender: TObject);
    procedure btClearIDClick(Sender: TObject);
    procedure cxGrid1Enter(Sender: TObject);
    procedure cxGrid1Exit(Sender: TObject);
    procedure cxGrid1DBTableView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);

    procedure FormShow(Sender: TObject);

    procedure btClearClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure cxGrid1DBTableView1CellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);

    procedure SelectPatient;
    procedure btCloseClick(Sender: TObject);
    procedure SearchUpdate(Sender: TObject);

    procedure ClearUpdate(Sender: TObject);
    procedure ToMedExecute(Sender: TObject);
    procedure ToNameExecute(Sender: TObject);
    procedure ToFamExecute(Sender: TObject);
    procedure ToOtcExecute(Sender: TObject);

    procedure ClrMUpdate(Sender: TObject);
    procedure ClrWUpdate(Sender: TObject);
    procedure ClrEUpdate(Sender: TObject);
    procedure ClrRUpdate(Sender: TObject);
    procedure cxGrid1DBTableView1CustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure actAddPatientExecute(Sender: TObject);
    procedure qryPatientsAfterOpen(DataSet: TDataSet);
    procedure actEditPatientExecute(Sender: TObject);
    procedure pmiSelectClick(Sender: TObject);
    procedure chbFullPIDClick(Sender: TObject);
    procedure edIDPropertiesChange(Sender: TObject);
  private
    Patient_ID: integer;
    PatientName: String;
  end;

var
  frmPat: TfmPatients;

implementation

uses uCallMain, _u_moss_PatientEdit;

{$R *.dfm}

procedure TfmPatients.actAddPatientExecute(Sender: TObject);
begin
  if not Assigned(fmPatientEdit) then
    fmPatientEdit := TfmPatientEdit.Create(Self);
  fmPatientEdit.ShowModal;

  // Делаем Выбор добавленого пациента
  edID.Text := IntToStr(fmPatientEdit.PID);
  btSearch.Click;

  FreeAndNil(fmPatientEdit);
end;

procedure TfmPatients.actEditPatientExecute(Sender: TObject);
begin
  if not Assigned(fmPatientEdit) then
    fmPatientEdit := TfmPatientEdit.Create(Self);
  fmPatientEdit.PID := qryPatients.FieldByName('PID').AsInteger;
  fmPatientEdit.ShowModal;

  FreeAndNil(fmPatientEdit);
end;

procedure TfmPatients.btClearClick(Sender: TObject);
begin
  // очистим все поля фильтра
  edID.Text := '';
  edFirstName.Text := '';
  edSecName.Text := '';
  edSurname.Text := '';
  edSurname.SetFocus;
end;

procedure TfmPatients.btClearFirstNameClick(Sender: TObject);
begin
  edFirstName.Text := '';
  edFirstName.SetFocus;
end;

procedure TfmPatients.btClearIDClick(Sender: TObject);
begin
  edID.Text := '';
  edID.SetFocus;
end;

procedure TfmPatients.btClearSecNameClick(Sender: TObject);
begin
  edSecName.Text := '';
  edSecName.SetFocus;
end;

procedure TfmPatients.btClearSurnameClick(Sender: TObject);
begin
  edSurname.Text := '';
  edSurname.SetFocus;
end;

procedure TfmPatients.btSearchClick(Sender: TObject);
begin
  if (edID.Text = '') and (edSurname.Text = '') and
     (edFirstName.Text = '') and (edSecName.Text = '') then
    Exit;

  if chbFullPID.Checked then
    qryPatients.ParamByName('FullPID').AsString := edID.Text
  else
  begin
    qryPatients.ParamByName('FullPID').Clear;
    qryPatients.ParamByName('pID').AsString := '%' + edID.Text + '%';
    qryPatients.ParamByName('pSurname').AsString := edSurname.Text + '%';
    qryPatients.ParamByName('pFirstName').AsString := edFirstName.Text + '%';
    qryPatients.ParamByName('pSecName').AsString := edSecName.Text + '%';
    qryPatients.ParamByName('Flag').AsInteger := 1;
  end;
  Screen.Cursor := crSQLWait;
  try
    qryPatients.Close;
    qryPatients.Open;
    if qryPatients.RecordCount > 0 then
      cxGrid1.SetFocus;
    if qryPatients.RecordCount = 1 then
      edID.Text := qryPatients.FieldByName('PID').AsString;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfmPatients.chbFullPIDClick(Sender: TObject);
begin
  edSurname.Enabled := not chbFullPID.Checked;
  edFirstName.Enabled := not chbFullPID.Checked;
  edSecName.Enabled := not chbFullPID.Checked;
end;

procedure TfmPatients.ClearUpdate(Sender: TObject);
begin
  Clear.Enabled := Search.Enabled
end;

procedure TfmPatients.ClrEUpdate(Sender: TObject);
begin
  if edFirstName.Text <> '' then
    ClrE.Enabled := True
  else
    ClrE.Enabled := False;
end;

procedure TfmPatients.ClrMUpdate(Sender: TObject);
begin
  if edID.Text <> '' then
    ClrM.Enabled := True
  else
    ClrM.Enabled := False;
end;

procedure TfmPatients.ClrRUpdate(Sender: TObject);
begin
  if edSecName.Text <> '' then
    ClrR.Enabled := True
  else
    ClrR.Enabled := False;
end;

procedure TfmPatients.ClrWUpdate(Sender: TObject);
begin
  if edSurname.Text <> '' then
    ClrW.Enabled := True
  else
    ClrW.Enabled := False;
end;

procedure TfmPatients.btCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmPatients.cxGrid1DBTableView1CellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  SelectPatient;
end;

procedure TfmPatients.cxGrid1DBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
  cl: TColor;
begin
  cl := AViewInfo.GridRecord.Values[cxGrid1DBTableView1StatusColor.Index];
  if cl <> 8433792 then // кроме наличных
    ACanvas.Brush.Color := cl;
end;

procedure TfmPatients.cxGrid1DBTableView1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    Key := 0;
    SelectPatient;
  end;
end;

procedure TfmPatients.cxGrid1Enter(Sender: TObject);
begin
  btSearch.Default := False;
end;

procedure TfmPatients.cxGrid1Exit(Sender: TObject);
begin
  btSearch.Default := True;
end;

procedure TfmPatients.edIDPropertiesChange(Sender: TObject);
begin
  chbFullPID.Checked := (Trim(edID.Text) <> '');
end;

procedure TfmPatients.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := False;
  Hide;
end;

procedure TfmPatients.FormShow(Sender: TObject);
begin
  if Patient_ID > 0 then
    edID.Text := IntToStr(Patient_ID);
  btSearchClick(Self);
end;

procedure TfmPatients.pmiSelectClick(Sender: TObject);
begin
  SelectPatient;
end;

procedure TfmPatients.qryPatientsAfterOpen(DataSet: TDataSet);
begin
  lbMore100Patients.Visible := (qryPatients.RecordCount >= 100);
end;

procedure TfmPatients.SearchUpdate(Sender: TObject);
begin
  if (edID.Text = '') and (edSurname.Text = '') and
     (edFirstName.Text = '') and (edSecName.Text = '') then
    Search.Enabled := False
  else
    Search.Enabled := True;
end;

procedure TfmPatients.SelectPatient;
var
  strComment: string;
  PID: integer;
begin
  if qryPatients.IsEmpty then
  begin
    PatientName := '';
    Exit;
  end;
  PID := qryPatients.FieldByName('PID').AsInteger;
  PatientName := qryPatients.FieldByName('Surname').AsString + ' ' +
    qryPatients.FieldByName('FirstName').AsString + ' ' +
    qryPatients.FieldByName('Secname').AsString;
  // Показываем комментарий, если имеется
  try
    msPatComment.ParamByName('PatientID').Value := PID;
    msPatComment.Execute;
    strComment := msPatComment.ParamByName('RETURN_VALUE').AsString;
    if strComment <> '' then
      MessageDlg(strComment, mtInformation, [mbOK], 0);
  finally ;
  end;
  frmMain.edPatients.Tag := PID;
  frmMain.edPatients.Text := PatientName;
  frmMain.lbPatientStatus.Caption :=
    qryPatients.FieldByName('StatusName').AsString;
  frmMain.lbPatientStatus.Color := qryPatients.FieldByName('Color').AsInteger;
  if qryPatients.FieldByName('Serv_project').AsString <> '' then
    frmMain.lbServ_Project.Caption :=
      qryPatients.FieldByName('Serv_project').AsString
  else
    frmMain.lbServ_Project.Caption := 'Не определен';
  Self.Hide;
end;

procedure TfmPatients.ToFamExecute(Sender: TObject);
begin
  edSurname.SetFocus;
end;

procedure TfmPatients.ToMedExecute(Sender: TObject);
begin
  edID.SetFocus;
end;

procedure TfmPatients.ToNameExecute(Sender: TObject);
begin
  edFirstName.SetFocus;
end;

procedure TfmPatients.ToOtcExecute(Sender: TObject);
begin
  edSecName.SetFocus;
end;

end.
