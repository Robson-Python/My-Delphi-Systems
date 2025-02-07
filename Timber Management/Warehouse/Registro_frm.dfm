object frmRegistro: TfrmRegistro
  Left = 192
  Top = 114
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Sistema Almoxarifado - Registro de Usu'#225'rio'
  ClientHeight = 206
  ClientWidth = 726
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 713
    Height = 193
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object Shape2: TShape
      Left = 480
      Top = 16
      Width = 161
      Height = 121
    end
    object lblFone: TLabel
      Left = 320
      Top = 56
      Width = 56
      Height = 16
      Caption = 'Telefone'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtUser: TLabeledEdit
      Left = 48
      Top = 72
      Width = 257
      Height = 24
      CharCase = ecUpperCase
      EditLabel.Width = 116
      EditLabel.Height = 16
      EditLabel.Caption = 'Nome da Empresa'
      TabOrder = 0
    end
    object Panel2: TPanel
      Left = 480
      Top = 16
      Width = 161
      Height = 121
      BevelInner = bvLowered
      BevelOuter = bvLowered
      Caption = 'Logomarca'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      object Image1: TImage
        Left = 0
        Top = 0
        Width = 161
        Height = 121
        Center = True
        Proportional = True
      end
    end
    object btnFoto: TBitBtn
      Left = 400
      Top = 144
      Width = 145
      Height = 41
      Cursor = crHandPoint
      Caption = 'Carregar Logo'
      TabOrder = 3
      OnClick = btnFotoClick
      Glyph.Data = {
        360C0000424D360C000000000000360000002800000020000000200000000100
        180000000000000C000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000006866666866666866666765656866660000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000006866665B575644403F3A36353935343E3A396A66656A66
        656A666500000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000006666666666664E4C4C979392D1CDCCC4C0BF888483635F5E3733323531
        303B37366A666568666568666500000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        686666424040818181C5C5C5D1CFCFD1CFCFC3C1C1ACAAAAC6C4C4D3D1D1B4B2
        B29A98975C58573531303B37366A67636A66656A67636A666500000000000000
        0000000000000000000000000000000000000000000000000000000000666666
        5F5D5DC0BEBED2D2D2D1D1D1D1D1D1D1D1D1C2C2C2AAAAAAC4C4C4E0E0E0ABAB
        ABEDEDEDFCFAF9E3E1E0A6A2A15C595535322E3B38344E4B476A676368666568
        66650000000000000000000000000000000000000000000000006666668D8D8D
        D3D3D3D3D3D3D2D2D2CFCFCFC4C4C4D3D3D3C5C5C5AAAAAABDBDBDDDDDDDF7F7
        F7ADADADF5F5F5F5F6F4F7F5F4F7F5F4DFDDDCA2A09F58565535322E3C37344F
        4A476B66656A66656A6665000000000000000000000000000000666666D5D5D5
        D5D5D5CDCDCDAFAFAF9E9E9EA8A8A8D5D5D5D5D5D5AAAAAAA2A2A2C4C4C4F7F7
        F7929292F1F1F1F1F1F1F1F2F0F1F2F0F1F1F1DBDBDBDDDBDAC5C3C298939067
        625F3631303B37364F4A496A66656A6665686665000000000000666666D0D0D0
        B0B0B09D9D9DB8B8B8C0C0C0A9AAA8D8D9D7D8D8D8AAAAAAC2C4C4DFE1E1F7F8
        F690918FECECECECECECEAECECC4C6C6A1A1A19C9C9C9C9C9C9B9B9B9E9C9BB3
        B1B0D9D7D7A9A7A7706C6B3732313C373456514E6B66650000006666669D9D9D
        BABABAD6D6D6DADADAC9C9C9A9AAA8DADBD9DADADAAAAAAAB4B6B6D3D5D5F7F8
        F6C1C2C0E8E8E8E8E8E8BABCBC9FA1A1A1A1A1A1A1A1939393858585A1A1A1A1
        A1A1A6A6A6D3D3D3EAE8E7E0DCDBA9A4A15954514E4948000000686666DEDCDC
        CDCBCBC5C3C3DCDCDCCBCBCBAAAAAADCDCDCDADCDCA9ABABACACACCCCCCCF7F7
        F7BEBEBEE4E5E3C7C8C6AAAAAAABABAB8B8B8B4242423B39394240403636365F
        5F5FA2A2A2ADADADD9D9D9E5E3E3E5E3E2CFCDCC383433000000686666E1DFDF
        BEBCBCBEBCBCDFDFDFCDCDCDAAAAAADFDFDFDDDFDFA8AAAAC4C4C4E1E1E1F7F7
        F7BCBCBCDDDEDCB2B3B1AFAFAF9090903636365B5B5B6361615C5A5A61616155
        55554646469F9F9FB5B5B5E0E0E0E0E0E0E2E0E0565251000000666666E1E1E1
        BDBDBDBDBDBDE1E1E1CFCFCFABABABE0E0E0E1E1E1AAAAAAA7A7A7C8C8C8F7F7
        F7BABABACBCBCBB6B6B6B6B6B64343436262624C4C4C3333333333333232324C
        4C4C626262535353B6B6B6CDCDCDDCDADADCDADA625E5D000000656565E3E3E3
        BEBEBEBEBEBEE3E3E3D0D0D0ABABABE3E3E3E3E3E3AAAAAAB5B5B5D5D5D5F7F7
        F7999999C6C6C6BCBCBC9191914747476464643734305B504871655B655A5246
        3E375553524C4C4C919191C4C4C4DAD8D8D9D7D7605C5B000000686666E7E5E5
        BFBFBFC0C0C0E5E5E5D3D3D3ACACACE5E5E5E5E5E5AAAAAABABABADDDDDDF9F7
        F7908E8EC8C8C8C4C4C47C7C7C5656564D4D4D52473F86674E6D4626704F3579
        63513E38316A6C6C606060C4C4C4D2D2D2D4D2D25F5B5A000000686666E9E7E7
        C0C0C0C0C0C0E7E7E7D4D4D4ADADADE7E7E7E7E7E7AAAAAAA2A2A2C4C4C4F9F7
        F78F8D8DCBCBCBCACACA7E7E7E5959594646465A4E4287613F8252287B512E86
        684F483F366A6C6C595959CACACACFCFCFCECECE5A5857000000666666EAEAEA
        C2C2C2C1C1C1EAEAEAD5D5D5AEAEAEEAEAEAEAEAEAAAAAAAC4C4C4E1E1E1F7F7
        F78C8C8CCECECED1D1D18282825B5B5B53515152493C896D4A98734794704A84
        6B51483F367070703D3E3CD1D2D0CCCCCCCBCBCB5A5858000000666666ECECEC
        C2C2C2C2C2C2ECECECD7D7D7AEAEAEECECECECECECA9A9A9B5B5B5DDDDDDF7F7
        F78A8A8ACCCCCCD8D8D8B9B9B94949497775753F382F75624786704D866E5070
        5F4A3A342D7F7F7F5C5D5BD8D9D7C6C6C6C5C5C55A5858000000666666EEEEEE
        C4C4C4C4C4C4EEEEEED9D9D9AEAEAEEEEEEEEEEEEEAAAAAAA5A5A5CCCCCCF7F7
        F7898989C4C4C4DEDEDEDEDEDE4949497877795856553D382F524C41524C413D
        37305E5C5B6B6B6B807E7DDEDCDBC1C1C1C1C1C1565656000000666666F1F1F1
        C5C5C5C5C5C5F1F1F1DBDBDBAFAFAFF1F1F1F1F1F1AAAAAAC4C4C4E1E1E1F7F7
        F7919191BCBCBCDBDBDBE6E6E6B9B9B93F3E4089888A6264644A4C4C4C4C4C64
        6464828282393939D2D0CFD8D6D5BCBCBCBCBCBC555555000000666666F3F3F3
        C6C6C6C6C6C6F3F3F3DCDCDCAFAFAFF3F3F3F4F4F4AAAAAAC4C4C4E1E1E1B3B3
        B39F9F9FB8B8B8BEBEBEE8E8E8EBEBEBA6A6A63939396666668080808080806C
        6C6C393939A6A6A6EBEBEBBDBDBDB8B8B8B8B8B8545454000000666666F5F5F5
        D3D3D3DEDEDEEEEEEEC7C7C7B0B0B0F5F5F5F5F5F59393939E9E9EA2A2A2A3A3
        A3B3B3B3B3B3B3B3B3B3C5C5C5F2F2F2F2F2F2CFCFCF7C7C7C4040403F3F3F70
        7070C3C3C3F2F2F2CECECEB3B3B3B3B3B3B3B3B3535353000000646464F1F1F1
        D4D4D4B6B6B69F9F9FBCBCBCDFDFDFF7F7F7F7F7F76E6E6EB0B0B0B0B0B0B0B0
        B0B0B0B0B0B0B0B0B0B0B0B0B0BDBDBDF0F0F0F9F9F9F9F9F9F8F8F8F9F9F9F9
        F9F9F9F9F9D3D3D3B0B0B0B1B1B1B0B0B0B0B0B05252520000006B6B6BA5A5A5
        C3C3C3DBDBDBF9F9F9F9F9F9F9F9F9F9F9F9F9F9F9A5A5A5A3A3A3AAAAAAAAAA
        AAAAAAAAAAAAAAAAAAAAAAAAAAA2A2A2919191BDBDBDE4E4E4E9E9E9E9E9E9AD
        ADAD989898A3A3A3AAAAAAAAAAAAAAAAAAAAAAAA5151510000007F7F7FFCFCFC
        FCFCFCFBFBFBFBFBFBFBFBFBD5D5D59797977171716565654949496E6E6E8A8A
        8AA7A7A7A7A7A7A7A7A7A7A7A7969696666666666666666666A7A7A7A7A7A776
        76765C5C5C5757575B5B5B646464717171989898505050000000000000CBCBCB
        FEFEFEFEFEFEFEFEFED8D8D8333333A9A9A9C0C0C0C0C0C0C0C0C0A9A9A93333
        33B5B5B5A5A5A59898989090908E8E8E9292928B8B8B838383A2A2A2A2A2A26B
        6B6B6363636666666666666666665959598686864F4F4F0000000000008D8D8D
        8C8C8CA6A6A6CCCCCCD8D8D8B1B1B1BEBEBECCCCCCCCCCCCE4E4E4C9C9C9ABAB
        ABF2F2F2F0F0F0EFEFEFEDEDEDE0E0E0BCBCBCA9A9A99B9B9B9898988A8A8A67
        67674848483939394342444D4C4E4B4D4D8183834B4D4D000000000000000000
        0000000000008080808080808080807E7E7E979797C8C8C8DFDFDFF6F6F6F5F5
        F5F3F3F3F3F3F3F0F0F0EFEFEFEDEDEDECECECD9D9D9B6B6B6A6A6A6B4B4B4A0
        A0A0B0B0B0A2A2A2807F816665676060607E8080404242000000000000000000
        0000000000000000000000000000000000000000008383838383837E7E7E7E7E
        7E7B7B7B939393C2C2C2DAD8D7F1EFEEB2B2B288888866666666666666666666
        66666666668E8E8EBCBABAD3D3D3888888444444666666000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000008181818381807573727373737979798F8F8FA3A3A39696969A
        9A9A8484848181817C7A7A868484656565000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000000000000000008D8D8D8181818F
        8D8D000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000}
    end
    object btnRemover: TBitBtn
      Left = 552
      Top = 144
      Width = 145
      Height = 41
      Cursor = crHandPoint
      Caption = 'Remover Logo'
      TabOrder = 4
      OnClick = btnRemoverClick
      Glyph.Data = {
        7E090000424D7E0900000000000036000000280000001D0000001B0000000100
        1800000000004809000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000000000000000000000E6E6FF2A
        2B9B2A2B9BE6E6FF000000000000000000000000000000000000000000000000
        000000000000000000000000000000F6F7FF3C3D700000000000000000000000
        00000000000000000000000000000000000000001E1EB80D0DDB0E0EDC1E1EB8
        EFF0FF0000000000000000000000000000000000000000000000000000000000
        00000000000000EFF0FF3A3A7600000000000000000000000000000000000000
        0000000000000000000000001E1EB80A0BE50304F61010DAE1E1FF0000000000
        00000000000000000000000000000000000000000000000000000000E8E8FF33
        3387EDEDFF000000000000000000000000000000000000000000000000000000
        00000000E6E6FF2020B40A0BE50908EA1A1AC4DFDFFFF4F5FF00000000000000
        0000000000000000000000000000000000E8E8FF2525A72728A2EFF0FF000000
        00000000000000000000000000000000000000000000000000000000000000E4
        E5FF1919BF0E0EDC0E0EDC1A1AC0E4E5FF000000000000000000000000000000
        000000000000E4E5FF2928A02324AADFDFFF0000000000000000000000000000
        0000000000000000000000000000000000000000000000000000E4E5FF2121B1
        0E0EDC0C0CE21A1AC0DFDFFF000000000000000000000000000000E4E5FF1A1A
        C01A1AC0E4E5FF00000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000000000E4E5FF1A1AC00E0EDC0E0E
        DC1A1AC0E4E5FF000000000000000000E4E5FF2323AB1516CC1E1EB8EFF0FF00
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000E6E5FF2122B00E0EDC0C0CE21A1AC0DC
        DCFFEAE9FFE4E5FF1A1AC01516CC2323ABE6E6FF000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000E6E5FF1A1AC00E0EDC0E0EDC1516CCD6D6FF2323AB
        1515CD191AC2E4E5FF0000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000E4E5FF2121B10E0EDC0707ED0C0CE21515CD2124ABE3E5FF0000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00D6D6FF0C0CE20201FB0304F61212D4DDDFFF00000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000000000DCDCFF1415CB0707ED03
        04F60A0BE51919C3E1E1FF000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000EFF0FFE1E1FF1919C30E0EDC0E0EDC1212D0CFD0FF2525A7
        2B2B97E8E8FF0000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000E6E6FF
        1E1DB91010DA0908EA0E0EDC2121B1E3E2FF000000E8E8FF2525A72424A6E8E8
        FF00000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000E2E1FF2020B40A0BE50304F60A0B
        E51A1AC0E4E5FF000000000000000000DFDFFF2525A72C2C98E8E8FF00000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000DFDFFF1C1DBB1313D10A0BE50204F6090BE52020B4E4E5FF00000000
        00000000000000000000000000002525A72525A7E8E8FF000000000000000000
        000000000000000000000000000000000000000000000000000000002122B00E
        0EDC0505F30304F6090BE5191BC0E4E5FF000000000000000000000000000000
        000000000000DFDFFF2627A1333387EFF0FF0000000000000000000000000000
        00000000000000000000000000000000000000002122B00E0EDC0404F20A0BE5
        2020B4E4E5FF0000000000000000000000000000000000000000000000000000
        00EFF0FFEDEDFF3A3A76EFF0FF00000000000000000000000000000000000000
        000000000000000000000000DFDFFF1E1EB81717C91E1EB8E6E6FF0000000000
        00000000000000000000000000000000000000000000000000000000000000F1
        F1FF3E3E6E000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000}
    end
    object btnAtual: TBitBtn
      Left = 144
      Top = 144
      Width = 121
      Height = 41
      Cursor = crHandPoint
      Hint = 'Atualiza os dados do Usu'#225'rio'
      Caption = 'Atualizar'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      OnClick = btnAtualClick
      Glyph.Data = {
        360C0000424D360C000000000000360000002800000020000000200000000100
        180000000000000C0000C40E0000C40E00000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000E0D2CCA78B849C8177A4918ABBABA50000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00009C9ACE514E8656557CABA9BF000000000000000000000000000000000000
        000000D9BDB2BD8A76C58C77AD7D6B9B6E60996C5E9C7162AF8677C19E910000
        00000000000000000000000000000000000000E1DEF8B7B5DF9D9ACB9D9BC9A0
        9EE03835A33D3AAD3D3B879796C0000000000000000000000000000000000000
        000000F9D9CECC937DFFE7CEFFE7D3FFD4C2E7B7A5CB9B89AA7C6B946B5C8461
        537E676B6F648C5551856B6895A5A4CE8688B84B508730397C29357D28357F26
        2F911818A82421B3322E987C7BBB000000000000000000000000000000000000
        000000FFEFE7BF9180FFF0DCFFFFF1FFF9EDFFFBEDFFFEEEFFF7E9FFE2D4E5C6
        B7B399AB483B913931A62823902D2E9619248C1B339320479C1B489F0E389D0C
        28A4181DB61913AE1E1A9B35348AA5A5C3000000000000000000000000000000
        000000FFF9F3B99283FFE6D4FFF9EEEEE4DAF3E5D9F4E4D7F9E8DBFFEFE0FFF7
        E6FFF3FF7362C915139B121E9C10289A3E5EC25A86DA659EE390CCFF80B6FF3B
        66D50D24B01B24BB1A1AAA231F9067669E000000000000000000000000000000
        000000FFFBF5BF9889FFE2D1FFFCF1F3E7DDF4E6DAF7E7DAF6E5D8F3DFCEF8DE
        C6F4DCE8AA9AF1141E90033696599FE5A0E5FF83C6DD80C0D2A8E3F74B80A171
        A2E04475E10226B01E23BE211BA82623865D5C94000000000000000000000000
        000000FFF8F2BD9687FFE4D1FFFCF0F4E7DFFEF3EBFFFFF5FFFDF4FFF1E5F4E1
        D4E5D5E74B499B0C298C5FAAEE91EFFFA0F1F9AAF0EABAF2ED497A7819494D8A
        BEDC8FC8FF103BB41A23C1211BBC211D9E27267C8685A7000000000000000000
        000000FFF0E9BD9785FFEBD8FFFBEFF7ECE4FFFFFAFFFFFCFFFFFCFFFEFFF7EB
        F78E8DB70420774A82DB97EDFF99F5FFB1FBFFC0F8F96685880E2A2B77A3A2AD
        DEEE8CBBEF3857BA1F23BE241CC71E19B023208E5B588A000000000000000000
        000000F1E0D7BF9D8DFFF2E0FFF8ECF8EDE5FFFFFCFFFFFEFFFFFEFFFBFFE6DE
        FF4347821B3F8D96D2FFAAF5FFB4FEFEB1EAEC42686C0A1A216B7F84C5F7F785
        C0CF709FD33B58BB2126C3231DD01F19BE211D9A4D4B86000000000000000000
        000000CCB9B1D2B5A6FFFCEDFFF5EAF9ECE4FFF9F5FFFFFCFFFFFBFFF9FFBCB4
        F12726705D72A9A9CCEEACD7E0D6FEFC7E9799233339252D346F8990B1F5FA8F
        E0FB7CBBFF1A42B91C25C9241DD2211AC1221F9D4A4A86000000000000000000
        000000C2ACA1E0C6BAFFFFF4FFF2E6FBEFE5F9EEE6FFF7EEFFF9F0F6EEFF9F94
        DD1E1E727488B792B3C7A9C9CEE0FCFCB4C8C95763671F2930152E3853919C9F
        E7FF6098FD082ABA2026D3241DD21F1BC1201F9D4D4E88000000000000000000
        FFF0E4CDB0A1F1DDD2FFFFF7FFF1E8FDF1E5FEF0E4FBEDE1F7EDDCF5EBF8978B
        D7171B74688BC3B5E4FFC7F4FFD4FBFDD9FCFFDDFBFC8BA0A22E454D2344586C
        8DCC3448CF1A24D02724D7231ECD1716B91C1D975E5E94000000000000000000
        F3D4C5D0AF9FFFF4EBFFFBF4FCF3EAFCF2E8FDF1E7FBEFE3FBEEE0F9EEF8ABA1
        E3191E733E61ABB9EBFFC5F9FFC9FBFFD0F9FBB8DDE1C0E3ED95B1CF596AA33C
        47A9232BC51D28D60A1FBE0726B7143AC01235976D7AA6000000000000000000
        E3C2B2E3C1B1FFFFF8FCF7F4FCF5F2FFF9F4FFF9F4FFF8F1FEF5ECF5EDF4D4CB
        F636378112238A769AF8B8F1FFC2FBFFC9EFF38FB3BB93C2E2A3CBFF4758D120
        28C11C2ACA0126B81966D440A7FE48BBFF4DAEE858829F000000000000FFFAF4
        D0AF9FFCDECDFFFFF9FFFDFCFFFFFEFFFFFEFFFFFEFFFFFEFFFFFCFEF8FDF3ED
        FF8183BD041883062B9D4F83D091C2FAAAC6F58DA5DB577CCC2143B51925C518
        27D10029BB3983F35CCBFF50D7FF48DAFF5FD6F6558CA1000000000000E7DAD2
        D7BAABFFF4E4FFFFFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFFFDFB
        FFDBE7FF3B66BD002599001D940D26A4252EB3262BB61D24BB1E25C82425D302
        20BB1E78E452CBFF5AD8FF66E4FF6EEDFF82E9FC5E94A5000000FFFFF7C9B9AD
        E6CFC0FFFFF4FFFFFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFFFFFDFFFFFDFF
        FFDAF2FF6CB0F14796F73A73E61640C3011FB40D1FC01F21CD2220CD1E1CC214
        3AC242B3FF3DCFFF56DDFF6CEAFF7DF4FF93F2FF6697A5000000FFF3E3D8C3B4
        F2E1D8FFFFF9FFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFFFFFAFF
        FFC4EAFC5ABBE75AD5FF6CDAFF66C8FF3188E8003AB20117A51416AA1719A322
        49BD45B7FF37CBFF4BD9FF5FE4FF71EBFF86E0F880A7B5000000F3D5C2DCC5B5
        FFF7EFFFFFFCFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFFFFFAFE
        FFCEF3FF68CAE86AE9FF68ECFF60E1FF55D1FF4CA7FC3558BA494DB333328E55
        6FBC60B7EF4CBFEA5ACDF269D6F66FD0EC73B8CC000000000000F3D4BFECD5C5
        FFFFFBFFFFFFFFFFFEFDFFFFFDFFFFFDFFFFFDFFFFFFFFFFFFFFFFFFFFFFFCFE
        FFE5FEFF93D6EF7EE1FF79F1FF5EE3FF45D1FF4CB9F1A2C9F5D0D1F37A738EE6
        E8FFDFFCFFB3E4FA99D1EA9BD2E7B5DEEDE2FDFF000000000000DABBA4DAC0AF
        EFDFD8E9E0DCF2E8E1F3E9E2FAEEEAFCF0ECFFF6F2FFF7F4FFFBFAFFFFFFFFFF
        FFF1FFFFD0F6FF95D5ED7BD5EE67D1F052C4E96BC2E2DEF8FFBBB4B19E928EFF
        F7F4000000000000000000000000000000000000000000000000C0A18CC2A38E
        C4A695C0A192C2A191C49F91CAA093CBA194CEA497C7A89FB7AEABECEBEDFFFF
        FFFAFFFFF3FFFFE5FEFFC8ECFCB7E3F4C0ECFDE3FEFFFFFAF6A9928ABFB4B000
        0000000000000000000000000000000000000000000000000000FFE6D6E3CABA
        D6B8A7CBAA9AC29E8CB78F7DAD8072A87565995F4C9B6E60B8A9A6EDEFF0FFFF
        FFFFFFFFFFFFFFFBFFFFF4FDFFF4FDFFF8FEFFFFFFFEFFEEE3A08479D3C8C400
        0000000000000000000000000000000000000000000000000000FFFFF9FFF5EE
        FFFEF8FFFBF4FFFBF0FFF4E8FFF0E4FFEFE1DDA18B996352C5B5AFF6F8F9FFFF
        FFFFFFFEFFFFFFFDFFFFFBFEFFFBFEFFFDFFFFFFFFFCFDE1D69B7F74E3D8D400
        0000000000000000000000000000000000000000000000000000000000000000
        FBF9F8FFFAF7F9F0E7F2E6DCEEE0D4FFFEEFFCC2ACAC7461D0C0BAFBFDFEFFFF
        FFFFFFFEFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFFFFFBF2D6CB9A7E73ECE3DF00
        0000000000000000000000000000000000000000000000000000000000000000
        000000FDFAF6FDF4EBF4E6DAE6D6C9FFF9EAF0BDA9AF8170D2C3C0FDFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBEAD0C4997F73F1E8E400
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000FFFAF6FDF2EAF2E6DAFFFCEEF1C3B1B18879CFC3BFFBFFFFFEFE
        FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBE9CFC3977D71EDE4E000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000FFFCF9F5EFE8FFFEF3F8CDBCB48D7ECBBFBDFAFEFFFFFF
        FFFFFFFFFFFFFFFFFFFFFDFFFFFDFFFFFFFFFFFFFFFBF2D6CB967A6FE0D7D300
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000FFFEFAFFFEF6FFE0D0B79687C4B6B0FFFCF9FFFF
        FBFFFFFBFFFFFBFFFFFBFFFFFBFFFFFBFFFFFBFFFFF8FFE7D8997E70D1C6C200
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000FFFEFAFFF5E9C2A898B59F93EFDCCFFFED
        DEFFE6D6FAE1D1F9DFCFF1D7C7F1D7C7E8CDBFEACBBCDDB7A5BA9B8CE6DBD700
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000FFFFF5FEE7D8C8AF9FD7BDACE6C8
        B5E5C6B1EBC8B4EBC8B4EECBB7EECBB7F5CFBDFAD2BFFFD5C2FFE0D0FFFDF900
        0000000000000000000000000000000000000000000000000000}
    end
    object btnSair: TBitBtn
      Left = 272
      Top = 144
      Width = 121
      Height = 41
      Cursor = crHandPoint
      Hint = 'Fechar a Tela'
      Caption = 'Sair'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      OnClick = btnSairClick
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
    end
    object mkeFone: TMaskEdit
      Left = 320
      Top = 72
      Width = 105
      Height = 24
      EditMask = '(00) - 0000-0000;1;_'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      MaxLength = 16
      ParentFont = False
      TabOrder = 1
      Text = '(  ) -     -    '
    end
    object btnInserir: TBitBtn
      Left = 16
      Top = 144
      Width = 121
      Height = 41
      Hint = 'Inclui os dados do usu'#225'rio do sistema'
      Caption = 'Inserir'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 7
      OnClick = btnInserirClick
      Glyph.Data = {
        360C0000424D360C000000000000360000002800000020000000200000000100
        180000000000000C000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000373332
        3833323A33303C33303C33303C33303D34303C33303C332F3C33303C332F3E33
        2F3C332F3E332F3E332F3E332F3E332F3E332F3E332F3E332F3B322E3A342F47
        423F000000000000000000000000000000000000000000000000383330EFE4E0
        E7D1CCEDD1CAEBD1CAEBD2C8ECD1C7EDD3C7EDD2C8EDD3C7EED1C8EED2C7F0D2
        C7EED2C7F0D2C7F0D2C7F0D3C5F0D3C5F2D3C4F2D3C4F0D3C5EED3C5DAC4B842
        332AAEA9A6000000000000000000000000000000000000000000383330D8CCC6
        FBE2D8FFE0D5FEDED1FDDECFFBDDCCFBDACAF9D8C8F8D8C5F7D6C3F8D4C2F6D2
        C0F3D3BCECD3B9E3D4B4DBD5B0D5D5ADD5D3ABD3D1A9D3D2ACD2D3ACD4D8B433
        3E1D81977A99B49A000000000000000000000000000000000000353332D5CFCA
        F7E7DAFCE5D5FAE3D3FAE2D0F8E0CCF7DFC9F6DEC6F6DDC3F7DCC2F5DABFF5D8
        BDECD9B6DCDEB0506C301C590F105E0B0F5D0A105E0B115D0C115D0C115D0C10
        5D0C0E5D0E0C5C0F0E5C0F155716355E38000000000000000000333333D5D1CC
        F6EBDDF7E8D5F7E6D3F8E5D0F9E4CEF6E2C9F7E2C6F5E0C5F1DCC7F2DBC5F1DA
        C0E8DDB7D6E2AE3060182D8D322CA53D26A03B1F99341C942F188E291286220F
        821B0D7C140C76110A6C0C0F5D10426F44000000000000000000333234D7D2CF
        F7EBDFFAEBD8FAE9D6FAE7D2FAE5CFFBE5CCFBE5C9F5E0CAF0DDD8EEDBD8EFDB
        C9EADDBDDFE2B5648C4B24862C3FC25B32B9532BB34D26AA4522A23C1C9B3517
        922A148B22137E1D146919346F35000000000000000000000000333234D9D4D1
        F9EDE1F5E6D3F5E3CCF5E1C8F4DFC9F0DCCBECD9D6E6D6E7C4B9E78B80AEC5B7
        C9E4D7CFE0D9B899B57A0A681146C86336C25D2ABA5427B44D23AB451DA13C1B
        9B3517922A0F7B1B186A1F89BB8B000000000000000000000000333234DBD6D3
        FAEFE1E5D4BFE0CAAEE3CBAFE0CAB1DAC8C9BAAFDD7C75D04241C63535B76963
        B5C3B7DBD9C6B7C9D49C18641232A9473DC96431C35D2ABA5427B44D23AB451E
        A33C1C9B350C7D1C0A61115E9661000000000000000000000000333234DDD8D5
        FCF1E3F7E5D4F5E1D0F3DFDAECDAEBBBAFE35D59BE3435C12E33DC2E34DB3839
        BF988FDFEAD3DBDBDCB055904620882B43C96536CA6431C35D2BB9542BB34D24
        AB4520A33C229937167923195F2088A58B000000000000000000333333DFDAD7
        FEF3E5E3D3CCD3C2CFB1A5D56A66CD383AC42F33D22C32D72D33D22F34D62C32
        D94A48C4BDACD1D2CEB589AF7312651049C76737CB6538CA6434C25D32B9532E
        B24D26AA4522A23D2498370D6819447549B4C8B5000000000000333333E0DDD8
        FDF4E7F6EAE6C3B7D35A539C3436C02F34D73034C94748CE8A88F95E5EDA282F
        D82F31CB8278C4D6D2DDC8DEB425631734A74A3ECA6545C86727A143026E1534
        A34732B14E26AA4522A23C228B3416581D92B391000000000000333333E2DFDA
        FFF7EAE2D6D4BFB5D3625BA43739B64143C08780CBC2B6E0D6C7E2A89FD8393B
        C92F34D7413EBC9695D7C7CFBE5D894420872C4CC765399D43297827609B5719
        601733A2462DB44D24AB45299E4311611C6E9B70000000000000323232E5E2DE
        FFF7EAF1E7E0EADEF0A59DCC655FB1AFA8F3E8D8EFF2DED3F5DDC9E6D4E56C69
        D03034C83032CC6061CFD1D0E09DB487166115439C46397429B7DC9EC1D2A626
        4A160B641435B0502BB14D2DA749166B21528454000000000000333333E6E3DF
        FFF9EFE5DACCDACBC2DACBC9D9C8D1DDCBD2DFCBC0E5CEB8E5CEB4DECAC9B7AD
        E24F4CB93034D33438C79690C9C9CDC7456836486E2CC2CE9ADFD9B4D7C6B137
        3D1E3F7B3E1A812C36B65733AF53166D23598B5B000000000000333333E8E5E1
        FFFBF0FDF0E0FFEFDAFFEFD6FFEED3FFECD1FFE9CFFFE8CEFEE8CCF7E2D3E7D8
        E6958DD33134C52F33CE5C57BAC3BFE8D4DBC6DCDFAEEADAB5F1D6BCE1C0B741
        37268CB4840D621842BE623CB45B13631E8CB98E000000000000333234E9E5E4
        FBF4EBEADDCDE1D0BBE7D2BCE6D2B9E6D2B9E7D2B7E7D2B7E8D1B7E6CFB9E1CE
        C1CDC0E0605ECF3135CA3334C4716FCFD0C7D1E1D0AFE6CFAFF2D7BDE0BFB643
        3628A6C59E0E58183FB05835A44E1A5B23D0EFD0000000000000333234EBE7E6
        FDF6EDFFF5E7FFF5E2FFF1DCFFEFDAFFEFD8FFEDD4FFEBD2FFE9D0FDE8CDFDE8
        CDEEDDE1ACA4EA4243BD2E33D53D3DC5B1A4D2E8D2CCF1D9C3F4D8C0E0BEB845
        3529AAC3A132713944A75718752A71A177000000000000000000333333EBE9E8
        FDF7F0EEE6D9E7DACAEBDCC9ECDBC8ECDBC6EDDAC5ECDAC3EBD9C2EBDAC0ECD8
        BFE5D3C8E1D2E79089D42E33CC2F32D05C54ABC8B9D9E5D0C8F3D8C3DEBCB645
        342BAAC2A21A521F206A28377840000000000000000000000000333333EDEBEA
        FCF8F3FFF9EEFFF7E9FFF6E4FFF4E2FFF1DEFFEFDCFFEED9FDECD7FBEBD4FBE9
        D2FAE6D4F5E2DAC7BBDF4948BC3434B66058A5C2B3D3EBD8D0F5DAC6DDBAB648
        322CAFBFA7587E5A487749000000000000000000000000000000333333EFEDEC
        FEFAF5F0E9E0E7DED1EADDCDEADDCDEBDDCBECDCCBEDDCC9ECDBC8ECDBC6EDDB
        C4ECDAC3EBD8C3E6D5D8A8A0CF9991C6D6C8DAE6D3CCE9D4BFF4DBC7DEB9B54C
        302FBBB9B1000000000000000000000000000000000000000000333333F1EFEE
        FFFBF8FFFAF3FFFAEDFFF9EBFFF7E7FFF5E5FFF4E2FFF0DFFFEFDCFFEED9FFEC
        D7FDEBD4FDE9D0F8E5D6EDDFE3EBDDE1F3E0D1F8E2C9F8E3C8F6DDC9DCB7B34D
        2E2FBFB5B5000000000000000000000000000000000000000000333333F3F1F0
        FFFDF9EBE5DEE5DCCFE7DCCEEADDCFE9DCCCEADCCAE8DAC8E9DAC7E9DBC5EAD9
        C4EBD9C2EAD8C1EAD7C2E5D5C5E7D4C5E9D4BFEBD5BCE9D5BCF8DECDDBB7B14F
        2F30BFB5B5000000000000000000000000000000000000000000333333F5F3F3
        FFFFFBFFFCF7FFFDF4FFFBF1FFF9EFFFF9ECFFF7E9FFF6E5FFF3E3FEF0DEFDEF
        DCFCEED8FDECD7FBEAD5FBE9D2FEE9CEFFE8C9FFE8C3FFE6BFFFE3C2D9AFA251
        312CC4B8B8000000000000000000000000000000000000000000353234F7F5F5
        FFFEFEFFFEFDFFFDF9FFFCF7FEFAF5FCF9F1FDF7F0FDF6EDFDF4EAFCF3E6FBF0
        E2F9EFDEFAEDDDFAECDAF9EAD7FFEACEFFECBCFFE9ACFFD996FFCF96DAAB8C55
        3326D9CECA000000000000000000000000000000000000000000353234F7F6F8
        FFFFFFFDFDFDFEFFFDFCFDFBFDFBFAFBFAF6FBF8F4FBF7F2FBF5EEFBF4EBFBF2
        E8F9F0E3F7EEE1F8EDDFF8EBDBFFEDCFD0A46EBE843CBF7D2AAB6F2982553368
        4E40F7EEEA000000000000000000000000000000000000000000333333F9F9F9
        FFFFFFFDFFFFFEFEFEFEFFFDFCFDFBFDFCF8FDFAF6FBF8F3FBF7F2FBF5EEFBF4
        EBFBF2E8F9F0E3F9EEE0F8EDDFFFEED2FCCF96E6AC60DC9A47C18A4760452AE2
        D7D3000000000000000000000000000000000000000000000000333333FBFBFB
        FDFFFFFDFFFFFEFEFEFEFEFEFDFEFCFCFDFBFDFBFAFDFAF6FBF8F3FBF7F2FBF5
        EEFBF4EBFBF2E8F9F0E3F7EEE1FFF0D5FFD9A4EEBA77D6A25C774F1BD9CBB900
        0000000000000000000000000000000000000000000000000000343434FDFDFD
        FFFFFFFFFFFFFDFFFFFDFFFFFEFEFEFEFFFDFCFDFBFDFCF8FCF9F4FCF8F3FBF7
        F2FBF5EEFBF4EBFBF2E8F9F0E3FFF0D9FFE4B5DFBE8C7F6541C2B19C00000000
        0000000000000000000000000000000000000000000000000000333333FFFFFF
        FFFFFFFFFFFFFDFFFFFDFFFFFFFFFFFEFEFEFEFFFDFCFDFBFDFCF8FDFAF6FBF8
        F4FBF7F2F9F5F0F9F3ECF9F2E9FBF1DFFFECCB9A8766948B7D00000000000000
        0000000000000000000000000000000000000000000000000000333333FFFFFF
        FFFFFFFDFDFDFAFAFAF8F8F8F6F6F6F4F4F4F1F1F1EFEFEFEDEEECEDEBEAEAE8
        E7E8E6E5E6E4E3E3E1E0E3E0DCE2DFD7B3AC9D7A7566FBF7F200000000000000
        0000000000000000000000000000000000000000000000000000767676333333
        3333333333333333333333333333333434343333333333333333333333333333
        333333333333333333333333333334326F6F6900000000000000000000000000
        0000000000000000000000000000000000000000000000000000}
    end
  end
  object OpenPictureDialog1: TOpenPictureDialog
    Left = 672
    Top = 48
  end
end
