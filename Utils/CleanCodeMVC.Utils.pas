unit CleanCodeMVC.Utils;

interface

uses
  CleanCodeMVC.Utils.Interfaces,
  Forms;

type
  TUtils = class(TInterfacedObject, iUtils)
  private
  public
    constructor Create;
    destructor Destroy; override;
    class function New : iUtils;
    function GenerateGUUID : String;
    function ClearEdits(Form : TForm) : iUtils;
  end;

implementation

uses
  System.SysUtils,
  Vcl.StdCtrls;

{ TUtils }

function TUtils.ClearEdits(Form : TForm) : iUtils;
var
  I : Integer;
begin
  Result := Self;

  for I := 0 to Form.ComponentCount -1 do
    if Form.Components[I] is TEdit then
      TEdit(Form.Components[I]).Clear;
end;

constructor TUtils.Create;
begin

end;

destructor TUtils.Destroy;
begin

  inherited;
end;

class function TUtils.New : iUtils;
begin
  Result := Self.Create;
end;

function TUtils.GenerateGUUID: String;
begin
  Result := TGUID.NewGuid.ToString
              .Replace('{','',[rfReplaceAll])
              .Replace('}','',[rfReplaceAll]);
end;

end.
