unit CleanCodeMVC.Model.Entity.User;

interface

uses
  Data.DB,
  CleanCodeMVC.Model.Query.Interfaces,
  CleanCodeMVC.Model.DAO.Interfaces,
  CleanCodeMVC.Model.Entity.Interfaces;

type
  TModelEntityUser = class(TInterfacedObject, iEntityUser)
  private
    FDAO : iEntityDAO<iEntityUser>;
    FGUUID: String;
    FUserName: String;
    FEmail: String;
    FPassword: String;
  public
    constructor Create;
    destructor Destroy; override;
    class function New : iEntityUser;
    function DAO : iEntityDAO<iEntityUser>;
    function GUUID : String; overload;
    function GUUID(Value : String) : iEntityUser; overload;
    function UserName : String; overload;
    function UserName(Value : String) : iEntityUser; overload;
    function Email : String; overload;
    function Email(Value : String) : iEntityUser; overload;
    function Password : String; overload;
    function Password(Value : String) : iEntityUser; overload;
  end;

implementation

{ TModelEntityUser }

uses
  System.SysUtils,
  CleanCodeMVC.Model.DAO.User,
  CleanCodeMVC.Controller.Factory;

constructor TModelEntityUser.Create;
begin
  FDAO := TModelDAOUser<iEntityUser>.New(Self);
end;

function TModelEntityUser.DAO: iEntityDao<iEntityUser>;
begin
  Result := FDAO;
end;

destructor TModelEntityUser.Destroy;
begin
  inherited;
end;

class function TModelEntityUser.New : iEntityUser;
begin
  Result := Self.Create;
end;

function TModelEntityUser.GUUID(Value: String): iEntityUser;
begin
  Result := Self;
  FGUUID := Value;
end;

function TModelEntityUser.GUUID: String;
begin
  Result := FGUUID;
end;

function TModelEntityUser.UserName: String;
begin
  Result := FUserName;
end;

function TModelEntityUser.UserName(Value: String): iEntityUser;
begin
  Result := Self;

  if Value.Trim.IsEmpty then
    raise TControllerFactory
            .New
            .ExceptionValidateFieldsForm('UserName',
                                         'É necessário informar o nome de usuário!');
  FUserName := Value.Trim;
end;

function TModelEntityUser.Email: String;
begin
  Result := FEmail;
end;

function TModelEntityUser.Email(Value: String): iEntityUser;
begin
  Result := Self;

  if Value.Trim.IsEmpty then
    raise TControllerFactory
            .New
            .ExceptionValidateFieldsForm('Email',
                                         'É necessário informar o email!');
  FEmail := Value.Trim;
end;

function TModelEntityUser.Password: String;
begin
  Result := FPassword;
end;

function TModelEntityUser.Password(Value: String): iEntityUser;
begin
  Result := Self;

  if Value.Trim.IsEmpty then
    raise TControllerFactory
            .New
            .ExceptionValidateFieldsForm('Password',
                                         'É necessário informar a senha!');
  FPassword := Value.Trim;
end;

end.
