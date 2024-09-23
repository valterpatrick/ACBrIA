program ACBrIAv1;

uses
  Vcl.Forms,
  uFrmPrincipal in 'uFrmPrincipal.pas' {FrmPrincipal},
  ACBrIA in 'ACBrIA.pas',
  ACBrIAClass in 'ACBrIAClass.pas',
  ACBrOpenAI in 'ACBrOpenAI.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.Run;
end.

