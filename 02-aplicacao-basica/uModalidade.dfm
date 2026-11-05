object frmModalidade: TfrmModalidade
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Modalidade'
  ClientHeight = 92
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
  object pnlModalidade: TPanel
    Left = 0
    Top = 0
    Width = 514
    Height = 65
    Align = alTop
    TabOrder = 0
    object lblNome: TLabel
      Left = 9
      Top = 10
      Width = 33
      Height = 15
      Caption = 'Nome'
    end
    object dbeNome: TDBEdit
      Left = 9
      Top = 27
      Width = 496
      Height = 23
      DataField = 'NOME'
      DataSource = DM.dsrModalidade
      TabOrder = 0
    end
  end
  object btnGravar: TBitBtn
    Left = 308
    Top = 65
    Width = 103
    Height = 27
    Align = alRight
    Caption = '&Gravar'
    TabOrder = 1
    OnClick = btnGravarClick
    ExplicitTop = 153
    ExplicitHeight = 26
  end
  object btnCancelar: TBitBtn
    Left = 411
    Top = 65
    Width = 103
    Height = 27
    Align = alRight
    Caption = '&Cancelar'
    TabOrder = 2
    OnClick = btnCancelarClick
    ExplicitTop = 153
    ExplicitHeight = 26
  end
end
