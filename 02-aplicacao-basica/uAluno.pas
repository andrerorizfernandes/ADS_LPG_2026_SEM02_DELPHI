unit uAluno;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.Buttons, Vcl.StdCtrls;

type
  TfrmAluno = class(TForm)
    pgcAluno: TPageControl;
    tbsCadastro: TTabSheet;
    tbsResultado: TTabSheet;
    btnGravar: TSpeedButton;
    btnCancelar: TSpeedButton;
    memResultado: TMemo;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
