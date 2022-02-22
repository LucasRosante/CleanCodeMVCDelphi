unit CleanCodeMVC.Model.Connection.Interfaces;

interface

uses
  Data.DB;

type
  iConnection = interface
  ['{B210AC32-7BD6-4882-B615-288927B5CB82}']
    function Connection : TCustomConnection;
  end;

implementation

end.
