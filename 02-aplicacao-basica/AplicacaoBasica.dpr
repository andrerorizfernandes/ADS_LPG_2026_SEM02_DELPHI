program AplicacaoBasica;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {frmPrincipal},
  uAluno in 'uAluno.pas' {frmAluno},
  uDM in 'uDM.pas' {DM: TDataModule},
  uLib in 'uLib.pas',
  uListarTurma in 'uListarTurma.pas' {frmListarTurma},
  uTurma in 'uTurma.pas' {frmTurma},
  uListarModalidade in 'uListarModalidade.pas' {frmListarModalidade},
  uModalidade in 'uModalidade.pas' {frmModalidade};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
