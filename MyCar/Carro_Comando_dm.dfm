object dmCarroComando: TdmCarroComando
  OldCreateOrder = False
  Left = 192
  Top = 114
  Height = 115
  Width = 275
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=MSDASQL.1;Persist Security Info=False;Data Source=Carro' +
      ' Comando'
    LoginPrompt = False
    Provider = 'MSDASQL.1'
    Left = 32
    Top = 24
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    Left = 120
    Top = 24
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 200
    Top = 24
  end
end
