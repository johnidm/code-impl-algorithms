object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Express'#245'es regulares'
  ClientHeight = 444
  ClientWidth = 451
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 119
    Width = 33
    Height = 13
    Caption = 'Campo'
  end
  object Label2: TLabel
    Left = 26
    Top = 175
    Width = 31
    Height = 13
    Caption = 'RegEx'
  end
  object Label3: TLabel
    Left = 21
    Top = 18
    Width = 126
    Height = 13
    Caption = 'Informe a placa do veiculo'
  end
  object Edit1: TEdit
    Left = 26
    Top = 138
    Width = 121
    Height = 21
    TabOrder = 0
    Text = 'EdtCampo'
  end
  object Edit2: TEdit
    Left = 26
    Top = 194
    Width = 121
    Height = 21
    TabOrder = 1
    Text = 'Edit2'
  end
  object BitBtn1: TBitBtn
    Left = 194
    Top = 140
    Width = 75
    Height = 25
    Caption = 'Validar 01'
    TabOrder = 2
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 194
    Top = 196
    Width = 75
    Height = 25
    Caption = 'Validar 02'
    TabOrder = 3
    OnClick = BitBtn2Click
  end
  object Button1: TButton
    Left = 346
    Top = 165
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 4
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 346
    Top = 196
    Width = 75
    Height = 25
    Caption = 'Button2'
    TabOrder = 5
    OnClick = Button2Click
  end
  object Memo1: TMemo
    Left = 18
    Top = 252
    Width = 185
    Height = 105
    Lines.Strings = (
      '^\d{5}-\d{3}$'
      '^[A-Z]{3}\d{4}$')
    TabOrder = 6
  end
  object Memo2: TMemo
    Left = 225
    Top = 244
    Width = 185
    Height = 105
    TabOrder = 7
  end
  object EdtPlacaVeiculo: TEdit
    Left = 21
    Top = 37
    Width = 126
    Height = 21
    TabOrder = 8
    OnEnter = EdtPlacaVeiculoEnter
    OnExit = EdtPlacaVeiculoExit
  end
end
