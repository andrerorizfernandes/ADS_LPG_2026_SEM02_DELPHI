object frmAluno: TfrmAluno
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Alunos'
  ClientHeight = 415
  ClientWidth = 678
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  TextHeight = 15
  object btnGravar: TSpeedButton
    Left = 586
    Top = 385
    Width = 92
    Height = 30
    Align = alRight
    Caption = '&Gravar'
    Enabled = False
    OnClick = btnGravarClick
    ExplicitLeft = 584
    ExplicitTop = 249
    ExplicitHeight = 31
  end
  object pgcAluno: TPageControl
    Left = 0
    Top = 0
    Width = 678
    Height = 385
    ActivePage = tbsCadastro
    Align = alTop
    TabOrder = 0
    object tbsCadastro: TTabSheet
      Caption = 'Cadastro'
      OnShow = tbsCadastroShow
      object lblMatricula: TLabel
        Left = 3
        Top = 3
        Width = 50
        Height = 15
        Caption = 'Matricula'
      end
      object lblNome: TLabel
        Left = 130
        Top = 3
        Width = 33
        Height = 15
        Caption = 'Nome'
      end
      object lblCpf: TLabel
        Left = 559
        Top = 3
        Width = 19
        Height = 15
        Caption = 'Cpf'
      end
      object lblSexo: TLabel
        Left = 3
        Top = 59
        Width = 24
        Height = 15
        Caption = 'Sexo'
      end
      object lblEndereco: TLabel
        Left = 130
        Top = 59
        Width = 49
        Height = 15
        Caption = 'Endere'#231'o'
      end
      object lblNumero: TLabel
        Left = 559
        Top = 59
        Width = 44
        Height = 15
        Caption = 'N'#250'mero'
      end
      object lblComplemento: TLabel
        Left = 3
        Top = 115
        Width = 77
        Height = 15
        Caption = 'Complemento'
      end
      object lblBairro: TLabel
        Left = 215
        Top = 115
        Width = 31
        Height = 15
        Caption = 'Bairro'
      end
      object lblMunicipio: TLabel
        Left = 427
        Top = 115
        Width = 54
        Height = 15
        Caption = 'Munic'#237'pio'
      end
      object lblUf: TLabel
        Left = 603
        Top = 115
        Width = 12
        Height = 15
        Caption = 'Uf'
      end
      object lblObservacoes: TLabel
        Left = 3
        Top = 216
        Width = 67
        Height = 15
        Caption = 'Observa'#231#245'es'
      end
      object edtMatricula: TEdit
        Left = 3
        Top = 19
        Width = 121
        Height = 23
        MaxLength = 9
        NumbersOnly = True
        TabOrder = 0
      end
      object edtNome: TEdit
        Left = 130
        Top = 19
        Width = 423
        Height = 23
        TabOrder = 1
      end
      object edtCpf: TEdit
        Left = 559
        Top = 19
        Width = 107
        Height = 23
        MaxLength = 11
        NumbersOnly = True
        TabOrder = 2
      end
      object cboSexo: TComboBox
        Left = 3
        Top = 75
        Width = 121
        Height = 23
        Style = csDropDownList
        TabOrder = 3
        Items.Strings = (
          'Feminino'
          'Masculino'
          'N'#227'o informado')
      end
      object edtEndereco: TEdit
        Left = 130
        Top = 75
        Width = 423
        Height = 23
        TabOrder = 4
      end
      object edtNumero: TEdit
        Left = 559
        Top = 75
        Width = 107
        Height = 23
        TabOrder = 5
      end
      object edtComplemento: TEdit
        Left = 3
        Top = 131
        Width = 206
        Height = 23
        TabOrder = 6
      end
      object edtBairro: TEdit
        Left = 215
        Top = 131
        Width = 206
        Height = 23
        TabOrder = 7
      end
      object edtMunicipio: TEdit
        Left = 427
        Top = 131
        Width = 171
        Height = 23
        TabOrder = 8
      end
      object cboUf: TComboBox
        Left = 604
        Top = 131
        Width = 62
        Height = 23
        Style = csDropDownList
        TabOrder = 9
        Items.Strings = (
          'AC'
          'AL'
          'AP'
          'AM'
          'BA'
          'CE'
          'DF'
          'ES'
          'GO'
          'MA'
          'MT'
          'MS'
          'MG'
          'PA'
          'PB'
          'PR'
          'PE'
          'PI'
          'RJ'
          'RN'
          'RS'
          'RO'
          'RR'
          'SC'
          'SP'
          'SE'
          'TO')
      end
      object memObservacoes: TMemo
        Left = 4
        Top = 235
        Width = 663
        Height = 117
        TabOrder = 11
      end
      object rdgEstadoCivil: TRadioGroup
        Left = 3
        Top = 160
        Width = 663
        Height = 50
        Caption = ' Estado civil '
        Columns = 6
        Items.Strings = (
          'Casado'
          'Divorciado'
          'Separado Judic.'
          'Solteiro'
          'Uni'#227'o Est'#225'vel'
          'Vi'#250'vo')
        TabOrder = 10
      end
    end
    object tbsResultado: TTabSheet
      Caption = 'Resultado'
      ImageIndex = 1
      OnShow = tbsResultadoShow
      object lblTotalAlunos: TLabel
        Left = 0
        Top = 340
        Width = 670
        Height = 15
        Align = alBottom
        Alignment = taRightJustify
        Caption = '0 Registros '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitLeft = 605
        ExplicitWidth = 65
      end
      object dbgResultado: TDBGrid
        Left = 0
        Top = 0
        Width = 670
        Height = 340
        Align = alClient
        DataSource = DM.dsrAluno
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        ParentFont = False
        PopupMenu = popResultado
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = [fsBold]
        OnDrawColumnCell = dbgResultadoDrawColumnCell
        Columns = <
          item
            Expanded = False
            FieldName = 'Matricula'
            Title.Caption = 'Matr'#237'cula'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Nome'
            Width = 228
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Cpf'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Sexo'
            Width = 43
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Endereco'
            Title.Caption = 'Endere'#231'o'
            Width = 212
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Numero'
            Title.Caption = 'N'#250'mero'
            Width = 67
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Complemento'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Bairro'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Municipio'
            Title.Caption = 'Munic'#237'pio'
            Width = 141
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Uf'
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'EstadoCivil'
            Title.Caption = 'Estado civil'
            Width = 64
            Visible = True
          end>
      end
    end
  end
  object popResultado: TPopupMenu
    Left = 508
    Top = 138
    object Excluiraluno1: TMenuItem
      Caption = 'Excluir aluno'
      OnClick = Excluiraluno1Click
    end
  end
end
