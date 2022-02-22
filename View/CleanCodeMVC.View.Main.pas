unit CleanCodeMVC.View.Main;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.ExtCtrls,
  Vcl.WinXCtrls,
  Data.DB,
  CleanCodeMVC.Controller.Entity, CleanCodeMVC.Controller.Interfaces;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    SearchBox1: TSearchBox;
    RadioGroup1: TRadioGroup;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    Panel3: TPanel;
    btnDelete: TButton;
    btnAll: TButton;
    Panel4: TPanel;
    Label1: TLabel;
    edtID: TEdit;
    Label5: TLabel;
    edtUserName: TEdit;
    Label6: TLabel;
    edtEmail: TEdit;
    edtPassword: TEdit;
    Label7: TLabel;
    btnInsert: TButton;
    btnUpdate: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnAllClick(Sender: TObject);
    procedure btnUpdateClick(Sender: TObject);
    procedure btnInsertClick(Sender: TObject);
    procedure SearchBox1InvokeSearch(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    FControllerEntity : iControllerEntity;
    FDataSource : TDataSource;
    procedure ClearEdits;
  public
  end;

var
  Form1: TForm1;

implementation

uses
  CleanCodeMVC.Controller.Factory;

{$R *.dfm}

procedure TForm1.btnAllClick(Sender: TObject);
begin
  FControllerEntity
    .USER
      .DAO
      .All(FDataSource);
end;

procedure TForm1.btnInsertClick(Sender: TObject);
begin
  FControllerEntity
    .USER
      .UserName(edtUserName.Text)
      .Email(edtEmail.Text)
      .Password(edtPassword.Text)
      .DAO
        .Insert
        .All(FDataSource);

  ClearEdits;
end;

procedure TForm1.btnUpdateClick(Sender: TObject);
begin
  FControllerEntity
    .USER
      .GUUID(edtID.Text)
      .UserName(edtUserName.Text)
      .Email(edtEmail.Text)
      .Password(edtPassword.Text)
      .DAO
        .Update
        .All(FDataSource);

  ClearEdits;
end;

procedure TForm1.ClearEdits;
begin
  TControllerFactory.New
    .Util
      .ClearEdits(Self);
end;

procedure TForm1.btnDeleteClick(Sender: TObject);
begin
  FControllerEntity
    .USER
      .DAO
      .Delete(FDataSource.DataSet.FieldByName('GUUID').AsString)
      .All(FDataSource);
end;

procedure TForm1.DBGrid1DblClick(Sender: TObject);
begin
  FControllerEntity
    .USER
      .DAO
      .Find(FDataSource.DataSet.FieldByName('GUUID').AsString);

  edtID.Text := FControllerEntity.USER.GUUID;
  edtUserName.Text := FControllerEntity.USER.UserName;
  edtEmail.Text := FControllerEntity.USER.Email;
  edtPassword.Text := FControllerEntity.USER.Password;

  edtUserName.SetFocus;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  FControllerEntity := TControllerEntity.New(Self);
  FDataSource := TDataSource.Create(Self);
  DBGrid1.DataSource := FDataSource;

  FControllerEntity.USER.DAO.All(FDataSource);
end;

procedure TForm1.SearchBox1InvokeSearch(Sender: TObject);
const
  FieldFind : array [1..3] of String = ('USER_NAME','EMAIL','PASSWORD');
begin
  if RadioGroup1.ItemIndex = 0 then
    FControllerEntity
      .USER
        .DAO
        .Find(SearchBox1.Text);

  if RadioGroup1.ItemIndex in [1..3] then
    FControllerEntity
      .USER
        .DAO
        .FindBy(FieldFind[RadioGroup1.ItemIndex],
                SearchBox1.Text);
end;

end.
