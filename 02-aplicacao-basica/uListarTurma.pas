unit uListarTurma;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, uLib;

type
  TfrmListarTurma = class(TForm)
    dbgTurma: TDBGrid;
    pnlRodape: TPanel;
    lblTotalizador: TLabel;
    btnExcluir: TBitBtn;
    btnEditar: TBitBtn;
    btnInserir: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure dbgTurmaDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure dbgTurmaDblClick(Sender: TObject);
  private
    procedure ListarTurmas;
    procedure ExcluirTurma;
    procedure AbrirTelaTurma(const Operacao: TOperacao);
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses
  uDM,
  uTurma;

{$R *.dfm}

procedure TfrmListarTurma.AbrirTelaTurma(const Operacao: TOperacao);
begin
  var lTelaTurma := TfrmTurma.Create(nil);
  try
    lTelaTurma.Operacao := Operacao;
    lTelaTurma.ShowModal;
  finally
    lTelaTurma.Free;
  end;
end;

procedure TfrmListarTurma.btnExcluirClick(Sender: TObject);
begin
  ExcluirTurma;
end;

procedure TfrmListarTurma.btnEditarClick(Sender: TObject);
begin
  AbrirTelaTurma(topEditar);
end;

procedure TfrmListarTurma.btnInserirClick(Sender: TObject);
begin
  AbrirTelaTurma(topInserir);
end;

procedure TfrmListarTurma.dbgTurmaDblClick(Sender: TObject);
begin
  AbrirTelaTurma(topEditar);
end;

procedure TfrmListarTurma.dbgTurmaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  ZebrarGrid(dbgTurma, DM.qryTurma, Rect, Column, State);
end;

procedure TfrmListarTurma.ExcluirTurma;
const
  MENSAGEM_CONFIRMACAO_EXCLUSAO = 'Deseja excluir a turma "%s"?';
begin
  if (not DM.qryTurma.Active) or DM.qryTurma.IsEmpty then
    Exit;

  if (not Pergunta(Format(MENSAGEM_CONFIRMACAO_EXCLUSAO, [DM.qryTurmaNOME.AsString]))) then
    Exit;

  DM.qryTurma.Edit;
  DM.qryTurmaEXCLUIDO.Value := True;
  DM.qryTurma.Post;

  DM.qryTurma.Refresh;
  AtualizarQuantidadeDeRegistros(DM.qryTurma, lblTotalizador);
end;

procedure TfrmListarTurma.FormActivate(Sender: TObject);
begin
  ListarTurmas;
  AjustarColunas(dbgTurma);
  AtualizarQuantidadeDeRegistros(DM.qryTurma, lblTotalizador);
end;

procedure TfrmListarTurma.ListarTurmas;
begin
  if (not DM.qryTurma.Active) then
    DM.qryTurma.Open;
end;
end.
