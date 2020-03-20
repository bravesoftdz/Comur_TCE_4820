unit DmdDatabase_EBS;

interface

uses
  SysUtils, Classes, IniFiles,
  IdBaseComponent, IdCoder, IdCoder3to4, IdCoderMIME, FMTBcd, ADODB, DB,
  DBXpress, SqlExpr, Forms, ZConnection;

  //, , , IniFiles,
  //IdBaseComponent, IdCoder, IdCoder3to4, IdCoderMIME, FMTBcd, Midaslib;


type
  TdmDatabase_EBS = class(TDataModule)
    ZConnection1: TZConnection;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
    function Fnc_ArquivoConfiguracao: string;

  public
  
  end;

var
  dmDatabase_EBS: TdmDatabase_EBS;

implementation

{$R *.dfm}

const
  cArquivoConfiguracao = 'Config.ini';

function TdmDatabase_EBS.Fnc_ArquivoConfiguracao: string;
begin
  Result := ExtractFilePath( Application.ExeName ) + cArquivoConfiguracao;
end;

procedure TdmDatabase_EBS.DataModuleCreate(Sender: TObject);
var
  Config: TIniFile;
begin
  if not FileExists(Fnc_ArquivoConfiguracao) then
    Exit;

  Config := TIniFile.Create( Fnc_ArquivoConfiguracao );
  try
    ZConnection1.Database := Config.ReadString('SS_MYSQL', 'DataBase', '');
    ZConnection1.Protocol := Config.ReadString('SS_MYSQL', 'Protocol', '');
    ZConnection1.HostName := Config.ReadString('SS_MYSQL', 'HostName', '');
    ZConnection1.User     := Config.ReadString('SS_MYSQL', 'User', '');
    ZConnection1.Password := Config.ReadString('SS_MYSQL', 'Password', '');
    ZConnection1.Port     := StrToInt(Config.ReadString('SS_MYSQL', 'Port', ''));

    {Conexao_MSSQL.Params.Values['HostName']  := Config.ReadString('SS_SQLSERVER', 'HostName', '');
    Conexao_MSSQL.Params.Values['DriverName']  := Config.ReadString('SS_SQLSERVER', 'DriverName', '');
    Conexao_MSSQL.Params.Values['DataBase']  := Config.ReadString('SS_SQLSERVER', 'DataBase', '');
    Conexao_MSSQL.Params.Values['User_Name'] := Config.ReadString('SS_SQLSERVER', 'User_Name', '');
    Conexao_MSSQL.Params.Values['Password']  := Config.ReadString('SS_SQLSERVER', 'Password', '');}
    //scoDados.Params.Values['PASSWORD']  := Decoder64.DecodeString( Config.ReadString('SSDemonstrativo', 'PASSWORD', '') );

{DriverName=MSSQL
HostName=WINDOWSXP\EBS
DataBase=EBS_Cordilheira_Codigo_Nome
User_Name=sa
Password=Cordilheir@2008
BlobSize=-1
ErrorResourceFile=
LocaleCode=0000
MSSQL TransIsolation=ReadCommited
OS Authentication=False}

    ZConnection1.Connected := True;

    //Conexao_MSSQL.Connected := True;
  finally
    FreeAndNil(Config);
  end;

end;

end.
