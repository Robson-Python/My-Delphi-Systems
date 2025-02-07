object frmBackup: TfrmBackup
  Left = 192
  Top = 113
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'MyContatos - Backup/Restore'
  ClientHeight = 280
  ClientWidth = 456
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 441
    Height = 265
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 32
      Width = 104
      Height = 14
      Caption = 'D:\Robson\Desktop'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 168
      Top = 32
      Width = 104
      Height = 14
      Caption = 'D:\Robson\Desktop'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 16
      Top = 8
      Width = 75
      Height = 22
      Caption = 'Origem:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -19
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 168
      Top = 8
      Width = 78
      Height = 22
      Caption = 'Destino:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -19
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DriveComboBox1: TDriveComboBox
      Left = 16
      Top = 200
      Width = 145
      Height = 20
      DirList = dir_1
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object dir_1: TDirectoryListBox
      Left = 16
      Top = 48
      Width = 145
      Height = 145
      DirLabel = Label1
      FileList = file_1
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
    object DriveComboBox2: TDriveComboBox
      Left = 168
      Top = 200
      Width = 145
      Height = 20
      DirList = dir_2
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
    end
    object dir_2: TDirectoryListBox
      Left = 168
      Top = 48
      Width = 145
      Height = 145
      DirLabel = Label2
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
    end
    object btnDestino: TBitBtn
      Left = 168
      Top = 228
      Width = 137
      Height = 29
      Cursor = crHandPoint
      Hint = 'Cria a Pasta onde vai ser Criada ou Restaurada a C'#243'pia'
      Caption = 'Criar Diret'#243'rio'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Glyph.Data = {
        06080000424D060800000000000036000000280000001A000000190000000100
        180000000000D007000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000079A7B8457384426C7963808900000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        74B7D07AB9CE4D869B3F74883C64704768715E7A810000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000062B4D3BDFFFF95DAF578D8FC67D9FF6B
        DAFF67CCF260BDDE58ACC83D7F92386E7F3A647141616C000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        6CBDDE9CDFF6A5E9FF81DBFD72DDFF72DDFF78DCFE7ADCFE7BDDFB77D5F265C3
        E057B3D049A2BD29718927667A2D617200000000000000000000000000000000
        000000000000000000000000000000007FD3F680C6DEB0F6FF88E1FC7CE2FF7C
        E2FF7CE1FF7CE2FF7CE2FF76E2FF75E2FF6FE2FF71E2FF69CBE960BAD359A7BE
        46879C0000000000000000000000000000000000000000000000000000000000
        78D1F661AEC9B3FFFF8DE5FD82E6FE81E7FE81E6FF81E6FF81E6FF7FE6FF7FE6
        FF7DE6FF7DE7FF82E6FF84E6FE86E6FE79D7F400000000000000000000000000
        0000000000000000000000000000000079D4FB57B8DE6FCCEBACFAFF90F0FD8A
        F2FF8CF1FF89F0FF89F0FF8AEFFE89F0FF89F0FF89F1FE89F0FF89F0FF89EFFF
        78DBF1447F8F0000000000000000000000000000000000000000000000000000
        79D8FF57C0EB51B2D6B8FFFF98F5FE8FF6FF8FF5FF8FF6FF8FF6FF8FF5FF8FF6
        FF8FF6FF8FF6FF8FF6FF8FF6FF91F5FF7EDCEF77BDCE2F5F6B00000000000000
        0000000000000000000000000000000074DAFF59C5F44FB1D9AFF4FF9DF9FE94
        FBFE94FAFF94FAFF94FAFF94FAFF94FAFF94FAFF94FBFE93F9FE94FAFF98FAFF
        83DDEEA2F0FF37727C0000000000000000000000000000000000000000000000
        71D7FF5DC9F95EC0EA8AD3E9A9FBFFA3FDFEA1FCFFA0FDFF9EFEFE9CFDFF9CFD
        FF9CFDFF9CFEFE9CFDFF9CFDFFA0FCFF88DDECAFFDFF77B4BE425F6400000000
        0000000000000000000000000000000083DEFF70D4FE72D4FC5FB6D8BFFFFFC1
        FFFFBCFFFFB8FFFFB6FFFFB4FDFFB4FEFFB3FFFEB3FFFEB3FFFEB3FFFEB4FEFF
        96DEEAC9FDFFCFFEFF70A1AB0000000000000000000000000000000000DBF7FE
        8AE3FF78D9FD76DAFD78DBFB55B4CE69C6DF67C1D979CEE499E8FBCCFFFFCBFE
        FFC5FEFFC1FFFFC1FEFFC1FFFFC0FFFF9EDDEBD7FFFFD9FFFFA6D8E43B657200
        00000000000000000000000000C1DEE790E6FF82E3FF7DE4FF7BE3FF77E4FF79
        E4FF7FE3FF77D6F077CDE388C3D2CDFFFFC8FFFFC8FFFFCAFEFFCCFFFFCCFFFF
        A8DCE8E1FEFFE2FFFFD1FEFF678F9B0000000000000000000000000000BADDE7
        A0F2FF93F3FF8EF4FF8EF4FF8EF4FF8EF4FF8EF4FF8EF4FF8EF4FF8CF3FF83E2
        F168B7C486CCD992CFD9A9E2EBB5E8F2D3FFFFE8FFFFECFFFFE4FFFFDAF9FF00
        00000000000000000000000000BDDEE7A9F7FF9AFAFF95FBFF95FBFF96FCFF95
        FBFF94FAFF95FBFF96FCFF96FCFF97FBFF9AFAFF9DF8FF9AF5FA88E3EA7DD7E2
        52A5BA8BB8C6A2C5D2A6CCD8C0E6F20000000000000000000000000000BEDBE2
        ACF8FF9EFCFF97FEFF97FEFF97FEFF9AFEFF9EFDFFA1FEFF9EFCFF9EFCFF9EFC
        FF9EFCFF9EFCFF9CFDFF97FDFF97FBFF55B2C9A6D5E3DFFFFFD1F1FCC3E1EC00
        00000000000000000000000000000000B2FBFFA0FCFF99FFFE99FFFE99FFFEA0
        FDFEAFFBFFB7FCFFB3FEFFAAFCFFA9FCFFABFBFFACFAFFAAFCFDA5FCFEA5FAFF
        64B2C3BCD8DF0000000000000000000000000000000000000000000000000000
        90CBDBBEFFFFB8FFFFB3FDFFB8FCFFC1FFFFAEE5F26894A1C1DBE1EAFFFFCEEB
        F0BEE2EA9DC6CF8BBFCB86BBC891C5D188B2BE00000000000000000000000000
        0000000000000000000000000000000092BCC99BC5D100000095C7D3B3E1E9BC
        E7F081A8B6BEDAE5000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000}
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnClick = btnDestinoClick
    end
    object btnOrigem: TBitBtn
      Left = 16
      Top = 228
      Width = 137
      Height = 29
      Cursor = crHandPoint
      Hint = 'Cria a Pasta onde vai ser Salva a C'#243'pia '
      Caption = 'Criar Diret'#243'rio'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Glyph.Data = {
        06080000424D060800000000000036000000280000001A000000190000000100
        180000000000D007000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000079A7B8457384426C7963808900000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        74B7D07AB9CE4D869B3F74883C64704768715E7A810000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000062B4D3BDFFFF95DAF578D8FC67D9FF6B
        DAFF67CCF260BDDE58ACC83D7F92386E7F3A647141616C000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        6CBDDE9CDFF6A5E9FF81DBFD72DDFF72DDFF78DCFE7ADCFE7BDDFB77D5F265C3
        E057B3D049A2BD29718927667A2D617200000000000000000000000000000000
        000000000000000000000000000000007FD3F680C6DEB0F6FF88E1FC7CE2FF7C
        E2FF7CE1FF7CE2FF7CE2FF76E2FF75E2FF6FE2FF71E2FF69CBE960BAD359A7BE
        46879C0000000000000000000000000000000000000000000000000000000000
        78D1F661AEC9B3FFFF8DE5FD82E6FE81E7FE81E6FF81E6FF81E6FF7FE6FF7FE6
        FF7DE6FF7DE7FF82E6FF84E6FE86E6FE79D7F400000000000000000000000000
        0000000000000000000000000000000079D4FB57B8DE6FCCEBACFAFF90F0FD8A
        F2FF8CF1FF89F0FF89F0FF8AEFFE89F0FF89F0FF89F1FE89F0FF89F0FF89EFFF
        78DBF1447F8F0000000000000000000000000000000000000000000000000000
        79D8FF57C0EB51B2D6B8FFFF98F5FE8FF6FF8FF5FF8FF6FF8FF6FF8FF5FF8FF6
        FF8FF6FF8FF6FF8FF6FF8FF6FF91F5FF7EDCEF77BDCE2F5F6B00000000000000
        0000000000000000000000000000000074DAFF59C5F44FB1D9AFF4FF9DF9FE94
        FBFE94FAFF94FAFF94FAFF94FAFF94FAFF94FAFF94FBFE93F9FE94FAFF98FAFF
        83DDEEA2F0FF37727C0000000000000000000000000000000000000000000000
        71D7FF5DC9F95EC0EA8AD3E9A9FBFFA3FDFEA1FCFFA0FDFF9EFEFE9CFDFF9CFD
        FF9CFDFF9CFEFE9CFDFF9CFDFFA0FCFF88DDECAFFDFF77B4BE425F6400000000
        0000000000000000000000000000000083DEFF70D4FE72D4FC5FB6D8BFFFFFC1
        FFFFBCFFFFB8FFFFB6FFFFB4FDFFB4FEFFB3FFFEB3FFFEB3FFFEB3FFFEB4FEFF
        96DEEAC9FDFFCFFEFF70A1AB0000000000000000000000000000000000DBF7FE
        8AE3FF78D9FD76DAFD78DBFB55B4CE69C6DF67C1D979CEE499E8FBCCFFFFCBFE
        FFC5FEFFC1FFFFC1FEFFC1FFFFC0FFFF9EDDEBD7FFFFD9FFFFA6D8E43B657200
        00000000000000000000000000C1DEE790E6FF82E3FF7DE4FF7BE3FF77E4FF79
        E4FF7FE3FF77D6F077CDE388C3D2CDFFFFC8FFFFC8FFFFCAFEFFCCFFFFCCFFFF
        A8DCE8E1FEFFE2FFFFD1FEFF678F9B0000000000000000000000000000BADDE7
        A0F2FF93F3FF8EF4FF8EF4FF8EF4FF8EF4FF8EF4FF8EF4FF8EF4FF8CF3FF83E2
        F168B7C486CCD992CFD9A9E2EBB5E8F2D3FFFFE8FFFFECFFFFE4FFFFDAF9FF00
        00000000000000000000000000BDDEE7A9F7FF9AFAFF95FBFF95FBFF96FCFF95
        FBFF94FAFF95FBFF96FCFF96FCFF97FBFF9AFAFF9DF8FF9AF5FA88E3EA7DD7E2
        52A5BA8BB8C6A2C5D2A6CCD8C0E6F20000000000000000000000000000BEDBE2
        ACF8FF9EFCFF97FEFF97FEFF97FEFF9AFEFF9EFDFFA1FEFF9EFCFF9EFCFF9EFC
        FF9EFCFF9EFCFF9CFDFF97FDFF97FBFF55B2C9A6D5E3DFFFFFD1F1FCC3E1EC00
        00000000000000000000000000000000B2FBFFA0FCFF99FFFE99FFFE99FFFEA0
        FDFEAFFBFFB7FCFFB3FEFFAAFCFFA9FCFFABFBFFACFAFFAAFCFDA5FCFEA5FAFF
        64B2C3BCD8DF0000000000000000000000000000000000000000000000000000
        90CBDBBEFFFFB8FFFFB3FDFFB8FCFFC1FFFFAEE5F26894A1C1DBE1EAFFFFCEEB
        F0BEE2EA9DC6CF8BBFCB86BBC891C5D188B2BE00000000000000000000000000
        0000000000000000000000000000000092BCC99BC5D100000095C7D3B3E1E9BC
        E7F081A8B6BEDAE5000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000}
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      OnClick = btnOrigemClick
    end
    object file_1: TFileListBox
      Left = 328
      Top = 208
      Width = 145
      Height = 137
      TabOrder = 6
      Visible = False
    end
    object btnFechar: TBitBtn
      Left = 328
      Top = 128
      Width = 97
      Height = 33
      Cursor = crHandPoint
      Hint = 'Fecha a Tela'
      Caption = 'Fechar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Glyph.Data = {
        06080000424D060800000000000036000000280000001A000000190000000100
        180000000000D007000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000498BB302629C016096145B871E5F853B647B
        4F6B7B6D7C840000000000000000000000000000000000000000000000000000
        000000000000000000000000000000D9E7F04E8FB7498BB34E8FB74E8FB70160
        961570BF126EB90E6BB10B6CA90968A602629C02629C02629C02629C02629C02
        629C02629C00000000000000000000000000000000000000000000000000005D
        97BF094C7B0F3E680F3E680F3E68015C911E7CCE2184D12588D32184D12184D1
        2184D11F80CF1F80CF1E7CCE1E7CCE1C79C70968A60000000000000000000000
        0000000000000000000000000000004283AB0C44701338601338601033530160
        962588D32D8ED8268CD52A91D8288FD7288FD7268CD5268CD5258AD52588D321
        84D10E6BB100000000000000000000000000000000006F926F0C94115978592A
        74A40F3E68103353054A2F45B24D0160962D8ED82A91D8268CD52D94DA2D94DA
        2D94DA278DD62C92D92A91D8288FD7278DD61273B40000000000000000000000
        0000001681252ABE3C38C34B056E0A056E0A1D8D2245B24D7BD89290E5A2015C
        912D8ED83295DC228AD53399DD3097DB3097DB2A91D82D94DA2D94DA2A91D82A
        91D81977B90000000000000000000000068B0924BA352ABE3C34BC4443C55655
        CA6962CF7667D17C7BD89225982A02629C3295DC3399DD228AD5389CDE389CDE
        3399DD2A91D83399DD3399DD2A91D82D94DA1C79C70000000000000000AFD5AF
        12AA1E18B8292ABE3C34BC4443C5564CC96062CF766FD38434A83C1033530262
        9C3399DD3BA1E31B6D9F3280B23BA1E33BA1E32D94DA389CDE379EE12C92D933
        99DD1F81C65F747D00000000000000000000000E9D162ABE3C34BC4438C34B34
        BC441D8D2206642813386013386002629C2F8BCB0D539B126EB90D539B296F8C
        3BA1E33097DB3BA1E33BA1E32C92D9379EE12685C94F6B7B0000000000000000
        0000000000001D8D2224AD31597859005D9B1338601338601338601338600968
        A61563A81570BF2184D11C79C7084E823794CC3399DD3FA5E53FA5E52A91D83B
        A1E32D8ED84F6B7B0000000000000000000000000000000000F2F5F2A4BEA901
        5C911338601338601338601338600968A61563A85D97BF86C2E474ACD41B6D9F
        42A8E63399DD42A8E642A8E6288FD73FA5E53295DC3B647B0000000000000000
        000000000000000000000000000000015C911338601338601338601338600B6C
        A92F8BCB2A74A4E2EEF56E9FC03E9BD148AEEB379EE142A8E645AAEA288FD73F
        A5E53295DC3B647B000000000000000000000000000000000000000000000001
        5C911338601338601338600F3E681273B445AAEA4EB5F0238AD24BB1EE48AEEB
        4BB1EE379EE148AEEB48AEEB278DD645AAEA379EE12A607F0000000000000000
        0000000000000000000000000000000357891033531033531338600C44701977
        B948AEEB4EB5F03BA1E34EB5F04BB1EE4EB5F0379EE14BB1EE4BB1EE268CD542
        A8E642A8E6145B87000000000000000000000000000000000000000000000008
        4E82056E0A0252141033530C44702685C94BB1EE68BBEC5CB2E873BBE67AC1E7
        86C2E48CB9D19AC9DC9AC9DC8CB9D1A7C8D742A8E6145B870000000000000000
        0000000000000000000000005F747D02521455C06374D68B025214133860278D
        D6D4D5D1FFF9D8FFFBF2F2F2F1FFFBF2FFFBF2D3CFF2C4C0F2F6F6F69A97F6F6
        EDEE73BBE60357890000000000000000000000000000128414189B1F43C5565C
        CE7167D17C6FD38483DC9A0F78533097DBEFEDD77B75EE544EF1A6A2F63D36EF
        BDBBFABDBBFA2B24EEFFFFFE2B24EEEAE6F973BBE6015C910000000000000000
        0000000E9D1634BC4434BC4443C55655CA6967D17C6FD3847BD892338E953BA1
        E3F9F2D77B75EE7974F5BDBBFA8681F50F08EDFFFFFE2B27F0FFFFFE2B24EEE6
        E5FC7AC1E7015C910000000000000000068B0924BA352ABE3C38C34B43C55655
        CA6967D17C6FD38483DC9A0B6E753BA9EDF9F2D77B75EEDFDDFBEEEEFD2B27F0
        9A97F6BDBBFA211BED7974F5897EC2C8B7A45CB2E8015C910000000000E2EDE2
        18B82918B8291D8D224A8F4A296F8C13386055C06374D68B02521403578942AC
        F1F9F2D7A6A2F68681F5B6B3F8E6E5FCFFFFFEEEEEFDFBFBFCFFFFFEFCE5C79A
        C9DC55B8F502629C00000000008BC38B0E9D16D4D5D10000000000001B6D9F13
        3860056E0A054A2F13386003578945B0F7FCE5C7FFF3E2FEF6EAFFF3E2FFEFDB
        FFEFDBFDECD3FAE7D5F1E3CF84BEDE4CB7F44BB1EE02629C00000000008BC38B
        A5A8A70000000000000000002A74A4015C91015893015C91015C91015C9145AA
        EA68BBEC7AC1E768BBEC60BCF34FB5F74FB5F742ACF1379EE13293D41F81C619
        77B91271AC02629C0000000000ECF5EC00000000000000000000000000000000
        00000000000000000000001B6D9F1273B40968A60C6498016096015C91015C91
        015C910160960C64984E8FB789A3B2B9D1DD0000000000000000000000000000
        0000000000000000000000000000000000000000000000000000008CB9D15D97
        BFA9BCC700000000000000000000000000000000000000000000000000000000
        00000000000000000000}
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 7
      OnClick = btnFecharClick
    end
    object btnCopiar: TBitBtn
      Left = 328
      Top = 88
      Width = 97
      Height = 33
      Cursor = crHandPoint
      Hint = 'Executa a C'#243'pia do Arquivo'
      Caption = 'Copiar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C006000001000000010000000000000000000000000000000000
        000000000000000000000000000000000000000000000000110B0B120B0B0000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000000000000000000C06064D3737
        B19B9BC7B7B7937F7F5747472B1F1F0701010000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000024
        1818866767D1B0B0EADBDBC3BFC0D5CBCBF0DCDAE2CCC9BBA4A28571704D3D3D
        1911110200000000000000000000000000000000000000000000000000000000
        000B06065C4444B89898D6B6B6E2CBCBD8C6C6353A3D0D4D65497E91879FA9C0
        BFC3E2D7D6EDDEDDD0BFBFA895956F5E5E332828040202000000000000000000
        0000000A0505463030937474D5B6B6DFCBCBDBCACAE7DCDCDDC9C97A6F712F5E
        720A5E7D005576015A7A266A83627179D5CBCAE0D4D2EBDBD9E8D4D454454600
        00000000000000001A10106D5252C2A1A1E0C8C8E0D0D0E5D9D9EFE9E9F4F3F3
        E7DBDBDCC2C2CEB3B2B09FA08489915073831D637D122E3BA18E8C4E626C2347
        57B1AEB09B8483010000281A1A423030A58585DDBFBFE2CFCFE3D6D6EBE3E3F1
        EEEEF5F4F4F4F2F2DDCCCDD0B2B3E0CACAE5C9C7E3C5C3DCBEBCC8ADADA69495
        C3ADAC666C730F3648777B82997E7D020000836262CCAAAAE0CACAE2D4D4E7DF
        DFEFEAEAF3F1F1F2F1F1EBE2E1D7C1C3C9A8A8C8A4A1C9ACACCDB4B8D2BCBECD
        AEAFD6B8B8E0C6C6DAC1C1D6BAB9BA9F9DCAB3B3917777040000C7A1A1D8C0C0
        E2D5D5EEE9E9F2F0F0F4F3F3F3F1F1EDE5E5D7BDBDD4B3B0EACEC3F6D5C3EABB
        A8D5A495C99991C6A19ECAACADCAAAABCCADAED2B4B5E4C6C7E0BDBD684E4E02
        0101C5A6A6EBE5E5F1EDEDF4F2F2F2EFEFE9DFDFE0CCCCCFB9B9C6B7B7CFBCB6
        E0CDC4F4CEBDF5AE92DC6943DB6742CD8D77C9A394CCA79ED2B3AFCBA9A99D82
        854A3B3D0E090A000000CEB3B3FAFCFCF4F3F3F0EBEBE0CFCFD2B4B5BFA7A7B5
        B3B1C9D7D4CEDFDDC5CFCDC4C9C7CCA193DF6C49E37550D28B72D69C83D3C7C2
        C8BEB9BF9D9278422E2F08000C0200000000C09A9AE8DFDFE9DFDFEBE5E5E7D8
        D8D0C3C4C5D0CDE3F9F5D4E3E0ABB6B3CFE2DED8F6F4CBC0B6E17E5EE77F5AD3
        8066D58770E8EFF0D5E4E8CFBAADE0764ED648248B2F160C0301B07E7EB38383
        B88B8BCEB1B1DDC8C8CCCFCED9EFEBB8C3C16C706F848E8CD9E8E5D9F2EFD8D0
        C6E68E6FE88762CD8972CA9180E9D1CAE8E8EAD8B5AAD8623DEA5832B6422214
        0601000000000000000000B37B7BB18989C2CCC9A2A29F8E9290AFBDBACBD6D4
        DCEAE7D6EEEBD7D2CAEE9878DBA388BCDCD6BCCBC1BDAC9DC6A598CA816CD44C
        25E85831AD42241306010000000000000000000000004140405D5B5B7E4C50D5
        C9C9DEF1EDD2DFDBD3E4E0D6EFECD6CEC7F2A383DDB39BC0F6F9B9F5F9B0F3F4
        A9E4E0A7D2CCACB3A7D77556B140211206020000000000000000000403030000
        00432023A7656CCBCFCDC9D5D3C0BFBFCBCECED1E3E1D2C8C2F4B092E4BBA2CA
        F0F2C4EEF0BBEDEFB2EFF2A9F6FB9AFFFFBDB2A6B43E1D130601000000000000
        0000000000001F12128C4D53A3797EC7DCD7CCD0CF7776769D9A9BD7E1E2D7D5
        CFF5B799E5BDA3D0EEF2CBECEEC4F0F1BCEEF1B4EAEDA6F4FAC4B9ACB4442313
        060100000001010B03031104030360383CA7656CAFB3B2DEF5F1D2D8D87D7C7C
        828181CED4D5DEDDD6F4B799E4B59ADCF4F5D2EFF0C8EBEBC2EBEDBBECEFAFF6
        F9CABCAEB64A2913060200000016166C1D1C66301E198F5358987A7DD1E9E5DC
        EFEBD4E2E0C7C8C8BBBAB9CBD3D3E1E3DDE7C8B7DFD0C4EDF4F4F3FFFFE6FFFF
        D2F7F9C3EEF0B5F7FACEC0B1B54F2C1306020808371D1D881A121D784746A161
        684D4748C3D4D1DEF2EED9EBE7D9E6E3D8E1DEE2EEEBE8F5F2E1EBE8DEE9E8DD
        E1E0B4AFACC5BDB9E3E9E6E2FBFBD3FFFFD7C9BABA56321407031A1A920F104E
        422418B46C706E474D0507079B9F9FDCEDEADCEFEAE0EFECE7F3F1EAF4F2EAF4
        F2EBF6F4F3FEFCD8E1DF2E2C2C796159B28A7DB5A199C5B1AADBB09F9B51370E
        02002A269220187D795899A66C741913130000008C8B8CB7BDBCD9EAE7E4F3F0
        E5F2F0EAF4F2EDF5F3F0F8F6FEFFFF9C9D9D000000000000000000000000BA8B
        7DA14829471E1000000034211F8F5661966DAA3E3573000000000000000000A0
        9F9FB3B7B6D5E0DEE7F3F0EEF8F5F3FAF9FCFFFFBBBDBC232323000000000000
        0000000000000000000000000000000000002B1A17613A374E32350E0D2B0000
        00000000000000000000000000A7A7A8B9BDBCD1D4D3D0D2D185858554535300
        0000000000000000000000000000000000000000000000000000}
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 8
      OnClick = btnCopiarClick
    end
    object Panel1: TPanel
      Left = 8
      Top = 104
      Width = 409
      Height = 41
      Caption = 'Panel1'
      TabOrder = 9
      Visible = False
      object prog: TGauge
        Left = 1
        Top = 1
        Width = 407
        Height = 39
        Align = alClient
        ForeColor = clBlue
        Progress = 0
      end
    end
  end
end
