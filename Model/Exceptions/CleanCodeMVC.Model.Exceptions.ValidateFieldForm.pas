unit CleanCodeMVC.Model.Exceptions.ValidateFieldForm;

interface

uses
  System.SysUtils;

type
  TValidateFieldsForm = class(Exception)
    private
      FField : String;
      FMessageError : String;
    public
      constructor Create(Field, MessageError : String);
      function Field : String;
      function MessageError : String;
  end;

implementation

{ TValidateFieldsForm }

constructor TValidateFieldsForm.Create(Field, MessageError: String);
begin
  FField := Field;
  FMessageError := MessageError;
end;

function TValidateFieldsForm.Field: String;
begin
  Result := FField;
end;

function TValidateFieldsForm.MessageError: String;
begin
  Result := FMessageError;
end;

end.
