unit Asa.Controller.Factory;

interface

uses
  Asa.Controller.Interfaces,
  Asa.Model.Connection.Interfaces,
  Asa.Model.Query.Interfaces,
  Asa.Utils.Interfaces, Vcl.Forms, Asa.Model.Exceptions.ValidateFieldForm;

type
  TControllerFactory = class(TInterfacedObject, iControllerFactory)
  private
//    FConnection : iConnection;
  public
    constructor Create;
    destructor Destroy; override;
    class function New : iControllerFactory;
    function Connection : iConnection;
    function Query : iQuery;
    function Util : iUtils;
    function ExceptionValidateFieldsForm(Field, MessageError : String): TValidateFieldsForm;
  end;

implementation

{ TControllerFactory }

uses
  Asa.Model.Query.Firedac,
  Asa.Model.Connection.Firedac,
  Asa.Utils, Asa.Controller.Exceptions;

constructor TControllerFactory.Create;
begin

end;

destructor TControllerFactory.Destroy;
begin

  inherited;
end;

function TControllerFactory.ExceptionValidateFieldsForm(Field, MessageError : String): TValidateFieldsForm;
begin
  Result := TValidateFieldsForm.Create(Field, MessageError);
end;

class function TControllerFactory.New : iControllerFactory;
begin
  Result := Self.Create;
end;

function TControllerFactory.Connection: iConnection;
begin
//  if not Assigned(FConnection) then
//    FConnection := TModelConnectionFiredac.New;
//
//  Result := FConnection;

  Result := TModelConnectionFiredac.New;
end;

function TControllerFactory.Query: iQuery;
begin
  Result := TModelQueryFiredac.New;
end;

function TControllerFactory.Util: iUtils;
begin
  Result := TUtils.New;
end;

end.
