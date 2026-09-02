object DM: TDM
  Height = 480
  Width = 640
  object cdsAluno: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 24
    Top = 24
    object cdsAlunoMatricula: TIntegerField
      FieldName = 'Matricula'
    end
    object cdsAlunoNome: TStringField
      FieldName = 'Nome'
    end
    object cdsAlunoCpf: TStringField
      FieldName = 'Cpf'
    end
    object cdsAlunoSexo: TStringField
      FieldName = 'Sexo'
      Size = 0
    end
    object cdsAlunoEndereco: TStringField
      FieldName = 'Endereco'
    end
    object cdsAlunoNumero: TStringField
      FieldName = 'Numero'
    end
    object cdsAlunoComplemento: TStringField
      FieldName = 'Complemento'
    end
    object cdsAlunoBairro: TStringField
      FieldName = 'Bairro'
    end
    object cdsAlunoMunicipio: TStringField
      FieldName = 'Municipio'
    end
    object cdsAlunoUf: TStringField
      FieldName = 'Uf'
    end
    object cdsAlunoEstadoCivil: TStringField
      FieldName = 'EstadoCivil'
    end
    object cdsAlunoObservacoes: TStringField
      FieldName = 'Observacoes'
    end
  end
  object dsrAluno: TDataSource
    DataSet = cdsAluno
    Left = 96
    Top = 24
  end
end
