unit CleanCodeMVC.Model.Connection.Firedac;

interface

uses
  CleanCodeMVC.Model.Connection.Interfaces,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Phys,
  FireDAC.FMXUI.Wait,
  FireDAC.Comp.Client,
  FireDAC.Comp.UI,
  FireDAC.Phys.MySQLDef,
  FireDAC.Phys.MySQL,
  FireDAC.Phys.IBBase,
  FireDAC.Phys.FB,
  Data.DB,
  System.SysUtils;

type
  TModelConnectionFiredac = class(TInterfacedObject, iConnection)
  private
    FConnection : TFDConnection;
  public
    constructor Create;
    destructor Destroy; override;
    class function New : iConnection;
    function Connection : TCustomConnection;
  end;

implementation

{ TModelConnectionFiredac }

constructor TModelConnectionFiredac.Create;
begin
  FConnection := TFDConnection.Create(nil);

  FConnection.DriverName := 'FB';
  FConnection.Params.Database := '..\..\Database\DB.fdb';
  FConnection.Params.UserName := 'SYSDBA';
  FConnection.Params.Password := 'masterkey';
  FConnection.LoginPrompt := False;

  FConnection.Connected := True;
end;

destructor TModelConnectionFiredac.Destroy;
begin
  FreeAndNil(FConnection);
  inherited;
end;

class function TModelConnectionFiredac.New : iConnection;
begin
  Result := Self.Create;
end;

function TModelConnectionFiredac.Connection: TCustomConnection;
begin
  Result := FConnection;
end;

end.
