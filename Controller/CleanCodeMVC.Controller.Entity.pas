unit CleanCodeMVC.Controller.Entity;

interface

uses
  CleanCodeMVC.Controller.Interfaces,
  CleanCodeMVC.Model.Entity.Interfaces, Vcl.Forms;

type
  TControllerEntity = class(TInterfacedObject, iControllerEntity)
  private
    FEntityUser : iEntityUser;
    FException : iControllerExceptions;
  public
    constructor Create(Form : TForm);
    destructor Destroy; override;
    class function New(Form : TForm) : iControllerEntity;
    function USER : iEntityUser;
  end;

implementation

{ TControllerEntity }

uses
  CleanCodeMVC.Model.Entity.User,
  CleanCodeMVC.Controller.Exceptions;

constructor TControllerEntity.Create(Form : TForm);
begin
  FException := TControllerExceptions.New(Form);
end;

destructor TControllerEntity.Destroy;
begin

  inherited;
end;

class function TControllerEntity.New (Form : TForm) : iControllerEntity;
begin
  Result := Self.Create(Form);
end;

function TControllerEntity.USER: iEntityUser;
begin
  if not Assigned(FEntityUser) then
    FEntityUser := TModelEntityUser.New;

  Result := FEntityUser;
end;

end.
