unit UConversor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzTabs, Grids, DBGrids, SMDBGrid, NxCollection, UDMFolha, ExtCtrls,
  StdCtrls, Mask, ToolEdit, ComObj, Buttons, DB, SqlExpr, CurrEdit, midaslib,
  ZDataset, ComCtrls, RxLookup;

type
  TfrmConversor = class(TForm)
    RzPageControl1: TRzPageControl;
    TS_Evento: TRzTabSheet;
    SMDBGrid1: TSMDBGrid;
    Panel2: TPanel;
    Label16: TLabel;
    File_TCE4960: TFilenameEdit;
    btnLe: TNxButton;
    btnGravar: TNxButton;
    NxButton1: TNxButton;
    NxButton2: TNxButton;
    Panel1: TPanel;
    Label7: TLabel;
    Label8: TLabel;
    ProgressBar1: TProgressBar;
    TS_PAGTO_POS: TRzTabSheet;
    Panel3: TPanel;
    Label1: TLabel;
    NxButton4: TNxButton;
    NxButton6: TNxButton;
    DirectoryEdit1: TDirectoryEdit;
    Label6: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    cbxMesIni: TComboBox;
    Label2: TLabel;
    ceAnoIni: TCurrencyEdit;
    Label4: TLabel;
    cbxTipo: TComboBox;
    SMDBGrid2: TSMDBGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnLeClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure SMDBGrid1GetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure NxButton1Click(Sender: TObject);
    procedure NxButton2Click(Sender: TObject);
    procedure NxButton6Click(Sender: TObject);
    procedure NxButton4Click(Sender: TObject);
  private
    { Private declarations }
    fDMFolha: TDMFolha;
    Txt: TextFile;
    vRegistro: string;
    vArquivo: string;
    vHeader_4960, vTrailler_4960: string;
    vTotal_NaoPreenchido, vTotal_NaoEncontrado: Integer;
    vTotal_Geral: Integer;
    vTotal_Correto: Integer;
    vCodFunc: Integer;
    vItem: Integer;
    procedure prc_Gravar_mEvento;
    procedure prc_Montar_Arquivo_TCE4960;
    function fnc_Montar_Campo: string;
    function Monta_Numero(Campo: string; Tamanho: Integer): string;
    function TirarAcento(texto: string): string;
    function Replace(Str, Ant, Novo: string): string;
    function fnc_Verifica_Casas_Decimais(Campo: string): string;
    function fnc_verifica_Arquivo(NomeArquivo: string): string;
    procedure prc_Abrir_Valores;
    procedure prc_Le_Valores;
    procedure prc_Montar_Arquivo_Pagto_Pos;
  public
    { Public declarations }
  end;

var
  frmConversor: TfrmConversor;

implementation

uses
  rsDBUtils, StrUtils, DmdDatabase_EBS, DateUtils;

{$R *.dfm}

function TfrmConversor.fnc_Montar_Campo: string;
var
  i, X: Integer;
  vTexto: string;
begin
  Result := '';
  i := pos(';', vRegistro);
  if i = 0 then
    i := Length(vRegistro) + 1;
  Result := Copy(vRegistro, 1, i - 1);
  vTexto := Result;
  Delete(vRegistro, 1, i);
  for X := 1 to Length(vTexto) do
  begin
    if Pos(vTexto[X], '''"') > 0 then
    begin
      vTexto[X] := ' ';
    end;
  end;
  if trim(copy(vTexto, 1, 1)) = '' then
    Delete(vTexto, 1, 1);
  if trim(copy(vTexto, Length(vTexto), 1)) = '' then
    Delete(vTexto, Length(vTexto), 1);
  Result := vTexto;
end;

procedure TfrmConversor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfrmConversor.prc_Gravar_mEvento;
var
  //sds: TSQLDataSet;
  sds: TZReadOnlyQuery;
  vContador: Integer;
  vTexto: string;
begin
  vItem := vItem + 1;
  fDMFolha.mEventos.Insert;
  fDMFolha.mEventosItem.AsInteger := vItem;
  fDMFolha.mEventosDtAtualizacao.AsString := copy(vRegistro, 1, 8);
  fDMFolha.mEventosCod_Funcionario.AsString := copy(vRegistro, 9, 12);
  fDMFolha.mEventosCPF.AsString := copy(vRegistro, 21, 14);
  fDMFolha.mEventosNome_Funcionario.AsString := copy(vRegistro, 35, 70);
  fDMFolha.mEventosDtNascimento.AsString := copy(vRegistro, 105, 8);
  fDMFolha.mEventosDtAdmissao.AsString := copy(vRegistro, 113, 8);
  fDMFolha.mEventosDtDemissao.AsString := copy(vRegistro, 121, 8);
  fDMFolha.mEventosCod_Cargo.AsString := copy(vRegistro, 129, 8);
  fDMFolha.mEventosNome_Cargo.AsString := copy(vRegistro, 137, 30);
  fDMFolha.mEventosCod_Setor.AsString := copy(vRegistro, 167, 8);
  fDMFolha.mEventosNome_Setor.AsString := copy(vRegistro, 175, 30);
  fDMFolha.mEventosSexo_Funcionario.AsString := copy(vRegistro, 205, 1);
  fDMFolha.mEventosQtd_Dependente.AsString := copy(vRegistro, 206, 3);
  fDMFolha.mEventosSit_Funcionario.AsString := copy(vRegistro, 209, 2);
  fDMFolha.mEventosRegime_Juridico.AsString := copy(vRegistro, 211, 1);
  fDMFolha.mEventosNatureza_Cargo.AsString := copy(vRegistro, 212, 1);
  fDMFolha.mEventosRegime_Previd.AsString := copy(vRegistro, 213, 2);
  fDMFolha.mEventosReg_Geral_RG.AsString := copy(vRegistro, 215, 14);
  fDMFolha.mEventosCBO.AsString := copy(vRegistro, 229, 6);
  fDMFolha.mEventosNIT.AsString := copy(vRegistro, 235, 11);
  fDMFolha.mEventosCategoria_Trab.AsString := copy(vRegistro, 246, 2);
  fDMFolha.mEventosEndereco.AsString := copy(vRegistro, 248, 30);
  fDMFolha.mEventosCidade.AsString := copy(vRegistro, 278, 30);
  fDMFolha.mEventosUF.AsString := copy(vRegistro, 308, 2);
  fDMFolha.mEventosCep.AsString := copy(vRegistro, 310, 8);
  fDMFolha.mEventosObs.AsString := copy(vRegistro, 318, 30);

  sds := TZReadOnlyQuery.Create(nil);
  try
    sds.Connection := dmDatabase_EBS.ZConnection1;
    sds.Close;
    sds.SQL.Text := 'select ff.vl_salario, ff.dt_salario, ff.nr_horas_semanais, ff.tipo_salario from funsalario ff ' + ' where ff.cd_funcionario = ' + IntToStr(fDMFolha.mEventosCod_Funcionario.AsInteger) + ' and ff.cd_empresa = 1 ' + ' order by ff.dt_salario desc ' + ' limit 0,1 ';
    sds.Open;
    fDMFolha.mEventosCarga_Horario.AsString := sds.FieldByName('nr_horas_semanais').AsString;
    fDMFolha.mEventosTipo_Carga_Hor.AsString := 'S';

    sds.Close;
    sds.SQL.Text := 'select ff.vl_salario, ff.dt_salario, ff.nr_horas_semanais, ff.tipo_salario from funsalario ff ' + ' where ff.cd_funcionario = ' + IntToStr(fDMFolha.mEventosCod_Funcionario.AsInteger) + ' and ff.cd_empresa = 1 ' + ' order by ff.dt_salario ' + ' limit 0,1 ';
    sds.Open;
    fDMFolha.mEventosSalario_Inicial.AsFloat := sds.FieldByName('vl_salario').AsFloat;

    if (StrToFloat(FormatFloat('0.00', fDMFolha.mEventosSalario_Inicial.AsFloat)) <= 0) and (copy(fDMFolha.mEventosNome_Cargo.AsString, 1, 8) = 'ESTAGIAR') then
    begin
      sds.Close;
      sds.SQL.Text := 'select e.vl_bolsa, e.cd_empresa, e.cd_funcionario from crhfuncionarioestagio e ' + ' where cd_empresa = 1 ' + '  and cd_funcionario = ' + IntToStr(fDMFolha.mEventosCod_Funcionario.AsInteger);
      sds.Open;
      fDMFolha.mEventosSalario_Inicial.AsFloat := sds.FieldByName('vl_bolsa').AsFloat;
    end;

  finally
    FreeAndNil(sds);
  end;

  fDMFolha.mEventosCedido_Adidio.AsString := 'X - Não se aplica';
  fDMFolha.mEventosOnus_Origem.AsString := 'X - Não se aplica';
  fDMFolha.mEventosRessarcimento.AsString := 'X - Não se aplica';
  fDMFolha.mEventosDtMov.AsString := '';
  fDMFolha.mEventosCNPJ_Orgao_Ori.AsString := '';

  fDMFolha.mEventos.Post;

  vTotal_Geral := vTotal_Geral + 1;

  {fDMFolha.mEventos.Insert;
  fDMFolha.mEventosDtAtualizacao.AsString := copy(vRegistro,1,8);
  fDMFolha.mEventosCodEvento.AsString     := copy(vRegistro,9,3);
  fDMFolha.mEventosNome.AsString          := copy(vRegistro,12,45);
  fDMFolha.mEventosContador.AsInteger     := 0;
  //fDMFolha.mEventosBaseLegal.AsString     := trim(copy(vRegistro,57,150));
  fDMFolha.mEventosBaseLegal.AsString     := '';
  fDMFolha.mEventosCodVantagem.AsString   := copy(vRegistro,207,5);

  sds := TZReadOnlyQuery.Create(nil);
  try
    sds.Connection := dmDatabase_EBS.ZConnection1;
    sds.Close;
    if copy(fDMFolha.mEventosNome.AsString,1,21) = '13 SALARIO INDENIZADO' then
      ShowMessage('aqui');

    sds.SQL.Text := 'select cd_evento, descricao, relacionamento from EVENTOG '
                     //+ ' where descricao collate Latin1_General_CI_AI like ' + QuotedStr(fDMFolha.mEventosNome.AsString);
                     + ' where rtrim(descricao) like ' + QuotedStr(fDMFolha.mEventosNome.AsString);
    sds.Open;
    while not sds.Eof do
    begin
      if (trim(sds.FieldByName('relacionamento').AsString) <> '') and not(sds.FieldByName('relacionamento').IsNull) then
      begin
        fDMFolha.mEventosBaseLegal.AsString            := TirarAcento(sds.FieldByName('relacionamento').AsString);
      //fDMFolha.mEventosBaseLegal.AsString            := sds.FieldByName('relacionamento').AsString;
        fDMFolha.mEventosCod_Encontrado.AsInteger      := sds.FieldByName('cd_evento').AsInteger;
        fDMFolha.mEventosDescricao_Encontrada.AsString := TirarAcento(sds.FieldByName('descricao').AsString);
      end;
      fDMFolha.mEventosContador.AsInteger            := fDMFolha.mEventosContador.AsInteger + 1;
      sds.Next;
    end;
    if (fDMFolha.mEventosContador.AsInteger > 0) and (trim(fDMFolha.mEventosBaseLegal.AsString) = '') then
      vTotal_NaoPreenchido := vTotal_NaoPreenchido + 1
    else
    if (fDMFolha.mEventosContador.AsInteger = 0) then
      vTotal_NaoEncontrado := vTotal_NaoEncontrado + 1
    else
      vTotal_Correto := vTotal_Correto + 1;
    vTotal_Geral := vTotal_Geral + 1;
  finally
    FreeAndNil(sds);
  end;
  fDMFolha.mEventos.Post;}
end;

function TfrmConversor.Monta_Numero(Campo: string; Tamanho: Integer): string;
var
  texto2: string;
  i: Integer;
begin
  texto2 := '';
  for i := 1 to Length(Campo) do
    if Campo[i] in ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'] then
      texto2 := texto2 + Copy(Campo, i, 1);
  for i := 1 to Tamanho - Length(texto2) do
    texto2 := '0' + texto2;
  Result := texto2;
end;

procedure TfrmConversor.FormCreate(Sender: TObject);
begin
  fDMFolha := TDMFolha.Create(Self);
  oDBUtils.SetDataSourceProperties(Self, fDMFolha);
end;

function TfrmConversor.fnc_verifica_Arquivo(NomeArquivo: string): string;
begin
  if copy(NomeArquivo, 1, 1) = '"' then
    delete(NomeArquivo, 1, 1);
  if copy(NomeArquivo, Length(NomeArquivo), 1) = '"' then
    delete(NomeArquivo, Length(NomeArquivo), 1);
  Result := NomeArquivo;
end;

function TfrmConversor.Replace(Str, Ant, Novo: string): string;
var
  iPos: Integer;
begin
  while Pos(Ant, Str) > 0 do
  begin
    iPos := Pos(Ant, Str);
    Str := copy(Str, 1, iPos - 1) + Novo + copy(Str, iPos + 1, Length(Str) - iPos);
  end;
  Result := Str;
end;

function TfrmConversor.fnc_Verifica_Casas_Decimais(Campo: string): string;
var
  i, x: Integer;
  vTexto2: string;
begin
  Result := '';
  i := pos(',', Campo);
  if i > 0 then
    i := Length(Campo) - i;
  if i < 2 then
  begin
    for x := 1 to 2 - i do
      result := result + '0';
  end;
end;

procedure TfrmConversor.btnLeClick(Sender: TObject);
begin
  {if trim(File_TCE4960.Text) = '' then
  begin
    MessageDlg('Arquivo não informado', mtInformation, [mbOk], 0);
    exit;
  end;
  vArquivo := fnc_verifica_Arquivo(File_TCE4960.Text);
  if not FileExists(vArquivo)then
  begin
    MessageDlg('Arquivo não encontrado', mtInformation, [mbOk], 0);
    exit;
  end;
  vHeader_4960   := '';
  vTrailler_4960 := '';
  vTotal_NaoEncontrado := 0;
  vTotal_NaoPreenchido := 0;
  vTotal_Correto       := 0;
  vTotal_Geral         := 0;
  fDMFolha.mEventos.EmptyDataSet;
  AssignFile(Txt,vArquivo);
  try
    Reset(Txt);
    while not Eof(txt) do
    begin
      ReadLn(Txt,vRegistro);
      if vHeader_4960 = '' then
        vHeader_4960 := vRegistro
      else
      if copy(vRegistro,1,11) = 'FINALIZADOR' then
        vTrailler_4960 := vRegistro
      else
      if vTrailler_4960 = '' then
        prc_Gravar_mEvento;
    end;
  finally
    CloseFile(Txt);
  end;
  Label4.Caption  := FormatFloat('0',vTotal_NaoPreenchido);
  Label6.Caption  := FormatFloat('0',vTotal_NaoEncontrado);
  Label8.Caption  := FormatFloat('0',vTotal_Geral);
  Label10.Caption := FormatFloat('0',vTotal_Correto);
  MessageDlg('Arquivo carregado na tela!', mtInformation, [mbOk], 0);}
end;

procedure TfrmConversor.btnGravarClick(Sender: TObject);
begin
  vArquivo := fnc_verifica_Arquivo(File_TCE4960.Text);
  AssignFile(Txt, vArquivo);
  Rewrite(Txt);
  Writeln(txt, vHeader_4960);
  fDMFolha.mEventos.First;
  while not fDMFolha.mEventos.Eof do
  begin
    prc_Montar_Arquivo_TCE4960;
    fDMFolha.mEventos.Next;
  end;
  Writeln(txt, vTrailler_4960);
  CloseFile(Txt);
  fDMFolha.mEventos.EmptyDataSet;
  MessageDlg('Arquivo TCE 4960 gravado!', mtInformation, [mbOk], 0);
end;

procedure TfrmConversor.prc_Montar_Arquivo_TCE4960;
var
  vTexto: string;
  vTexto2: string;
  i: Integer;
begin
  vTexto := fDMFolha.mEventosDtAtualizacao.AsString;
  vTexto2 := fDMFolha.mEventosCod_Funcionario.AsString;
  for i := 1 to 12 - Length(fDMFolha.mEventosCod_Funcionario.AsString) do
    vTexto2 := '0' + fDMFolha.mEventosCod_Funcionario.AsString;
  vTexto := vTexto + vTexto2;
  vTexto2 := fDMFolha.mEventosCPF.AsString;
  for i := 1 to 14 - Length(vTexto2) do
    vTexto2 := '0' + vTexto2;
  vTexto := vTexto + vTexto2;

  vTexto2 := fDMFolha.mEventosNome_Funcionario.AsString;
  for i := 1 to 70 - Length(vTexto2) do
    vTexto2 := vTexto2 + ' ';
  vTexto := vTexto + vTexto2;

  vTexto2 := fDMFolha.mEventosDtNascimento.AsString;
  for i := 1 to 8 - Length(vTexto2) do
    vTexto2 := '0' + vTexto2;
  vTexto := vTexto + vTexto2;

  vTexto2 := fDMFolha.mEventosDtAdmissao.AsString;
  for i := 1 to 8 - Length(vTexto2) do
    vTexto2 := '0' + vTexto2;
  vTexto := vTexto + vTexto2;

  vTexto2 := fDMFolha.mEventosDtDemissao.AsString;
  for i := 1 to 8 - Length(vTexto2) do
    vTexto2 := '0' + vTexto2;
  vTexto := vTexto + vTexto2;

  vTexto2 := fDMFolha.mEventosCod_Cargo.AsString;
  for i := 1 to 8 - Length(vTexto2) do
    vTexto2 := '0' + vTexto2;
  vTexto := vTexto + vTexto2;

  vTexto2 := fDMFolha.mEventosNome_Cargo.AsString;
  for i := 1 to 30 - Length(vTexto2) do
    vTexto2 := vTexto2 + ' ';
  vTexto := vTexto + vTexto2;

  vTexto2 := fDMFolha.mEventosCod_Setor.AsString;
  for i := 1 to 8 - Length(vTexto2) do
    vTexto2 := '0' + vTexto2;
  vTexto := vTexto + vTexto2;

  vTexto2 := fDMFolha.mEventosNome_Setor.AsString;
  for i := 1 to 30 - Length(vTexto2) do
    vTexto2 := vTexto2 + ' ';
  vTexto := vTexto + vTexto2;

  vTexto2 := fDMFolha.mEventosSexo_Funcionario.AsString;
  for i := 1 to 1 - Length(vTexto2) do
    vTexto2 := '0' + vTexto2;
  vTexto := vTexto + vTexto2;

  vTexto2 := fDMFolha.mEventosQtd_Dependente.AsString;
  for i := 1 to 3 - Length(vTexto2) do
    vTexto2 := '0' + vTexto2;
  vTexto := vTexto + vTexto2;

  vTexto2 := fDMFolha.mEventosSit_Funcionario.AsString;
  for i := 1 to 2 - Length(vTexto2) do
    vTexto2 := '0' + vTexto2;
  vTexto := vTexto + vTexto2;

  vTexto2 := fDMFolha.mEventosRegime_Juridico.AsString;
  for i := 1 to 1 - Length(vTexto2) do
    vTexto2 := vTexto2 + ' ';
  vTexto := vTexto + vTexto2;

  vTexto2 := fDMFolha.mEventosNatureza_Cargo.AsString;
  for i := 1 to 1 - Length(vTexto2) do
    vTexto2 := vTexto2 + ' ';
  vTexto := vTexto + vTexto2;

  vTexto2 := fDMFolha.mEventosRegime_Previd.AsString;
  for i := 1 to 2 - Length(vTexto2) do
    vTexto2 := '0' + vTexto2;
  vTexto := vTexto + vTexto2;

  vTexto2 := fDMFolha.mEventosReg_Geral_RG.AsString;
  for i := 1 to 14 - Length(vTexto2) do
    vTexto2 := '0' + vTexto2;
  vTexto := vTexto + vTexto2;

  vTexto2 := fDMFolha.mEventosCBO.AsString;
  for i := 1 to 6 - Length(vTexto2) do
    vTexto2 := '0' + vTexto2;
  vTexto := vTexto + vTexto2;

  vTexto2 := fDMFolha.mEventosNIT.AsString;
  for i := 1 to 11 - Length(vTexto2) do
    vTexto2 := '0' + vTexto2;
  vTexto := vTexto + vTexto2;

  vTexto2 := fDMFolha.mEventosCategoria_Trab.AsString;
  for i := 1 to 2 - Length(vTexto2) do
    vTexto2 := '0' + vTexto2;
  vTexto := vTexto + vTexto2;

  vTexto2 := fDMFolha.mEventosEndereco.AsString;
  for i := 1 to 30 - Length(vTexto2) do
    vTexto2 := vTexto2 + ' ';
  vTexto := vTexto + vTexto2;

  vTexto2 := fDMFolha.mEventosCidade.AsString;
  for i := 1 to 30 - Length(vTexto2) do
    vTexto2 := vTexto2 + ' ';
  vTexto := vTexto + vTexto2;

  vTexto2 := fDMFolha.mEventosUF.AsString;
  for i := 1 to 2 - Length(vTexto2) do
    vTexto2 := vTexto2 + ' ';
  vTexto := vTexto + vTexto2;

  vTexto2 := fDMFolha.mEventosCep.AsString;
  for i := 1 to 8 - Length(vTexto2) do
    vTexto2 := '0' + vTexto2;
  vTexto := vTexto + vTexto2;

  vTexto2 := fDMFolha.mEventosObs.AsString;
  for i := 1 to 30 - Length(vTexto2) do
    vTexto2 := vTexto2 + ' ';
  vTexto := vTexto + vTexto2;

  vTexto2 := fDMFolha.mEventosCarga_Horario.AsString;
  for i := 1 to 3 - Length(vTexto2) do
    vTexto2 := '0' + vTexto2;
  vTexto := vTexto + vTexto2;

  vTexto2 := copy(fDMFolha.mEventosTipo_Carga_Hor.AsString, 1, 1);
  for i := 1 to 1 - Length(vTexto2) do
    vTexto2 := vTexto2 + ' ';
  vTexto := vTexto + vTexto2;

  vTexto2 := copy(fDMFolha.mEventosCedido_Adidio.AsString, 1, 1);
  for i := 1 to 1 - Length(vTexto2) do
    vTexto2 := vTexto2 + ' ';
  vTexto := vTexto + vTexto2;

  vTexto2 := copy(fDMFolha.mEventosOnus_Origem.AsString, 1, 1);
  for i := 1 to 1 - Length(vTexto2) do
    vTexto2 := vTexto2 + ' ';
  vTexto := vTexto + vTexto2;

  vTexto2 := copy(fDMFolha.mEventosRessarcimento.AsString, 1, 1);
  for i := 1 to 1 - Length(vTexto2) do
    vTexto2 := vTexto2 + ' ';
  vTexto := vTexto + vTexto2;

  vTexto2 := fDMFolha.mEventosDtMov.AsString;
  for i := 1 to 8 - Length(vTexto2) do
    vTexto2 := '0' + vTexto2;
  vTexto := vTexto + vTexto2;

  vTexto2 := fDMFolha.mEventosCNPJ_Orgao_Ori.AsString;
  for i := 1 to 14 - Length(vTexto2) do
    vTexto2 := '0' + vTexto2;
  vTexto := vTexto + vTexto2;

  vTexto2 := FormatFloat('0.00', fDMFolha.mEventosSalario_Inicial.AsFloat);
  vTexto2 := Monta_Numero(vTexto2, 0);
  for i := 1 to 17 - Length(vTexto2) do
    vTexto2 := '0' + vTexto2;
  vTexto := vTexto + vTexto2;

  Writeln(txt, vTexto);
end;

function TfrmConversor.TirarAcento(texto: string): string;
var
  i: Integer;
begin
  texto := Trim(AnsiUpperCase(texto));
  for i := 1 to Length(texto) do
  begin
    if Pos(texto[i], ' 0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ`~''"!@#$%^&*()_-+=|/\{}[]:;,.<>') = 0 then
    begin
      case texto[i] of
        'Á', 'À', 'Â', 'Ä', 'Ã':
          texto[i] := 'A';
        'É', 'È', 'Ê', 'Ë':
          texto[i] := 'E';
        'Í', 'Ì', 'Î', 'Ï':
          texto[i] := 'I';
        'Ó', 'Ò', 'Ô', 'Ö', 'Õ':
          texto[i] := 'O';
        'Ú', 'Ù', 'Û', 'Ü':
          texto[i] := 'U';
        'Ç':
          texto[i] := 'C';
        'Ñ':
          texto[i] := 'N';
      else
        texto[i] := ' ';
      end;
    end;
  end;
  texto := StringReplace(texto, '&', 'e', [rfReplaceAll, rfIgnoreCase]);
  Result := AnsiUpperCase(texto);
end;

procedure TfrmConversor.SMDBGrid1GetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  {if not(fDMFolha.mEventos.IsEmpty) and (trim(fDMFolha.mEventosBaseLegal.AsString) = '') then
  begin
    if (fDMFolha.mEventosContador.AsInteger > 0) then
    begin
      Background  := clRed;
      AFont.Color := clWhite;
    end
    else
    if fDMFolha.mEventosContador.AsInteger = 0 then
      Background := clYellow;
  end;}
end;

procedure TfrmConversor.NxButton1Click(Sender: TObject);
var
  AStrings: TStrings;
  vFlag: Boolean;
  vCol: Integer;
  mStream: TMemoryStream;
  Cont: Integer;
begin
  if trim(File_TCE4960.Text) = '' then
  begin
    MessageDlg('Arquivo não informado', mtInformation, [mbOk], 0);
    exit;
  end;
  vArquivo := fnc_verifica_Arquivo(File_TCE4960.Text);
  if not FileExists(vArquivo) then
  begin
    MessageDlg('Arquivo não encontrado', mtInformation, [mbOk], 0);
    exit;
  end;

  fDMFolha.mEventos.EmptyDataSet;
  AStrings := TStringList.Create;
  AStrings.Clear;
  //mStream  := TMemoryStream.Create;
  //mStream.Position := 0;
  //mStream.LoadFromFile(File_TCE4960.Text);
  //vArquivo := ExtractFilePath(File_TCE4960.Text) + 'TCE_4820_N.TXT';
  //mStream.SaveToFile(vArquivo);

  AStrings.LoadFromFile(vArquivo);
  AStrings.Text := trim(AStrings[2]);

  vFlag := False;
  vCol := 1;
  while not vFlag do
  begin
    if vHeader_4960 = '' then
    begin
      vHeader_4960 := copy(AStrings.Text, vCol, 130);
      vCol := vCol + 130;
    end
    else if copy(AStrings.Text, vCol, 11) = 'FINALIZADOR' then
    begin
      vTrailler_4960 := copy(AStrings.Text, vCol, 21);
      vFlag := True;
    end
    else if vTrailler_4960 = '' then
    begin
      vRegistro := copy(AStrings.Text, vCol, 347);
      vCol := vCol + 347;
      if trim(vRegistro) = '' then
        vFlag := True;
      prc_Gravar_mEvento;
    end;
    if trim(vTrailler_4960) <> '' then
      vFlag := True;
  end;


  {vHeader_4960   := '';
  vTrailler_4960 := '';
  vTotal_NaoEncontrado := 0;
  vTotal_NaoPreenchido := 0;
  vTotal_Correto       := 0;
  vTotal_Geral         := 0;
  fDMFolha.mEventos.EmptyDataSet;
  AssignFile(Txt,vArquivo);
  try
    Reset(Txt);
    while not Eof(txt) do
    begin
      ReadLn(Txt,vRegistro);
      if vHeader_4960 = '' then
        vHeader_4960 := vRegistro
      else
      if copy(vRegistro,1,11) = 'FINALIZADOR' then
        vTrailler_4960 := vRegistro
      else
      if vTrailler_4960 = '' then
        prc_Gravar_mEvento;
    end;
  finally
    CloseFile(Txt);
  end;
  Label4.Caption  := FormatFloat('0',vTotal_NaoPreenchido);
  Label6.Caption  := FormatFloat('0',vTotal_NaoEncontrado);
  Label8.Caption  := FormatFloat('0',vTotal_Geral);
  Label10.Caption := FormatFloat('0',vTotal_Correto);
  MessageDlg('Arquivo carregado na tela!', mtInformation, [mbOk], 0);}

end;

procedure TfrmConversor.NxButton2Click(Sender: TObject);
var
  AStrings: TStrings;
  i: Integer;
begin
  if trim(File_TCE4960.Text) = '' then
  begin
    MessageDlg('Arquivo não informado', mtInformation, [mbOk], 0);
    exit;
  end;
  vArquivo := fnc_verifica_Arquivo(File_TCE4960.Text);
  if not FileExists(vArquivo) then
  begin
    MessageDlg('Arquivo não encontrado', mtInformation, [mbOk], 0);
    exit;
  end;

  fDMFolha.mEventos.EmptyDataSet;
  AStrings := TStringList.Create;

  try
    AStrings.Clear;
    AStrings.LoadFromFile(vArquivo);
    i := 0;
    ProgressBar1.Visible := True;
    ProgressBar1.Max := AStrings.Count;
    ProgressBar1.Position := 0;
    while i < AStrings.Count do
    begin
      vRegistro := AStrings[i];
      ProgressBar1.Position := ProgressBar1.Position + 1;
      if vHeader_4960 = '' then
        vHeader_4960 := vRegistro
      else if copy(vRegistro, 1, 11) = 'FINALIZADOR' then
        vTrailler_4960 := vRegistro
      else if vTrailler_4960 = '' then
        prc_Gravar_mEvento;
      i := i + 1;
    end;
  finally
    FreeAndNil(AStrings);
  end;

  ProgressBar1.Visible := False;

  Label8.Caption := FormatFloat('0', vTotal_Geral);
  MessageDlg('Arquivo carregado na tela!', mtConfirmation, [mbOk], 0);
end;

procedure TfrmConversor.NxButton6Click(Sender: TObject);
begin
  if RxDBLookupCombo1.Text = '' then
  begin
    MessageDlg('Empresa não informada!', mtError, [mbOk], 0);
    RxDBLookupCombo1.SetFocus;
    Exit;
  end;
  if cbxMesIni.ItemIndex < 0 then
  begin
    MessageDlg('Mês não informado!', mtError, [mbOk], 0);
    cbxMesIni.SetFocus;
    Exit;
  end;
  if ceAnoIni.AsInteger <= 2000 then
  begin
    MessageDlg('Ano inválido!', mtError, [mbOk], 0);
    ceAnoIni.SetFocus;
    Exit;
  end;
  fDMFolha.mPagtoPos.EmptyDataSet;
  prc_Abrir_Valores;
  prc_Le_Valores;
end;

procedure TfrmConversor.prc_Abrir_Valores;
begin
  fDMFolha.cdsValores.Close;
  fDMFolha.sdsValores.SQL.Text := 'SELECT pro.tipo, fun.cd_funcionario COD_FUNCIONARIO, fun.nome NOME, ' + 'ffun.nr_agencia_deposito AGENCIA, ffun.cd_banco_deposito, ' + 'concat(cast(ffun.nr_conta_deposito  as char(9)),ffun.dv_conta_deposito) as CONTA_CORRENTE, ' + 'sum(pro.valor) valor, eve.tp_evento ' + 'FROM procevento pro ' + ' INNER JOIN funcionario fun ON fun.cd_funcionario = pro.cd_funcionario ' + '  and  fun.cd_empresa = ' + IntToStr(RxDBLookupCombo1.KeyValue) +
    ' INNER JOIN eventog eve ON eve.cd_evento = pro.cd_evento ' + ' LEFT JOIN funfuncional ffun ON ffun.cd_funcionario = fun.cd_funcionario ' + '  and ffun.cd_empresa = ' + IntToStr(RxDBLookupCombo1.KeyValue) + ' WHERE pro.mes = ' + IntToStr(cbxMesIni.ItemIndex) + ' AND pro.ano = ' + ceAnoIni.Text + ' AND pro.tipo = ' + QuotedStr(IntToStr(cbxTipo.ItemIndex + 1)) + ' AND pro.cd_empresa = ' + IntToStr(RxDBLookupCombo1.KeyValue) + ' AND (eve.tp_evento = ' + QuotedStr('V') + ' or eve.tp_evento = ' + QuotedStr('D') + ') ' + 'group by pro.tipo, fun.cd_funcionario, fun.nome,  ffun.nr_agencia_deposito, ' + 'ffun.nr_conta_deposito, ffun.dv_conta_deposito, eve.tp_evento   , ffun.cd_banco_deposito ';
  fDMFolha.cdsValores.Open;

end;

procedure TfrmConversor.prc_Le_Valores;
var
  sds: TZReadOnlyQuery;
begin
  sds := TZReadOnlyQuery.Create(nil);
  try
    fDMFolha.cdsValores.First;
    while not fDMFolha.cdsValores.Eof do
    begin
      fDMFolha.mPagtoPos.Insert;
      if fDMFolha.mPagtoPos.Locate('Cod_Funcionario', fDMFolha.cdsValoresCOD_FUNCIONARIO.AsInteger, [loCaseInsensitive]) then
        fDMFolha.mPagtoPos.Edit
      else
      begin
        fDMFolha.mPagtoPos.Insert;
        fDMFolha.mPagtoPosIdentificador.AsString := IntToStr(cbxMesIni.ItemIndex + 1);
        fDMFolha.mPagtoPosCod_Funcionario.AsInteger := fDMFolha.cdsValoresCOD_FUNCIONARIO.AsInteger;
        fDMFolha.mPagtoPosCod_Banco.AsString := fDMFolha.cdsValorescd_banco_deposito.AsString;
        fDMFolha.mPagtoPosCod_Agencia.AsString := fDMFolha.cdsValoresAGENCIA.AsString;
        fDMFolha.mPagtoPosConta_Corrente.AsString := fDMFolha.cdsValoresCONTA_CORRENTE.AsString;
        fDMFolha.mPagtoPosUltimo_Pagamento.AsString := 'N';

        sds.Close;
        sds.SQL.Text := 'SELECT pb.dt_pagamento FROM procbase pb ' + ' where pb.cd_empresa = ' + IntToStr(RxDBLookupCombo1.KeyValue) + ' and pb.cd_funcionario = ' + IntToStr(fDMFolha.cdsValoresCOD_FUNCIONARIO.AsInteger) + ' and pb.mes = ' + IntToStr(cbxMesIni.ItemIndex + 1) + ' and pb.ano = ' + ceAnoIni.Text + ' and pb.tipo = ' + QuotedStr(IntToStr(cbxTipo.ItemIndex + 1));
        sds.Open;
        if not sds.IsEmpty then
          fDMFolha.mPagtoPosDtPagamento.AsDateTime := sds.FieldByName('dt_pagamento').AsDateTime;
        fDMFolha.mPagtoPosValor_Pago.AsFloat := 0;
      end;
      if fDMFolha.cdsValorestp_evento.AsString = 'D' then
        fDMFolha.mPagtoPosValor_Pago.AsFloat := StrToFloat(FormatFloat('0.00', fDMFolha.mPagtoPosValor_Pago.AsFloat - fDMFolha.cdsValoresvalor.AsFloat))
      else
        fDMFolha.mPagtoPosValor_Pago.AsFloat := StrToFloat(FormatFloat('0.00', fDMFolha.mPagtoPosValor_Pago.AsFloat + fDMFolha.cdsValoresvalor.AsFloat));
      fDMFolha.mPagtoPos.Post;
      fDMFolha.cdsValores.Next;
    end;

  finally
    FreeAndNil(sds);

  end;
  MessageDlg('Consulta gerada', mtConfirmation, [mbOk], 0);

end;

procedure TfrmConversor.NxButton4Click(Sender: TObject);
begin
  if Trim(DirectoryEdit1.Text) = '' then
  begin
    MessageDlg('Local de gravação do arquivo PAGTO_POS.TXT não informado!', mtError, [mbOk], 0);
    DirectoryEdit1.SetFocus;
    Exit;
  end;
  vArquivo := DirectoryEdit1.Text;
  if copy(vArquivo, 1, 1) = '"' then
    delete(vArquivo, 1, 1);
  if copy(vArquivo, Length(vArquivo), 1) = '"' then
    delete(vArquivo, Length(vArquivo), 1);
  if copy(vArquivo, Length(vArquivo), 1) <> '\' then
    vArquivo := vArquivo + '\';
  vArquivo := vArquivo + 'PAGTO_POS.TXT';
  AssignFile(Txt, vArquivo);
  Rewrite(Txt);

  fDMFolha.mPagtoPos.First;
  while not fDMFolha.mPagtoPos.Eof do
  begin
    prc_Montar_Arquivo_Pagto_Pos;

    fDMFolha.mPagtoPos.Next;
  end;
  CloseFile(Txt);
  MessageDlg('Arquivo PAGTO_POS.TXT gerados!', mtConfirmation, [mbOk], 0);
end;

procedure TfrmConversor.prc_Montar_Arquivo_Pagto_Pos;
var
  vTexto: string;
  vTexto2: string;
  i: Integer;
begin
  // Identificador    Tam 12   - 1 a 12
  vTexto := ceAnoIni.Text;
  vTexto2 := fDMFolha.mPagtoPosIdentificador.AsString;
  for i := 1 to 8 - Length(fDMFolha.mPagtoPosIdentificador.AsString) do
    vTexto2 := '0' + vTexto2;
  vTexto := vTexto + vTexto2;

  // Cód. Funcionário   Tam 12   - 13 a 24
  vTexto2 := fDMFolha.mPagtoPosCod_Funcionario.AsString;
  for i := 1 to 12 - Length(fDMFolha.mPagtoPosCod_Funcionario.AsString) do
    vTexto2 := '0' + vTexto2;
  vTexto := vTexto + vTexto2;

  // Data de Pagamentto   Tam 8   - 25 a 32
  vTexto2 := Monta_Numero(fDMFolha.mPagtoPosDtPagamento.AsString, 0);
  vTexto := vTexto + vTexto2;

  // Valor Pago    Tam 17   - 33 a 49
  vTexto2 := FormatFloat('0.00', fDMFolha.mPagtoPosValor_Pago.AsFloat);
  vTexto2 := Monta_Numero(vTexto2, 0);
  for i := 1 to 17 - Length(vTexto2) do
    vTexto2 := '0' + vTexto2;
  vTexto := vTexto + vTexto2;
  
  // Código do Banco    Tam 5   - 50 a 54
  vTexto2 := Monta_Numero(fDMFolha.mPagtoPosCod_Banco.AsString, 0);
  for i := 1 to 5 - Length(vTexto2) do
    vTexto2 := '0' + vTexto2;
  vTexto := vTexto + vTexto2;

  // Código da Agência  Tam 5   - 55 a 59
  vTexto2 := Monta_Numero(fDMFolha.mPagtoPosCod_Agencia.AsString, 0);
  for i := 1 to 5 - Length(vTexto2) do
    vTexto2 := '0' + vTexto2;
  vTexto := vTexto + vTexto2;

  // Código da Conta Corrente  Tam 20   - 60 a 79
  vTexto2 := Monta_Numero(fDMFolha.mPagtoPosConta_Corrente.AsString, 0);
  for i := 1 to 20 - Length(vTexto2) do
    vTexto2 := '0' + vTexto2;
  vTexto := vTexto + vTexto2;

  // Último Pagamento  Tam 1   - 80 a 80
  vTexto := vTexto + fDMFolha.mPagtoPosUltimo_Pagamento.AsString;

  Writeln(txt, vTexto);
end;

end.

