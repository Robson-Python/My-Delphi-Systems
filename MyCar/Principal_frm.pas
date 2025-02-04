unit Principal_frm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, XPMan, Buttons, ExtCtrls, ImgList, ComCtrls, StdCtrls,
  ToolWin, ExtDlgs, DBCtrls, jpeg, DB, OleServer, MPlayer, DateUtils;

type
  TfrmPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Arquivo1: TMenuItem;
    Registro1: TMenuItem;
    Sair1: TMenuItem;
    Cadastros1: TMenuItem;
    Veculos1: TMenuItem;
    Motoristas1: TMenuItem;
    Gerenciamento1: TMenuItem;
    PecasServios1: TMenuItem;
    Consultas1: TMenuItem;
    Ajuda1: TMenuItem;
    SobreoCarroComando1: TMenuItem;
    Ferramentas1: TMenuItem;
    Backup1: TMenuItem;
    N1: TMenuItem;
    Timer1: TTimer;
    N2: TMenuItem;
    Calucladora1: TMenuItem;
    GeradordeConsultas1: TMenuItem;
    Exibir1: TMenuItem;
    BarradeStatus1: TMenuItem;
    XPManifest1: TXPManifest;
    Panel1: TPanel;
    btnVeiculos: TSpeedButton;
    btnMorista: TSpeedButton;
    btnPecas: TSpeedButton;
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
    StatusBar1: TStatusBar;
    ManualdoUsurio1: TMenuItem;
    btnConsulta: TSpeedButton;
    ManualdoUsurio2: TMenuItem;
    Manuteno1: TMenuItem;
    Fornecedores1: TMenuItem;
    N6: TMenuItem;
    Contas1: TMenuItem;
    btnFornecedores: TSpeedButton;
    btnContas: TSpeedButton;
    btnManutenao: TSpeedButton;
    Shape1: TShape;
    OpenDialog1: TOpenDialog;
    CalcularGastosMotorFlex1: TMenuItem;
    dtpDataCount: TDateTimePicker;
    edtCount: TEdit;
    dtpDataFinal: TDateTimePicker;
    dtpDataAtual: TDateTimePicker;
    edtHora: TEdit;
    DateTimePicker1: TDateTimePicker;
    CompradeVeculos1: TMenuItem;
    N8: TMenuItem;
    ImageList1: TImageList;
    btnBackup: TSpeedButton;
    btnCalculadora: TSpeedButton;
    btnCompras: TSpeedButton;
    btnAgenda: TSpeedButton;
    Agenda1: TMenuItem;
    btnRevisao: TSpeedButton;
    Revisoes1: TMenuItem;
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
    procedure PecasServios1Click(Sender: TObject);
    procedure btnPecasClick(Sender: TObject);
    procedure GeradordeConsultas1Click(Sender: TObject);
    procedure btnConsultaClick(Sender: TObject);
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
    procedure ManualdoUsurio1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ManualdoUsurio2Click(Sender: TObject);
    procedure Manuteno1Click(Sender: TObject);
    procedure btnManutenaoClick(Sender: TObject);
    procedure Fornecedores1Click(Sender: TObject);
    procedure btnFornecedoresClick(Sender: TObject);
    procedure btnContasClick(Sender: TObject);
    procedure CalcularGastosMotorFlex1Click(Sender: TObject);
    procedure btnBackupClick(Sender: TObject);
    procedure CompradeVeculos1Click(Sender: TObject);
    procedure Contas1Click(Sender: TObject);
    procedure btnComprasClick(Sender: TObject);
    procedure Agenda1Click(Sender: TObject);
    procedure btnAgendaClick(Sender: TObject);
    procedure ExecFile(F: String);
    procedure Revisoes1Click(Sender: TObject);
    procedure btnRevisaoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses Cad_Veiculo_frm, Carro_Comando_dm, CadMotorista_frm, Pecas_frm, Consultas_frm,
   Sobre_frm, Registro_frm, Manutencao_frm, CadFornec_frm, Flex_frm, CompraVenda_frm,
   Contas_frm, Agenda_frm, Alerta_frm, SHELLAPI, Revisoes_frm;

{$R *.dfm}

function Count() : Integer;
var vDias, vData : Integer;
begin
    With dmCarroComando.zqMyCar do begin
       Active := False;
       SQL.Clear;
       SQL.Add('select DTIP945C, CD987VKXL, BGU2762NDS1620, RCK100VXZ35 from mycar where codigo =1');
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
          SQL.Add('update mycar set OHK00178FN11M0 = '+QuotedStr(frmPrincipal.edtCount.Text)+', BGU2762NDS1620 = '+IntToStr(vData+1)+' where codigo = 1');
          ExecSQL;
       end
       else begin
          Active := False;
          SQL.Clear;
          SQL.Add('update mycar set OHK00178FN11M0 = ''1000'' where codigo = 1');
          ExecSQL;
       end;
    end;
end;

function fImagem() : String;
begin
    With dmCarroComando.zqCarro do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select * from imagem');
       Active := True;
       If dmCarroComando.zqCarro.RecordCount = 0 then begin
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
      With dmCarroComando.zqMyCar do begin
         Active := False;
         SQL.Clear;
         SQL.Add('Select * from mycar');
         Active := True;
         If dmCarroComando.zqMyCar.RecordCount = 0 then begin
            Active := True;
            SQL.Clear;
            SQL.Add('Insert into mycar (CODIGO, REGISTRO, CD987VKXL, HQVTU00134, BGJK11SNNB029181, DTIP945C, BGU2762NDS1620, OHK00178FN11M0, RCK100VXZ35) values (1, '''', '+QuotedStr(DateToStr(Date+15))+', ''0010110101100011011010111011001100101100110011000110101010010100101'', ''KAZ-2Y5'', '+QuotedStr(DateToStr(Date))+', ''15'', ''0'', '+QuotedStr(DateToStr(Date))+')');
            ExecSQL;
            Application.MessageBox('Olá! Obrigado por instalar o MyCar em seu computador. A partir de agora você terá 15 dias para usá-lo em modo demonstração, para que você possa conhecê-lo melhor antes de licenciá-lo.','MyCar Versão Demo - Congratulações',MB_OK+MB_ICONINFORMATION);
         end;
         ShortDateFormat := 'dd/mm/yyyy';
     end;
     Except
         Application.MessageBox('O MyCar não pode ser executado neste computador. Re-instale o programa ou entre em contato com o Programador para solucionar o problema!','MyCar - Erro Fatal',MB_OK+MB_ICONERROR);
         Application.Terminate;
     end;
end;

function fBloqueia() : String;
var Situacao : String;
    vCount, vDias : Integer;
begin
    With dmCarroComando.zqMyCar do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select HQVTU00134, BGU2762NDS1620 from mycar where codigo = 1');
       Active := True;
       Situacao := FieldByName('HQVTU00134').AsString;
       vDias := FieldByName('BGU2762NDS1620').AsInteger;
    end;
    If Situacao = '0010110101100011011010111011001100101100110011000110101010010100101' then begin
       With dmCarroComando.zqMyCar do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Select OHK00178FN11M0 from mycar where codigo = 1');
          Active := True;
          vCount := fieldByName('OHK00178FN11M0').AsInteger;
          If vCount = vDias then begin
             Application.MessageBox('Sua Licença expira hoje! Entre em contato com o Programador até o fim do dia para obter uma nova licença, pois a partir de amanhã o programa será bloqueado. Lembre-se, você tem que estar em dia com o pagamento da licença para obter uma nova licença.','MyCar - Atenção - Sua Licença Expira Hoje',MB_OK+MB_ICONWARNING);
          end
          else begin
             If vCount > vDias then begin
                Application.MessageBox('Sua Licença expirou. O MyCar foi bloqueado! Entre em contato com o Programador para efetuar a renovação da Licença e fazer o desbloqueio do programa.','MyCar - Programa Bloqueado',MB_OK+MB_ICONERROR);
                Active := False;
                SQL.Clear;
                SQL.Add('Update mycar set HQVTU00134 = ''00100101101010101101110010101001001010011010101110010110010011010101'' where codigo = 1');
                ExecSQL;
             end;
          end;
       end;
    end
    else begin
       Application.MessageBox('O MyCar está BLOQUEADO! Para você continuar a usá-lo, entre em contato com o Programador Proprietário do Sistema nos endereços localizados no menu Ajuda para efetuar a ativação de sua licença do MyCar.','MyCar - Aviso - Sua Licença Expirou',MB_OK+MB_ICONWARNING);
    end;
end;

function fSituacao() : String;
var sSituacao : String;
begin
    With dmCarroComando.zqMyCar do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select HQVTU00134 from mycar where codigo = 1');
       Active := True;
       sSituacao := FieldByName('HQVTU00134').AsString;
       If sSituacao = '00100101101010101101110010101001001010011010101110010110010011010101' then begin
          frmPrincipal.Cadastros1.Enabled := False;
          frmPrincipal.Gerenciamento1.Enabled := False;
          frmPrincipal.Consultas1.Enabled := False;
          frmPrincipal.Ferramentas1.Enabled := False;
          frmPrincipal.Panel1.Enabled := False;
          frmPrincipal.Registro1.Enabled := False;
          frmPrincipal.Exibir1.Enabled := False;
          frmPrincipal.PlanodeFundo1.Enabled := False;
          frmPrincipal.TrocarCor.Enabled := False;
          frmPrincipal.RemoverCordoFundo2.Enabled := False;
          frmPrincipal.InserirAlterarImagem1.Enabled := False;
          frmPrincipal.RemoverImagem2.Enabled := False;
          frmPrincipal.BarradeStatus2.Enabled := False;
          frmPrincipal.ManualdoUsurio2.Enabled := False;
          frmPrincipal.Calculadora1.Enabled := False;
       end
       else begin
          frmPrincipal.Cadastros1.Enabled := True;
          frmPrincipal.Gerenciamento1.Enabled := True;
          frmPrincipal.Consultas1.Enabled := True;
          frmPrincipal.Ferramentas1.Enabled := True;
          frmPrincipal.Panel1.Enabled := True;
          frmPrincipal.Registro1.Enabled := True;
          frmPrincipal.Exibir1.Enabled := True;
          frmPrincipal.PlanodeFundo1.Enabled := True;
          frmPrincipal.Registro1.Enabled := True;
          frmPrincipal.TrocarCor.Enabled := True;
          frmPrincipal.RemoverCordoFundo2.Enabled := True;
          frmPrincipal.InserirAlterarImagem1.Enabled := True;
          frmPrincipal.RemoverImagem2.Enabled := True;
          frmPrincipal.BarradeStatus2.Enabled := True;
          frmPrincipal.ManualdoUsurio2.Enabled := True;
          frmPrincipal.Calculadora1.Enabled := True;
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
    StatusBar1.Panels[2].Text:= TimeToStr(Time);
    StatusBar1.Panels[3].Text:= DateToStr(Date);
    If StatusBar1.Panels[2].Text = edtHora.Text then begin
       Try
         Application.CreateForm(TfrmAlerta, frmAlerta);
         frmAlerta.ShowModal;
       Finally
            frmAlerta.Free;
       end;
    end;
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
    else begin
       If BarradeStatus1.Checked = False then begin
          StatusBar1.Visible := True;
          BarradeStatus1.Checked := True;
          Ocultar1.Checked := True;
       end;
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
    fFoto, fUser : TStream;
    Jpeg : TJPEGImage;
begin
    DataBase;
    Count;
    fImagem;
    fSituacao;
    fBloqueia;
    With dmCarroComando.zqCarro do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select r_nome from registro');
       Active := True;
       StatusBar1.Panels[1].Text := 'USUÁRIO: '+FieldByName('r_nome').AsString;
       DateTimePicker1.Date := Date;
       DateSeparator := '/';
       ShortDateFormat := 'yyyy-mm-dd';
    end;
    With dmCarroComando.zqCarro do begin
       Active := False;
       SQL.Clear;
       SQL.Add('select a_hora from agenda where a_data = '+QuotedStr(DateToStr(DateTimePicker1.Date))+' and a_lembrar = ''S'' order by a_hora');
       Active := True;
       ShortDateFormat := 'dd/mm/yyyy';
       edtHora.Text := FieldByName('a_hora').AsString;
    end;
    Jpeg := nil;
    With dmCarroComando.zqCarro do begin
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

procedure TfrmPrincipal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    ShortDateFormat := 'yyyy-mm-dd';
    With dmCarroComando.zqMyCar do begin
       Active := False;
       SQL.Clear;
       SQL.Add('update mycar set RCK100VXZ35 = '+QuotedStr(DateToStr(Date+1))+' where codigo = 1');
       ExecSQL;
    end;
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

procedure TfrmPrincipal.PecasServios1Click(Sender: TObject);
begin
    Try
      Application.CreateForm(TfrmPecas, frmPecas);
      frmPecas.ShowModal;
    Finally
         frmPecas.Free;
    end;
end;

procedure TfrmPrincipal.btnPecasClick(Sender: TObject);
begin
    PecasServios1Click(Sender);
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

procedure TfrmPrincipal.trocarcordoFundo1Click(Sender: TObject);
var cCor : String;
begin
    If ColorDialog1.Execute then begin
       frmPrincipal.Color := ColorDialog1.Color;
    end;
    cCor := ColorToString(Color);
    With dmCarroComando.zqCarro do begin
       Active :=  False;
       SQL.Clear;
       SQL.Add('Update imagem set cor = '+QuotedStr(cCor)+' where cod = 1');
       ExecSQL;
    end;
end;

procedure TfrmPrincipal.RemovercordoFundo1Click(Sender: TObject);
var cCor : String;
begin
    frmPrincipal.Color := clBtnFace;
    cCor := ColorToString(frmPrincipal.Color);
    With dmCarroComando.zqCarro do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Update imagem set cor = '+QuotedStr(cCor)+' where cod = 1');
       ExecSQL;
    end;
end;

procedure TfrmPrincipal.InserirImagem1Click(Sender: TObject);
var iImagem : String;
begin
    If OpenPictureDialog1.Execute then begin
       Image1.Picture.Assign(nil);
       Image1.Picture.LoadFromFile(OpenPictureDialog1.FileName);
       iImagem := OpenPictureDialog1.FileName;
       With dmCarroComando.zqCarro do begin
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

procedure TfrmPrincipal.RemoverImagem1Click(Sender: TObject);
begin
    With dmCarroComando.zqCarro do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Update imagem set foto = null where cod =1');
       ExecSQL;
       Image1.Picture.Assign(nil);
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
    If Application.MessageBox('O MyCar será fechado para que seja executada a cópia de segurança. Deseja Encerrar o MyCar?','MyCar - Confirmar',MB_YESNO+MB_ICONQUESTION) = ID_YES then begin
       WinExec('C:\Arquivos de programas\MyCar\Backup',SW_SHOW);
       Close;
    end;
end;

procedure TfrmPrincipal.ManualdoUsurio1Click(Sender: TObject);
begin
    ExecFile('C:\Arquivos de programas\MyCar\MyCar - Manual do Usuário.pdf');
end;

procedure TfrmPrincipal.FormActivate(Sender: TObject);
begin
    With dmCarroComando.zqCarro do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select r_nome from registro');
       Active := True;
       frmPrincipal.Caption := 'MyCar - Sistema Para Controle e Gerenciamento de Automóveis ['+FieldByName('r_nome').AsString+']';
    end;
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

procedure TfrmPrincipal.btnContasClick(Sender: TObject);
begin
    CompradeVeculos1Click(Self);
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

procedure TfrmPrincipal.btnBackupClick(Sender: TObject);
begin
    Backup1Click(Self);
end;

procedure TfrmPrincipal.CompradeVeculos1Click(Sender: TObject);
begin
    Try
      Application.CreateForm(TfrmCompraVenda, frmCompraVenda);
      frmCompraVenda.ShowModal;
    Finally
         frmCompraVenda.Free;
    end;
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

procedure TfrmPrincipal.btnComprasClick(Sender: TObject);
begin
    Contas1Click(Self);    
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

procedure TfrmPrincipal.Revisoes1Click(Sender: TObject);
begin
    Try
      Application.CreateForm(TfrmRevisoes, frmRevisoes);
      frmRevisoes.ShowModal;
    Finally
         frmRevisoes.Free;
    end;
end;

procedure TfrmPrincipal.btnRevisaoClick(Sender: TObject);
begin
    Revisoes1Click(Self);
end;

end.
