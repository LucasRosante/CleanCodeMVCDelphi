unit CleanCodeMVC.Model.DAO.User;

interface

uses
  Data.DB,
  CleanCodeMVC.Model.Query.Interfaces,
  CleanCodeMVC.Model.DAO.Interfaces;

type
  TModelDAOUser<T : IInterface> = class(TInterfacedObject, iEntityDAO<T>)
  private
    [Weak]
    FParent : T;
    FQuery: iQuery;
  public
    constructor Create(Parent : T);
    destructor Destroy; override;
    class function New(Parent : T) : iEntityDAO<T>;
    function &End : T;
    function All(DataSource : TDataSource) : iEntityDAO<T>;
    function Find(GUUID : String) : iEntityDAO<T>;
    function FindBy(FieldName : String; Value : String) : iEntityDAO<T>;
    function Insert : iEntityDAO<T>;
    function Update : iEntityDAO<T>;
    function Delete(GUUID : String) : iEntityDAO<T>;
  end;

implementation

uses
  System.SysUtils,
  CleanCodeMVC.Model.Entity.Interfaces,
  CleanCodeMVC.Controller.Factory;

{ TModelDAOUser }

constructor TModelDAOUser<T>.Create(Parent : T);
begin
  FParent := Parent;
  FQuery := TControllerFactory.New.Query;
end;

destructor TModelDAOUser<T>.Destroy;
begin

  inherited;
end;

class function TModelDAOUser<T>.New(Parent : T) : iEntityDAO<T>;
begin
  Result := Self.Create(Parent);
end;

function TModelDAOUser<T>.&End: T;
begin
  Result := FParent;
end;

function TModelDAOUser<T>.All(DataSource: TDataSource): iEntityDAO<T>;
begin
  Result := Self;
  FQuery.Open('SELECT * FROM USERS');
  DataSource.DataSet := FQuery.DataSet;
end;

function TModelDAOUser<T>.Find(GUUID: String): iEntityDAO<T>;
begin
  Result := Self;
  FQuery.Open('SELECT FIRST 1 * FROM USERS WHERE GUUID = :GUUID', [GUUID]);

  iEntityUser(FParent).GUUID(FQuery.DataSet.FieldByName('GUUID').AsString);
  iEntityUser(FParent).UserName(FQuery.DataSet.FieldByName('USER_NAME').AsString);
  iEntityUser(FParent).Email(FQuery.DataSet.FieldByName('EMAIL').AsString);
  iEntityUser(FParent).Password(FQuery.DataSet.FieldByName('PASSWORD').AsString);
end;

function TModelDAOUser<T>.FindBy(FieldName, Value: String): iEntityDAO<T>;
begin
  Result := Self;
  FQuery.Open('SELECT * FROM USERS WHERE  '+FieldName+' = :'+FieldName, [Value]);
end;

function TModelDAOUser<T>.Insert: iEntityDAO<T>;
begin
  Result := Self;
  FQuery.ExecuteSQL('INSERT INTO USERS (GUUID,USER_NAME,EMAIL,PASSWORD) '+
                    'VALUES (:GUUID,:USER_NAME,:EMAIL,:PASSWORD)',
                    [TControllerFactory.New.Util.GenerateGUUID,
                     iEntityUser(FParent).UserName,
                     iEntityUser(FParent).Email,
                     iEntityUser(FParent).Password]);
end;

function TModelDAOUser<T>.Update: iEntityDAO<T>;
begin
  Result := Self;
  FQuery.ExecuteSQL(
    'UPDATE USERS SET '+
    'USER_NAME = :USER_NAME, EMAIL = :EMAIL, PASSWORD = :PASSWORD '+
    'WHERE GUUID = :GUUID',
    [iEntityUser(FParent).UserName,
     iEntityUser(FParent).Email,
     iEntityUser(FParent).Password,
     iEntityUser(FParent).GUUID]);
end;

function TModelDAOUser<T>.Delete(GUUID: String): iEntityDAO<T>;
begin
  Result := Self;
  FQuery.ExecuteSQL('DELETE FROM USERS WHERE GUUID = :GUUID', [GUUID]);
end;

end.
