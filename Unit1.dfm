object Form1: TForm1
  Left = 313
  Top = 124
  Width = 928
  Height = 480
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lbDiretorio: TLabel
    Left = 44
    Top = 31
    Width = 125
    Height = 13
    Alignment = taRightJustify
    Caption = 'Arquivo do Plano Cont'#225'bil:'
  end
  object BitBtn1: TBitBtn
    Left = 176
    Top = 96
    Width = 75
    Height = 25
    Caption = 'BitBtn1'
    TabOrder = 0
    OnClick = BitBtn1Click
  end
  object File_Plano: TFilenameEdit
    Left = 172
    Top = 23
    Width = 539
    Height = 21
    NumGlyphs = 1
    TabOrder = 1
  end
end
