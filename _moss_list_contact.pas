unit _moss_list_contact;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer,
  cxEdit, dxSkinsCore, Menus, cxStyles,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage, DB,
  cxDBData, cxMaskEdit, cxDBLookupComboBox, DBAccess, MSAccess, MemDS,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxGridCustomView, cxGrid, ExtCtrls, StdCtrls, cxButtons, cxMemo,
  cxDBEdit, cxTextEdit, cxLabel, cxGroupBox, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver;

type
  TfmContact = class(TForm)
    cxGroupBox1: TcxGroupBox;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxGroupBox2: TcxGroupBox;
    btExit: TcxButton;
    btCancel: TcxButton;
    btSave: TcxButton;
    cxGroupBox3: TcxGroupBox;
    cxDBTextEdit1: TcxDBTextEdit;
    q_list_mail: TMSQuery;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    ds_list_mail: TMSDataSource;
    cxGrid1DBTableView1_moss_email_ID: TcxGridDBColumn;
    cxGrid1DBTableView1_moss_email_name: TcxGridDBColumn;
    cxGrid1DBTableView1_moss_email_type_ID: TcxGridDBColumn;
    cxGrid1DBTableView1_moss_email_datecreated: TcxGridDBColumn;
    cxGrid1DBTableView1_moss_email_author_ID: TcxGridDBColumn;
    cxGrid1DBTableView1_moss_contacts_email_ID: TcxGridDBColumn;
    cxGrid1DBTableView1_moss_contacts_email_contacts_ID: TcxGridDBColumn;
    cxGrid1DBTableView1_moss_contacts_email_email_ID: TcxGridDBColumn;
    cxGrid1DBTableView1_moss_contacts_email_state: TcxGridDBColumn;
    q_list_type_mail: TMSQuery;
    ds_mail_type: TMSDataSource;
    q_insert_mail: TMSSQL;
    update_mail_state: TMSSQL;
    set_mail_state: TMSSQL;
    cxGrid2: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    q_list_phone: TMSQuery;
    ds_list_phone: TMSDataSource;
    q_list_type_phone: TMSQuery;
    ds_list_phone_type: TMSDataSource;
    cxGridDBTableView1_moss_telephone_value: TcxGridDBColumn;
    cxGridDBTableView1_moss_telephone_type_ID: TcxGridDBColumn;
    cxGridDBTableView1_moss_contacts_telephone_state: TcxGridDBColumn;
    q_insert_phone: TMSSQL;
    update_phone_state: TMSSQL;
    set_phone_state: TMSSQL;
    cxDBTextEdit2: TcxDBTextEdit;
    cxLabel3: TcxLabel;
    cxDBMemo1: TcxDBMemo;
    q_select_contact: TMSQuery;
    ds_sel_contact: TMSDataSource;
    q_delete_mail: TMSSQL;
    q_delete_phone: TMSSQL;
    q_list_phone_moss_telephone_ID: TIntegerField;
    q_list_phone_moss_telephone_value: TWideStringField;
    q_list_phone_moss_telephone_type_ID: TIntegerField;
    q_list_phone_moss_telephone_datecreated: TDateTimeField;
    q_list_phone_moss_contacts_telephone_ID: TIntegerField;
    q_list_phone_moss_contacts_telephone_contacts_ID: TIntegerField;
    q_list_phone_moss_contacts_telephone_telephone_ID: TIntegerField;
    q_list_phone_moss_contacts_telephone_state: TBooleanField;
    q_list_mail_moss_email_ID: TIntegerField;
    q_list_mail_moss_email_name: TWideStringField;
    q_list_mail_moss_email_type_ID: TIntegerField;
    q_list_mail_moss_email_datecreated: TDateTimeField;
    q_list_mail_moss_contacts_email_ID: TIntegerField;
    q_list_mail_moss_contacts_email_contacts_ID: TIntegerField;
    q_list_mail_moss_contacts_email_email_ID: TIntegerField;
    q_list_mail_moss_contacts_email_state: TBooleanField;
    q_list_mail_moss_email_author_staff_ID: TIntegerField;
    q_list_phone_moss_telephone_author_staff_ID: TIntegerField;
    grbPhone: TcxGroupBox;
    grbMail: TcxGroupBox;
    pnl1: TPanel;
    procedure btExitClick(Sender: TObject);
    procedure q_list_mailBeforePost(DataSet: TDataSet);
    procedure q_list_mailAfterPost(DataSet: TDataSet);
    procedure q_list_mailNewRecord(DataSet: TDataSet);
    procedure cxGrid1DBTableView1EditValueChanged
      (Sender: TcxCustomGridTableView;
      AItem: TcxCustomGridTableItem);
    procedure btSaveClick(Sender: TObject);
    procedure q_list_phoneBeforePost(DataSet: TDataSet);
    procedure q_list_phoneAfterPost(DataSet: TDataSet);
    procedure cxGridDBTableView1EditValueChanged
      (Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem);
    procedure FormShow(Sender: TObject);
    procedure q_list_mailBeforeDelete(DataSet: TDataSet);
    procedure q_list_phoneBeforeDelete(DataSet: TDataSet);
    procedure FormResize(Sender: TObject);
  private
  public
    NewMail: Boolean;
    NewPhone: Boolean;
    ContactId: Integer;
  end;

var
  fmContact: TfmContact;

implementation

uses uCallMain;
{$R *.dfm}

procedure TfmContact.btExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfmContact.btSaveClick(Sender: TObject);
begin
  if (q_list_mail.State in [dsEdit, dsInsert]) then
    q_list_mail.Post;
  if (q_list_phone.State in [dsEdit, dsInsert]) then
    q_list_phone.Post;
  if (q_select_contact.State = dsEdit) then
    q_select_contact.Post;
end;

procedure TfmContact.cxGrid1DBTableView1EditValueChanged
  (Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem);
begin
  if (AItem.Name = 'cxGrid1DBTableView1_moss_contacts_email_state') then
  begin
    if (AItem.EditValue = false) and
      (AItem.GridView.Controller.EditingController.Edit.EditValue = true) then
    begin
      // сбросим все  state  = 0
      update_mail_state.ParamByName('IdCont').Value := q_list_mail.ParamByName
        ('IdCont').AsInteger;
      update_mail_state.Execute();
      // установим в текущем  state=1
      set_mail_state.ParamByName('IdCont').Value := q_list_mail.ParamByName
        ('IdCont').AsInteger;
      set_mail_state.ParamByName('IdMail').Value := q_list_mail.FieldByName
        ('_moss_email_ID').AsInteger;
      set_mail_state.ParamByName('State').Value := true;
      set_mail_state.Execute();
      q_list_mail.Refresh;
    end
    else if (AItem.EditValue = true) and
      (AItem.GridView.Controller.EditingController.Edit.EditValue = false)

      then
    begin
      set_mail_state.ParamByName('IdCont').Value := q_list_mail.ParamByName
        ('IdCont').AsInteger;
      set_mail_state.ParamByName('IdMail').Value := q_list_mail.FieldByName
        ('_moss_email_ID').AsInteger;
      set_mail_state.ParamByName('State').Value := false;
      set_mail_state.Execute();
      q_list_mail.Refresh;
    end;
  end;
end;

procedure TfmContact.cxGridDBTableView1EditValueChanged
  (Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem);
begin
  if (AItem.Name = 'cxGridDBTableView1_moss_contacts_telephone_state') then
  begin
    if (AItem.EditValue = false) and
      (AItem.GridView.Controller.EditingController.Edit.EditValue = true) then
    begin
      update_phone_state.ParamByName('IdCont').Value := q_list_phone.ParamByName
        ('IdCont').AsInteger;
      update_phone_state.Execute();
      // установим в текущем  state=1
      set_phone_state.ParamByName('IdCont').Value := q_list_phone.ParamByName
        ('IdCont').AsInteger;
      set_phone_state.ParamByName('IdPhone').Value := q_list_phone.FieldByName
        ('_moss_telephone_ID').AsInteger;
      set_phone_state.ParamByName('State').Value := true;
      set_phone_state.Execute();
      q_list_phone.Refresh;
    end
    else if (AItem.EditValue = true) and
      (AItem.GridView.Controller.EditingController.Edit.EditValue = false) then
    begin
      set_phone_state.ParamByName('IdCont').Value := q_list_phone.ParamByName
        ('IdCont').AsInteger;
      set_phone_state.ParamByName('IdPhone').Value := q_list_phone.FieldByName
        ('_moss_telephone_ID').AsInteger;
      set_phone_state.ParamByName('State').Value := false;
      set_phone_state.Execute();
      q_list_phone.Refresh;
    end;
  end;
end;

procedure TfmContact.FormResize(Sender: TObject);
begin
  grbPhone.Width := ClientWidth div 2;
end;

procedure TfmContact.FormShow(Sender: TObject);
begin
  q_select_contact.ParamByName('ContId').Value := ContactId;
  q_select_contact.Active := false;
  q_select_contact.Active := true;
  // список майлов
  q_list_mail.ParamByName('IdCont').Value := ContactId;
  q_list_mail.Active := false;
  q_list_mail.Active := true;
  q_list_type_mail.Active := false;
  q_list_type_mail.Active := true;
  // список телефонов
  q_list_phone.ParamByName('IdCont').Value := ContactId;
  q_list_phone.Active := false;
  q_list_phone.Active := true;
  q_list_type_phone.Active := false;
  q_list_type_phone.Active := true;
end;

procedure TfmContact.q_list_mailAfterPost(DataSet: TDataSet);
begin
  if (NewMail) then
  begin
    q_insert_mail.ParamByName('IdCont').Value := q_list_mail.ParamByName
      ('IdCont').AsInteger;
    q_insert_mail.ParamByName('IdMail').Value := q_list_mail.FieldByName
      ('_moss_email_id').AsInteger;
    if (q_list_mail.FieldByName('_moss_contacts_email_state').AsBoolean) then
    begin // поставили признак ќ—Ќќ¬Ќјя в почте - сбросим остальные почты в обычные
      update_mail_state.ParamByName('IdCont').Value := q_list_mail.ParamByName
        ('IdCont').AsInteger;
      update_mail_state.Execute;
    end;
    q_insert_mail.ParamByName('State').Value := q_list_mail.FieldByName
      ('_moss_contacts_email_state').AsBoolean;
    q_insert_mail.Execute;
    q_list_mail.Refresh;
  end;
end;

procedure TfmContact.q_list_mailBeforeDelete(DataSet: TDataSet);
begin
  q_delete_mail.ParamByName('IdCont').Value := q_list_mail.ParamByName('IdCont')
    .AsInteger;
  q_delete_mail.ParamByName('IdMail').Value := q_list_mail.FieldByName
    ('_moss_email_id').AsInteger;
  q_delete_mail.Execute;
end;

procedure TfmContact.q_list_mailNewRecord(DataSet: TDataSet);
begin // ѕрисваиваем значени€ по умолчанию.
  q_list_mail.FieldByName('_moss_email_author_staff_ID')
    .Value := frmMain.StaffId; // јвтор.
end;

procedure TfmContact.q_list_phoneAfterPost(DataSet: TDataSet);
begin
  if (NewPhone) then
  begin //
    q_insert_phone.ParamByName('IdCont').Value := q_list_phone.ParamByName
      ('IdCont').AsInteger;
    q_insert_phone.ParamByName('IdPhone').Value := q_list_phone.FieldByName
      ('_moss_telephone_id').AsInteger;
    if (q_list_phone.FieldByName('_moss_contacts_telephone_state').AsBoolean)
      then
    begin
      // поставили признак ќ—Ќќ¬Ќјя в phone - сбросим остальные в обычные
      update_phone_state.ParamByName('IdCont').Value := q_list_phone.ParamByName
        ('IdCont').AsInteger;
      update_phone_state.Execute;

    end;

    q_insert_phone.ParamByName('State').Value := q_list_phone.FieldByName
      ('_moss_contacts_telephone_state').AsBoolean;
    q_insert_phone.Execute;
    q_list_phone.Refresh;

  end;
end;

procedure TfmContact.q_list_phoneBeforeDelete(DataSet: TDataSet);
begin
  q_delete_phone.ParamByName('IdCont').Value := q_list_phone.ParamByName
    ('IdCont').AsInteger;
  q_delete_phone.ParamByName('IdPhone').Value := q_list_phone.FieldByName
    ('_moss_telephone_id').AsInteger;
  q_delete_phone.Execute;
end;

procedure TfmContact.q_list_mailBeforePost(DataSet: TDataSet);
begin
  if (DataSet.FieldByName('_moss_email_type_id').AsInteger < 1) then
    DataSet.FieldByName('_moss_email_type_id').Value := 3;
  if (DataSet.State = dsInsert) then
    NewMail := true
  else
    NewMail := false;
end;

procedure TfmContact.q_list_phoneBeforePost(DataSet: TDataSet);
begin
  if (DataSet.FieldByName('_moss_telephone_type_id').AsInteger < 1) then
    DataSet.FieldByName('_moss_telephone_type_id').Value := 1;
  q_list_phone.FieldByName('_moss_telephone_author_staff_ID')
    .Value := frmMain.StaffId; // јвтор
  q_list_phone.FieldByName('_moss_telephone_datecreated').Value := Now;

  if (DataSet.State = dsInsert) then
    NewPhone := true
  else
    NewPhone := false;
end;

end.
