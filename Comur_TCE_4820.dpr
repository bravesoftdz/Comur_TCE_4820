program Comur_TCE_4820;

uses
  Forms,
  UConversor in 'UConversor.pas' {frmConversor},
  DmdDatabase_EBS in 'DmdDatabase_EBS.pas' {dmDatabase_EBS: TDataModule},
  UDMFolha in 'UDMFolha.pas' {DMFolha: TDataModule},
  rsDBUtils in '..\..\rslib\nova\rsDBUtils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Comur_TCE';
  Application.CreateForm(TdmDatabase_EBS, dmDatabase_EBS);
  Application.CreateForm(TfrmConversor, frmConversor);
  Application.Run;
end.
