unit CleanCodeMVC.Model.Query.Firedac;

interface

uses
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  FireDAC.VCLUI.Wait,
  FireDAC.Comp.UI,
  CleanCodeMVC.Model.Query.Interfaces,
  CleanCodeMVC.Model.Connection.Interfaces,
  Data.DB;

type
  TModelQueryFiredac = class(TInterfacedObject, iQuery)
  private
    class var FConnection : iConnection;
    FQuery : TFDQuery;
  public
    constructor Create;
    destructor Destroy; override;
    class function New : iQuery;
    function DataSet : TDataSet;
    function Open(SQL : String) : iQuery; overload;
    function Open(SQL : String; Params : array of Variant) : iQuery; overload;
    function ExecuteSQL(SQL : String; Params : array of Variant) : iQuery; overload;
    function ExecuteSQL(SQL : String) : iQuery; overload;
  end;

implementation

uses
  System.SysUtils,
  CleanCodeMVC.Controller.Factory;

constructor TModelQueryFiredac.Create;
begin
  if not Assigned(TModelQueryFiredac.FConnection) then
    TModelQueryFiredac.FConnection := TControllerFactory.New.Connection;

  FQuery := TFDQuery.Create(nil);

  FQuery.Connection := TFDConnection(TModelQueryFiredac.FConnection.Connection);
end;

function TModelQueryFiredac.DataSet: TDataSet;
begin
  Result := FQuery;
end;

destructor TModelQueryFiredac.Destroy;
begin
  FreeAndNil(FQuery);
  inherited;
end;

class function TModelQueryFiredac.New : iQuery;
begin
  Result := Self.Create;
end;

function TModelQueryFiredac.ExecuteSQL(SQL: String): iQuery;
begin
  FQuery.ExecSQL(SQL);
end;

function TModelQueryFiredac.ExecuteSQL(SQL: String; Params: array of Variant): iQuery;
begin
  FQuery.ExecSQL(SQL, Params);
end;

function TModelQueryFiredac.Open(SQL: String; Params: array of Variant): iQuery;
begin
  Result := Self;
  FQuery.Open(SQL, Params);
end;

function TModelQueryFiredac.Open(SQL: String): iQuery;
begin
  Result := Self;
  FQuery.Open(SQL);
end;

end.
