unit uModalidade;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.Mask, Vcl.DBCtrls, uDM, uLib;

type
  TfrmModalidade = class(TForm)
    pnlModalidade: TPanel;
    btnGravar: TBitBtn;
    btnCancelar: TBitBtn;
    lblNome: TLabel;
    dbeNome: TDBEdit;
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
  frmModalidade: TfrmModalidade;

implementation

uses
  Data.DB;

{$R *.dfm}

procedure TfrmModalidade.btnCancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure TfrmModalidade.btnGravarClick(Sender: TObject);
begin
  ValidarDados;
  Gravar;
end;

procedure TfrmModalidade.Cancelar;
begin
  DM.qryModalidade.Cancel;
  Close;
end;

procedure TfrmModalidade.FormActivate(Sender: TObject);
begin
  PrepararAmbiente;
end;

procedure TfrmModalidade.Gravar;
const
  MENSAGEM_ERRO_GRAVACAO = 'Erro ao gravar dados. %s.';
begin
  try
    DM.qryModalidade.Post;

    var Posicao := DM.qryModalidade.RecNo;
    DM.qryModalidade.Close;
    DM.qryModalidade.Open;
    DM.qryModalidade.RecNo := Posicao;
  except
    on E: Exception do
      Erro(Format(MENSAGEM_ERRO_GRAVACAO, [E.Message]));
  end;

  Close;
end;

procedure TfrmModalidade.PrepararAmbiente;
begin
  case FOperacao of
    topInserir:
    begin
      DM.qryModalidade.Append;
      Caption := 'Modalidade [Inserindo]';
    end;

    topEditar:
    begin
      DM.qryModalidade.Edit;
      Caption := 'Modalidade [Editando]';
    end;
  end;

  dbeNome.SetFocus;
end;

procedure TfrmModalidade.ValidarDados;
begin
  if Trim(dbeNome.Text).IsEmpty then
  begin
    Alerta('Informe o nome da Modalidade.');
    dbeNome.SetFocus ;
    Abort;
  end;
end;
end.
