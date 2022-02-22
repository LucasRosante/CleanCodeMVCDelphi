unit CleanCodeMVC.Model.Query.Interfaces;

interface

uses
  Data.DB;

type
  iQuery = interface
    ['{E607C25E-4D1D-4835-9EED-D5AA0DC322FF}']
    function DataSet : TDataSet;
    function Open(SQL : String) : iQuery; overload;
    function Open(SQL : String; Params : array of Variant) : iQuery; overload;
    function ExecuteSQL(SQL : String; Params : array of Variant) : iQuery; overload;
    function ExecuteSQL(SQL : String) : iQuery; overload;
  end;

implementation

end.
