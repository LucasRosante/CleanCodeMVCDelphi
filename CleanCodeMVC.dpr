program CleanCodeMVC;

uses
  Vcl.Forms,
  CleanCodeMVC.View.Main in 'View\CleanCodeMVC.View.Main.pas' {Form1},
  CleanCodeMVC.Model.Query.Firedac in 'Model\Query\CleanCodeMVC.Model.Query.Firedac.pas',
  CleanCodeMVC.Model.Query.Interfaces in 'Model\Query\CleanCodeMVC.Model.Query.Interfaces.pas',
  CleanCodeMVC.Model.Connection.Firedac in 'Model\Connection\CleanCodeMVC.Model.Connection.Firedac.pas',
  CleanCodeMVC.Model.Connection.Interfaces in 'Model\Connection\CleanCodeMVC.Model.Connection.Interfaces.pas',
  CleanCodeMVC.Model.Entity.Interfaces in 'Model\Entity\CleanCodeMVC.Model.Entity.Interfaces.pas',
  CleanCodeMVC.Model.Entity.User in 'Model\Entity\CleanCodeMVC.Model.Entity.User.pas',
  CleanCodeMVC.Model.DAO.Interfaces in 'Model\Dao\CleanCodeMVC.Model.DAO.Interfaces.pas',
  CleanCodeMVC.Controller.Entity in 'Controller\CleanCodeMVC.Controller.Entity.pas',
  CleanCodeMVC.Controller.Interfaces in 'Controller\CleanCodeMVC.Controller.Interfaces.pas',
  CleanCodeMVC.Utils in 'Utils\CleanCodeMVC.Utils.pas',
  CleanCodeMVC.Controller.Factory in 'Controller\CleanCodeMVC.Controller.Factory.pas',
  CleanCodeMVC.Utils.Interfaces in 'Utils\CleanCodeMVC.Utils.Interfaces.pas',
  CleanCodeMVC.Model.Exceptions.ValidateFieldForm in 'Model\Exceptions\CleanCodeMVC.Model.Exceptions.ValidateFieldForm.pas',
  CleanCodeMVC.Controller.Exceptions in 'Controller\CleanCodeMVC.Controller.Exceptions.pas',
  CleanCodeMVC.Model.DAO.User in 'Model\Dao\CleanCodeMVC.Model.DAO.User.pas';

{$R *.res}

begin
  {$WARN SYMBOL_PLATFORM OFF}
  ReportMemoryLeaksOnShutdown := DebugHook <> 0;
  {$WARN SYMBOL_PLATFORM ON}

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
