unit uLib;

interface

uses
  DBClient, System.SysUtils;

function RecuperarCaminhoCompletoDoXml(const DataSet: TClientDataSet): string;
procedure SalvarDadosClientDataSet(const DataSet: TClientDataSet);
procedure RecuperarDadosDoXmlParaClientDataSet(const DataSet: TClientDataSet; const CaminhoXml: string);

implementation

function RecuperarCaminhoCompletoDoXml(const DataSet: TClientDataSet): string;
const
  DIRETORIO_DADOS = 'Dados\';
  EXTENSAO_XML = '.xml';
begin
  var lCaminhoArquivoDeDados := ExtractFilePath(ParamStr(0)) + DIRETORIO_DADOS;
  ForceDirectories(lCaminhoArquivoDeDados);
  Result := lCaminhoArquivoDeDados + DataSet.Name + EXTENSAO_XML
end;

procedure SalvarDadosClientDataSet(const DataSet: TClientDataSet);
begin
  if (not Assigned(DataSet)) then
    Exit;

  if (not DataSet.Active) then
    Exit;

  if DataSet.IsEmpty then
    Exit;

  DataSet.SaveToFile(
    RecuperarCaminhoCompletoDoXml(DataSet),
    dfXMLUTF8);
end;

procedure RecuperarDadosDoXmlParaClientDataSet(const DataSet: TClientDataSet; const CaminhoXml: string);
begin
  if (not Assigned(DataSet)) then
    Exit;

  if (not DataSet.Active) then
    Exit;

  if CaminhoXml.Trim.IsEmpty then
    Exit;

  if (not FileExists(CaminhoXml)) then
    Exit;

  DataSet.EmptyDataSet;
  DataSet.LoadFromFile(CaminhoXml);
end;
end.
