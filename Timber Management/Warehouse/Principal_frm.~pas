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
    Clientes1: TMenuItem;
    Produtos1: TMenuItem;
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
    btnClientes: TSpeedButton;
    btnFornecedores: TSpeedButton;
    btnCompras: TSpeedButton;
    btnVendas: TSpeedButton;
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
    StatusBar1: TStatusBar;
    btnCalculadora: TSpeedButton;
    btnImpressao: TSpeedButton;
    ManualdoUsurio2: TMenuItem;
    Fornecedores1: TMenuItem;
    btnProdutos: TSpeedButton;
    Shape1: TShape;
    N6: TMenuItem;
    UnidadedeMedidas1: TMenuItem;
    btnUnidade: TSpeedButton;
    Categoria1: TMenuItem;
    btnCategoria: TSpeedButton;
    procedure Sair1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Calucladora1Click(Sender: TObject);
    procedure btnCalculadoraClick(Sender: TObject);
    procedure BarradeStatus1Click(Sender: TObject);
    procedure Clientes1Click(Sender: TObject);
    procedure btnClientesClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnFornecedoresClick(Sender: TObject);
    procedure Produtos1Click(Sender: TObject);
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
    procedure Fornecedores1Click(Sender: TObject);
    procedure btnProdutosClick(Sender: TObject);
    procedure btnComprasClick(Sender: TObject);
    procedure btnVendasClick(Sender: TObject);
    procedure btnUnidadeClick(Sender: TObject);
    procedure UnidadedeMedidas1Click(Sender: TObject);
    procedure Categoria1Click(Sender: TObject);
    procedure btnCategoriaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses Usuario_frm, Senha_frm, Sobre_frm, Registro_frm, Backup_frm,
  Carro_Comando_dm, CadFornec_frm, Impressao_frm, CadCli_frm, CadProd_frm,
  Entrada_frm, Saida_frm, CadMedida_frm, CadCateg_frm;

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
          Application.MessageBox('O Sistema Almoxarifado está BLOQUEADO! Para desbloquea-lo compre uma licença com o programador.','Sistema Almoxarifado - Erro Fatal',MB_OK + MB_ICONERROR);
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

procedure TfrmPrincipal.Clientes1Click(Sender: TObject);
begin
    Try
      Application.CreateForm(TfrmCadCli, frmCadCli);
      frmCadCli.ShowModal;
    Finally
         frmCadCli.Free;
    end;
end;

procedure TfrmPrincipal.btnClientesClick(Sender: TObject);
begin
    Clientes1Click(Sender);
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

procedure TfrmPrincipal.Produtos1Click(Sender: TObject);
begin
    Try
      Application.CreateForm(TfrmCadProd, frmCadProd);
      frmCadProd.ShowModal;
    Finally
         frmCadProd.Free;
    end;
end;

procedure TfrmPrincipal.btnProdutosClick(Sender: TObject);
begin
    Produtos1Click(Sender);
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

procedure TfrmPrincipal.btnComprasClick(Sender: TObject);
begin
    Compras1Click(Sender);
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

procedure TfrmPrincipal.btnVendasClick(Sender: TObject);
begin
    Vendas1Click(Sender);
end;

procedure TfrmPrincipal.Usurios1Click(Sender: TObject);
begin
    If StatusBar1.Panels[2].Text = 'Nível:Alto' then begin
       Try
         Application.CreateForm(TfrmUsuario, frmUsuario);
         frmUsuario.ShowModal;
       Finally
            frmUsuario.Free;
       end;
    end
    else begin
       Application.MessageBox('Seu nível de acesso é Baixo. Você não tem permissão para alterar Contas de Usuários!','Sistema Almoxarifado - Atenção',MB_OK+MB_ICONSTOP);
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
    If StatusBar1.Panels[2].Text = 'Nível:Alto' then begin
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
       Application.MessageBox('Seu nível de acesso é Baixo. Você não tem permissão para executar esse comando!','Sistema Almoxarifado - Atenção',MB_OK+MB_ICONSTOP);
    end;
end;

procedure TfrmPrincipal.RemovercordoFundo1Click(Sender: TObject);
var cCor : String;
begin
    If StatusBar1.Panels[2].Text = 'Nível:Alto' then begin
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
       Application.MessageBox('Seu nível de acesso é Baixo. Você não tem permissão para executar esse comando!','Sistema Almoxarifado - Atenção',MB_OK+MB_ICONSTOP);
    end;
end;

procedure TfrmPrincipal.InserirImagem1Click(Sender: TObject);
var iMagem : String;
begin
    If StatusBar1.Panels[2].Text = 'Nível:Alto' then begin
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
       Application.MessageBox('Seu nível de acesso é Baixo. Você não tem permissão para executar esse comando!','Sistema Almoxarifado - Atenção',MB_OK+MB_ICONSTOP);
    end;
end;

procedure TfrmPrincipal.RemoverImagem1Click(Sender: TObject);
begin
    If StatusBar1.Panels[2].Text = 'Nível:Alto' then begin
       With dmVendas.ADOQuery1 do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Update imagem set foto = null where cod =1');
          ExecSQL;
          Image1.Picture.Assign(nil);
       end;
    end
    else begin
       Application.MessageBox('Seu nível de acesso é Baixo. Você não tem permissão para executar esse comando!','Sistema Almoxarifado - Atenção',MB_OK+MB_ICONSTOP);
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
    If StatusBar1.Panels[2].Text = 'Nível:Alto' then begin
       Try
         Application.CreateForm(TfrmBackup, frmBackup);
         frmBackup.ShowModal;
       Finally
            frmBackup.Free;
       end;
    end
    else begin
       Application.MessageBox('Seu nível de acesso é Baixo. Você não tem permissão para criar arquivos de Backup!','Sistema Almoxarifado - Atenção',MB_OK+MB_ICONSTOP);
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
       frmPrincipal.Caption := 'Sistema Almoxarifado ['+FieldByName('usuario').AsString+']';
    end;
end;

procedure TfrmPrincipal.ManualdoUsurio2Click(Sender: TObject);
begin
    ManualdoUsurio1Click(Sender);
end;

procedure TfrmPrincipal.btnUnidadeClick(Sender: TObject);
begin
    UnidadedeMedidas1Click(Sender);
end;

procedure TfrmPrincipal.UnidadedeMedidas1Click(Sender: TObject);
begin
    Try
      Application.CreateForm(TfrmCadMed, frmCadMed);
      frmCadMed.ShowModal;
    Finally
         frmCadMed.Free;
    end;
end;

procedure TfrmPrincipal.Categoria1Click(Sender: TObject);
begin
    Try
      Application.CreateForm(TfrmCadCateg, frmCadCateg);
      frmCadCateg.ShowModal;
    Finally
         frmCadCateg.Free;
    end;
end;

procedure TfrmPrincipal.btnCategoriaClick(Sender: TObject);
begin
    Categoria1Click(Sender);
end;

end.
