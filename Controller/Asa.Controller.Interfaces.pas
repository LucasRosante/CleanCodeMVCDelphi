unit Asa.Controller.Interfaces;

interface

uses
  Asa.Model.Entity.Interfaces,
  Asa.Model.Query.Interfaces,
  Asa.Model.Connection.Interfaces,
  Asa.Utils.Interfaces,
  Asa.Model.Exceptions.ValidateFieldForm;

type
  iControllerEntity = interface
    ['{DA0A52A7-FE32-4639-95D4-10888F04FD9B}']
    function USER : iEntityUser;
  end;

  iControllerFactory = interface
    ['{47D7787D-039A-4659-95BB-6E9A4B8B018C}']
    function Connection : iConnection;
    function Query : iQuery;
    function Util : iUtils;
    function ExceptionValidateFieldsForm(Field, MessageError : String): TValidateFieldsForm;
  end;

  iControllerExceptions = interface
    ['{E30B8828-32CE-4B46-B762-D95023242898}']
  end;

implementation

end.
