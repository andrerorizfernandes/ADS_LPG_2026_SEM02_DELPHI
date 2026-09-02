unit uDM;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Datasnap.DBClient;

type
  TDM = class(TDataModule)
    cdsAluno: TClientDataSet;
    dsrAluno: TDataSource;
    cdsAlunoMatricula: TIntegerField;
    cdsAlunoNome: TStringField;
    cdsAlunoCpf: TStringField;
    cdsAlunoSexo: TStringField;
    cdsAlunoEndereco: TStringField;
    cdsAlunoNumero: TStringField;
    cdsAlunoComplemento: TStringField;
    cdsAlunoBairro: TStringField;
    cdsAlunoMunicipio: TStringField;
    cdsAlunoUf: TStringField;
    cdsAlunoEstadoCivil: TStringField;
    cdsAlunoObservacoes: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
