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
    Empresas1: TMenuItem;
    Especie1: TMenuItem;
    Gerenciamento1: TMenuItem;
    Compras1: TMenuItem;
    Vendas1: TMenuItem;
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
    Exibir1: TMenuItem;
    BarradeStatus1: TMenuItem;
    XPManifest1: TXPManifest;
    Panel1: TPanel;
    btnEmpresa: TSpeedButton;
    btnTerceiro: TSpeedButton;
    btnPatio: TSpeedButton;
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
    btnCalculadora: TSpeedButton;
    ManualdoUsurio2: TMenuItem;
    Shape1: TShape;
    Deposito1: TMenuItem;
    btnClassif: TSpeedButton;
    Classificacao1: TMenuItem;
    btnEspecie: TSpeedButton;
    btnEntrada: TSpeedButton;
    btnSaida: TSpeedButton;
    StatusBar1: TStatusBar;
    Terceiros1: TMenuItem;
    ConsultaTora1: TMenuItem;
    Entrada1: TMenuItem;
    EntradaporTerceiroResumo1: TMenuItem;
    EstoqueGeralResumido1: TMenuItem;
    Sada1: TMenuItem;
    N6: TMenuItem;
    Empresa1: TMenuItem;
    erceiro1: TMenuItem;
    Depsito1: TMenuItem;
    Classuficao1: TMenuItem;
    Espcie1: TMenuItem;
    btnConsTora: TSpeedButton;
    EstoqueAcumulativo1: TMenuItem;
    procedure Sair1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Calucladora1Click(Sender: TObject);
    procedure btnCalculadoraClick(Sender: TObject);
    procedure BarradeStatus1Click(Sender: TObject);
    procedure Empresas1Click(Sender: TObject);
    procedure btnEmpresaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Especie1Click(Sender: TObject);
    procedure Compras1Click(Sender: TObject);
    procedure Vendas1Click(Sender: TObject);
    procedure Usurios1Click(Sender: TObject);
    procedure Logoff1Click(Sender: TObject);
    procedure trocarcordoFundo1Click(Sender: TObject);
    procedure RemovercordoFundo1Click(Sender: TObject);
    procedure InserirImagem1Click(Sender: TObject);
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
    procedure ManualdoUsurio1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ManualdoUsurio2Click(Sender: TObject);
    procedure btnFreteirosClick(Sender: TObject);
    procedure btnPatioClick(Sender: TObject);
    procedure btnSetorClick(Sender: TObject);
    procedure btnClassifClick(Sender: TObject);
    procedure Deposito1Click(Sender: TObject);
    procedure Classificacao1Click(Sender: TObject);
    procedure btnEspecieClick(Sender: TObject);
    procedure SetoresdeProduo1Click(Sender: TObject);
    procedure MquinasdeProduo1Click(Sender: TObject);
    procedure btnMaquinasClick(Sender: TObject);
    procedure Freteiro1Click(Sender: TObject);
    procedure btnEntradaClick(Sender: TObject);
    procedure btnSaidaClick(Sender: TObject);
    procedure Terceiros1Click(Sender: TObject);
    procedure btnTerceiroClick(Sender: TObject);
    procedure ConsultaTora1Click(Sender: TObject);
    procedure btnConsToraClick(Sender: TObject);
    procedure Empresa1Click(Sender: TObject);
    procedure erceiro1Click(Sender: TObject);
    procedure Depsito1Click(Sender: TObject);
    procedure Classuficao1Click(Sender: TObject);
    procedure Espcie1Click(Sender: TObject);
    procedure Entrada1Click(Sender: TObject);
    procedure EntradaporTerceiroResumo1Click(Sender: TObject);
    procedure EstoqueGeralResumido1Click(Sender: TObject);
    procedure Sada1Click(Sender: TObject);
    procedure EstoqueAcumulativo1Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses Usuario_frm, Senha_frm, Sobre_frm, Registro_frm, Backup_frm,
  Carro_Comando_dm, CadFornec_frm, Impressao_frm,
  Entrada_frm, Saida_frm, CadEmpresa_frm,
  CadSubEsp_frm, MateriaPrima_frm, Deposito_frm, Setores_frm, Maquinas_frm,
  CadFreteiro_frm, ConsTora_frm, ImpEmpresa_frm, ImpTerceiro_frm,
  ImpDeposito_frm, ImpClassificacao, ImpEspecie_frm, EmisRelEntrada_frm,
  ImprimeTerceiro_frm, EmissEstoq_frm, EmisRelSaida_frm,
  EmissaoRelAcumulativo_frm;

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

function fSituacao() : String;
var sSituacao : String;
begin
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select situacao from registro where codigo = 1');
       Active := True;
       sSituacao := FieldByName('situacao').AsString;
       If sSituacao = 'INATIVO' then begin
          frmPrincipal.Arquivo1.Enabled := False;
          frmPrincipal.Cadastros1.Enabled := False;
          frmPrincipal.Gerenciamento1.Enabled := False;
          frmPrincipal.Impressao1.Enabled := False;
          frmPrincipal.Ferramentas1.Enabled := False;
          frmPrincipal.Panel1.Enabled := False;
          Application.MessageBox('O Sistema Controle de Toras est� BLOQUEADO! Para desbloquea-lo compre uma licen�a com o programador.','Controle de Toras - Erro Fatal',MB_OK + MB_ICONERROR);
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
       Image1.Height := 609;
    end
    else
       If BarradeStatus1.Checked = False then begin
          StatusBar1.Visible := True;
          BarradeStatus1.Checked := True;
          Ocultar1.Checked := True;
          Image1.Height := 593;
       end;
    end;

procedure TfrmPrincipal.Empresas1Click(Sender: TObject);
begin
    Try
      Application.CreateForm(TfrmCadEmpresa, frmCadEmpresa);
      frmCadEmpresa.ShowModal;
    Finally
         frmCadEmpresa.Free;
    end;
end;

procedure TfrmPrincipal.btnEmpresaClick(Sender: TObject);
begin
    Empresas1Click(Sender);
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
var cCor : String;
    fFoto : TStream;
    Jpeg : TJPEGImage;
begin
    fSituacao;
    dmVendas.ADOConnection1.Connected := True;
    Try
      Application.CreateForm(TfrmSenha, frmSenha);
      frmSenha.ShowModal;
    Finally
         frmSenha.Free;
    end;
    Jpeg := nil;
    With dmVendas.ADOQuery1 do begin
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
    dmVendas.ADOConnection1.Connected := False;
    If Application.MessageBox('Deseja fazer a C�pia de Seguran�a agora?','Controle de Toras - Backup',MB_YESNO+MB_ICONQUESTION) = ID_YES then begin
       Backup1Click(Sender);
    end;
end;

procedure TfrmPrincipal.Especie1Click(Sender: TObject);
begin
    Try
      Application.CreateForm(TfrmCadEspecie, frmCadEspecie);
      frmCadEspecie.ShowModal;
    Finally
         frmCadEspecie.Free;
    end;
end;

procedure TfrmPrincipal.btnFreteirosClick(Sender: TObject);
begin
    Freteiro1Click(Sender);
end;

procedure TfrmPrincipal.Compras1Click(Sender: TObject);
begin
    Try           
      Application.CreateForm(TfrmEntrada, frmEntrada);
      frmEntrada.ShowModal;
    Finally
         frmEntrada.Free;
    end;
end;

procedure TfrmPrincipal.btnPatioClick(Sender: TObject);
begin
    Deposito1Click(Sender);
end;

procedure TfrmPrincipal.Vendas1Click(Sender: TObject);
begin
    Try
      Application.CreateForm(TfrmSaida, frmSaida);
      frmSaida.ShowModal;
    Finally
         frmSaida.Free;
    end;
end;

procedure TfrmPrincipal.btnSetorClick(Sender: TObject);
begin
    SetoresdeProduo1Click(Sender);
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
       Application.MessageBox('Seu n�vel de acesso � Baixo. Voc� n�o tem permiss�o para alterar Contas de Usu�rios!','Controle de Toras - Aten��o',MB_OK+MB_ICONSTOP);
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
       With dmVendas.ADOQuery1 do begin
          Active :=  False;
          SQL.Clear;
          SQL.Add('Update imagem set cor = '+QuotedStr(cCor)+' where cod = 1');
          ExecSQL;
       end;
    end
    else begin
       Application.MessageBox('Seu n�vel de acesso � Baixo. Voc� n�o tem permiss�o para executar esse comando!','Controle de Toras - Aten��o',MB_OK+MB_ICONSTOP);
    end;
end;

procedure TfrmPrincipal.RemovercordoFundo1Click(Sender: TObject);
var cCor : String;
begin
    If StatusBar1.Panels[2].Text = 'N�vel:Alto' then begin
       frmPrincipal.Color := clBtnFace;
       cCor := ColorToString(frmPrincipal.Color);
       With dmVendas.ADOQuery1 do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Update imagem set cor = '+QuotedStr(cCor)+' where cod = 1');
          ExecSQL;
       end;
    end
    else begin
       Application.MessageBox('Seu n�vel de acesso � Baixo. Voc� n�o tem permiss�o para executar esse comando!','Controle de Toras - Aten��o',MB_OK+MB_ICONSTOP);
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
          With dmVendas.ADOQuery1 do begin
             Active := False;
             SQL.Clear;
             SQL.Add('Update imagem set foto = LOAD_FILE('+QuotedStr(iMagem)+') where cod = 1');
             ExecSQL;
          end;
          fConvertImagem;
       end;
    end
    else begin
       Application.MessageBox('Seu n�vel de acesso � Baixo. Voc� n�o tem permiss�o para executar esse comando!','Controle de Toras - Aten��o',MB_OK+MB_ICONSTOP);
    end;
end;

procedure TfrmPrincipal.RemoverImagem1Click(Sender: TObject);
begin
    If StatusBar1.Panels[2].Text = 'N�vel:Alto' then begin
       With dmVendas.ADOQuery1 do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Update imagem set foto = null where cod =1');
          ExecSQL;
          Image1.Picture.Assign(nil);
       end;
    end
    else begin
       Application.MessageBox('Seu n�vel de acesso � Baixo. Voc� n�o tem permiss�o para executar esse comando!','Controle de Toras - Aten��o',MB_OK+MB_ICONSTOP);
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
       Try
         Application.CreateForm(TfrmBackup, frmBackup);
         frmBackup.ShowModal;
       Finally
            frmBackup.Free;
       end;
    end
    else begin
       Application.MessageBox('Seu n�vel de acesso � Baixo. Voc� n�o tem permiss�o para criar arquivos de Backup!','Controle de Toras - Aten��o',MB_OK+MB_ICONSTOP);
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

procedure TfrmPrincipal.ManualdoUsurio1Click(Sender: TObject);
begin
//    Application.HelpFile := 'C:\Arquivos de Programas\RS Softwares\Carro Comando\CARRO COMANDO - MANUAL DO USUARIO';
//    Application.HelpCommand(HELP_FORCEFILE, 0);
end;

procedure TfrmPrincipal.FormActivate(Sender: TObject);
begin
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select usuario from registro where codigo = 1');
       Active := True;
       frmPrincipal.Caption := 'Controle de Toras ['+FieldByName('usuario').AsString+']';
    end;
end;

procedure TfrmPrincipal.ManualdoUsurio2Click(Sender: TObject);
begin
    ManualdoUsurio1Click(Sender);
end;

procedure TfrmPrincipal.btnClassifClick(Sender: TObject);
begin
    Classificacao1Click(Sender);
end;

procedure TfrmPrincipal.Deposito1Click(Sender: TObject);
begin
    Try
      Application.CreateForm(TfrmDeposito, frmDeposito);
      frmDeposito.ShowModal;
    Finally
         frmDeposito.Free;
    end;
end;

procedure TfrmPrincipal.Classificacao1Click(Sender: TObject);
begin
    Try
      Application.CreateForm(TfrmClassificacao, frmClassificacao);
      frmClassificacao.ShowModal;
    Finally
         frmClassificacao.Free;
    end;
end;

procedure TfrmPrincipal.btnEspecieClick(Sender: TObject);
begin
    Especie1Click(Sender);
end;

procedure TfrmPrincipal.SetoresdeProduo1Click(Sender: TObject);
begin
    Try
      Application.CreateForm(TfrmSetores, frmSetores);
      frmSetores.ShowModal;
    Finally
         frmSetores.Free;
    end;
end;

procedure TfrmPrincipal.MquinasdeProduo1Click(Sender: TObject);
begin
    Try
      Application.CreateForm(TfrmMaquinas, frmMaquinas);
      frmMaquinas.ShowModal;
    Finally
         frmMaquinas.Free;
    end;
end;

procedure TfrmPrincipal.btnMaquinasClick(Sender: TObject);
begin
    MquinasdeProduo1Click(Sender);
end;

procedure TfrmPrincipal.Freteiro1Click(Sender: TObject);
begin
    Try
      Application.CreateForm(TfrmCadFreteiro, frmCadFreteiro);
      frmCadFreteiro.ShowModal;
    Finally
         frmCadFreteiro.Free;
    end;
end;

procedure TfrmPrincipal.btnEntradaClick(Sender: TObject);
begin
    Compras1Click(Sender);    
end;

procedure TfrmPrincipal.btnSaidaClick(Sender: TObject);
begin
    Vendas1Click(Sender);    
end;

procedure TfrmPrincipal.Terceiros1Click(Sender: TObject);
begin
    Try
      Application.CreateForm(TfrmCadTerceiro, frmCadTerceiro);
      frmCadTerceiro.ShowModal;
    Finally
         frmCadTerceiro.Free;
    end;
end;

procedure TfrmPrincipal.btnTerceiroClick(Sender: TObject);
begin
    Terceiros1Click(Sender);
end;

procedure TfrmPrincipal.ConsultaTora1Click(Sender: TObject);
begin
    Try
      Application.CreateForm(TfrmConsTora, frmConsTora);
      frmConsTora.ShowModal;
    Finally
         frmConsTora.Free;
    end;
end;

procedure TfrmPrincipal.btnConsToraClick(Sender: TObject);
begin
    ConsultaTora1Click(Sender);
end;

procedure TfrmPrincipal.Empresa1Click(Sender: TObject);
begin
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select * from empresa order by id');
       Active := True;
    end;
    Try
      Application.CreateForm(TfrmImpEmpresa, frmImpEmpresa);
      frmImpEmpresa.qrpImpEmpresa.Preview;
    Finally
         frmImpEmpresa.Free;
    end;
end;

procedure TfrmPrincipal.erceiro1Click(Sender: TObject);
begin
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select * from terceiro order by id');
       Active := True;
    end;
    Try
      Application.CreateForm(TfrmImpTerceiro, frmImpTerceiro);
      frmImpTerceiro.qrpImpTerceiro.Preview;
    Finally
         frmImpTerceiro.Free;
    end;
end;

procedure TfrmPrincipal.Depsito1Click(Sender: TObject);
begin
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select * from deposito order by id');
       Active := True;
    end;
    Try
      Application.CreateForm(TfrmImpDeposito, frmImpDeposito);
      frmImpDeposito.qrpImpDeposito.Preview;
    Finally
         frmImpDeposito.Free;
    end;
end;

procedure TfrmPrincipal.Classuficao1Click(Sender: TObject);
begin
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select * from classificacao order by id');
       Active := True;
    end;
    Try
      Application.CreateForm(TfrmImpClassificacao, frmImpClassificacao);
      frmImpClassificacao.qrpImpClassificacao.Preview;
    Finally
         frmImpClassificacao.Free;
    end;
end;

procedure TfrmPrincipal.Espcie1Click(Sender: TObject);
begin
     With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select * from especie order by id');
       Active := True;
    end;
    Try
      Application.CreateForm(TfrmImpEspecie, frmImpEspecie);
      frmImpEspecie.qrpImpEspecie.Preview;
    Finally
         frmImpEspecie.Free;
    end;
end;

procedure TfrmPrincipal.Entrada1Click(Sender: TObject);
begin
    Try
      Application.CreateForm(TfrmEmisRelEntrada, frmEmisRelEntrada);
      frmEmisRelEntrada.ShowModal;
    Finally
         frmEmisRelEntrada.Free;
    end;
end;

procedure TfrmPrincipal.EntradaporTerceiroResumo1Click(Sender: TObject);
begin
    Try
      Application.CreateForm(TfrmImprimeTerceiro, frmImprimeTerceiro);
      frmImprimeTerceiro.ShowModal;
    Finally
         frmImprimeTerceiro.Free;
    end;
end;

procedure TfrmPrincipal.EstoqueGeralResumido1Click(Sender: TObject);
begin
    Try
      Application.CreateForm(TfrmEmisEstoq, frmEmisEstoq);
      frmEmisEstoq.ShowModal;
    Finally
         frmEmisEstoq.Free;
    end;
end;

procedure TfrmPrincipal.Sada1Click(Sender: TObject);
begin
    Try
      Application.CreateForm(TfrmEmisRelSaida, frmEmisRelSaida);
      frmEmisRelSaida.ShowModal;
    Finally
         frmEmisRelSaida.Free;
    end;
end;

procedure TfrmPrincipal.EstoqueAcumulativo1Click(Sender: TObject);
begin
    Try
      Application.CreateForm(TfrmEmissaoRelAcumulativo, frmEmissaoRelAcumulativo);
      frmEmissaoRelAcumulativo.ShowModal;
    Finally
         frmEmissaoRelAcumulativo.Free;
    end;
end;

end.
