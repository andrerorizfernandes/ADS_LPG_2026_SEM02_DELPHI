unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ExtCtrls, Vcl.ComCtrls,
  Vcl.Imaging.jpeg;

type
  TfrmPrincipal = class(TForm)
    menPrincipal: TMainMenu;
    Cadastro1: TMenuItem;
    Sair1: TMenuItem;
    Aluno1: TMenuItem;
    stbRodape: TStatusBar;
    imgPrincipal: TImage;
    tmrPrincipal: TTimer;
    procedure tmrPrincipalTimer(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Aluno1Click(Sender: TObject);
  private
    FHoraLogin: TTime;

    procedure PreencherDadosDoRodape;
    procedure CapturarHoraDoLogin;
    function TempoLogadoNoSistema(const HoraDoLogin: TTime): TTime;
    procedure AbrirTelaAluno;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  System.SysUtils,
  uAluno;

{$R *.dfm}

procedure TfrmPrincipal.AbrirTelaAluno;
begin
  var lTelaAluno := TfrmAluno.Create(nil);
  try
    lTelaAluno.ShowModal;
  finally
    lTelaAluno.Free;
  end;
end;

procedure TfrmPrincipal.Aluno1Click(Sender: TObject);
begin
  AbrirTelaAluno;
end;

procedure TfrmPrincipal.CapturarHoraDoLogin;
begin
  FHoraLogin := Time;
end;

procedure TfrmPrincipal.PreencherDadosDoRodape;
begin
  const NOME_USUARIO = 'Andre Roriz Fernandes';

  stbRodape.Panels[0].Text := 'Data: ' + DateToStr(Date);
  stbRodape.Panels[1].Text := 'Hora: ' + TimeToStr(Time);
  stbRodape.Panels[2].Text := 'Tempo logado: ' +
    TimeToStr(TempoLogadoNoSistema(FHoraLogin));
  stbRodape.Panels[3].Text := 'Usuário logado: ' + NOME_USUARIO;
end;

function TfrmPrincipal.TempoLogadoNoSistema(const HoraDoLogin: TTime): TTime;
begin
  Result := (Time - HoraDoLogin);
end;

procedure TfrmPrincipal.FormActivate(Sender: TObject);
begin
  CapturarHoraDoLogin;
end;

procedure TfrmPrincipal.tmrPrincipalTimer(Sender: TObject);
begin
  PreencherDadosDoRodape;
end;
end.
