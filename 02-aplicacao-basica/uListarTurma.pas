unit uListarTurma;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.Buttons;

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
  private
    procedure ListarTurmas;
    procedure ExcluirTurma;
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses
  uDM,
  uLib;

{$R *.dfm}

procedure TfrmListarTurma.btnExcluirClick(Sender: TObject);
begin
  ExcluirTurma;
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
