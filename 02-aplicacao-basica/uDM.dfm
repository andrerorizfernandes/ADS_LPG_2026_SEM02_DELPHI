object DM: TDM
  Height = 480
  Width = 640
  object cdsAluno: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'Matricula'
        DataType = ftInteger
      end
      item
        Name = 'Nome'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'Cpf'
        DataType = ftString
        Size = 11
      end
      item
        Name = 'Endereco'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'Numero'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'Complemento'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Bairro'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Municipio'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Uf'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'EstadoCivil'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'Observacoes'
        DataType = ftString
        Size = 1000
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 24
    Top = 24
    object cdsAlunoMatricula: TIntegerField
      FieldName = 'Matricula'
    end
    object cdsAlunoNome: TStringField
      FieldName = 'Nome'
      Size = 60
    end
    object cdsAlunoCpf: TStringField
      FieldName = 'Cpf'
      Size = 11
    end
    object cdsAlunoSexo: TStringField
      FieldKind = fkCalculated
      FieldName = 'Sexo'
      Size = 1
      Calculated = True
    end
    object cdsAlunoEndereco: TStringField
      FieldName = 'Endereco'
      Size = 100
    end
    object cdsAlunoNumero: TStringField
      FieldName = 'Numero'
      Size = 10
    end
    object cdsAlunoComplemento: TStringField
      FieldName = 'Complemento'
      Size = 50
    end
    object cdsAlunoBairro: TStringField
      FieldName = 'Bairro'
      Size = 50
    end
    object cdsAlunoMunicipio: TStringField
      FieldName = 'Municipio'
      Size = 50
    end
    object cdsAlunoUf: TStringField
      FieldName = 'Uf'
      Size = 2
    end
    object cdsAlunoEstadoCivil: TStringField
      FieldName = 'EstadoCivil'
      Size = 1
    end
    object cdsAlunoObservacoes: TStringField
      FieldName = 'Observacoes'
      Size = 1000
    end
  end
  object dsrAluno: TDataSource
    DataSet = cdsAluno
    Left = 96
    Top = 24
  end
end
