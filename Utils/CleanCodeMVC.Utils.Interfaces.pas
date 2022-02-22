unit CleanCodeMVC.Utils.Interfaces;

interface

uses
  Forms;

type
  iUtils = interface
    function GenerateGUUID : String;
    function ClearEdits(Form : TForm) : iUtils;
  end;

implementation

end.
