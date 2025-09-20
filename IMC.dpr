program IMC;

uses
  Vcl.Forms,
  frmPrincipal in 'frmPrincipal.pas' {formCalculoIMC},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Windows10');
  Application.Title := 'IMC - Calculadora';
  Application.CreateForm(TformCalculoIMC, formCalculoIMC);
  Application.Run;
end.
