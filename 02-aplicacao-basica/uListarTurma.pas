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
  private
    procedure ListarTurmas;
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses
  uDM,
  uLib;

{$R *.dfm}

procedure TfrmListarTurma.FormActivate(Sender: TObject);
begin
  ListarTurmas;
end;

procedure TfrmListarTurma.ListarTurmas;
begin
  if (not DM.qryTurma.Active) then
  begin
    DM.qryTurma.Open;
    AjustarColunas(dbgTurma);
  end;
end;
end.
