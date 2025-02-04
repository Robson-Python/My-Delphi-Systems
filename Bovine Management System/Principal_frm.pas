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
    Despesas1: TMenuItem;
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
    btnDespesas: TSpeedButton;
    btnProdutos: TSpeedButton;
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
    btnConsulta: TSpeedButton;
    btnCalculadora: TSpeedButton;
    btnImpressao: TSpeedButton;
    Produtos: TMenuItem;
    Shape1: TShape;
    Fornecedores1: TMenuItem;
    btnFornecedor: TSpeedButton;
    Gerenciamento1: TMenuItem;
    ControledeDespesas1: TMenuItem;
    btnEntradaAnimais: TSpeedButton;
    btnControleDesp: TSpeedButton;
    N6: TMenuItem;
    N7: TMenuItem;
    EntradaeSaidadeAnimais1: TMenuItem;
    SadadeAnimais1: TMenuItem;
    btnSaidaAnimais: TSpeedButton;
    ControledeLavoura1: TMenuItem;
    btnLavoura: TSpeedButton;
    ManualdoUsurio1: TMenuItem;
    ManualdoUsurio2: TMenuItem;
    ControleDiriodeConfinamento1: TMenuItem;
    btnDiario: TSpeedButton;
    N8: TMenuItem;
    Confinamentos1: TMenuItem;
    procedure Sair1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Calucladora1Click(Sender: TObject);
    procedure btnCalculadoraClick(Sender: TObject);
    procedure BarradeStatus1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnDespesasClick(Sender: TObject);
//    procedure FuncionariosClick(Sender: TObject);
    procedure GeradordeConsultas1Click(Sender: TObject);
    procedure btnConsultaClick(Sender: TObject);
    procedure Usurios1Click(Sender: TObject);
    procedure Logoff1Click(Sender: TObject);
    procedure trocarcordoFundo1Click(Sender: TObject);
    procedure RemovercordoFundo1Click(Sender: TObject);
    procedure InserirImagem1Click(Sender: TObject);
    procedure Despesas1Click(Sender: TObject);
    procedure RemoverImagem1Click(Sender: TObject);
    procedure Calculadora1Click(Sender: TObject);
    procedure TrocarCorClick(Sender: TObject);
    procedure RemoverCordoFundo2Click(Sender: TObject);
    procedure InserirAlterarImagem1Click(Sender: TObject);
    procedure RemoverImagem2Click(Sender: TObject);
    procedure Ocultar1Click(Sender: TObject);
    procedure SobreoCarroComando1Click(Sender: TObject);
    procedure Registro1Click(Sender: TObject);
    procedure GeradordeImpresso1Click(Sender: TObject);
    procedure btnImpressaoClick(Sender: TObject);
    procedure ManualdoUsurio1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ManualdoUsurio2Click(Sender: TObject);
    procedure btnProdutosClick(Sender: TObject);
    procedure ProdutosClick(Sender: TObject);
    procedure Fornecedores1Click(Sender: TObject);
    procedure btnFornecedorClick(Sender: TObject);
    procedure ControledeDespesas1Click(Sender: TObject);
    procedure btnControleDespClick(Sender: TObject);
    procedure EntradaeSaidadeAnimais1Click(Sender: TObject);
    procedure btnEntradaAnimaisClick(Sender: TObject);
    procedure SadadeAnimais1Click(Sender: TObject);
    procedure btnSaidaAnimaisClick(Sender: TObject);
    procedure ControledeLavoura1Click(Sender: TObject);
    procedure btnLavouraClick(Sender: TObject);
    procedure Backup1Click(Sender: TObject);
    procedure ControleDiriodeConfinamento1Click(Sender: TObject);
    procedure btnDiarioClick(Sender: TObject);
    procedure Confinamentos1Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses Carro_Comando_dm, Consultas_frm, Usuario_frm, Senha_frm, Sobre_frm, Registro_frm, Backup_frm, Impressao_frm,
     CadFunc_frm, CadProd_frm, CadFornec_frm, CadDespesa_frm, EntradaAnimais_frm, SaidaAnimais_frm,
     Ativar_frm, Confinamento_frm, Lavoura_frm, Alimentos_frm,
  PasswordDialog_frm, ControleDiario_frm;

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

function DataBase() : String;
begin
    DateSeparator := '/';
    ShortDateFormat := 'yyyy-mm-dd';
    With dmCarroComando.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select * from sistema');
       Active := True;
       If dmCarroComando.ADOQuery1.RecordCount = 0 then begin
          Active := True;
          SQL.Clear;
          SQL.Add('Insert into sistema (CODIGO, REGISTRO, DT_IMPLANT, DT_VALID, SITUACAO, SERIAL_NUMBER, DIAS) values (1, '''', '+QuotedStr(DateToStr(Date))+', '+QuotedStr(DateToStr(Date))+', ''INATIVO'', ''KAZ-2Y5'', ''0'')');
          ExecSQL;
       end;
    end;
    ShortDateFormat := 'dd/mm/yyyy';
end;

function fImagem() : String;
begin
    With dmCarroComando.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select * from imagem');
       Active := True;
       If dmCarroComando.ADOQuery1.RecordCount = 0 then begin
          Active := True;
          SQL.Clear;
          SQL.Add('Insert into imagem (COD, FOTO, COR) values (1, '''', ''clBtnFace'')');
          ExecSQL;
       end;
    end;
end;

function fBloqueia() : String;
var dData, Agora, Situacao : String;
begin
    Agora := DateToStr(Now);
    With dmCarroComando.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select situacao from sistema where codigo = 1');
       Active := True;
       Situacao := fieldByName('situacao').AsString;
    end;
    If Situacao = 'ATIVO' then begin
       With dmCarroComando.ADOQuery1 do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Select dt_valid from sistema where codigo = 1');
          Active := True;
          dData := fieldByName('dt_valid').AsString;
          If dData = Agora then begin
             Application.MessageBox('Sua Licença expira hoje! Entre em contato com o Programador até o fim do dia para obter uma nova licença, pois a partir de amanhã o programa será bloqueado. Lembre-se, você tem que estar em dia com o pagamento da licença para obter uma nova licença.','Omega - Atenção - Sua Licença Expira Hoje',MB_OK+MB_ICONWARNING);
          end
          else begin
             If Now > StrToDate(dData) then begin
                Application.MessageBox('Sua Licença expirou. O Programa foi bloqueado! Entre em contato com o Programador para efetuar a renovação da Licença e fazer o desbloqueio do programa.','Omega - Programa Bloqueado',MB_OK+MB_ICONERROR);
                Active := False;
                SQL.Clear;
                SQL.Add('Update sistema set situacao = ''INATIVO'' where codigo = 1');
                ExecSQL;
             end;
         end;
       end;
    end
    else begin
       Application.MessageBox('O Omega está BLOQUEADO! Para você continuar a usá-lo, entre em contato com o Programador Proprietário do Sistema nos endereços localizados no menu Ajuda para efetuar a ativação de sua licença do Omega.','Omega - Aviso - Sua Licença Expirou',MB_OK+MB_ICONWARNING);
    end;
end;

function fSituacao() : String;
var sSituacao : String;
begin
    With dmCarroComando.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select situacao from sistema where codigo = 1');
       Active := True;
       sSituacao := FieldByName('situacao').AsString;
       If sSituacao = 'INATIVO' then begin
          frmPrincipal.Cadastros1.Enabled := False;
          frmPrincipal.Impressao1.Enabled := False;
          frmPrincipal.Ferramentas1.Enabled := False;
          frmPrincipal.Gerenciamento1.Enabled := False;
          frmPrincipal.Panel1.Enabled := False;
          frmPrincipal.Registro1.Enabled := False;
          frmPrincipal.PlanodeFundo1.Enabled := False;
          frmPrincipal.Logoff1.Enabled := False;
          frmPrincipal.Exibir1.Enabled := False;
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

procedure TfrmPrincipal.FormShow(Sender: TObject);
var cCor : String;
    fFoto : TStream;
    Jpeg : TJPEGImage;
begin
    DataBase;
    fImagem;
    fSituacao;
    fBloqueia;
    dmCarroComando.ZConnection1.Connected := True;
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
    dmCarroComando.ZConnection1.Connected := False;
end;

procedure TfrmPrincipal.btnDespesasClick(Sender: TObject);
begin
    Despesas1Click(Sender);
end;

procedure TfrmPrincipal.Despesas1Click(Sender: TObject);
begin
    Try
      Application.CreateForm(TfrmCadDespesas, frmCadDespesas);
      frmCadDespesas.ShowModal;
    Finally
        frmCadDespesas.Free;
    end;
end;

//procedure TfrmPrincipal.FuncionariosClick(Sender: TObject);
//begin
//    Try
//      Application.CreateForm(TfrmCadFunc, frmCadFunc);
//      frmCadFunc.ShowModal;
//    Finally
//         frmCadFunc.Free;
//    end;
//end;

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
    Confinamentos1Click(Sender);
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
       Application.MessageBox('Seu nível de acesso é Baixo. Você não tem permissão para alterar Contas de Usuários!','Omega - Atenção',MB_OK+MB_ICONSTOP);
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
       With dmCarroComando.ADOQuery1 do begin
          Active :=  False;
          SQL.Clear;
          SQL.Add('Update imagem set cor = '+QuotedStr(cCor)+' where cod = 1');
          ExecSQL;
       end;
    end
    else begin
       Application.MessageBox('Seu nível de acesso é Baixo. Você não tem permissão para executar esse comando!','Omega - Atenção',MB_OK+MB_ICONSTOP);
    end;
end;

procedure TfrmPrincipal.RemovercordoFundo1Click(Sender: TObject);
var cCor : String;
begin
    If StatusBar1.Panels[2].Text = 'Nível:Alto' then begin
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
       Application.MessageBox('Seu nível de acesso é Baixo. Você não tem permissão para executar esse comando!','Omega - Atenção',MB_OK+MB_ICONSTOP);
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
       Application.MessageBox('Seu nível de acesso é Baixo. Você não tem permissão para executar esse comando!','Omega - Atenção',MB_OK+MB_ICONSTOP);
    end;
end;

procedure TfrmPrincipal.RemoverImagem1Click(Sender: TObject);
begin
    If StatusBar1.Panels[2].Text = 'Nível:Alto' then begin
       With dmCarroComando.ADOQuery1 do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Update imagem set foto = null where cod =1');
          ExecSQL;
          Image1.Picture.Assign(nil);
       end;
    end
    else begin
       Application.MessageBox('Seu nível de acesso é Baixo. Você não tem permissão para executar esse comando!','Omega - Atenção',MB_OK+MB_ICONSTOP);
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

procedure TfrmPrincipal.Registro1Click(Sender: TObject);
begin
    Try
      Application.CreateForm(TfrmRegistro, frmRegistro);
      frmRegistro.ShowModal;
    Finally
         frmRegistro.Free;
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
    Application.HelpFile := 'C:\Arquivos de Programas\Omega\Omega\OMEGA - MANUAL DO USUARIO';
    Application.HelpCommand(HELP_FORCEFILE, 0);
end;

procedure TfrmPrincipal.FormActivate(Sender: TObject);
begin
    With dmCarroComando.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select usuario from registro where codigo = 1');
       Active := True;
       frmPrincipal.Caption := 'Omega - Sistema Para Gerenciamento e Controle Financeiro de Criação Bovina['+FieldByName('usuario').AsString+']';
    end;
end;

procedure TfrmPrincipal.ManualdoUsurio2Click(Sender: TObject);
begin
    ManualdoUsurio1Click(Sender);
end;

procedure TfrmPrincipal.btnProdutosClick(Sender: TObject);
begin
    ProdutosClick(Sender);
end;

procedure TfrmPrincipal.ProdutosClick(Sender: TObject);
begin
    Try
      Application.CreateForm(TfrmCadProd, frmCadProd);
      frmCadProd.ShowModal;
    Finally
         frmCadProd.Free;
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

procedure TfrmPrincipal.btnFornecedorClick(Sender: TObject);
begin
    Fornecedores1Click(Sender);
end;

procedure TfrmPrincipal.ControledeDespesas1Click(Sender: TObject);
begin
    Try
      Application.CreateForm(TfrmAlimentos, frmAlimentos);
      frmAlimentos.ShowModal;
    Finally
         frmAlimentos.Free;
    end;
end;

procedure TfrmPrincipal.btnControleDespClick(Sender: TObject);
begin
    ControledeDespesas1Click(Sender);
end;

procedure TfrmPrincipal.EntradaeSaidadeAnimais1Click(Sender: TObject);
begin
    Try
      Application.CreateForm(TfrmEntradaAnimais, frmEntradaAnimais);
      frmEntradaAnimais.ShowModal;
    Finally
         frmEntradaAnimais.Free;
    end;
end;

procedure TfrmPrincipal.btnEntradaAnimaisClick(Sender: TObject);
begin
    EntradaeSaidadeAnimais1Click(Sender);    
end;

procedure TfrmPrincipal.SadadeAnimais1Click(Sender: TObject);
begin
    Try
      Application.CreateForm(TfrmSaidaAnimais, frmSaidaAnimais);
      frmSaidaAnimais.ShowModal;
    Finally
         frmSaidaAnimais.Free;
    end;
end;

procedure TfrmPrincipal.btnSaidaAnimaisClick(Sender: TObject);
begin
    SadadeAnimais1Click(Sender);
end;

procedure TfrmPrincipal.ControledeLavoura1Click(Sender: TObject);
begin
    Try
      Application.CreateForm(TfrmLavoura, frmLavoura);
      frmLavoura.ShowModal;
    Finally
         frmLavoura.Free;
    end;
end;

procedure TfrmPrincipal.btnLavouraClick(Sender: TObject);
begin
    ControledeLavoura1Click(Sender);
end;

procedure TfrmPrincipal.Backup1Click(Sender: TObject);
begin
    If StatusBar1.Panels[2].Text = 'Nível:Alto' then begin
       Try
         Application.CreateForm(TPasswordDlg, PasswordDlg);
         PasswordDlg.ShowModal;
       Finally
            PasswordDlg.Free;
       end;
    end
    else begin
       Application.MessageBox('Seu nível de acesso é Baixo. Você não tem permissão para executar esse comando!','Omega - Atenção',MB_OK+MB_ICONSTOP);
    end;
end;

procedure TfrmPrincipal.ControleDiriodeConfinamento1Click(Sender: TObject);
begin
    Try
      Application.CreateForm(TfrmControleDiario, frmControleDiario);
      frmControleDiario.ShowModal;
    Finally
         frmControleDiario.Free;
    end;
end;

procedure TfrmPrincipal.btnDiarioClick(Sender: TObject);
begin
    ControleDiriodeConfinamento1Click(Sender);    
end;

procedure TfrmPrincipal.Confinamentos1Click(Sender: TObject);
begin
    Try
      Application.CreateForm(TfrmConsultas, frmConsultas);
      frmConsultas.ShowModal;
    Finally
         frmConsultas.Free;
    end;
end;

end.
