unit uAluno;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.Buttons, Vcl.StdCtrls,
  Vcl.ExtCtrls;

type
  TfrmAluno = class(TForm)
    pgcAluno: TPageControl;
    tbsCadastro: TTabSheet;
    tbsResultado: TTabSheet;
    btnGravar: TSpeedButton;
    btnCancelar: TSpeedButton;
    memResultado: TMemo;
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
    procedure FormActivate(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
  private
    procedure PrepararAmbiente;
    procedure CadastrarAluno;
    function ValidarCamposObrigatorios: Boolean;
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
  tbsResultado.TabVisible := True;

  memResultado.Clear;
  memResultado.Lines.Add('Dados cadastrados:');
  memResultado.Lines.Add('');

  memResultado.Lines.Add('Matrícula: ' + edtMatricula.Text);
  memResultado.Lines.Add('Nome: ' + edtNome.Text);
  memResultado.Lines.Add('Cpf: ' + edtCpf.Text);
  memResultado.Lines.Add('Sexo: ' + cboSexo.Text);
  memResultado.Lines.Add('Endereço: ' + edtEndereco.Text);
  memResultado.Lines.Add('Número: ' + edtNumero.Text);
  memResultado.Lines.Add('Complemento: ' + edtComplemento.Text);
  memResultado.Lines.Add('Bairro: ' + edtBairro.Text);
  memResultado.Lines.Add('Município: ' + edtMunicipio.Text);
  memResultado.Lines.Add('Uf: ' + cboUf.Text);
  memResultado.Lines.Add('Observações: ' + memObservacoes.Text);

  pgcAluno.ActivePage := tbsResultado;
  Caption := 'Aluno';
  ShowMessage('Cadastro concluído com sucesso.');
end;

procedure TfrmAluno.FormActivate(Sender: TObject);
begin
  PrepararAmbiente;
end;

procedure TfrmAluno.PrepararAmbiente;
begin
  Caption := 'Cadastrar novo aluno';
  tbsResultado.TabVisible := False;
  tbsCadastro.SetFocus;
  edtMatricula.SetFocus;
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
