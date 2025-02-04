unit Principal_frm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, XPMan, ExtDlgs, Menus, ExtCtrls, ImgList, ComCtrls, StdCtrls,
  Buttons, jpeg, DateUtils;

type
  TfrmPrincipal = class(TForm)
    Image1: TImage;
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    btnFilmes: TSpeedButton;
    btnReservas: TSpeedButton;
    btnCalculadora: TSpeedButton;
    btnClientes: TSpeedButton;
    btnProdutos: TSpeedButton;
    btnVendas: TSpeedButton;
    btnLocacoes: TSpeedButton;
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
    Filmes1: TMenuItem;
    Produtos1: TMenuItem;
    Reservas1: TMenuItem;
    Ferramentas1: TMenuItem;
    Calculadora1: TMenuItem;
    BackupRestore1: TMenuItem;
    Ajuda1: TMenuItem;
    SobreoMybook: TMenuItem;
    ImageList1: TImageList;
    Timer1: TTimer;
    ColorDialog1: TColorDialog;
    OpenPictureDialog1: TOpenPictureDialog;
    XPManifest1: TXPManifest;
    Movimento1: TMenuItem;
    Locaes1: TMenuItem;
    VendaProdutos1: TMenuItem;
    Consulta1: TMenuItem;
    btnConsultas: TSpeedButton;
    PlanodeFundo1: TMenuItem;
    TrocarCordoFundo1: TMenuItem;
    RemoverCordoFundo1: TMenuItem;
    N2: TMenuItem;
    TrocarImagemdoFundo1: TMenuItem;
    RemoverImagemdoFundo1: TMenuItem;
    edtHora: TEdit;
    DateTimePicker1: TDateTimePicker;
    edtCount: TEdit;
    dtpDataCount: TDateTimePicker;
    dtpDataAtual: TDateTimePicker;
    dtpDataFinal: TDateTimePicker;
    procedure Sair1Click(Sender: TObject);
    procedure Clientes1Click(Sender: TObject);
    procedure btnClientesClick(Sender: TObject);
    procedure Filmes1Click(Sender: TObject);
    procedure btnFilmesClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure BarradeStatus1Click(Sender: TObject);
    procedure btnCalculadoraClick(Sender: TObject);
    procedure Calculadora1Click(Sender: TObject);
    procedure Reservas1Click(Sender: TObject);
    procedure btnReservasClick(Sender: TObject);
    procedure Locaes1Click(Sender: TObject);
    procedure btnLocacoesClick(Sender: TObject);
    procedure BackupRestore1Click(Sender: TObject);
    procedure btnBackupClick(Sender: TObject);
    procedure Registro1Click(Sender: TObject);
    procedure SobreoMybookClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Produtos1Click(Sender: TObject);
    procedure btnProdutosClick(Sender: TObject);
    procedure VendaProdutos1Click(Sender: TObject);
    procedure btnVendasClick(Sender: TObject);
    procedure Consulta1Click(Sender: TObject);
    procedure btnConsultasClick(Sender: TObject);
    procedure TrocarCordoFundo1Click(Sender: TObject);
    procedure TrocarImagemdoFundo1Click(Sender: TObject);
    procedure RemoverCordoFundo1Click(Sender: TObject);
    procedure RemoverImagemdoFundo1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses Clientes_frm, Filmes_frm, Reservas_frm, Locacoes_frm, Registro_frm,
  Sobre_frm, Locadora_dm, Produtos_frm, VendaProduto_frm, Consultas_frm, DB;

{$R *.dfm}

function Count() : Integer;
var vDias, vData : Integer;
begin
    With dmLocadora.zqSystem do begin
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
    With dmLocadora.zqLocadora do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select * from imagem');
       Active := True;
       If dmLocadora.zqLocadora.RecordCount = 0 then begin
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
      With dmLocadora.zqSystem do begin
         Active := False;
         SQL.Clear;
         SQL.Add('Select * from enterprise');
         Active := True;
         If dmLocadora.zqSystem.RecordCount = 0 then begin
            Active := True;
            SQL.Clear;
            SQL.Add('Insert into enterprise (CODIGO, REGISTRO, CD987VKXL, HQVTU00134, BGJK11SNNB029181, DTIP945C, BGU2762NDS1620, OHK00178FN11M0, RCK100VXZ35) values (1, '''', '+QuotedStr(DateToStr(Date+15))+', ''0010110101100011011010111011001100101100110011000110101010010100101'', ''KAZ-2Y5'', '+QuotedStr(DateToStr(Date))+', ''15'', ''0'', '+QuotedStr(DateToStr(Date))+')');
            ExecSQL;
            Application.MessageBox('Olá! Obrigado por instalar o Rental em seu computador. A partir de agora você terá 15 dias para usá-lo em modo demonstração, para que você possa conhecê-lo melhor antes de licenciá-lo.','Rental Versão Demo - Congratulações',MB_OK+MB_ICONINFORMATION);
         end;
         ShortDateFormat := 'dd/mm/yyyy';
      end;
      Except
        Application.MessageBox('O Rental não pode ser executado neste computador. Re-instale o programa ou entre em contato com o Programador para solucionar o problema!','Rental - Erro Fatal',MB_OK+MB_ICONERROR);
        Application.Terminate;
    end;
end;

function fBloqueia() : String;
var Situacao : String;
    vCount, vDias : Integer;
begin
    With dmLocadora.zqSystem do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select HQVTU00134, BGU2762NDS1620 from enterprise where codigo = 1');
       Active := True;
       Situacao := FieldByName('HQVTU00134').AsString;
       vDias := FieldByName('BGU2762NDS1620').AsInteger;
    end;
    If Situacao = '0010110101100011011010111011001100101100110011000110101010010100101' then begin
       With dmLocadora.zqSystem do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Select OHK00178FN11M0 from enterprise where codigo = 1');
          Active := True;
          vCount := fieldByName('OHK00178FN11M0').AsInteger;
          If vCount = vDias then begin
             Application.MessageBox('Sua Licença expira hoje! Entre em contato com o Programador até o fim do dia para obter uma nova licença, pois a partir de amanhã o programa será bloqueado. Lembre-se, você tem que estar em dia com o pagamento da licença para obter uma nova licença.','Rental - Atenção - Sua Licença Expira Hoje',MB_OK+MB_ICONWARNING);
          end
          else begin
             If vCount > vDias then begin
                Application.MessageBox('Sua Licença expirou. O Rental foi bloqueado! Entre em contato com o Programador para efetuar a renovação da Licença e fazer o desbloqueio do programa.','Rental - Programa Bloqueado',MB_OK+MB_ICONERROR);
                Active := False;
                SQL.Clear;
                SQL.Add('Update enterprise set HQVTU00134 = ''00100101101010101101110010101001001010011010101110010110010011010101'' where codigo = 1');
                ExecSQL;
             end;
          end;
       end;
    end
    else begin
       Application.MessageBox('O Rental está BLOQUEADO! Para você continuar a usá-lo, entre em contato com o Programador Proprietário do Sistema nos endereços localizados no menu Ajuda para efetuar a ativação de sua licença do Rental.','Rental - Aviso - Sua Licença Expirou',MB_OK+MB_ICONWARNING);
    end;
end;

function fSituacao() : String;
var sSituacao : String;
begin
    With dmLocadora.zqSystem do begin
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
          frmPrincipal.TrocarCordoFundo1.Enabled := False;
          frmPrincipal.TrocarImagemdoFundo1.Enabled := False;
          frmPrincipal.RemoverImagemdoFundo1.Enabled := False;
          frmPrincipal.RemoverImagemdoFundo1.Enabled := False;
          frmPrincipal.BarradeStatus1.Enabled := False;
          frmPrincipal.Calculadora1.Enabled := False;
          frmPrincipal.btnClientes.Caption := 'Clientes';
          frmPrincipal.btnProdutos.Caption := 'Produtos';
          frmPrincipal.btnFilmes.Caption := 'Filmes';
          frmPrincipal.btnReservas.Caption := 'Reservas';
          frmPrincipal.btnLocacoes.Caption := 'Locações';
          frmPrincipal.btnVendas.Caption := 'Vendas';
          frmPrincipal.btnConsultas.Caption := 'Consultas';
          frmPrincipal.btnCalculadora.Caption := 'Calculadora';
          frmPrincipal.btnBackup.Caption := 'Backup';
       end
       else begin
          frmPrincipal.Cadastros1.Enabled := True;
          frmPrincipal.Movimento1.Enabled := True;
          frmPrincipal.Ferramentas1.Enabled := True;
          frmPrincipal.Panel1.Enabled := True;
          frmPrincipal.Registro1.Enabled := True;
          frmPrincipal.Exibir1.Enabled := True;
          frmPrincipal.PlanodeFundo1.Enabled := True;
          frmPrincipal.TrocarCordoFundo1.Enabled := True;
          frmPrincipal.TrocarImagemdoFundo1.Enabled := True;
          frmPrincipal.RemoverImagemdoFundo1.Enabled := True;
          frmPrincipal.RemoverImagemdoFundo1.Enabled := True;
          frmPrincipal.BarradeStatus1.Enabled := True;
          frmPrincipal.Calculadora1.Enabled := True;
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

procedure TfrmPrincipal.Filmes1Click(Sender: TObject);
begin
    Try
      Application.CreateForm(TfrmFilmes, frmFilmes);
      frmFilmes.ShowModal;
    Finally
         frmFilmes.Free;
    end;
end;

procedure TfrmPrincipal.btnFilmesClick(Sender: TObject);
begin
    Filmes1Click(Self);
end;

procedure TfrmPrincipal.Timer1Timer(Sender: TObject);
begin
    DateSeparator := '/';
    ShortDateFormat := 'dd/mm/yyyy';
    StatusBar1.Panels[1].Text:= TimeToStr(Time);
    StatusBar1.Panels[2].Text:= DateToStr(Date);
end;

procedure TfrmPrincipal.BarradeStatus1Click(Sender: TObject);
begin
    If BarradeStatus1.Checked = True then begin
       BarradeStatus1.Checked := False;
       StatusBar1.Visible := False;
    end
    else
       If BarradeStatus1.Checked = False then begin
          StatusBar1.Visible := True;
          BarradeStatus1.Checked := True;
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

procedure TfrmPrincipal.Reservas1Click(Sender: TObject);
begin
    Try
     Application.CreateForm(TfrmReservas, frmReservas);
     frmReservas.ShowModal;
    Finally
         frmReservas.Free;
    end;
end;

procedure TfrmPrincipal.btnReservasClick(Sender: TObject);
begin
    Reservas1Click(Self);    
end;

procedure TfrmPrincipal.Locaes1Click(Sender: TObject);
begin
    Try
      Application.CreateForm(TfrmLocacoes, frmLocacoes);
      frmLocacoes.ShowModal;
    Finally
         frmLocacoes.Free;
    end;
end;

procedure TfrmPrincipal.btnLocacoesClick(Sender: TObject);
begin
    Locaes1Click(Self);
end;

procedure TfrmPrincipal.BackupRestore1Click(Sender: TObject);
begin
    If Application.MessageBox('O Rental será fechado para que seja executada a cópia de segurança. Deseja Encerrar o Rental?','Rental - Confirmar',MB_YESNO+MB_ICONQUESTION) = ID_YES then begin;
       WinExec('C:\Rental\Backup',SW_SHOW);
       Application.Terminate;
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

procedure TfrmPrincipal.SobreoMybookClick(Sender: TObject);
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
    With dmLocadora.zqLocadora do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select r_nome from registro');
       Active := True;
       StatusBar1.Panels[3].Text := 'USUÁRIO: '+FieldByName('r_nome').AsString;
    end;
    Jpeg := nil;
    With dmLocadora.zqLocadora do begin
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

procedure TfrmPrincipal.btnProdutosClick(Sender: TObject);
begin
    Produtos1Click(Self);
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

procedure TfrmPrincipal.btnVendasClick(Sender: TObject);
begin
    VendaProdutos1Click(Self);
end;

procedure TfrmPrincipal.Consulta1Click(Sender: TObject);
begin
    Try
      Application.CreateForm(TfrmConsultas, frmConsultas);
      frmConsultas.ShowModal;
    Finally
         frmConsultas.Free;
    end;
end;

procedure TfrmPrincipal.btnConsultasClick(Sender: TObject);
begin
    Consulta1Click(Self);
end;

procedure TfrmPrincipal.TrocarCordoFundo1Click(Sender: TObject);
var cCor : String;
begin
    If ColorDialog1.Execute then begin
       frmPrincipal.Color := ColorDialog1.Color;
    end;
    cCor := ColorToString(Color);
    With dmLocadora.zqLocadora do begin
       Active :=  False;
       SQL.Clear;
       SQL.Add('Update imagem set cor = '+QuotedStr(cCor)+' where cod = 1');
       ExecSQL;
    end;
end;

procedure TfrmPrincipal.TrocarImagemdoFundo1Click(Sender: TObject);
var iImagem : String;
begin
    If OpenPictureDialog1.Execute then begin
       Image1.Picture.Assign(nil);
       Image1.Picture.LoadFromFile(OpenPictureDialog1.FileName);
       iImagem := OpenPictureDialog1.FileName;
       With dmLocadora.zqLocadora do begin
          Active := False;
          SQL.Clear;
          SQL.Add('select cod, foto from imagem where cod = 1');
          Active := True;
          Edit;
          TBlobField(FieldByName('foto')).LoadFromFile(iImagem);
          Post;
       end;
    end;
end;

procedure TfrmPrincipal.RemoverCordoFundo1Click(Sender: TObject);
var cCor : String;
begin
    frmPrincipal.Color := clBtnFace;
    cCor := ColorToString(frmPrincipal.Color);
    With dmLocadora.zqLocadora do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Update imagem set cor = '+QuotedStr(cCor)+' where cod = 1');
       ExecSQL;
    end;
end;

procedure TfrmPrincipal.RemoverImagemdoFundo1Click(Sender: TObject);
begin
    With dmLocadora.zqLocadora do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Update imagem set foto = null where cod =1');
       ExecSQL;
       Image1.Picture.Assign(nil);
    end;
end;

procedure TfrmPrincipal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    ShortDateFormat := 'yyyy-mm-dd';
    With dmLocadora.zqSystem do begin
       Active := False;
       SQL.Clear;
       SQL.Add('update enterprise set RCK100VXZ35 = '+QuotedStr(DateToStr(Date+1))+' where codigo = 1');
       ExecSQL;
    end;
end;

end.
