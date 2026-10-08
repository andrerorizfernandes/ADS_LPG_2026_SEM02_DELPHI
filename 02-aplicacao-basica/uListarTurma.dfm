object frmListarTurma: TfrmListarTurma
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Turmas'
  ClientHeight = 392
  ClientWidth = 712
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  TextHeight = 15
  object lblTotalizador: TLabel
    Left = 0
    Top = 346
    Width = 712
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
    ExplicitLeft = 547
    ExplicitTop = 284
    ExplicitWidth = 65
  end
  object dbgTurma: TDBGrid
    Left = 0
    Top = 0
    Width = 712
    Height = 346
    Align = alClient
    DataSource = DM.dsrTurma
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = [fsBold]
    Columns = <
      item
        Expanded = False
        FieldName = 'NOME'
        Title.Caption = 'Nome'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SIGLA'
        Title.Caption = 'Sigla'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REPRESENTANTE'
        Title.Caption = 'Representante'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ANO'
        Title.Caption = 'Ano'
        Visible = True
      end>
  end
  object pnlRodape: TPanel
    Left = 0
    Top = 361
    Width = 712
    Height = 31
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 1
    ExplicitTop = 309
    ExplicitWidth = 612
    object btnExcluir: TBitBtn
      Left = 604
      Top = 2
      Width = 106
      Height = 27
      Align = alRight
      Caption = 'E&xcluir'
      TabOrder = 2
      ExplicitLeft = 504
      ExplicitHeight = 31
    end
    object btnEditar: TBitBtn
      Left = 498
      Top = 2
      Width = 106
      Height = 27
      Align = alRight
      Caption = '&Editar'
      TabOrder = 1
      ExplicitLeft = 504
      ExplicitHeight = 31
    end
    object btnInserir: TBitBtn
      Left = 392
      Top = 2
      Width = 106
      Height = 27
      Align = alRight
      Caption = '&Inserir'
      TabOrder = 0
      ExplicitLeft = 504
      ExplicitHeight = 31
    end
  end
end
