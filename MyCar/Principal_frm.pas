unit Principal_frm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, XPMan, Buttons, ExtCtrls, ImgList, ComCtrls, StdCtrls,
  ToolWin, ExtDlgs, DBCtrls, jpeg, DB, ADODB, OleServer, WordXP, AccessXP,
  MPlayer;

type
  TfrmPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Arquivo1: TMenuItem;
    Registro1: TMenuItem;
    Sair1: TMenuItem;
    Cadastros1: TMenuItem;
    Veculos1: TMenuItem;
    Motoristas1: TMenuItem;
    Categorias1: TMenuItem;
    Gerenciamento1: TMenuItem;
    PecasServios1: TMenuItem;
    Viagens1: TMenuItem;
    Consultas1: TMenuItem;
    Impressao1: TMenuItem;
    Ajuda1: TMenuItem;
    SobreoCarroComando1: TMenuItem;
    Ferramentas1: TMenuItem;
    Backup1: TMenuItem;
    Usurios1: TMenuItem;
    ImageList1: TImageList;
    Logoff1: TMenuItem;
    N1: TMenuItem;
    Timer1: TTimer;
    N2: TMenuItem;
    Calucladora1: TMenuItem;
    GeradordeConsultas1: TMenuItem;
    Exibir1: TMenuItem;
    BarradeStatus1: TMenuItem;
    Combustvel1: TMenuItem;
    XPManifest1: TXPManifest;
    Panel1: TPanel;
    btnVeiculos: TSpeedButton;
    btnMorista: TSpeedButton;
    btnCategorias: TSpeedButton;
    btnPecas: TSpeedButton;
    btnViagens: TSpeedButton;
    btnComb: TSpeedButton;
    ColorDialog1: TColorDialog;
    PlanodeFundo1: TMenuItem;
    trocarcordoFundo1: TMenuItem;
    InserirImagem1: TMenuItem;
    N3: TMenuItem;
    RemovercordoFundo1: TMenuItem;
    RemoverImagem1: TMenuItem;
    OpenPictureDialog1: TOpenPictureDialog;
    Image1: TImage;
    PopupMenu1: TPopupMenu;
    TrocarCor: TMenuItem;
    RemoverCordoFundo2: TMenuItem;
    N4: TMenuItem;
    InserirAlterarImagem1: TMenuItem;
    RemoverImagem2: TMenuItem;
    BarradeStatus2: TMenuItem;
    Ocultar1: TMenuItem;
    Ajuda2: TMenuItem;
    N5: TMenuItem;
    Calculadora1: TMenuItem;
    Label1: TLabel;
    GeradordeImpresso1: TMenuItem;
    RelatriodeBordo1: TMenuItem;
    ViagensePercursos1: TMenuItem;
    Abastecimentos1: TMenuItem;
    Browser1: TMenuItem;
    StatusBar1: TStatusBar;
    ManualdoUsurio1: TMenuItem;
    btnConsulta: TSpeedButton;
    btnCalculadora: TSpeedButton;
    btnImpressao: TSpeedButton;
    btnBrowser: TSpeedButton;
    ManualdoUsurio2: TMenuItem;
    Manuteno1: TMenuItem;
    Fornecedores1: TMenuItem;
    N6: TMenuItem;
    Financeiro1: TMenuItem;
    ContasaPagar1: TMenuItem;
    btnFornecedores: TSpeedButton;
    btnContas: TSpeedButton;
    btnManutenao: TSpeedButton;
    Shape1: TShape;
    OpenDialog1: TOpenDialog;
    CalcularGastosMotorFlex1: TMenuItem;
    procedure Sair1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Calucladora1Click(Sender: TObject);
    procedure btnCalculadoraClick(Sender: TObject);
    procedure BarradeStatus1Click(Sender: TObject);
    procedure Veculos1Click(Sender: TObject);
    procedure btnVeiculosClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnMoristaClick(Sender: TObject);
    procedure Categorias1Click(Sender: TObject);
    procedure btnCategoriasClick(Sender: TObject);
    procedure PecasServios1Click(Sender: TObject);
    procedure btnPecasClick(Sender: TObject);
    procedure Viagens1Click(Sender: TObject);
    procedure btnViagensClick(Sender: TObject);
    procedure Combustvel1Click(Sender: TObject);
    procedure btnCombClick(Sender: TObject);
    procedure GeradordeConsultas1Click(Sender: TObject);
    procedure btnConsultaClick(Sender: TObject);
    procedure Usurios1Click(Sender: TObject);
    procedure Logoff1Click(Sender: TObject);
    procedure trocarcordoFundo1Click(Sender: TObject);
    procedure RemovercordoFundo1Click(Sender: TObject);
    procedure InserirImagem1Click(Sender: TObject);
    procedure Motoristas1Click(Sender: TObject);
    procedure RemoverImagem1Click(Sender: TObject);
    procedure Calculadora1Click(Sender: TObject);
    procedure TrocarCorClick(Sender: TObject);
    procedure RemoverCordoFundo2Click(Sender: TObject);
    procedure InserirAlterarImagem1Click(Sender: TObject);
    procedure RemoverImagem2Click(Sender: TObject);
    procedure Ocultar1Click(Sender: TObject);
    procedure SobreoCarroComando1Click(Sender: TObject);
    procedure Ajuda2Click(Sender: TObject);
    procedure Registro1Click(Sender: TObject);
    procedure Backup1Click(Sender: TObject);
    procedure GeradordeImpresso1Click(Sender: TObject);
    procedure btnImpressaoClick(Sender: TObject);
    procedure ViagensePercursos1Click(Sender: TObject);
    procedure Abastecimentos1Click(Sender: TObject);
    procedure Browser1Click(Sender: TObject);
    procedure btnBrowserClick(Sender: TObject);
    procedure ManualdoUsurio1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ManualdoUsurio2Click(Sender: TObject);
    procedure Manuteno1Click(Sender: TObject);
    procedure btnManutenaoClick(Sender: TObject);
    procedure Lembrete;
    procedure Fornecedores1Click(Sender: TObject);
    procedure btnFornecedoresClick(Sender: TObject);
    procedure ContasaPagar1Click(Sender: TObject);
    procedure btnContasClick(Sender: TObject);
    procedure LembreteContas;
    procedure CalcularGastosMotorFlex1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses Cad_Veiculo_frm, Carro_Comando_dm, CadMotorista_frm, CadCategoria_frm,
  GerPecas_frm, GerViagem_frm, GerComb_frm, Consultas_frm,
  Usuario_frm, Senha_frm, Sobre_frm, Registro_frm, Backup_frm,
  Impressao_frm, RelatViag_frm, RelatAbast_frm, Browser_frm,
  Manutencao_frm, Lembrete_frm, CadFornec_frm, Contas_frm,
  LembreteConta_frm, Flex_frm;

{$R *.dfm}

function fConvertImagem() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmPrincipal.OpenPictureDialog1.FileName;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '\' then
       valor[i] := '/'
    else
       if valor[i] = '/' then
          valor[i] := '\';
    end;
    frmPrincipal.OpenPictureDialog1.FileName := valor;
end;

//function SerialNum(FDrive:String) :String;
//Var Serial : DWord;
//    DirLen, Flags : DWord;
//    DLabel : Array[0..11] of Char;
//begin
//    Try
//      GetVolumeInformation(PChar(FDrive+':\'),dLabel,12,@Serial,DirLen,Flags,nil,0);
//      Result := IntToHex(Serial,8);
//      Except
//          Result := '';
//    end;
//    frmPrincipal.Label1.Caption := Result;
//end;

//function SerialHD() : String;
//var Serial, NumSerial : String;
//begin
//    NumSerial := SerialNum(frmPrincipal.Label1.Caption);
//    With dmCarroComando.ADOQuery1 do begin
//       Active := False;
//       SQL.Clear;
//       SQL.Add('Select serial_hd from registro where codigo = 1');
//       Active := True;
//       Serial := FieldByName('serial_hd').AsString;
//       If Trim(Serial) = '' then begin
//          Active := False;
//          SQL.Clear;
//          SQL.Add('Update registro set serial_hd = '+QuotedStr(frmPrincipal.Label1.Caption)+'');
//          ExecSQL;
//       end
//       else begin
//          If Trim(Serial) <> Trim(NumSerial) then begin
//             Application.MessageBox('O programa n�o est� registrado para funcionar nesse computador! Voc� foi v�tima de falsifica��o do programa ou n�o tem licen�a para usar esse programa. Entre em contato com o programador para resolver esse problema...','Carro Comando - Erro Fatal',MB_OK+MB_ICONERROR);
//             Application.Terminate;
//          end;
//       end;
//    end;
//end;

function fBloqueia() : String;
var dData, Agora, Situacao : String;
begin
    Agora := DateToStr(Now);
    With dmCarroComando.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select situacao from registro where codigo = 1');
       Active := True;
       Situacao := fieldByName('situacao').AsString;
    end;
    If Situacao = 'ATIVO' then begin
       With dmCarroComando.ADOQuery1 do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Select dt_valid from registro where codigo = 1');
          Active := True;
          dData := fieldByName('dt_valid').AsString;
          If dData = Agora then begin
             Application.MessageBox('Sua Licen�a expira hoje! Entre em contato com o Programador at� o fim do dia para obter uma nova licen�a, pois a partir de amanh� o programa ser� bloqueado. Lembre-se, voc� tem que estar em dia com o pagamento do aluguel para obter uma nova licen�a.','Carro Comando - Aten��o',MB_OK+MB_ICONWARNING);
          end
          else begin
             If Now > StrToDate(dData) then begin
                Application.MessageBox('Sua Licen�a expirou. O Programa foi bloqueado! Entre em contato com o Programador para efetuar a renova��o da Licen�a e fazer o desbloqueio do programa.','Carro Comanodo - Programa Bloqueado',MB_OK+MB_ICONERROR);
                Active := False;
                SQL.Clear;
                SQL.Add('Update registro set situacao = ''INATIVO'' where codigo = 1');
                ExecSQL;
             end;
         end;
       end;
    end
    else begin
       Application.MessageBox('O Carro Comando est� BLOQUEADO! Para voc� poder us�-lo, entre em contato com o Programador nos endere�os localizados no menu Ajuda para efetuar o seu registro ou renovar sua licen�a do Carro Comando.','Carro Comando - Aviso',MB_OK+MB_ICONWARNING);
    end;
end;

function fSituacao() : String;
var sSituacao : String;
begin
    With dmCarroComando.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select situacao from registro where codigo = 1');
       Active := True;
       sSituacao := FieldByName('situacao').AsString;
       If sSituacao = 'INATIVO' then begin
          frmPrincipal.Cadastros1.Enabled := False;
          frmPrincipal.Gerenciamento1.Enabled := False;
          frmPrincipal.Consultas1.Enabled := False;
          frmPrincipal.Impressao1.Enabled := False;
          frmPrincipal.Ferramentas1.Enabled := False;
          frmPrincipal.Panel1.Enabled := False;
       end;
    end;
end;

procedure TfrmPrincipal.Sair1Click(Sender: TObject);
begin
    Close;
end;

procedure TfrmPrincipal.Timer1Timer(Sender: TObject);
begin
    DateSeparator := '/';
    ShortDateFormat := 'dd/mm/yyyy';
    StatusBar1.Panels[3].Text:= TimeToStr(Time);
    StatusBar1.Panels[4].Text:= DateToStr(Date);
end;

procedure TfrmPrincipal.Calucladora1Click(Sender: TObject);
begin
    Try
      WinExec('Calc.exe',Sw_Show);
    Except
      ShowMessage('Verifique se a Calculadora foi Instalada pelo Windows!');
    end;
end;

procedure TfrmPrincipal.btnCalculadoraClick(Sender: TObject);
begin
    Calucladora1Click(Sender);
end;

procedure TfrmPrincipal.BarradeStatus1Click(Sender: TObject);
begin
    If BarradeStatus1.Checked = True then begin
       BarradeStatus1.Checked := False;
       Ocultar1.Checked := False;
       StatusBar1.Visible := False;
    end
    else
       If BarradeStatus1.Checked = False then begin
          StatusBar1.Visible := True;
          BarradeStatus1.Checked := True;
          Ocultar1.Checked := True;
       end;
    end;

procedure TfrmPrincipal.Veculos1Click(Sender: TObject);
begin
    Try
      Application.CreateForm(TfrmCadVeiculo, frmCadVeiculo);
      frmCadVeiculo.ShowModal;
    Finally
         frmCadVeiculo.Free;
    end;
end;

procedure TfrmPrincipal.btnVeiculosClick(Sender: TObject);
begin
    Veculos1Click(Sender);
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
var cCor : String;
    fFoto : TStream;
    Jpeg : TJPEGImage;
begin
    fSituacao;
//    SerialHD;
    fBloqueia;
    dmCarroComando.ADOConnection1.Connected := True;
    Try
      Application.CreateForm(TfrmSenha, frmSenha);
      frmSenha.ShowModal;
    Finally
         frmSenha.Free;
    end;
    Jpeg := nil;
    With dmCarroComando.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select foto, cor from imagem where cod = ''1''');
       Active := True;
       cCor := FieldByName('cor').AsString;
       frmPrincipal.Color := StringToColor(cCor);
       fFoto := CreateBlobStream(FieldByName('foto'),bmRead);
       If fFoto.Size > 0 then begin
          Jpeg := TJPEGImage.Create;
          Jpeg.LoadFromStream(fFoto);
          Image1.Picture.Assign(Jpeg);
       end;
       Jpeg.Free;
       fFoto.Destroy;
    end;
end;

procedure TfrmPrincipal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    dmCarroComando.ADOConnection1.Connected := False;
end;

procedure TfrmPrincipal.btnMoristaClick(Sender: TObject);
begin
    Try
      Application.CreateForm(TfrmCadMotorista, frmCadMotorista);
      frmCadMotorista.ShowModal;
    Finally
        frmCadMotorista.Free;
    end;
end;

procedure TfrmPrincipal.Motoristas1Click(Sender: TObject);
begin
    btnMoristaClick(Sender);
end;

procedure TfrmPrincipal.Categorias1Click(Sender: TObject);
begin
    Try
      Application.CreateForm(TfrmCadCategoria, frmCadCategoria);
      frmCadCategoria.ShowModal;
    Finally
         frmCadCategoria.Free;
    end;
end;

procedure TfrmPrincipal.btnCategoriasClick(Sender: TObject);
begin
    Categorias1Click(Sender);
end;

procedure TfrmPrincipal.PecasServios1Click(Sender: TObject);
begin
    Try
      Application.CreateForm(TfrmGerPecas, frmGerPecas);
      frmGerPecas.ShowModal;
    Finally
         frmGerPecas.Free;
    end;
end;

procedure TfrmPrincipal.btnPecasClick(Sender: TObject);
begin
    PecasServios1Click(Sender);
end;

procedure TfrmPrincipal.Viagens1Click(Sender: TObject);
begin
    Try
      Application.CreateForm(TfrmGerViagem, frmGerViagem);
      frmGerViagem.ShowModal;
    Finally
         frmGerViagem.Free;
    end;
end;

procedure TfrmPrincipal.btnViagensClick(Sender: TObject);
begin
    Viagens1Click(Sender);
end;

procedure TfrmPrincipal.Combustvel1Click(Sender: TObject);
begin
    Try
      Application.CreateForm(TfrmGerComb, frmGerComb);
      frmGerComb.ShowModal;
    Finally
         frmGerComb.Free;
    end;
end;

procedure TfrmPrincipal.btnCombClick(Sender: TObject);
begin
    Combustvel1Click(Sender);
end;

procedure TfrmPrincipal.GeradordeConsultas1Click(Sender: TObject);
begin
    Try
      Application.CreateForm(TfrmConsultas, frmConsultas);
      frmConsultas.ShowModal;
    Finally
         frmConsultas.Free;
    end;
end;

procedure TfrmPrincipal.btnConsultaClick(Sender: TObject);
begin
    GeradordeConsultas1Click(Sender);
end;

procedure TfrmPrincipal.Usurios1Click(Sender: TObject);
begin
    If StatusBar1.Panels[2].Text = 'N�vel:Alto' then begin
       Try
         Application.CreateForm(TfrmUsuario, frmUsuario);
         frmUsuario.ShowModal;
       Finally
            frmUsuario.Free;
       end;
    end
    else begin
       Application.MessageBox('Seu n�vel de acesso � Baixo. Voc� n�o tem permiss�o para alterar Contas de Usu�rios!','Carro Comando - Aten��o',MB_OK+MB_ICONSTOP);
    end;
end;

procedure TfrmPrincipal.Logoff1Click(Sender: TObject);
begin
    Try
      Application.CreateForm(TfrmSenha, frmSenha);
      frmSenha.ShowModal;
    Finally
         frmSenha.Free;
    end;
end;

procedure TfrmPrincipal.trocarcordoFundo1Click(Sender: TObject);
var cCor : String;
begin
    If StatusBar1.Panels[2].Text = 'N�vel:Alto' then begin
       If ColorDialog1.Execute then begin
          frmPrincipal.Color := ColorDialog1.Color;
       end;
       cCor := ColorToString(Color);
       With dmCarroComando.ADOQuery1 do begin
          Active :=  False;
          SQL.Clear;
          SQL.Add('Update imagem set cor = '+QuotedStr(cCor)+' where cod = 1');
          ExecSQL;
       end;
    end
    else begin
       Application.MessageBox('Seu n�vel de acesso � Baixo. Voc� n�o tem permiss�o para executar esse comando!','Carro Comando - Aten��o',MB_OK+MB_ICONSTOP);
    end;
end;

procedure TfrmPrincipal.RemovercordoFundo1Click(Sender: TObject);
var cCor : String;
begin
    If StatusBar1.Panels[2].Text = 'N�vel:Alto' then begin
       frmPrincipal.Color := clBtnFace;
       cCor := ColorToString(frmPrincipal.Color);
       With dmCarroComando.ADOQuery1 do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Update imagem set cor = '+QuotedStr(cCor)+' where cod = 1');
          ExecSQL;
       end;
    end
    else begin
       Application.MessageBox('Seu n�vel de acesso � Baixo. Voc� n�o tem permiss�o para executar esse comando!','Carro Comando - Aten��o',MB_OK+MB_ICONSTOP);
    end;
end;

procedure TfrmPrincipal.InserirImagem1Click(Sender: TObject);
var iMagem : String;
begin
    If StatusBar1.Panels[2].Text = 'N�vel:Alto' then begin
       If OpenPictureDialog1.Execute then begin
          Image1.Picture.LoadFromFile(OpenPictureDialog1.FileName);
          fConvertImagem;
          iMagem := OpenPictureDialog1.FileName;
          With dmCarroComando.ADOQuery1 do begin
             Active := False;
             SQL.Clear;
             SQL.Add('Update imagem set foto = LOAD_FILE('+QuotedStr(iMagem)+') where cod = 1');
             ExecSQL;
          end;
          fConvertImagem;
       end;
    end
    else begin
       Application.MessageBox('Seu n�vel de acesso � Baixo. Voc� n�o tem permiss�o para executar esse comando!','Carro Comando - Aten��o',MB_OK+MB_ICONSTOP);
    end;
end;

procedure TfrmPrincipal.RemoverImagem1Click(Sender: TObject);
begin
    If StatusBar1.Panels[2].Text = 'N�vel:Alto' then begin
       With dmCarroComando.ADOQuery1 do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Update imagem set foto = null where cod =1');
          ExecSQL;
          Image1.Picture.Assign(nil);
       end;
    end
    else begin
       Application.MessageBox('Seu n�vel de acesso � Baixo. Voc� n�o tem permiss�o para executar esse comando!','Carro Comando - Aten��o',MB_OK+MB_ICONSTOP);
    end;
end;

procedure TfrmPrincipal.Calculadora1Click(Sender: TObject);
begin
    Calucladora1Click(Sender);
end;

procedure TfrmPrincipal.TrocarCorClick(Sender: TObject);
begin
    trocarcordoFundo1Click(Sender);
end;

procedure TfrmPrincipal.RemoverCordoFundo2Click(Sender: TObject);
begin
    RemovercordoFundo1Click(Sender);
end;

procedure TfrmPrincipal.InserirAlterarImagem1Click(Sender: TObject);
begin
    InserirImagem1Click(Sender);
end;

procedure TfrmPrincipal.RemoverImagem2Click(Sender: TObject);
begin
    RemoverImagem1Click(Sender);
end;

procedure TfrmPrincipal.Ocultar1Click(Sender: TObject);
begin
    BarradeStatus1Click(Sender);
end;

procedure TfrmPrincipal.SobreoCarroComando1Click(Sender: TObject);
begin
    Try
      Application.CreateForm(TfrmSobre, frmSobre);
      frmSobre.ShowModal;
    Finally
         frmSobre.Free;
    end;
end;

procedure TfrmPrincipal.Ajuda2Click(Sender: TObject);
begin
    SobreoCarroComando1Click(Sender);
end;

procedure TfrmPrincipal.Registro1Click(Sender: TObject);
begin
    Try
      Application.CreateForm(TfrmRegistro, frmRegistro);
      frmRegistro.ShowModal;
    Finally
         frmRegistro.Free;
    end;
end;


procedure TfrmPrincipal.Backup1Click(Sender: TObject);
begin
    If StatusBar1.Panels[2].Text = 'N�vel:Alto' then begin
       OpenDialog1.Execute;
    end
    else begin
       Application.MessageBox('Seu n�vel de acesso � Baixo. Voc� n�o tem permiss�o para criar arquivos de Backup!','Carro Comando - Aten��o',MB_OK+MB_ICONSTOP);
    end;
end;

procedure TfrmPrincipal.GeradordeImpresso1Click(Sender: TObject);
begin
    Try
      Application.CreateForm(TfrmImpressao, frmImpressao);
      frmImpressao.ShowModal;
    Finally
         frmImpressao.Free;
    end;
end;

procedure TfrmPrincipal.btnImpressaoClick(Sender: TObject);
begin
    GeradordeImpresso1Click(Sender);
end;

procedure TfrmPrincipal.ViagensePercursos1Click(Sender: TObject);
begin
    Try
      Application.CreateForm(TfrmRelatViag, frmRelatViag);
      frmRelatViag.qrpRelatViag.Preview;
    Finally
         frmRelatViag.Free;
    end;
end;

procedure TfrmPrincipal.Abastecimentos1Click(Sender: TObject);
begin
    Try
      Application.CreateForm(TfrmRelatAbast, frmRelatAbast);
      frmRelatAbast.qrpRelatAbast.Preview;
    Finally
         frmRelatAbast.Free;
    end;
end;

procedure TfrmPrincipal.Browser1Click(Sender: TObject);
begin
    If StatusBar1.Panels[2].Text = 'N�vel:Alto' then begin
//       Try
         Application.CreateForm(TfrmBrowser, frmBrowser);
         frmBrowser.Show;
//       Finally
//            frmBrowser.Free;
//       end;
    end
    else begin
       Application.MessageBox('Seu n�vel de acesso � Baixo. Voc� n�o tem permiss�o para navegar na Internet!','Carro Comando - Aten��o',MB_OK+MB_ICONSTOP);
    end;
end;

procedure TfrmPrincipal.btnBrowserClick(Sender: TObject);
begin
    Browser1Click(Sender);
end;

procedure TfrmPrincipal.ManualdoUsurio1Click(Sender: TObject);
begin
    Application.HelpFile := 'C:\Arquivos de Programas\RS Softwares\Carro Comando\CARRO COMANDO - MANUAL DO USUARIO';
    Application.HelpCommand(HELP_FORCEFILE, 0);
end;

procedure TfrmPrincipal.FormActivate(Sender: TObject);
begin
    With dmCarroComando.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select usuario from registro where codigo = 1');
       Active := True;
       frmPrincipal.Caption := 'Carro Comando - Sistema Para Gerenciamento de Autom�veis ['+FieldByName('usuario').AsString+']';
    end;
    Lembrete;
    LembreteContas;
//    MediaPlayer1.Open;
//    MediaPlayer1.Play;
end;

procedure TfrmPrincipal.ManualdoUsurio2Click(Sender: TObject);
begin
    ManualdoUsurio1Click(Sender);
end;

procedure TfrmPrincipal.Manuteno1Click(Sender: TObject);
begin
    Try
      Application.CreateForm(TfrmManutencao, frmManutencao);
      frmManutencao.ShowModal;
    Finally
         frmManutencao.Free;
    end;
end;

procedure TfrmPrincipal.btnManutenaoClick(Sender: TObject);
begin
    Manuteno1Click(Sender);
end;

procedure TfrmPrincipal.Lembrete;
var dData, dVenc : String;
begin
    DateSeparator := '/';
    ShortDateFormat := 'yyyy-mm-dd';
    dData := DateToStr(Date);
    With dmCarroComando.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select * from manutencao where mt_dtvenc = '+QuotedStr(dData)+' and mt_sit = ''ATIVO''');
       Active := True;
       dVenc := FieldByName('mt_dtvenc').AsString;
       If dData = dVenc then begin
          Try
            Application.CreateForm(TfrmLembrete, frmLembrete);
            frmLembrete.ShowModal;
          Finally
               frmLembrete.Free;
          end;
       end;
    end;
end;

procedure TfrmPrincipal.Fornecedores1Click(Sender: TObject);
begin
    Try
      Application.CreateForm(TfrmCadFornec, frmCadFornec);
      frmCadFornec.ShowModal;
    Finally
         frmCadFornec.Free;
    end;
end;

procedure TfrmPrincipal.btnFornecedoresClick(Sender: TObject);
begin
    Fornecedores1Click(Sender);
end;

procedure TfrmPrincipal.ContasaPagar1Click(Sender: TObject);
begin
    Try
      Application.CreateForm(TfrmContas, frmContas);
      frmContas.ShowModal;
    Finally
         frmContas.Free;
    end;
end;

procedure TfrmPrincipal.btnContasClick(Sender: TObject);
begin
    ContasaPagar1Click(Sender);
end;

procedure TfrmPrincipal.LembreteContas;
var dData, dVenc : String;
begin
    DateSeparator := '/';
    ShortDateFormat := 'yyyy-mm-dd';
    dData := DateToStr(Date);
    With dmCarroComando.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select * from contas where ct_venc = '+QuotedStr(dData)+' and ct_sit = ''N�O PAGO''');
       Active := True;
       dVenc := FieldByName('ct_venc').AsString;
       If dData = dVenc then begin
          Try
            Application.CreateForm(TfrmLembreteConta, frmLembreteConta);
            frmLembreteConta.ShowModal;
          Finally
               frmLembreteConta.Free;
          end;
       end;
    end;
end;

procedure TfrmPrincipal.CalcularGastosMotorFlex1Click(Sender: TObject);
begin
    Try
      Application.CreateForm(TfrmFlex, frmFlex);
      frmFlex.ShowModal;
    Finally
         frmFlex.Free;
    end;
end;

end.
