object frmAluno: TfrmAluno
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Aluno'
  ClientHeight = 280
  ClientWidth = 676
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 15
  object btnGravar: TSpeedButton
    Left = 492
    Top = 252
    Width = 92
    Height = 28
    Align = alRight
    Caption = '&Gravar'
    ExplicitLeft = 584
    ExplicitTop = 249
    ExplicitHeight = 31
  end
  object btnCancelar: TSpeedButton
    Left = 584
    Top = 252
    Width = 92
    Height = 28
    Align = alRight
    Caption = '&Cancelar'
    ExplicitTop = 249
    ExplicitHeight = 31
  end
  object pgcAluno: TPageControl
    Left = 0
    Top = 0
    Width = 676
    Height = 252
    ActivePage = tbsCadastro
    Align = alTop
    TabOrder = 0
    object tbsCadastro: TTabSheet
      Caption = 'Cadastro'
    end
    object tbsResultado: TTabSheet
      Caption = 'Resultado'
      ImageIndex = 1
      object memResultado: TMemo
        Left = 0
        Top = 0
        Width = 668
        Height = 222
        Align = alClient
        Color = 14869218
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        ExplicitLeft = 96
        ExplicitTop = 40
        ExplicitWidth = 185
        ExplicitHeight = 89
      end
    end
  end
end
