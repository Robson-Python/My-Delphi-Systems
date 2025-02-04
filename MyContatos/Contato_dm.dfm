object dmContato: TdmContato
  OldCreateOrder = False
  Height = 190
  Width = 317
  object fdcContato: TFDConnection
    Params.Strings = (
      
        'Database=E:\Robson\Documents\Embarcadero\Studio\Projects\Contato' +
        '\Contato DB\CONTATO.db3'
      'LockingMode=Normal'
      'DriverID=SQLite')
    UpdateOptions.AssignedValues = [uvAutoCommitUpdates]
    Connected = True
    LoginPrompt = False
    Left = 48
    Top = 40
  end
  object fdqContato: TFDQuery
    Connection = fdcContato
    Left = 128
    Top = 40
  end
  object frxDBRelatorios: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    DataSet = fdqContato
    BCDToCurrency = False
    Left = 212
    Top = 40
  end
  object FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink
    Left = 80
    Top = 104
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 208
    Top = 104
  end
end
