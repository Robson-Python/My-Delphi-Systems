object dmCarroComando: TdmCarroComando
  OldCreateOrder = False
  Left = 192
  Top = 114
  Height = 115
  Width = 275
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 200
    Top = 24
  end
  object ZConnection1: TZConnection
    ControlsCodePage = cGET_ACP
    UTF8StringsAsWideField = False
    Properties.Strings = (
      'AutoEncodeStrings=ON')
    Connected = True
    Port = 0
    Database = 
      'D:\Robson\Meus Documentos\Meus Programas\Confinamento - Pasto\Co' +
      'nfinamento - Banco de Dados\CONFINAMENTO.db3'
    Protocol = 'sqlite-3'
    LibraryLocation = 
      'D:\Robson\Programas\SQLite\sqlite-dll-win32-x86-3071602\sqlite3.' +
      'dll'
    Left = 40
    Top = 24
  end
  object ADOQuery1: TZQuery
    Connection = ZConnection1
    Params = <>
    Left = 120
    Top = 24
  end
end
