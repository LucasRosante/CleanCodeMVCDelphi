unit Asa.Controller.Exceptions;

interface

uses
  Asa.Controller.Interfaces,
  System.SysUtils,
  Vcl.Forms;

type
  TControllerExceptions = class(TInterfacedObject, iControllerExceptions)
  private
    FForm : TForm;
    procedure Exceptions(Sender : TObject; E : Exception);
  public
    constructor Create(Form : TForm);
    destructor Destroy; override;
    class function New(Form : TForm) : iControllerExceptions;
  end;

implementation

uses
  Vcl.StdCtrls,
  Vcl.Dialogs, Asa.Model.Exceptions.ValidateFieldForm;

{ TControllerExceptions }

constructor TControllerExceptions.Create(Form : TForm);
begin
  FForm := Form;
  Application.OnException := Exceptions;
end;

destructor TControllerExceptions.Destroy;
begin

  inherited;
end;

procedure TControllerExceptions.Exceptions(Sender: TObject; E: Exception);
begin
  if E is TValidateFieldsForm then begin
    TEdit(FForm.FindComponent('edt'+TValidateFieldsForm(E).Field)).SetFocus;
    MessageDlg(TValidateFieldsForm(E).MessageError, mtError, [mbOK], 0);
  end
  else
    MessageDlg(E.Message, mtError, [mbOK], 0);
end;

class function TControllerExceptions.New (Form : TForm) : iControllerExceptions;
begin
  Result := Self.Create(Form);
end;

end.
