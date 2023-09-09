unit uAddPhone;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, dxSkinsCore, Menus, cxGroupBox,
  cxRadioGroup, StdCtrls, cxButtons, cxCheckBox, cxTextEdit, cxMaskEdit, DB,
  MemDS, DBAccess, MSAccess, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver;

type
  TfmAddPhone = class(TForm)
    qTypeTel: TMSQuery;
    edPhone: TcxMaskEdit;
    Label1: TLabel;
    chbIsMain: TcxCheckBox;
    btSave: TcxButton;
    btCancel: TcxButton;
    rgTypeTel: TcxRadioGroup;
    spSaveTel: TMSStoredProc;
    lbStatus: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btSaveClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    Phone: string;
  end;

var
  fmAddPhone: TfmAddPhone;

implementation

uses uCallMain;

{$R *.dfm}

procedure TfmAddPhone.btSaveClick(Sender: TObject);
begin
  if frmMain.edPatients.Tag = 0 then
  begin
    lbStatus.Caption := 'Не выбран пациент!';
    lbStatus.Visible := True;
    Exit;
  end;
  if rgTypeTel.ItemIndex = -1 then
  begin
    lbStatus.Caption := 'Не выбран тип телефона!';
    lbStatus.Visible := True;
    Exit;
  end;
  if edPhone.Text = '(   )   -    ' then
  begin
    lbStatus.Caption := 'Не указан номер телефона!';
    lbStatus.Visible := True;
    Exit;
  end;
  if frmMain.IsPhoneExists(edPhone.Text) then
  begin
    lbStatus.Caption := 'Телефон уже добавлен!';
    lbStatus.Visible := True;
    Exit;
  end;
  spSaveTel.ParamByName('pid').Value := frmMain.edPatients.Tag;
  spSaveTel.ParamByName('telephone').Value := edPhone.Text + ' доб.(     )';
  spSaveTel.ParamByName('telephone_type_ID').Value := rgTypeTel.Properties.Items[rgTypeTel.ItemIndex].Tag;
  spSaveTel.ParamByName('isMain').AsBoolean := chbIsMain.Checked;
  spSaveTel.ParamByName('Staff_ID').Value := frmMain.StaffId;
  spSaveTel.Execute;

  ModalResult := mrOk;
end;

procedure TfmAddPhone.FormActivate(Sender: TObject);
begin
  edPhone.Text := Phone;
  rgTypeTel.ItemIndex := -1;
  lbStatus.Visible := False;
  chbIsMain.Checked := False;
end;

procedure TfmAddPhone.FormCreate(Sender: TObject);
var
  rgi: TcxRadioGroupItem;
begin
  rgTypeTel.Properties.Items.Clear;
  qTypeTel.Open;
  qTypeTel.First;
  while not qTypeTel.Eof do
  begin
    rgi := rgTypeTel.Properties.Items.Add;
    rgi.Caption := qTypeTel.FieldByName('Name').AsString;
    rgi.Tag := qTypeTel.FieldByName('ID').AsInteger;
    qTypeTel.Next;
  end;
end;

end.
