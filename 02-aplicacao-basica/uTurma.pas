unit uTurma;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.Mask, Vcl.DBCtrls, uDM, uLib;

type
  TfrmTurma = class(TForm)
    pnlTurma: TPanel;
    btnGravar: TBitBtn;
    btnCancelar: TBitBtn;
    lblNome: TLabel;
    lblRepresentante: TLabel;
    lblSigla: TLabel;
    lblAno: TLabel;
    dbeNome: TDBEdit;
    dbeRepresentante: TDBEdit;
    dbeSigla: TDBEdit;
    dbeAno: TDBEdit;
    dblModalidade: TDBLookupComboBox;
    lblModalidade: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    FOperacao: TOperacao;

    procedure PrepararAmbiente;
    procedure ValidarDados;
    procedure Gravar;
    procedure Cancelar;
    { Private declarations }
  public
    property Operacao: TOperacao write FOperacao;
    { Public declarations }
  end;

var
  frmTurma: TfrmTurma;

implementation

uses
  Data.DB;

{$R *.dfm}

procedure TfrmTurma.btnCancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure TfrmTurma.btnGravarClick(Sender: TObject);
begin
  ValidarDados;
  Gravar;
end;

procedure TfrmTurma.Cancelar;
begin
  DM.qryTurma.Cancel;
  Close;
end;

procedure TfrmTurma.FormActivate(Sender: TObject);
begin
  PrepararAmbiente;
end;

procedure TfrmTurma.Gravar;
const
  MENSAGEM_ERRO_GRAVACAO = 'Erro ao gravar dados. %s.';
begin
  try
    DM.qryTurma.Post;

    var Posicao := DM.qryTurma.RecNo;
    DM.qryTurma.Close;
    DM.qryTurma.Open;
    DM.qryTurma.RecNo := Posicao;
  except
    on E: Exception do
      Erro(Format(MENSAGEM_ERRO_GRAVACAO, [E.Message]));
  end;

  Close;
end;

procedure TfrmTurma.PrepararAmbiente;
begin
  case FOperacao of
    topInserir:
    begin
      DM.qryTurma.Append;
      Caption := 'Turma [Inserindo]';
    end;

    topEditar:
    begin
      DM.qryTurma.Edit;
      Caption := 'Turma [Editando]';
    end;
  end;

  dbeNome.SetFocus;
end;

procedure TfrmTurma.ValidarDados;
begin
  if Trim(dbeNome.Text).IsEmpty then
  begin
    Alerta('Informe o nome da turma.');
    dbeNome.SetFocus ;
    Abort;
  end;

  if Trim(dbeSigla.Text).IsEmpty then
  begin
    Alerta('Informe a sigla da turma.');
    dbeSigla.SetFocus ;
    Abort;
  end;

  if (Trim(dbeSigla.Text).Length <> 3) then
  begin
    Alerta('Informe uma sigla de turma com três caracteres.');
    dbeSigla.SetFocus ;
    Abort;
  end;

  if (not (DM.qryTurma.State in [dsInsert, dsEdit])) then
  begin
    Erro('Não foi possível definir se a operação é de inserção ou edição.');
    Abort;
  end;
end;
end.
