unit uDM;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Datasnap.DBClient,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.VCLUI.Wait, FireDAC.Comp.Client, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet;

type
  TDM = class(TDataModule)
    dsrAluno: TDataSource;
    Conexao: TFDConnection;
    qryAluno: TFDQuery;
    qryAlunoID: TIntegerField;
    qryAlunoMATRICULA: TIntegerField;
    qryAlunoNOME: TStringField;
    qryAlunoCPF: TStringField;
    qryAlunoSEXO: TStringField;
    qryAlunoENDERECO: TStringField;
    qryAlunoNUMERO: TStringField;
    qryAlunoCOMPLEMENTO: TStringField;
    qryAlunoBAIRRO: TStringField;
    qryAlunoMUNICIPIO: TStringField;
    qryAlunoUF: TStringField;
    qryAlunoESTADOCIVIL: TStringField;
    qryAlunoOBSERVACOES: TStringField;
    qryTurma: TFDQuery;
    dsrTurma: TDataSource;
    qryTurmaID: TIntegerField;
    qryTurmaNOME: TStringField;
    qryTurmaSIGLA: TStringField;
    qryTurmaREPRESENTANTE: TStringField;
    qryTurmaANO: TIntegerField;
    qryTurmaDATAHORA: TSQLTimeStampField;
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
