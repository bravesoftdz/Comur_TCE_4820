unit UDMFolha;

interface

uses
  SysUtils, Classes, FMTBcd, DB, DBClient, Provider, SqlExpr,
  ZAbstractRODataset, ZDataset;

type
  TDMFolha = class(TDataModule)
    mEventos: TClientDataSet;
    dsmEventos: TDataSource;
    mEventosItem: TIntegerField;
    sdsEstrutura_1: TZReadOnlyQuery;
    mEventosCod_Funcionario: TStringField;
    mEventosCPF: TStringField;
    mEventosNome_Funcionario: TStringField;
    mEventosCod_Cargo: TStringField;
    mEventosNome_Cargo: TStringField;
    mEventosCod_Setor: TStringField;
    mEventosNome_Setor: TStringField;
    mEventosSexo_Funcionario: TStringField;
    mEventosQtd_Dependente: TStringField;
    mEventosSit_Funcionario: TStringField;
    mEventosRegime_Juridico: TStringField;
    mEventosNatureza_Cargo: TStringField;
    mEventosRegime_Previd: TStringField;
    mEventosReg_Geral_RG: TStringField;
    mEventosCBO: TStringField;
    mEventosNIT: TStringField;
    mEventosCategoria_Trab: TStringField;
    mEventosEndereco: TStringField;
    mEventosCidade: TStringField;
    mEventosUF: TStringField;
    mEventosCep: TStringField;
    mEventosObs: TStringField;
    mEventosCarga_Horario: TStringField;
    mEventosTipo_Carga_Hor: TStringField;
    mEventosCedido_Adidio: TStringField;
    mEventosOnus_Origem: TStringField;
    mEventosRessarcimento: TStringField;
    mEventosCNPJ_Orgao_Ori: TStringField;
    mEventosSalario_Inicial: TFloatField;
    mEventosDtAtualizacao: TStringField;
    mEventosDtMov: TStringField;
    mEventosDtNascimento: TStringField;
    mEventosDtAdmissao: TStringField;
    mEventosDtDemissao: TStringField;
    dspEmpresa: TDataSetProvider;
    cdsEmpresa: TClientDataSet;
    cdsEmpresacd_empresa: TIntegerField;
    cdsEmpresarazao: TStringField;
    cdsEmpresacnpj_cpf: TStringField;
    dsEmpresa: TDataSource;
    sdsEmpresa: TZReadOnlyQuery;
    dspValores: TDataSetProvider;
    cdsValores: TClientDataSet;
    dsValores: TDataSource;
    sdsValores: TZReadOnlyQuery;
    cdsValorestipo: TSmallintField;
    cdsValoresCOD_FUNCIONARIO: TIntegerField;
    cdsValoresNOME: TStringField;
    cdsValoresAGENCIA: TSmallintField;
    cdsValorescd_banco_deposito: TSmallintField;
    cdsValoresCONTA_CORRENTE: TStringField;
    cdsValoresvalor: TFloatField;
    cdsValorestp_evento: TStringField;
    mPagtoPos: TClientDataSet;
    dsmPagtoPos: TDataSource;
    mPagtoPosIdentificador: TStringField;
    mPagtoPosCod_Funcionario: TIntegerField;
    mPagtoPosDtPagamento: TDateField;
    mPagtoPosValor_Pago: TFloatField;
    mPagtoPosCod_Banco: TStringField;
    mPagtoPosCod_Agencia: TStringField;
    mPagtoPosConta_Corrente: TStringField;
    mPagtoPosUltimo_Pagamento: TStringField;
    mPagtoPosNome_Funcionario: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
    ctEvento_EBS : String;
  end;

var
  DMFolha: TDMFolha;

implementation

uses DmdDatabase_EBS;

{$R *.dfm}

end.
