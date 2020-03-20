object frmConversor: TfrmConversor
  Left = 144
  Top = 34
  Width = 1122
  Height = 644
  Caption = 
    'Ajusta   arquivo TCE 4820/PAGTO_POS  (vers'#227'o 2.0  MySQL) 19/03/2' +
    '020'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object RzPageControl1: TRzPageControl
    Left = 0
    Top = 0
    Width = 1106
    Height = 605
    ActivePage = TS_PAGTO_POS
    ActivePageDefault = TS_Evento
    Align = alClient
    BackgroundColor = clNavy
    FlatColor = clNavy
    ParentBackgroundColor = False
    ParentColor = False
    TabIndex = 1
    TabOrder = 0
    FixedDimension = 19
    object TS_Evento: TRzTabSheet
      Caption = 'Eventos'
      object SMDBGrid1: TSMDBGrid
        Left = 0
        Top = 63
        Width = 1102
        Height = 469
        Align = alClient
        DataSource = DMFolha.dsmEventos
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Flat = False
        BandsFont.Charset = DEFAULT_CHARSET
        BandsFont.Color = clWindowText
        BandsFont.Height = -11
        BandsFont.Name = 'MS Sans Serif'
        BandsFont.Style = []
        Groupings = <>
        GridStyle.Style = gsCustom
        GridStyle.OddColor = clWindow
        GridStyle.EvenColor = clWindow
        TitleHeight.PixelCount = 24
        FooterColor = clBtnFace
        ExOptions = [eoDisableDelete, eoDisableInsert, eoENTERlikeTAB, eoKeepSelection, eoStandardPopup, eoBLOBEditor, eoTitleWordWrap]
        OnGetCellParams = SMDBGrid1GetCellParams
        RegistryKey = 'Software\Scalabium'
        RegistrySection = 'SMDBGrid'
        WidthOfIndicator = 11
        DefaultRowHeight = 17
        ScrollBars = ssHorizontal
        ColCount = 35
        RowCount = 2
        Columns = <
          item
            Expanded = False
            FieldName = 'DtAtualizacao'
            Title.Color = 10485568
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Cod_Funcionario'
            Title.Color = 10485568
            Width = 103
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CPF'
            Title.Color = 10485568
            Width = 156
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Nome_Funcionario'
            Title.Color = 10485568
            Width = 368
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DtNascimento'
            Title.Color = 10485568
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DtAdmissao'
            Title.Color = 10485568
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DtDemissao'
            Title.Color = 10485568
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Cod_Cargo'
            Title.Color = 10485568
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Nome_Cargo'
            Title.Color = 10485568
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Cod_Setor'
            Title.Color = 10485568
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Nome_Setor'
            Title.Color = 10485568
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Sexo_Funcionario'
            Title.Color = 10485568
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Qtd_Dependente'
            Title.Color = 10485568
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Sit_Funcionario'
            Title.Color = 10485568
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Regime_Juridico'
            Title.Color = 10485568
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Natureza_Cargo'
            Title.Color = 10485568
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Regime_Previd'
            Title.Color = 10485568
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Reg_Geral_RG'
            Title.Color = 10485568
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CBO'
            Title.Color = 10485568
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NIT'
            Title.Color = 10485568
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Categoria_Trab'
            Title.Color = 10485568
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Endereco'
            Title.Color = 10485568
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Cidade'
            Title.Color = 10485568
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'UF'
            Title.Color = 10485568
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Cep'
            Title.Color = 10485568
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Obs'
            Title.Color = 10485568
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Carga_Horario'
            Title.Color = 10485568
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Tipo_Carga_Hor'
            Title.Color = 10485568
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Cedido_Adidio'
            Title.Color = 10485568
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Onus_Origem'
            Title.Color = 10485568
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Ressarcimento'
            Title.Color = 10485568
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DtMov'
            Title.Color = 10485568
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CNPJ_Orgao_Ori'
            Title.Color = 10485568
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Salario_Inicial'
            Title.Color = 10485568
            Width = 75
            Visible = True
          end>
      end
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 1102
        Height = 63
        Align = alTop
        Color = clSilver
        TabOrder = 1
        object Label16: TLabel
          Left = 12
          Top = 15
          Width = 93
          Height = 13
          Alignment = taRightJustify
          Caption = 'Arquivo TCE_4820:'
        end
        object File_TCE4960: TFilenameEdit
          Left = 108
          Top = 7
          Width = 539
          Height = 21
          NumGlyphs = 1
          TabOrder = 0
        end
        object btnLe: TNxButton
          Left = 853
          Top = 8
          Width = 228
          Height = 30
          Caption = 'Le Arq.TCE 4820'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          GlyphSpacing = 5
          ParentFont = False
          TabOrder = 1
          Transparent = True
          Visible = False
          OnClick = btnLeClick
        end
        object btnGravar: TNxButton
          Left = 337
          Top = 32
          Width = 228
          Height = 30
          Caption = 'Gravar Arq.TCE 4820'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          GlyphSpacing = 5
          ParentFont = False
          TabOrder = 2
          Transparent = True
          OnClick = btnGravarClick
        end
        object NxButton1: TNxButton
          Left = 768
          Top = 8
          Width = 75
          Caption = 'NxButton1'
          TabOrder = 3
          Visible = False
          OnClick = NxButton1Click
        end
        object NxButton2: TNxButton
          Left = 110
          Top = 32
          Width = 228
          Height = 30
          Caption = 'Le Arq.TCE 4820'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          OnClick = NxButton2Click
        end
      end
      object Panel1: TPanel
        Left = 0
        Top = 532
        Width = 1102
        Height = 50
        Align = alBottom
        Color = clSilver
        TabOrder = 2
        object Label7: TLabel
          Left = 30
          Top = 17
          Width = 218
          Height = 18
          Alignment = taRightJustify
          Caption = 'Total Geral de Registros:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label8: TLabel
          Left = 257
          Top = 17
          Width = 11
          Height = 18
          Caption = '0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object ProgressBar1: TProgressBar
          Left = 376
          Top = 17
          Width = 609
          Height = 17
          TabOrder = 0
          Visible = False
        end
      end
    end
    object TS_PAGTO_POS: TRzTabSheet
      Caption = 'Arquivo PAGTO_POS.TXT'
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 1102
        Height = 124
        Align = alTop
        Color = clSilver
        TabOrder = 0
        object Label1: TLabel
          Left = 6
          Top = 75
          Width = 118
          Height = 13
          Alignment = taRightJustify
          Caption = 'Local Grava'#231#227'o Arquivo:'
        end
        object Label6: TLabel
          Left = 80
          Top = 11
          Width = 44
          Height = 13
          Alignment = taRightJustify
          Caption = 'Empresa:'
        end
        object Label2: TLabel
          Left = 47
          Top = 32
          Width = 77
          Height = 13
          Alignment = taRightJustify
          Caption = 'M'#234's/Ano Inicial:'
        end
        object Label4: TLabel
          Left = 28
          Top = 53
          Width = 96
          Height = 13
          Alignment = taRightJustify
          Caption = 'Tipo de Pagamento:'
        end
        object NxButton4: TNxButton
          Left = 353
          Top = 92
          Width = 228
          Height = 30
          Caption = 'Gerar Arquivo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          GlyphSpacing = 5
          ParentFont = False
          TabOrder = 6
          Transparent = True
          OnClick = NxButton4Click
        end
        object NxButton6: TNxButton
          Left = 126
          Top = 92
          Width = 228
          Height = 30
          Caption = 'Consultar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
          OnClick = NxButton6Click
        end
        object DirectoryEdit1: TDirectoryEdit
          Left = 127
          Top = 68
          Width = 337
          Height = 21
          NumGlyphs = 1
          TabOrder = 4
        end
        object RxDBLookupCombo1: TRxDBLookupCombo
          Left = 127
          Top = 3
          Width = 337
          Height = 21
          DropDownCount = 8
          LookupField = 'cd_empresa'
          LookupDisplay = 'razao'
          LookupSource = DMFolha.dsEmpresa
          TabOrder = 0
        end
        object cbxMesIni: TComboBox
          Left = 127
          Top = 24
          Width = 81
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 1
          Items.Strings = (
            'Janeiro'
            'Fevereiro'
            'Mar'#231'o'
            'Abril'
            'Maio'
            'Junho'
            'Julho'
            'Agosto'
            'Setembro'
            'Outubro'
            'Novembro'
            'Dezembro')
        end
        object ceAnoIni: TCurrencyEdit
          Left = 208
          Top = 24
          Width = 54
          Height = 21
          AutoSize = False
          DecimalPlaces = 0
          DisplayFormat = '0'
          MaxLength = 4
          TabOrder = 2
        end
        object cbxTipo: TComboBox
          Left = 127
          Top = 46
          Width = 337
          Height = 21
          ItemHeight = 13
          ItemIndex = 1
          TabOrder = 3
          Text = '2-Folha Mensal'
          Items.Strings = (
            '1-Adto Sal'#225'rio'
            '2-Folha Mensal'
            '3-'
            '4-'
            '5-')
        end
      end
      object SMDBGrid2: TSMDBGrid
        Left = 0
        Top = 124
        Width = 1102
        Height = 458
        Align = alClient
        Ctl3D = False
        DataSource = DMFolha.dsmPagtoPos
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ParentCtl3D = False
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Flat = True
        BandsFont.Charset = DEFAULT_CHARSET
        BandsFont.Color = clWindowText
        BandsFont.Height = -11
        BandsFont.Name = 'MS Sans Serif'
        BandsFont.Style = []
        Groupings = <>
        GridStyle.Style = gsCustom
        GridStyle.OddColor = clWindow
        GridStyle.EvenColor = clWindow
        TitleHeight.PixelCount = 24
        FooterColor = clBtnFace
        ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoStandardPopup, eoBLOBEditor, eoTitleWordWrap]
        OnGetCellParams = SMDBGrid1GetCellParams
        RegistryKey = 'Software\Scalabium'
        RegistrySection = 'SMDBGrid'
        WidthOfIndicator = 11
        DefaultRowHeight = 17
        ScrollBars = ssHorizontal
        ColCount = 10
        RowCount = 2
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Identificador'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Color = 16777088
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Cod_Funcionario'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'C'#243'd. Funcion'#225'rio'
            Title.Color = 16777088
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Nome_Funcionario'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'Nome Funcion'#225'rio'
            Title.Color = 16777088
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'DtPagamento'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'Dt. Pagamento'
            Title.Color = 16777088
            Width = 85
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Valor_Pago'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'Valor'
            Title.Color = 16777088
            Width = 90
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Cod_Banco'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'C'#243'd. Banco'
            Title.Color = 16777088
            Width = 63
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Cod_Agencia'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'Ag'#234'ncia'
            Title.Color = 16777088
            Width = 53
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Conta_Corrente'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'Conta Corrente'
            Title.Color = 16777088
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Ultimo_Pagamento'
            Title.Alignment = taCenter
            Title.Caption = #218'ltimo Pagto'
            Title.Color = 16777088
            Width = 45
            Visible = True
          end>
      end
    end
  end
end
