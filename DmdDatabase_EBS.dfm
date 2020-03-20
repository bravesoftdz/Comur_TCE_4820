object dmDatabase_EBS: TdmDatabase_EBS
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 350
  Top = 178
  Height = 342
  Width = 670
  object ZConnection1: TZConnection
    Protocol = 'mysql-4.1'
    HostName = 'desenvolvimento1'
    Port = 5003
    Database = 'sage_gestao_contabil'
    User = 'sa'
    Password = 'S@geBr.2014'
    Left = 232
    Top = 48
  end
end
