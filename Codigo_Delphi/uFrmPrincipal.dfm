object FrmPrincipal: TFrmPrincipal
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'ACBrIA - v1'
  ClientHeight = 302
  ClientWidth = 768
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 22
    Top = 240
    Width = 42
    Height = 13
    Alignment = taRightJustify
    Caption = 'API Key:'
  end
  object MemoPrompt: TMemo
    Left = 8
    Top = 8
    Width = 241
    Height = 217
    Lines.Strings = (
      'Com base nos estados brasileiros (UF) '
      'informados em uma lista onde a primeira UF '#233' o '
      'Estado de Partida e a '#250'ltima UF '#233' o estado de '
      'Chegada. Gere uma lista ordenada dos estados '
      'onde ser'#225' feito o percurso de caminh'#227'o;'
      'O primeiro e o '#250'ltimo estado da lista recebida '
      'n'#227'o devem ser informados no retorno;'
      'Voc'#234' vai receber um arquivo json ({"uf":[]}) e '
      'deve retornar um json ({"percurso":[]});'
      ''
      'Exemplo Envio:  {"uf":["RS", "MG", "SP", "MT"]}'
      'Exemplo Sa'#237'da:  {"percurso":["SC", "PR", "SP", '
      '"MG", "GO"]}')
    TabOrder = 0
  end
  object MemoUsuario: TMemo
    Left = 255
    Top = 8
    Width = 241
    Height = 217
    Lines.Strings = (
      '{"uf":["RS", "MG", "SP", "MT"]}')
    TabOrder = 1
  end
  object MemoModelo: TMemo
    Left = 502
    Top = 8
    Width = 241
    Height = 217
    TabOrder = 2
  end
  object BtnGerar: TBitBtn
    Left = 502
    Top = 235
    Width = 241
    Height = 25
    Caption = 'Gerar'
    TabOrder = 3
    OnClick = BtnGerarClick
  end
  object EdtKey: TEdit
    Left = 70
    Top = 237
    Width = 426
    Height = 21
    TabOrder = 4
  end
end
