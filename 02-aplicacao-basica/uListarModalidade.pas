unit uListarModalidade;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, uLib;

type
  TfrmListarModalidade = class(TForm)
    dbgModalidade: TDBGrid;
    pnlRodape: TPanel;
    lblTotalizador: TLabel;
    btnExcluir: TBitBtn;
    btnEditar: TBitBtn;
    btnInserir: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure dbgModalidadeDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure dbgModalidadeDblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    procedure AbrirEstrutura;
    procedure FecharEstrutura;
    procedure ExcluirModalidade;
    procedure AbrirTelaModalidade(const Operacao: TOperacao);
    function ExisteTurmasVinculadas(const CodigoModalidade: Integer): Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.VCLUI.Wait, FireDAC.Comp.Client, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet, uDM, uModalidade;

{$R *.dfm}

procedure TfrmListarModalidade.AbrirEstrutura;
begin
  if (not DM.qryModalidade.Active) then
    DM.qryModalidade.Open;

  if (not DM.qryModalidade.Active) then
    DM.qryModalidade.Open;
end;

procedure TfrmListarModalidade.AbrirTelaModalidade(const Operacao: TOperacao);
begin
  var lTelaModalidade := TfrmModalidade.Create(nil);
  try
    lTelaModalidade.Operacao := Operacao;
    lTelaModalidade.ShowModal;
    AtualizarQuantidadeDeRegistros(DM.qryModalidade, lblTotalizador);
  finally
    lTelaModalidade.Free;
  end;
end;

procedure TfrmListarModalidade.btnExcluirClick(Sender: TObject);
begin
  if (not ExisteTurmasVinculadas(DM.qryModalidadeID.Value)) then
    ExcluirModalidade;
end;

procedure TfrmListarModalidade.btnEditarClick(Sender: TObject);
begin
  AbrirTelaModalidade(topEditar);
end;

procedure TfrmListarModalidade.btnInserirClick(Sender: TObject);
begin
  AbrirTelaModalidade(topInserir);
end;

procedure TfrmListarModalidade.dbgModalidadeDblClick(Sender: TObject);
begin
  AbrirTelaModalidade(topEditar);
end;

procedure TfrmListarModalidade.dbgModalidadeDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  ZebrarGrid(dbgModalidade, DM.qryModalidade, Rect, Column, State);
end;

procedure TfrmListarModalidade.ExcluirModalidade;
const
  MENSAGEM_CONFIRMACAO_EXCLUSAO = 'Deseja excluir a Modalidade "%s"?';
begin
  if (not DM.qryModalidade.Active) or DM.qryModalidade.IsEmpty then
    Exit;

  if (not Pergunta(Format(MENSAGEM_CONFIRMACAO_EXCLUSAO, [DM.qryModalidadeNOME.AsString]))) then
    Exit;

  DM.qryModalidade.Edit;
  DM.qryModalidadeEXCLUIDO.Value := True;
  DM.qryModalidade.Post;

  DM.qryModalidade.Refresh;
  AtualizarQuantidadeDeRegistros(DM.qryModalidade, lblTotalizador);
end;

procedure TfrmListarModalidade.FecharEstrutura;
begin
  DM.qryModalidade.Close;
  DM.qryModalidade.Close;
end;

procedure TfrmListarModalidade.FormActivate(Sender: TObject);
begin
  AbrirEstrutura;
  AjustarColunas(dbgModalidade);
  AtualizarQuantidadeDeRegistros(DM.qryModalidade, lblTotalizador);
end;

procedure TfrmListarModalidade.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FecharEstrutura;
end;

function TfrmListarModalidade.ExisteTurmasVinculadas(const CodigoModalidade: Integer): Boolean;
const
  SQL_PESQUISA_TURMA =
    'SELECT' +
    '  t.SIGLA,' +
    '  t.NOME ' +
    'FROM TURMA t ' +
    'WHERE t.IDMODALIDADE =:IDMODALIDADE AND t.EXCLUIDO = false';
begin
  Result := False;

  var lQuery := TFDQuery.Create(nil);
  try
    lQuery.Connection := DM.Conexao;
    lQuery.SQL.Add(SQL_PESQUISA_TURMA);
    lQuery.Params[0].Value := CodigoModalidade;

    try
      lQuery.Open;

      if (not lQuery.IsEmpty) then
      begin
        Alerta('Não é possível realizar a exclusão, pois existem ' + lQuery.RecordCount.ToString +
          ' turmas vinculadas.');
        Exit(True);
      end;
    except
      Erro('Falha ao realizar a exclusão, pois não foi possível verificar turmas relacionadas.');
      Exit(True);
    end;
  finally
    lQuery.Free;
  end;
end;
end.
