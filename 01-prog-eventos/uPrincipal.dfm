object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Exemplo de eventos'
  ClientHeight = 304
  ClientWidth = 563
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
  object lblTesteDuploClique: TLabel
    Left = 48
    Top = 32
    Width = 152
    Height = 15
    Caption = 'Duplo clique para continuar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    OnDblClick = lblTesteDuploCliqueDblClick
  end
  object btnApresentacao: TButton
    Left = 240
    Top = 136
    Width = 75
    Height = 25
    Caption = 'Acessar'
    TabOrder = 0
    OnClick = btnApresentacaoClick
    OnMouseMove = btnApresentacaoMouseMove
  end
  object edtTesteTecla: TEdit
    Left = 336
    Top = 29
    Width = 225
    Height = 23
    Hint = 'Informe o seu nome'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnKeyPress = edtTesteTeclaKeyPress
  end
end
