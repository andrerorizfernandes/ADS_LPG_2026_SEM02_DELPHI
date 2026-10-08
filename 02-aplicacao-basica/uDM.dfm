object DM: TDM
  Height = 480
  Width = 640
  object dsrAluno: TDataSource
    DataSet = qryAluno
    Left = 112
    Top = 104
  end
  object Conexao: TFDConnection
    Params.Strings = (
      
        'Database=C:\Users\Andre Roriz\Downloads\ADS_LPG_2026_SEM02_DELPH' +
        'I\02-aplicacao-basica\DataBase\DADOS.FDB'
      'User_Name=SYSDBA'
      'Password=18071988'
      'DriverID=FB')
    Connected = True
    LoginPrompt = False
    Left = 40
    Top = 24
  end
  object qryAluno: TFDQuery
    Connection = Conexao
    SQL.Strings = (
      'SELECT '
      '  a.ID,'
      '  a.MATRICULA,'
      '  a.NOME,'
      '  a.CPF,'
      '  a.SEXO,'
      '  a.ENDERECO,'
      '  a.NUMERO,'
      '  a.COMPLEMENTO,'
      '  a.BAIRRO,'
      '  a.MUNICIPIO,'
      '  a.UF,'
      '  a.ESTADOCIVIL,'
      '  a.OBSERVACOES'
      'FROM ALUNO a')
    Left = 32
    Top = 104
    object qryAlunoID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
    end
    object qryAlunoMATRICULA: TIntegerField
      DisplayLabel = 'Matr'#237'cula'
      FieldName = 'MATRICULA'
      Origin = 'MATRICULA'
      Required = True
    end
    object qryAlunoNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 60
    end
    object qryAlunoCPF: TStringField
      DisplayLabel = 'Cpf'
      FieldName = 'CPF'
      Origin = 'CPF'
      Required = True
      Size = 11
    end
    object qryAlunoSEXO: TStringField
      DisplayLabel = 'Sexo'
      FieldName = 'SEXO'
      Origin = 'SEXO'
      Size = 1
    end
    object qryAlunoENDERECO: TStringField
      DisplayLabel = 'Endere'#231'o'
      FieldName = 'ENDERECO'
      Origin = 'ENDERECO'
      Required = True
      Size = 100
    end
    object qryAlunoNUMERO: TStringField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
      Size = 10
    end
    object qryAlunoCOMPLEMENTO: TStringField
      DisplayLabel = 'Complemento'
      FieldName = 'COMPLEMENTO'
      Origin = 'COMPLEMENTO'
      Size = 50
    end
    object qryAlunoBAIRRO: TStringField
      DisplayLabel = 'Bairro'
      FieldName = 'BAIRRO'
      Origin = 'BAIRRO'
      Size = 50
    end
    object qryAlunoMUNICIPIO: TStringField
      DisplayLabel = 'Munic'#237'pio'
      FieldName = 'MUNICIPIO'
      Origin = 'MUNICIPIO'
      Required = True
      Size = 50
    end
    object qryAlunoUF: TStringField
      DisplayLabel = 'Uf'
      FieldName = 'UF'
      Origin = 'UF'
      Required = True
      Size = 2
    end
    object qryAlunoESTADOCIVIL: TStringField
      DisplayLabel = 'Estado Civil'
      FieldName = 'ESTADOCIVIL'
      Origin = 'ESTADOCIVIL'
      Size = 1
    end
    object qryAlunoOBSERVACOES: TStringField
      DisplayLabel = 'Observa'#231#245'es'
      FieldName = 'OBSERVACOES'
      Origin = 'OBSERVACOES'
      Size = 1000
    end
  end
  object qryTurma: TFDQuery
    Connection = Conexao
    SQL.Strings = (
      'SELECT'
      '  t.ID,'
      '  t.NOME,'
      '  t.SIGLA,'
      '  t.REPRESENTANTE,'
      '  t.ANO,'
      '  t.DATAHORA'
      'FROM TURMA t ')
    Left = 32
    Top = 176
    object qryTurmaID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryTurmaNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 100
    end
    object qryTurmaSIGLA: TStringField
      FieldName = 'SIGLA'
      Origin = 'SIGLA'
      Required = True
      Size = 5
    end
    object qryTurmaREPRESENTANTE: TStringField
      FieldName = 'REPRESENTANTE'
      Origin = 'REPRESENTANTE'
      Size = 100
    end
    object qryTurmaANO: TIntegerField
      FieldName = 'ANO'
      Origin = 'ANO'
    end
    object qryTurmaDATAHORA: TSQLTimeStampField
      FieldName = 'DATAHORA'
      Origin = 'DATAHORA'
    end
  end
  object dsrTurma: TDataSource
    DataSet = qryTurma
    Left = 112
    Top = 176
  end
end
