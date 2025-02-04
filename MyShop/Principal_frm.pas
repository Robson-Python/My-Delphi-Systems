unit Principal_frm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, XPMan, ExtDlgs, Menus, ExtCtrls, ImgList, ComCtrls, StdCtrls,
  Buttons, jpeg, System.ImageList;

type
  TfrmPrincipal = class(TForm)
    Image1: TImage;
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    btnProduto: TSpeedButton;
    btnServico: TSpeedButton;
    btnCalculadora: TSpeedButton;
    btnClientes: TSpeedButton;
    btnSaida: TSpeedButton;
    btnBackup: TSpeedButton;
    MainMenu1: TMainMenu;
    Arquivo1: TMenuItem;
    Registro1: TMenuItem;
    Exibir1: TMenuItem;
    BarradeStatus1: TMenuItem;
    N1: TMenuItem;
    Sair1: TMenuItem;
    Cadastros1: TMenuItem;
    Clientes1: TMenuItem;
    Servicos1: TMenuItem;
    Produtos1: TMenuItem;
    Ferramentas1: TMenuItem;
    Calculadora1: TMenuItem;
    BackupRestore1: TMenuItem;
    Ajuda1: TMenuItem;
    SobreoEnterprise: TMenuItem;
    Timer1: TTimer;
    ColorDialog1: TColorDialog;
    OpenPictureDialog1: TOpenPictureDialog;
    XPManifest1: TXPManifest;
    Movimento1: TMenuItem;
    VendaProdutos1: TMenuItem;
    PlanodeFundo1: TMenuItem;
    TrocarCordoFundo1: TMenuItem;
    RemoverCordoFundo1: TMenuItem;
    N2: TMenuItem;
    TrocarImagemdoFundo1: TMenuItem;
    RemoverImagemdoFundo1: TMenuItem;
    Caixa1: TMenuItem;
    btnCaixa: TSpeedButton;
    Contas1: TMenuItem;
    N3: TMenuItem;
    btnContas: TSpeedButton;
    ContasdeUsurios1: TMenuItem;
    N4: TMenuItem;
    Log1: TMenuItem;
    ManualdoUsurio1: TMenuItem;
    dtpDataCount: TDateTimePicker;
    dtpDataAtual: TDateTimePicker;
    dtpDataFinal: TDateTimePicker;
    edtCount: TEdit;
    PopupMenu1: TPopupMenu;
    TrocarCordoFundo2: TMenuItem;
    RemoverCordoFundo2: TMenuItem;
    MenuItem1: TMenuItem;
    InserirAlterarImagem2: TMenuItem;
    RemoverImagem2: TMenuItem;
    N5: TMenuItem;
    BarradeStatus2: TMenuItem;
    Ocultar1: TMenuItem;
    Ajuda2: TMenuItem;
    Calculadora2: TMenuItem;
    ManualdoUsurio2: TMenuItem;
    Fornecedores1: TMenuItem;
    ImageList1: TImageList;
    btnFornecedores: TSpeedButton;
    PhotoBooklbum1: TMenuItem;
    N6: TMenuItem;
    btnAlbum: TSpeedButton;
    N7: TMenuItem;
    N8: TMenuItem;
    Balanco1: TMenuItem;
    btnBalanco: TSpeedButton;
    DateTimePicker1: TDateTimePicker;
    edtHora: TEdit;
    Agenda1: TMenuItem;
    btnAgenda: TSpeedButton;
    procedure Sair1Click(Sender: TObject);
    procedure Clientes1Click(Sender: TObject);
    procedure btnClientesClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure BarradeStatus1Click(Sender: TObject);
    procedure btnCalculadoraClick(Sender: TObject);
    procedure Calculadora1Click(Sender: TObject);
    procedure BackupRestore1Click(Sender: TObject);
    procedure btnBackupClick(Sender: TObject);
    procedure Registro1Click(Sender: TObject);
    procedure SobreoEnterpriseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Produtos1Click(Sender: TObject);
    procedure btnSaidaClick(Sender: TObject);
    procedure VendaProdutos1Click(Sender: TObject);
    procedure TrocarCordoFundo1Click(Sender: TObject);
    procedure TrocarImagemdoFundo1Click(Sender: TObject);
    procedure RemoverCordoFundo1Click(Sender: TObject);
    procedure RemoverImagemdoFundo1Click(Sender: TObject);
    procedure btnProdutoClick(Sender: TObject);
    procedure Servicos1Click(Sender: TObject);
    procedure btnServicoClick(Sender: TObject);
    procedure Contas1Click(Sender: TObject);
    procedure btnContasClick(Sender: TObject);
    procedure ContasdeUsurios1Click(Sender: TObject);
    procedure Log1Click(Sender: TObject);
    procedure TrocarCordoFundo2Click(Sender: TObject);
    procedure RemoverCordoFundo2Click(Sender: TObject);
    procedure InserirAlterarImagem2Click(Sender: TObject);
    procedure RemoverImagem2Click(Sender: TObject);
    procedure Ocultar1Click(Sender: TObject);
    procedure Ajuda2Click(Sender: TObject);
    procedure Calculadora2Click(Sender: TObject);
    procedure Fornecedores1Click(Sender: TObject);
    procedure btnFornecedoresClick(Sender: TObject);
    procedure Caixa1Click(Sender: TObject);
    procedure btnCaixaClick(Sender: TObject);
    procedure PhotoBooklbum1Click(Sender: TObject);
    procedure btnAlbumClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ManualdoUsurio1Click(Sender: TObject);
    procedure ExecFile(F: String);
    procedure Balanco1Click(Sender: TObject);
    procedure btnBalancoClick(Sender: TObject);
    procedure ManualdoUsurio2Click(Sender: TObject);
    procedure Agenda1Click(Sender: TObject);
    procedure btnAgendaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses Clientes_frm, Registro_frm, Sobre_frm, Enterprise_dm, Produtos_frm, VendaProduto_frm, DB,
  Servicos_frm, Contas_frm, Usuario_frm, Senha_frm, DateUtils,
  Fornecedores_frm, Caixa_frm, Photobook_frm, SHELLAPI, Balanco_frm,
  Alerta_frm, Agenda_frm;

{$R *.dfm}

function Count() : Integer;
var vDias, vData : Integer;
begin
    With dmEnterprise.zqSystem do begin
       Active := False;
       SQL.Clear;
       SQL.Add('select DTIP945C, CD987VKXL, BGU2762NDS1620, RCK100VXZ35 from enterprise where codigo =1');
       Active := True;
       frmPrincipal.dtpDataCount.Date := FieldByName('DTIP945C').AsDateTime;
       frmPrincipal.dtpDataAtual.Date := FieldByName('RCK100VXZ35').AsDateTime;
       frmPrincipal.dtpDataFinal.Date := FieldByName('CD987VKXL').AsDateTime;
       vData := DaysBetween(frmPrincipal.dtpDataCount.Date, frmPrincipal.dtpDataFinal.Date);
       vDias := FieldByName('BGU2762NDS1620').AsInteger;
       frmPrincipal.edtCount.Text := IntToStr(DaysBetween(frmPrincipal.dtpDataCount.date,frmPrincipal.dtpDataAtual.Date)+1);
       If StrToInt(frmPrincipal.edtCount.Text) <= vDias then begin
          Active := False;
          SQL.Clear;
          SQL.Add('update enterprise set OHK00178FN11M0 = '+QuotedStr(frmPrincipal.edtCount.Text)+', BGU2762NDS1620 = '+IntToStr(vData+1)+' where codigo = 1');
          ExecSQL;
       end
       else begin
          Active := False;
          SQL.Clear;
          SQL.Add('update enterprise set OHK00178FN11M0 = ''1000'' where codigo = 1');
          ExecSQL;
       end;
    end;
end;

function fImagem() : String;
begin
    With dmEnterprise.zqEnterprise do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select * from imagem');
       Active := True;
       If dmEnterprise.zqEnterprise.RecordCount = 0 then begin
          Active := True;
          SQL.Clear;
          SQL.Add('Insert into imagem (COD, FOTO, COR) values (1, '''', ''clBtnFace'')');
          ExecSQL;
       end;
    end;
end;

function DataBase() : String;
begin
    DateSeparator := '/';
    ShortDateFormat := 'yyyy-mm-dd';
    Try
      With dmEnterprise.zqSystem do begin
         Active := False;
         SQL.Clear;
         SQL.Add('Select * from enterprise');
         Active := True;
         If dmEnterprise.zqSystem.RecordCount = 0 then begin
            Active := True;
            SQL.Clear;
            SQL.Add('Insert into enterprise (CODIGO, REGISTRO, CD987VKXL, HQVTU00134, BGJK11SNNB029181, DTIP945C, BGU2762NDS1620, OHK00178FN11M0, RCK100VXZ35) values (1, '''', '+QuotedStr(DateToStr(Date+15))+', ''0010110101100011011010111011001100101100110011000110101010010100101'', ''KAZ-2Y5'', '+QuotedStr(DateToStr(Date))+', ''15'', ''0'', '+QuotedStr(DateToStr(Date))+')');
            ExecSQL;
            Application.MessageBox('Ol�! Obrigado por instalar o MyShop em seu computador. A partir de agora voc� ter� 15 dias para us�-lo em modo demonstra��o, para que voc� possa conhec�-lo melhor antes de licenci�-lo.','MyShop Vers�o Demo - Congratula��es',MB_OK+MB_ICONINFORMATION);
         end;
         ShortDateFormat := 'dd/mm/yyyy';
      end;
      Except
        Application.MessageBox('O MyShop n�o pode ser executado neste computador. Re-instale o programa ou entre em contato com o Programador para solucionar o problema!','MyShop - Erro Fatal',MB_OK+MB_ICONERROR);
        Application.Terminate;
    end;
end;

function fBloqueia() : String;
var Situacao : String;
    vCount, vDias : Integer;
begin
    With dmEnterprise.zqSystem do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select HQVTU00134, BGU2762NDS1620 from enterprise where codigo = 1');
       Active := True;
       Situacao := FieldByName('HQVTU00134').AsString;
       vDias := FieldByName('BGU2762NDS1620').AsInteger;
    end;
    If Situacao = '0010110101100011011010111011001100101100110011000110101010010100101' then begin
       With dmEnterprise.zqSystem do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Select OHK00178FN11M0 from enterprise where codigo = 1');
          Active := True;
          vCount := fieldByName('OHK00178FN11M0').AsInteger;
          If vCount = vDias then begin
             Application.MessageBox('Sua Licen�a expira hoje! Entre em contato com o Programador at� o fim do dia para obter uma nova licen�a, pois a partir de amanh� o programa ser� bloqueado. Lembre-se, voc� tem que estar em dia com o pagamento da licen�a para obter uma nova licen�a.','MyShop - Aten��o - Sua Licen�a Expira Hoje',MB_OK+MB_ICONWARNING);
          end
          else begin
             If vCount > vDias then begin
                Application.MessageBox('Sua Licen�a expirou. O MyShop foi bloqueado! Entre em contato com o Programador para efetuar a renova��o da Licen�a e fazer o desbloqueio do programa.','MyShop - Programa Bloqueado',MB_OK+MB_ICONERROR);
                Active := False;
                SQL.Clear;
                SQL.Add('Update enterprise set HQVTU00134 = ''00100101101010101101110010101001001010011010101110010110010011010101'' where codigo = 1');
                ExecSQL;
             end;
          end;
       end;
    end
    else begin
       Application.MessageBox('O MyShop est� BLOQUEADO! Para voc� continuar a us�-lo, entre em contato com o Programador Propriet�rio do Sistema nos endere�os localizados no menu Ajuda para efetuar a ativa��o de sua licen�a do MyShop.','MyShop - Aviso - Sua Licen�a Expirou',MB_OK+MB_ICONWARNING);
    end;
end;

function fSituacao() : String;
var sSituacao : String;
begin
    With dmEnterprise.zqSystem do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select HQVTU00134 from enterprise where codigo = 1');
       Active := True;
       sSituacao := FieldByName('HQVTU00134').AsString;
       If sSituacao = '00100101101010101101110010101001001010011010101110010110010011010101' then begin
          frmPrincipal.Cadastros1.Enabled := False;
          frmPrincipal.Movimento1.Enabled := False;
          frmPrincipal.Ferramentas1.Enabled := False;
          frmPrincipal.Panel1.Enabled := False;
          frmPrincipal.Registro1.Enabled := False;
          frmPrincipal.Exibir1.Enabled := False;
          frmPrincipal.PlanodeFundo1.Enabled := False;
          frmPrincipal.TrocarCordoFundo2.Enabled := False;
          frmPrincipal.InserirAlterarImagem2.Enabled := False;
          frmPrincipal.RemoverCordoFundo2.Enabled := False;
          frmPrincipal.RemoverImagem2.Enabled := False;
          frmPrincipal.BarradeStatus2.Enabled := False;
          frmPrincipal.ManualdoUsurio2.Enabled := False;
          frmPrincipal.Calculadora2.Enabled := False;
          frmPrincipal.btnClientes.Caption := 'Clientes';
          frmPrincipal.btnFornecedores.Caption := 'Fornecedor';
          frmPrincipal.btnProduto.Caption := 'Produtos';
          frmPrincipal.btnServico.Caption := 'Servi�os';
          frmPrincipal.btnSaida.Caption := 'Vendas';
          frmPrincipal.btnContas.Caption := 'Contas';
          frmPrincipal.btnCaixa.Caption := 'Caixa';
          frmPrincipal.btnAlbum.Caption := 'Photobook';
          frmPrincipal.btnCalculadora.Caption := 'Calculadora';
          frmPrincipal.btnBackup.Caption := 'Backup';
          frmPrincipal.btnBalanco.Caption := 'Balan�o';
          frmPrincipal.btnAgenda.Caption := 'Agenda';
       end
       else begin
          frmPrincipal.Cadastros1.Enabled := True;
          frmPrincipal.Movimento1.Enabled := True;
          frmPrincipal.Ferramentas1.Enabled := True;
          frmPrincipal.Panel1.Enabled := True;
          frmPrincipal.Registro1.Enabled := True;
          frmPrincipal.Exibir1.Enabled := True;
          frmPrincipal.PlanodeFundo1.Enabled := True;
          frmPrincipal.TrocarCordoFundo2.Enabled := True;
          frmPrincipal.InserirAlterarImagem2.Enabled := True;
          frmPrincipal.RemoverCordoFundo2.Enabled := True;
          frmPrincipal.RemoverImagem2.Enabled := True;
          frmPrincipal.BarradeStatus2.Enabled := True;
          frmPrincipal.ManualdoUsurio2.Enabled := True;
          frmPrincipal.Calculadora2.Enabled := True;
       end;
    end;
end;

procedure TfrmPrincipal.Sair1Click(Sender: TObject);
begin
    Close;
end;

procedure TfrmPrincipal.Clientes1Click(Sender: TObject);
begin
    Try
      Application.CreateForm(TfrmClientes, frmClientes);
      frmClientes.ShowModal;
    Finally
         frmClientes.Free;
    end;
end;

procedure TfrmPrincipal.btnClientesClick(Sender: TObject);
begin
    Clientes1Click(Self);
end;

procedure TfrmPrincipal.Timer1Timer(Sender: TObject);
begin
    DateSeparator := '/';
    ShortDateFormat := 'dd/mm/yyyy';
    StatusBar1.Panels[3].Text:= TimeToStr(Time);
    StatusBar1.Panels[4].Text:= DateToStr(Date);
    If StatusBar1.Panels[3].Text = edtHora.Text then begin
       Try
         Application.CreateForm(TfrmAlerta, frmAlerta);
         frmAlerta.ShowModal;
       Finally
            frmAlerta.Free;
       end;
    end;
end;

procedure TfrmPrincipal.BarradeStatus1Click(Sender: TObject);
begin
    If BarradeStatus1.Checked = True then begin
       BarradeStatus1.Checked := False;
       StatusBar1.Visible := False;
    end
    else begin
       If BarradeStatus1.Checked = False then begin
          StatusBar1.Visible := True;
          BarradeStatus1.Checked := True;
       end;
    end;
end;

procedure TfrmPrincipal.btnCalculadoraClick(Sender: TObject);
begin
    Calculadora1Click(Self);
end;

procedure TfrmPrincipal.Calculadora1Click(Sender: TObject);
begin
    Try
      WinExec('Calc.exe',Sw_Show);
    Except
      ShowMessage('Verifique se a Calculadora foi Instalada pelo Windows!');
    end;
end;

procedure TfrmPrincipal.BackupRestore1Click(Sender: TObject);
begin
    If StatusBar1.Panels[2].Text = 'N�vel: Administrador' then begin
       If Application.MessageBox('O MyShop ser� fechado para que seja executada a c�pia de seguran�a. Deseja Encerrar o MyShop?','MyShop - Confirmar',MB_YESNO+MB_ICONQUESTION) = ID_YES then begin;
          WinExec('C:\MyShop\Backup',SW_SHOW);
          Application.Terminate;
       end;
    end
    else begin
       Application.MessageBox('Seu n�vel de acesso � de Usu�rio. Voc� n�o tem permiss�o para executar esse comando. Contate o Administrador do Sistema.','MyShop - Aten��o',MB_OK+MB_ICONSTOP);
    end;
end;

procedure TfrmPrincipal.btnBackupClick(Sender: TObject);
begin
    BackupRestore1Click(Self);
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

procedure TfrmPrincipal.SobreoEnterpriseClick(Sender: TObject);
begin
    Try
      Application.CreateForm(TfrmSobre, frmSobre);
      frmSobre.ShowModal;
    Finally
         frmSobre.Free;
    end;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
var cCor : String;
    fFoto, fUser : TStream;
    Jpeg : TJPEGImage;
begin
    DataBase;
    Count;
    fImagem;
    fSituacao;
    fBloqueia;
    Try
      Application.CreateForm(TfrmSenha, frmSenha);
      frmSenha.ShowModal;
    Finally
         frmSenha.Free;
    end;
    With dmEnterprise.zqEnterprise do begin
       Active := False;
       SQL.Clear;
       SQL.Add('select a_hora from agenda where a_data = '+QuotedStr(DateToStr(DateTimePicker1.Date))+' and a_lembrar = ''S'' order by a_hora');
       Active := True;
       ShortDateFormat := 'dd/mm/yyyy';
       edtHora.Text := FieldByName('a_hora').AsString;
    end;
    Jpeg := nil;
    With dmEnterprise.zqEnterprise do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select r_nome from registro');
       Active := True;
       frmPrincipal.Caption := 'MyShop - Sistema Para Controle e Gerenciamento de Empresas e Presta��o de Servi�os ['+FieldByName('r_nome').AsString+']';
       Active := False;
       SQL.Clear;
       SQL.Add('Select foto as foto, cor from imagem where cod = ''1''');
       Active := True;
       cCor := FieldByName('COR').AsString;
       frmPrincipal.Color := StringToColor(cCor);
       fFoto := CreateBlobStream(FieldByName('foto'), bmRead);
       If fFoto.Size > 0 then begin
          Jpeg := TJPEGImage.Create;
          Jpeg.LoadFromStream(fFoto);
          Image1.Picture.Assign(Jpeg);
       end;
       Jpeg.Free;
       fFoto.Destroy;
    end;
end;

procedure TfrmPrincipal.Produtos1Click(Sender: TObject);
begin
    Try
      Application.CreateForm(TfrmProdutos, frmProdutos);
      frmProdutos.ShowModal;
    Finally
         frmProdutos.Free;
    end;
end;

procedure TfrmPrincipal.btnSaidaClick(Sender: TObject);
begin
    VendaProdutos1Click(Self);
end;
procedure TfrmPrincipal.VendaProdutos1Click(Sender: TObject);
begin
    Try
      Application.CreateForm(TfrmVendaProduto, frmVendaProduto);
      frmVendaProduto.ShowModal;
    Finally
         frmVendaProduto.Free;
    end;
end;

procedure TfrmPrincipal.TrocarCordoFundo1Click(Sender: TObject);
var cCor : String;
begin
    If StatusBar1.Panels[2].Text = 'N�vel: Administrador' then begin
       If ColorDialog1.Execute then begin
          frmPrincipal.Color := ColorDialog1.Color;
       end;
       cCor := ColorToString(Color);
       With dmEnterprise.zqEnterprise do begin
          Active :=  False;
          SQL.Clear;
          SQL.Add('Update imagem set cor = '+QuotedStr(cCor)+' where cod = 1');
          ExecSQL;
       end;
    end
    else begin
       Application.MessageBox('Seu n�vel de acesso � de Usu�rio. Voc� n�o tem permiss�o para executar esse comando. Contate o Administrador do Sistema.','MyShop - Aten��o',MB_OK+MB_ICONSTOP);
    end;
end;

procedure TfrmPrincipal.TrocarImagemdoFundo1Click(Sender: TObject);
var iImagem : String;
begin
    If StatusBar1.Panels[2].Text = 'N�vel: Administrador' then begin
       If OpenPictureDialog1.Execute then begin
          Image1.Picture.Assign(nil);
          Image1.Picture.LoadFromFile(OpenPictureDialog1.FileName);
          iImagem := OpenPictureDialog1.FileName;
          With dmEnterprise.zqEnterprise do begin
             Active := False;
             SQL.Clear;
             SQL.Add('select cod, foto from imagem where cod = 1');
             Active := True;
             Edit;
             TBlobField(FieldByName('foto')).LoadFromFile(iImagem);
             Post;
          end;
       end;
    end
    else begin
       Application.MessageBox('Seu n�vel de acesso � de Usu�rio. Voc� n�o tem permiss�o para executar esse comando. Contate o Administrador do Sistema.','MyShop - Aten��o',MB_OK+MB_ICONSTOP);
    end;
end;

procedure TfrmPrincipal.RemoverCordoFundo1Click(Sender: TObject);
var cCor : String;
begin
    If StatusBar1.Panels[2].Text = 'N�vel: Administrador' then begin
       frmPrincipal.Color := clBtnFace;
       cCor := ColorToString(frmPrincipal.Color);
       With dmEnterprise.zqEnterprise do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Update imagem set cor = '+QuotedStr(cCor)+' where cod = 1');
          ExecSQL;
       end;
    end
    else begin
       Application.MessageBox('Seu n�vel de acesso � de Usu�rio. Voc� n�o tem permiss�o para executar esse comando. Contate o Administrador do Sistema.','MyShop - Aten��o',MB_OK+MB_ICONSTOP);
    end;
end;

procedure TfrmPrincipal.RemoverImagemdoFundo1Click(Sender: TObject);
begin
    If StatusBar1.Panels[2].Text = 'N�vel: Administrador' then begin
       With dmEnterprise.zqEnterprise do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Update imagem set foto = null where cod =1');
          ExecSQL;
          Image1.Picture.Assign(nil);
       end;
    end
    else begin
       Application.MessageBox('Seu n�vel de acesso � de Usu�rio. Voc� n�o tem permiss�o para executar esse comando. Contate o Administrador do Sistema.','MyShop - Aten��o',MB_OK+MB_ICONSTOP);
    end;
end;

procedure TfrmPrincipal.btnProdutoClick(Sender: TObject);
begin
    Produtos1Click(Self);    
end;

procedure TfrmPrincipal.Servicos1Click(Sender: TObject);
begin
    Try
      Application.CreateForm(TfrmServicos, frmServicos);
      frmServicos.ShowModal;
    Finally
         frmServicos.Free;
    end;
end;

procedure TfrmPrincipal.btnServicoClick(Sender: TObject);
begin
    Servicos1Click(Self);
end;

procedure TfrmPrincipal.Contas1Click(Sender: TObject);
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
    Contas1Click(Self);
end;

procedure TfrmPrincipal.ContasdeUsurios1Click(Sender: TObject);
begin
    If StatusBar1.Panels[2].Text = 'N�vel: Administrador' then begin
       Try
         Application.CreateForm(TfrmUsuario, frmUsuario);
         frmUsuario.ShowModal;
       Finally
            frmUsuario.Free;
       end;
    end
    else begin
       Application.MessageBox('Seu n�vel de acesso � de Usu�rio. Voc� n�o tem permiss�o para executar esse comando. Contate o Administrador do Sistema.','MyShop - Aten��o',MB_OK+MB_ICONSTOP);
    end;
end;

procedure TfrmPrincipal.Log1Click(Sender: TObject);
begin
    Try
      Application.CreateForm(TfrmSenha, frmSenha);
      frmSenha.ShowModal;
    Finally
         frmSenha.Free;
    end;
end;

procedure TfrmPrincipal.TrocarCordoFundo2Click(Sender: TObject);
begin
    TrocarCordoFundo1Click(Self);
end;

procedure TfrmPrincipal.RemoverCordoFundo2Click(Sender: TObject);
begin
    RemoverCordoFundo1Click(Self);
end;

procedure TfrmPrincipal.InserirAlterarImagem2Click(Sender: TObject);
begin
    TrocarImagemdoFundo1Click(Self);
end;

procedure TfrmPrincipal.RemoverImagem2Click(Sender: TObject);
begin
    RemoverImagemdoFundo1Click(Self);
end;

procedure TfrmPrincipal.Ocultar1Click(Sender: TObject);
begin
    BarradeStatus1Click(Self);
end;

procedure TfrmPrincipal.Ajuda2Click(Sender: TObject);
begin
    SobreoEnterpriseClick(Self);    
end;

procedure TfrmPrincipal.Calculadora2Click(Sender: TObject);
begin
    Calculadora1Click(Self);
end;

procedure TfrmPrincipal.Fornecedores1Click(Sender: TObject);
begin
    Try
      Application.CreateForm(TfrmFornecedores, frmFornecedores);
      frmFornecedores.ShowModal;
    Finally
         frmFornecedores.Free;
    end;
end;

procedure TfrmPrincipal.btnFornecedoresClick(Sender: TObject);
begin
    Fornecedores1Click(Self);
end;

procedure TfrmPrincipal.Caixa1Click(Sender: TObject);
begin
    Try
      Application.CreateForm(TfrmCaixa, frmCaixa);
      frmCaixa.ShowModal;
    Finally
         frmCaixa.Free;
    end;
end;

procedure TfrmPrincipal.btnCaixaClick(Sender: TObject);
begin
    Caixa1Click(Self);
end;

procedure TfrmPrincipal.PhotoBooklbum1Click(Sender: TObject);
begin
    Try
      Application.CreateForm(TfrmPhotobook, frmPhotobook);
      frmPhotobook.ShowModal;
    Finally
         frmPhotobook.Free;
    end;
end;

procedure TfrmPrincipal.btnAlbumClick(Sender: TObject);
begin
    PhotoBooklbum1Click(Self);
end;

procedure TfrmPrincipal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    ShortDateFormat := 'yyyy-mm-dd';
    With dmEnterprise.zqSystem do begin
       Active := False;
       SQL.Clear;
       SQL.Add('update enterprise set RCK100VXZ35 = '+QuotedStr(DateToStr(Date+1))+' where codigo = 1');
       ExecSQL;
    end;
end;

procedure TfrmPrincipal.ManualdoUsurio1Click(Sender: TObject);
begin
    ExecFile('C:\MyShop\MyShop - Manual do Usu�rio.pdf');
end;

procedure TfrmPrincipal.ExecFile(F: String);
var r: String;
begin
    case ShellExecute(Handle, nil, PChar(F), nil, nil, SW_SHOWNORMAL) of
       ERROR_FILE_NOT_FOUND: r := 'The specified file was not found.';
       ERROR_PATH_NOT_FOUND: r := 'The specified path was not found.';
       ERROR_BAD_FORMAT: r := 'The .EXE file is invalid (non-Win32 .EXE or error in .EXE image).';
       SE_ERR_ACCESSDENIED: r := 'Windows 95 only: The operating system denied access to the specified file.';
       SE_ERR_ASSOCINCOMPLETE: r := 'The filename association is incomplete or invalid.';
       SE_ERR_DDEBUSY: r := 'The DDE transaction could not be completed because other DDE transactions were being processed.';
       SE_ERR_DDEFAIL: r := 'The DDE transaction failed.';
       SE_ERR_DDETIMEOUT: r := 'The DDE transaction could not be completed because the request timed out.';
       SE_ERR_DLLNOTFOUND: r := 'Windows 95 only: The specified dynamic-link library was not found.';
       SE_ERR_NOASSOC: r := 'There is no application associated with the given filename extension.';
       SE_ERR_OOM: r := 'Windows 95 only: There was not enough memory to complete the operation.';
       SE_ERR_SHARE: r := 'A sharing violation occurred.';
    else
       Exit;
    end;
    ShowMessage(r);
end;

procedure TfrmPrincipal.Balanco1Click(Sender: TObject);
begin
    If StatusBar1.Panels[2].Text = 'N�vel: Administrador' then begin
       Try
         Application.CreateForm(TfrmBalanco, frmBalanco);
         frmBalanco.ShowModal;
        Finally
            frmBalanco.Free;
        end;
     end
     else begin
       Application.MessageBox('Seu n�vel de acesso � de Usu�rio. Voc� n�o tem permiss�o para executar esse comando. Contate o Administrador do Sistema.','MyShop - Aten��o',MB_OK+MB_ICONSTOP);
     end;
end;

procedure TfrmPrincipal.btnBalancoClick(Sender: TObject);
begin
    Balanco1Click(Self);
end;

procedure TfrmPrincipal.ManualdoUsurio2Click(Sender: TObject);
begin
    ManualdoUsurio1Click(Self);
end;

procedure TfrmPrincipal.Agenda1Click(Sender: TObject);
begin
    Try
      Application.CreateForm(TfrmAgenda, frmAgenda);
      frmAgenda.ShowModal;
    Finally
         frmAgenda.Free;
    end;
end;

procedure TfrmPrincipal.btnAgendaClick(Sender: TObject);
begin
    Agenda1Click(Self);
end;

end.
