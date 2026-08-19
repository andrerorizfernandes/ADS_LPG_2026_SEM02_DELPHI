unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmPrincipal = class(TForm)
    btnApresentacao: TButton;
    lblTesteDuploClique: TLabel;
    edtTesteTecla: TEdit;
    procedure btnApresentacaoClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure lblTesteDuploCliqueDblClick(Sender: TObject);
    procedure edtTesteTeclaKeyPress(Sender: TObject; var Key: Char);
    procedure btnApresentacaoMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.btnApresentacaoClick(Sender: TObject);
begin
  ShowMessage('Olá mundo!');
end;

procedure TfrmPrincipal.btnApresentacaoMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  Caption := 'Verifique seu dados cadastrais antes de confirmar';
end;

procedure TfrmPrincipal.edtTesteTeclaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    ShowMessage('O aluno ' + edtTesteTecla.Text + ' foi cadastrado com sucesso.');
end;

procedure TfrmPrincipal.FormActivate(Sender: TObject);
begin
  ShowMessage('Boa noite meu nome é Andre');
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ShowMessage('Obrigado por utilizar');
end;

procedure TfrmPrincipal.lblTesteDuploCliqueDblClick(Sender: TObject);
begin
  ShowMessage('Validação concluída');
end;

end.
