unit uLib;

interface

uses
  DBClient, System.SysUtils, Vcl.DBGrids, Data.DB, Winapi.Windows, Vcl.Grids,
  Vcl.Graphics;

procedure Alerta(Mensagem: string);
procedure Informacao(Mensagem: string);
procedure Erro(Mensagem: string);
function Pergunta(Pergunta: string): Boolean;
function RecuperarCaminhoCompletoDoXml(const DataSet: TClientDataSet): string;
procedure SalvarDadosClientDataSetParaXml(const DataSet: TClientDataSet);
procedure RecuperarDadosDoXmlParaClientDataSet(const DataSet: TClientDataSet; const CaminhoXml: string);
procedure AjustarColunas(Grid: TDBGrid);
procedure ZebrarGrid(Sender, DataSet: TObject; Rect: TRect; Column: TColumn; State: TGridDrawState);
function RemoveCaracter(Texto: string): string;
function ValidarCPFCNPJ(CpfCnpj: string): Boolean;
function ValidarCNPJ(CpfCnpj : string): Boolean;
Function ValidarCPF(numero: string): Boolean;

implementation

uses
  Vcl.Forms;

const
  NOME_SISTEMA = 'AplicacaoBasica';

procedure Alerta(Mensagem: string);
begin
  Application.MessageBox(PChar(Mensagem), PWideChar(NOME_SISTEMA), MB_ICONWARNING);
end;

Procedure Informacao(Mensagem: string);
begin
  Application.MessageBox(PChar(Mensagem), PWideChar(NOME_SISTEMA), MB_ICONINFORMATION);
end;

procedure Erro(Mensagem: string);
begin
  Application.MessageBox(Pchar(Mensagem), PWideChar(NOME_SISTEMA), mb_Ok + MB_ICONERROR);
end;

function Pergunta(Pergunta: string): Boolean;
begin
  if (Application.MessageBox(PChar(Pergunta), PWideChar(NOME_SISTEMA), MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2) = IDYES) then
    Exit(True);

  Result := False;
end;

function RecuperarCaminhoCompletoDoXml(const DataSet: TClientDataSet): string;
const
  DIRETORIO_DADOS = 'Dados\';
  EXTENSAO_XML = '.xml';
begin
  var lCaminhoArquivoDeDados := ExtractFilePath(ParamStr(0)) + DIRETORIO_DADOS;
  ForceDirectories(lCaminhoArquivoDeDados);
  Result := lCaminhoArquivoDeDados + DataSet.Name + EXTENSAO_XML
end;

procedure SalvarDadosClientDataSetParaXml(const DataSet: TClientDataSet);
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

procedure AjustarColunas(Grid: TDBGrid);
const
  MENSAGEM_ERRO_COLUNAS = 'Erro de colunas no DBGrid';
begin
  try
    var DataSet := Grid.DataSource.DataSet;

    if (not DataSet.Active) then
      Exit;

    if (DataSet.State <> dsBrowse) then
      Exit;

    var Posicao := DataSet.RecNo;

    if (DataSet.RecordCount = 0) then
      begin
        for var I := 0 to (Grid.Columns.Count - 1) do
          Grid.Columns[I].Width := 100;
      end
    else
      begin
        var Tamanhos: array of Integer;
        SetLength(Tamanhos, Grid.Columns.Count);
        for var I := 0 to (Grid.Columns.Count - 1) do
          if Grid.Columns[I].Visible then
            Tamanhos[I]:= Grid.Canvas.TextWidth(Grid.Columns[I].Title.Caption)
          else
            Tamanhos[I]:= 0;
        try
           DataSet.DisableControls;
           DataSet.First;
           while not DataSet.Eof do
           begin
             for var I := 0 to (Grid.Columns.Count - 1) do
             begin
               if Grid.Columns[I].Visible then
                   begin
                     var Tamanho := Grid.Canvas.TextWidth(Grid.Columns[I].Field.AsString);
                     if (Tamanho > Tamanhos[I]) then
                       Tamanhos[I] := Tamanho;
                   end
                 else
                   Tamanhos[I] := 0;
             end;

             DataSet.Next;
           end;

           for var I := 0 to (Grid.Columns.Count - 1) do
             if Grid.Columns[I].Visible then
             begin
               try
                  Grid.Columns[I].Width := (Tamanhos[I] + 10);
               except
               end;
             end;

           DataSet.First;
        finally
           DataSet.RecNo:= Posicao;
           SetLength(Tamanhos, 0);
           Tamanhos := nil;
           DataSet.EnableControls;
        end;
      end;
  except
    Alerta(MENSAGEM_ERRO_COLUNAS);
  end;
end;

procedure ZebrarGrid(Sender, DataSet: TObject; Rect: TRect; Column: TColumn;
  State: TGridDrawState);
begin
  if (not (DataSet as TDataSet).Active) then
    Exit;

  if (DataSet as TDataSet).IsEmpty then
    Exit;

  if (not Odd((DataSet as TDataSet).RecNo)) then
    if (not (gdSelected in State)) then
      begin
        (Sender as TDBGrid).Canvas.Brush.Color := cl3DLight;
        (Sender as TDBGrid).Canvas.FillRect(Rect);
        (Sender as TDBGrid).DefaultDrawDataCell(rect,column.Field,State);
      end
        else
        begin
          (Sender as TDBGrid).Canvas.Brush.Color := $00CFB78F;
          (Sender as TDBGrid).Canvas.FillRect(Rect);
          (Sender as TDBGrid).DefaultDrawDataCell(rect,column.Field,State);
        end
        else
          if (gdSelected in State) then
          begin
            (Sender as TDBGrid).Canvas.Brush.Color := $00CFB78F;
            (Sender as TDBGrid).Canvas.FillRect(Rect);
            (Sender as TDBGrid).DefaultDrawDataCell(rect,column.Field,State);
          end;
end;

function RemoveCaracter(Texto: string): string;
begin
  var Resultado := EmptyStr;

  for var I := 1 to Texto.Length do
  begin
    if (Texto[I] <> '.') and (Texto[I] <> '/') and (Texto[I] <> '-') and
       (Texto[I] <> '_') and (Texto[I] <> ' ') and (Texto[I] <> ':') then
      Resultado := Resultado + Texto[I];
  end;

  Result := Resultado;
end;

function ValidarCPFCNPJ(CpfCnpj: string): Boolean;
begin
  var Valor := RemoveCaracter(CpfCnpj);

  if (Valor.Length = 11) then
    Exit(ValidarCPF(Valor));

  if (Valor.Length = 14) then
    Exit(ValidarCNPJ(Valor));

  Result := False;
end;

function ValidarCNPJ(CpfCnpj : String) : Boolean;
begin
  if ((CpfCnpj = '00000000000000') or (CpfCnpj = '11111111111111') or
  (CpfCnpj = '22222222222222') or (CpfCnpj = '33333333333333') or
  (CpfCnpj = '44444444444444') or (CpfCnpj = '55555555555555') or
  (CpfCnpj = '66666666666666') or (CpfCnpj = '77777777777777') or
  (CpfCnpj = '88888888888888') or (CpfCnpj = '99999999999999') or
  (length(CpfCnpj) <> 14)) then
  begin
    ValidarCNPJ := False;
    Exit;
  end;

  try
    var sm := 0;
    var peso := 2;
    for var i := 12 downto 1 do
    begin
      sm := sm + (StrToInt(CpfCnpj[i]) * peso);
      peso := peso + 1;
      if (peso = 10) then
        peso := 2;
    end;

    var dig13 := EmptyStr;
    var r:= sm mod 11;
    if ((r = 0) or (r = 1)) then
      dig13 := '0'
    else
      str((11 - r) : 1, dig13);

    sm := 0;
    peso := 2;
    for var i := 13 downto 1 do
    begin
      sm:= sm + (StrToInt(CpfCnpj[i]) * peso);
      peso := peso + 1;
      if (peso = 10) then peso:= 2;
    end;

    var dig14 := EmptyStr;
    r:= sm mod 11;
    if ((r = 0) or (r = 1)) then
      dig14:= '0'
    else
      str((11 - r) : 1, dig14);

    if ((dig13 = CpfCnpj[13]) and (dig14 = CpfCnpj[14])) then
      ValidarCNPJ:= True
    else
      ValidarCNPJ := False;
  except
    ValidarCNPJ := False;
  end;
end;

function ValidarCPF(numero: string): Boolean;
begin
  if numero.IsEmpty then
  begin
    result:= false;
    exit;
  end;

  var Wvalid:= False;
  var Wdigit1:= 0;
  var Wdigit2:= 0;
  var Want:= numero[1];
  Delete(numero,ansipos('.',numero),1);
  Delete(numero,ansipos('.',numero),1);
  Delete(numero,ansipos('-',numero),1);

  for var i := 1 to numero.Length do
  begin
    if numero[i] <> Want then
    begin
      Wvalid := True;
      Break;
    end;
  end;

  if (not Wvalid) then
  begin
    Result := False;
    Exit;
  end;

  for var i := 1 to 9 do
    wdigit1 := Wdigit1+(StrToInt(numero[10 - i]) * (I + 1));

  Wdigit1:= ((11 - (Wdigit1 mod 11))mod 11) mod 10;
  if IntToStr(Wdigit1) <> numero[10] then
  begin
    Result := False;
    Exit;
  end;

  for var i:=1 to 10 do
    wdigit2:=Wdigit2+(strtoint(numero[11-i])*(I+1));

  Wdigit2:= ((11 - (Wdigit2 mod 11))mod 11) mod 10;
  if IntToStr(Wdigit2) <> numero[11] then
  begin
    Result := False;
    Exit;
  end;

  Result := True;
end;
end.
