object frmTurma: TfrmTurma
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Turma'
  ClientHeight = 179
  ClientWidth = 514
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  TextHeight = 15
  object pnlTurma: TPanel
    Left = 0
    Top = 0
    Width = 514
    Height = 153
    Align = alTop
    TabOrder = 0
    object lblNome: TLabel
      Left = 9
      Top = 10
      Width = 33
      Height = 15
      Caption = 'Nome'
    end
    object lblRepresentante: TLabel
      Left = 9
      Top = 58
      Width = 75
      Height = 15
      Caption = 'Representante'
    end
    object lblSigla: TLabel
      Left = 431
      Top = 10
      Width = 25
      Height = 15
      Caption = 'Sigla'
    end
    object lblAno: TLabel
      Left = 431
      Top = 58
      Width = 22
      Height = 15
      Caption = 'Ano'
    end
    object lblModalidade: TLabel
      Left = 9
      Top = 106
      Width = 63
      Height = 15
      Caption = 'Modalidade'
    end
    object dbeNome: TDBEdit
      Left = 9
      Top = 27
      Width = 416
      Height = 23
      DataField = 'NOME'
      DataSource = DM.dsrTurma
      TabOrder = 0
    end
    object dbeRepresentante: TDBEdit
      Left = 9
      Top = 75
      Width = 416
      Height = 23
      DataField = 'REPRESENTANTE'
      DataSource = DM.dsrTurma
      TabOrder = 2
    end
    object dbeSigla: TDBEdit
      Left = 431
      Top = 27
      Width = 74
      Height = 23
      CharCase = ecUpperCase
      DataField = 'SIGLA'
      DataSource = DM.dsrTurma
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      MaxLength = 3
      ParentFont = False
      TabOrder = 1
    end
    object dbeAno: TDBEdit
      Left = 431
      Top = 75
      Width = 74
      Height = 23
      DataField = 'ANO'
      DataSource = DM.dsrTurma
      MaxLength = 4
      TabOrder = 3
    end
    object dblModalidade: TDBLookupComboBox
      Left = 9
      Top = 122
      Width = 496
      Height = 23
      DataField = 'IDMODALIDADE'
      DataSource = DM.dsrTurma
      KeyField = 'ID'
      ListField = 'NOME'
      ListSource = DM.dsrModalidade
      TabOrder = 4
    end
  end
  object btnGravar: TBitBtn
    Left = 308
    Top = 153
    Width = 103
    Height = 26
    Align = alRight
    Caption = '&Gravar'
    TabOrder = 1
    OnClick = btnGravarClick
    ExplicitTop = 113
    ExplicitHeight = 29
  end
  object btnCancelar: TBitBtn
    Left = 411
    Top = 153
    Width = 103
    Height = 26
    Align = alRight
    Caption = '&Cancelar'
    TabOrder = 2
    OnClick = btnCancelarClick
    ExplicitTop = 113
    ExplicitHeight = 29
  end
end
