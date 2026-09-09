unit uAluno;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.Buttons, Vcl.StdCtrls,
  Vcl.ExtCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, uDM, Vcl.Menus;

type
  TfrmAluno = class(TForm)
    pgcAluno: TPageControl;
    tbsCadastro: TTabSheet;
    tbsResultado: TTabSheet;
    btnGravar: TSpeedButton;
    lblMatricula: TLabel;
    edtMatricula: TEdit;
    edtNome: TEdit;
    lblNome: TLabel;
    lblCpf: TLabel;
    edtCpf: TEdit;
    lblSexo: TLabel;
    cboSexo: TComboBox;
    lblEndereco: TLabel;
    edtEndereco: TEdit;
    lblNumero: TLabel;
    edtNumero: TEdit;
    lblComplemento: TLabel;
    edtComplemento: TEdit;
    edtBairro: TEdit;
    lblBairro: TLabel;
    edtMunicipio: TEdit;
    lblMunicipio: TLabel;
    lblUf: TLabel;
    cboUf: TComboBox;
    lblObservacoes: TLabel;
    memObservacoes: TMemo;
    rdgEstadoCivil: TRadioGroup;
    dbgResultado: TDBGrid;
    popResultado: TPopupMenu;
    Excluiraluno1: TMenuItem;
    lblTotalAlunos: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tbsCadastroShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tbsResultadoShow(Sender: TObject);
    procedure Excluiraluno1Click(Sender: TObject);
  private
    procedure PrepararAmbiente;
    procedure EncerrarAmbiente;
    procedure CadastrarAluno;
    procedure LimparCampos;
    procedure CriarEstruturaDeDados;
    procedure PrepararParaInserirNovoAluno;
    procedure PrepararParaVisualizarResultados;
    procedure ExcluirAluno;
    procedure TotalizadorDeAlunos;

    function ValidarCamposObrigatorios: Boolean;
    function RetornarSexoSelecionado(const IndiceSelecionado: Integer): string;
    function RetornarEstadoCivilSelecionado(const IndiceSelecionado: Integer): string;
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TfrmAluno.btnGravarClick(Sender: TObject);
begin
  if ValidarCamposObrigatorios then
    CadastrarAluno;
end;

procedure TfrmAluno.CadastrarAluno;
begin
  try
    DM.cdsAlunoMatricula.AsInteger := StrToInt(edtMatricula.Text);
    DM.cdsAlunoNome.AsString := edtNome.Text;
    DM.cdsAlunoCpf.AsString := edtCpf.Text;
    DM.cdsAlunoSexo.AsString := RetornarSexoSelecionado(cboSexo.ItemIndex);
    DM.cdsAlunoEndereco.AsString := edtEndereco.Text;
    DM.cdsAlunoNumero.AsString := edtNumero.Text;
    DM.cdsAlunoComplemento.AsString := edtComplemento.Text;
    DM.cdsAlunoBairro.AsString := edtBairro.Text;
    DM.cdsAlunoMunicipio.AsString := edtMunicipio.Text;
    DM.cdsAlunoUf.AsString := cboUf.Text;
    DM.cdsAlunoEstadoCivil.AsString := RetornarEstadoCivilSelecionado(rdgEstadoCivil.ItemIndex);
    DM.cdsAlunoObservacoes.AsString := memObservacoes.Text;

    DM.cdsAluno.Post;
  except
    on E: Exception do
      ShowMessage('Ocorreu um erro ao gravar os dados.' + sLineBreak +
        'Erro original: ' + E.Message);
  end;

  tbsResultado.TabVisible := True;
  pgcAluno.ActivePage := tbsResultado;
  TotalizadorDeAlunos;
  LimparCampos;
end;

procedure TfrmAluno.CriarEstruturaDeDados;
begin
  if (not DM.cdsAluno.Active) then
    DM.cdsAluno.CreateDataSet;

  DM.cdsAluno.Open;
end;

procedure TfrmAluno.EncerrarAmbiente;
begin
  DM.cdsAluno.Close;
end;

procedure TfrmAluno.ExcluirAluno;
begin
  if (not DM.cdsAluno.Active) then
    Exit;

  if (DM.cdsAluno.IsEmpty) then
    Exit;

  DM.cdsAluno.Delete;
  TotalizadorDeAlunos;
end;

procedure TfrmAluno.Excluiraluno1Click(Sender: TObject);
begin
  ExcluirAluno;
end;

procedure TfrmAluno.FormActivate(Sender: TObject);
begin
  PrepararAmbiente;
end;

procedure TfrmAluno.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  EncerrarAmbiente;
end;

procedure TfrmAluno.FormCreate(Sender: TObject);
begin
  CriarEstruturaDeDados;
end;

procedure TfrmAluno.LimparCampos;
begin
  edtMatricula.Text := EmptyStr;
  edtNome.Text := EmptyStr;
  edtCpf.Text := EmptyStr;
  cboSexo.ItemIndex := -1;
  edtEndereco.Text := EmptyStr;
  edtNumero.Text := EmptyStr;
  edtComplemento.Text := EmptyStr;
  edtBairro.Text := EmptyStr;
  edtMunicipio.Text := EmptyStr;
  cboUf.ItemIndex := -1;
  rdgEstadoCivil.ItemIndex := -1;
  memObservacoes.Clear;
end;

procedure TfrmAluno.PrepararAmbiente;
begin
  tbsResultado.TabVisible := False;
  tbsCadastro.SetFocus;
  edtMatricula.SetFocus;
end;

procedure TfrmAluno.PrepararParaInserirNovoAluno;
begin
  if (not DM.cdsAluno.Active) then
    Exit;

  if (DM.cdsAluno.State = dsInsert) then
    Exit;

  DM.cdsAluno.Append;

  btnGravar.Enabled := True;

  Caption := 'Cadastrar novo aluno';
end;

procedure TfrmAluno.PrepararParaVisualizarResultados;
begin
  if (DM.cdsAluno.State = dsInsert) then
    DM.cdsAluno.Cancel;

  btnGravar.Enabled := False;

  LimparCampos;
  Caption := 'Alunos';
end;

function TfrmAluno.RetornarEstadoCivilSelecionado(
  const IndiceSelecionado: Integer): string;
begin
  Result := EmptyStr;
  case IndiceSelecionado of
    0: Exit('C');
    1: Exit('D');
    2: Exit('J');
    3: Exit('S');
    4: Exit('U');
    5: Exit('V');
  end;
end;

function TfrmAluno.RetornarSexoSelecionado(
  const IndiceSelecionado: Integer): string;
begin
  Result := EmptyStr;
  case IndiceSelecionado of
    0: Exit('F');
    1: Exit('M');
    2: Exit('N');
  end;
end;

procedure TfrmAluno.tbsCadastroShow(Sender: TObject);
begin
  PrepararParaInserirNovoAluno;
end;

procedure TfrmAluno.tbsResultadoShow(Sender: TObject);
begin
  PrepararParaVisualizarResultados;
end;

procedure TfrmAluno.TotalizadorDeAlunos;
begin
  if (not DM.cdsAluno.Active) then
    Exit;

  var lInformacao := DM.cdsAluno.RecordCount.ToString + ' Alunos ';
  if (DM.cdsAluno.RecordCount = 1) then
    lInformacao := DM.cdsAluno.RecordCount.ToString + ' Aluno ';

  lblTotalAlunos.Caption := lInformacao;
end;

function TfrmAluno.ValidarCamposObrigatorios: Boolean;
begin
  if Trim(edtMatricula.Text).IsEmpty then
  begin
    ShowMessage('Informe a matrícula.');
    edtMatricula.SetFocus;
    Exit(False);
  end;

  if Trim(edtNome.Text).IsEmpty then
  begin
    ShowMessage('Informe o nome.');
    edtNome.SetFocus;
    Exit(False);
  end;

  if Trim(edtCpf.Text).IsEmpty then
  begin
    ShowMessage('Informe o cpf.');
    edtCpf.SetFocus;
    Exit(False);
  end;

  if Trim(edtEndereco.Text).IsEmpty then
  begin
    ShowMessage('Informe o endereço.');
    edtEndereco.SetFocus;
    Exit(False);
  end;

  if Trim(edtMunicipio.Text).IsEmpty then
  begin
    ShowMessage('Informe o município.');
    edtMunicipio.SetFocus;
    Exit(False);
  end;

  if (cboUf.ItemIndex = -1) then
  begin
    ShowMessage('Selecione a Uf.');
    cboUf.SetFocus;
    Exit(False);
  end;

  Result := True;
end;
end.
