object frmListarModalidade: TfrmListarModalidade
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Modalidades'
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
  OnClose = FormClose
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
    ExplicitLeft = 647
    ExplicitWidth = 65
  end
  object dbgModalidade: TDBGrid
    Left = 0
    Top = 0
    Width = 712
    Height = 346
    Align = alClient
    DataSource = DM.dsrModalidade
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
    OnDrawColumnCell = dbgModalidadeDrawColumnCell
    OnDblClick = dbgModalidadeDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'ID'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Title.Caption = 'Nome'
        Width = 506
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
    object btnExcluir: TBitBtn
      Left = 604
      Top = 2
      Width = 106
      Height = 27
      Align = alRight
      Caption = 'E&xcluir'
      TabOrder = 2
      OnClick = btnExcluirClick
    end
    object btnEditar: TBitBtn
      Left = 498
      Top = 2
      Width = 106
      Height = 27
      Align = alRight
      Caption = '&Editar'
      TabOrder = 1
      OnClick = btnEditarClick
    end
    object btnInserir: TBitBtn
      Left = 392
      Top = 2
      Width = 106
      Height = 27
      Align = alRight
      Caption = '&Inserir'
      TabOrder = 0
      OnClick = btnInserirClick
    end
  end
end
