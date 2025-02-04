unit Principal_frm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, System.ImageList,
  Vcl.ImgList, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtDlgs, Vcl.ExtCtrls,
  Vcl.ComCtrls, Vcl.Imaging.jpeg, frxClass, frxExportPDF, DB;

type
  TfrmPrincipal = class(TForm)
    Image1: TImage;
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    btnCalendario: TSpeedButton;
    btnCalculadora: TSpeedButton;
    btnClientes: TSpeedButton;
    btnUsuario: TSpeedButton;
    btnRetorno: TSpeedButton;
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
    Usuario1: TMenuItem;
    Controles1: TMenuItem;
    ClientePosVenda1: TMenuItem;
    PlanodeFundo1: TMenuItem;
    trocarcordoFundo1: TMenuItem;
    RemovercordoFundo1: TMenuItem;
    N2: TMenuItem;
    Ferramentas1: TMenuItem;
    Calculadora1: TMenuItem;
    BackupRestore1: TMenuItem;
    Ajuda1: TMenuItem;
    SobreoMyContatos: TMenuItem;
    ImageList1: TImageList;
    Timer1: TTimer;
    PopupMenu1: TPopupMenu;
    TrocarCor: TMenuItem;
    RemoverCor: TMenuItem;
    N4: TMenuItem;
    BarradeStatus2: TMenuItem;
    Ocultar1: TMenuItem;
    ManualdoUsurio2: TMenuItem;
    Ajuda2: TMenuItem;
    Calculadora2: TMenuItem;
    ColorDialog1: TColorDialog;
    OpenPictureDialog1: TOpenPictureDialog;
    Retorno1: TMenuItem;
    btnAuditoria: TSpeedButton;
    AuditoriaPsVenda1: TMenuItem;
    N3: TMenuItem;
    InserirAlterarImagem1: TMenuItem;
    RemoverImagem1: TMenuItem;
    InserirTrocarImagem1: TMenuItem;
    RemoverImagem2: TMenuItem;
    N5: TMenuItem;
    Motocicletas1: TMenuItem;
    btnMotos: TSpeedButton;
    Logoff1: TMenuItem;
    btnRelatorios: TSpeedButton;
    RelatrioseGrficos1: TMenuItem;
    GeradordeRelatrios1: TMenuItem;
    dtpLicenca: TDateTimePicker;
    dtpDataAtual: TDateTimePicker;
    procedure Sair1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure BarradeStatus1Click(Sender: TObject);
    procedure trocarcordoFundo1Click(Sender: TObject);
    procedure Calculadora1Click(Sender: TObject);
    procedure Clientes1Click(Sender: TObject);
    procedure btnClientesClick(Sender: TObject);
    procedure Usuario1Click(Sender: TObject);
    procedure btnUsuarioClick(Sender: TObject);
    procedure btnRetornoClick(Sender: TObject);
    procedure Retorno1Click(Sender: TObject);
    procedure AuditoriaPsVenda1Click(Sender: TObject);
    procedure btnAuditoriaClick(Sender: TObject);
    procedure ClientePosVenda1Click(Sender: TObject);
    procedure btnCalendarioClick(Sender: TObject);
    procedure btnCalculadoraClick(Sender: TObject);
    procedure SobreoMyContatosClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RemovercordoFundo1Click(Sender: TObject);
    procedure InserirAlterarImagem1Click(Sender: TObject);
    procedure RemoverImagem1Click(Sender: TObject);
    procedure TrocarCorClick(Sender: TObject);
    procedure RemoverCorClick(Sender: TObject);
    procedure InserirTrocarImagem1Click(Sender: TObject);
    procedure RemoverImagem2Click(Sender: TObject);
    procedure Ocultar1Click(Sender: TObject);
    procedure Ajuda2Click(Sender: TObject);
    procedure Calculadora2Click(Sender: TObject);
    procedure BackupRestore1Click(Sender: TObject);
    procedure btnBackupClick(Sender: TObject);
    procedure Registro1Click(Sender: TObject);
    procedure Motocicletas1Click(Sender: TObject);
    procedure btnMotosClick(Sender: TObject);
    procedure Logoff1Click(Sender: TObject);
    procedure GeradordeRelatrios1Click(Sender: TObject);
    procedure btnRelatoriosClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses Clientes_frm, Usuario_frm, PosVenda_frm, Auditoria_frm,
  ClientesPosVenda_frm, Sobre_frm, Contato_dm, Registro_frm, Motos_frm,
  Senha_frm, Relatorios_frm;

function Ano(Data:TDateTime): String;
{Retorna uma data por extenso}
var
//  NoDia : Integer;
  DiaDaSemana : array [1..7] of String;
  Meses : array [1..12] of String;
  Dia, Mes, Ano : Word;
begin
{ Dias da Semana }
  DiaDasemana [1]:= 'Domingo';
  DiaDasemana [2]:= 'Segunda-feira';
  DiaDasemana [3]:= 'Terçafeira';
  DiaDasemana [4]:= 'Quarta-feira';
  DiaDasemana [5]:= 'Quinta-feira';
  DiaDasemana [6]:= 'Sexta-feira';
  DiaDasemana [7]:= 'Sábado';
{ Meses do ano }
  Meses [1] := '01';
  Meses [2] := '02';
  Meses [3] := '03';
  Meses [4] := '04';
  Meses [5] := '05';
  Meses [6] := '06';
  Meses [7] := '07';
  Meses [8] := '08';
  Meses [9] := '09';
  Meses [10]:= '10';
  Meses [11]:= '11';
  Meses [12]:= '12';
  DecodeDate (Data, Ano, Mes, Dia);
//  NoDia := DayOfWeek (Data);
  Result := IntToStr(Ano);
end;

function fImagem() : String;
begin
    With dmContato.fdqContato do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select * from imagem');
       Active := True;
       If dmContato.fdqContato.RecordCount = 0 then begin
          Active := True;
          SQL.Clear;
          SQL.Add('Insert into imagem (COD, FOTO, COR) values (1, '''', ''clBtnFace'')');
          ExecSQL;
       end;
    end;
end;

function fLogin() : string;
begin
    if frmPrincipal.StatusBar1.Panels[2].Text = 'Nível: ADMINISTRADOR' then begin
       fLogin := '0';
    end;
    if frmPrincipal.StatusBar1.Panels[2].Text = 'Nível: AUDITORIA' then begin
       fLogin := '1';
    end;
    if frmPrincipal.StatusBar1.Panels[2].Text = 'Nível: CLIENTES PARA PÓS VENDA' then begin
       fLogin := '2';
    end;
    if frmPrincipal.StatusBar1.Panels[2].Text = 'Nível: OPERADOR' then begin
       fLogin := '3';
    end;
    if frmPrincipal.StatusBar1.Panels[2].Text = 'Nível: PÓS VENDA' then begin
       fLogin := '4';
    end;
    if frmPrincipal.StatusBar1.Panels[2].Text = 'Nível: DBA' then begin
       fLogin := '5';
    end;
end;

procedure TfrmPrincipal.ClientePosVenda1Click(Sender: TObject);
begin
    if fLogin = '0' then begin
       Try
         Application.CreateForm(TfrmClientePosVenda, frmClientePosVenda);
         frmClientePosVenda.ShowModal
       Finally
            frmClientePosVenda.Free
       End;
    end
    else begin
       if fLogin = '2' then begin
          Try
            Application.CreateForm(TfrmClientePosVenda, frmClientePosVenda);
            frmClientePosVenda.ShowModal
          Finally
               frmClientePosVenda.Free
          End;
       end
       else begin
          if fLogin = '4' then begin
             Try
               Application.CreateForm(TfrmClientePosVenda, frmClientePosVenda);
               frmClientePosVenda.ShowModal
             Finally
                  frmClientePosVenda.Free
             End;
          end
          else begin
             ShowMessage('Você não tem permissão para acessar esse Controle.');
          end;
       end;
    end;
end;

procedure TfrmPrincipal.Clientes1Click(Sender: TObject);
begin
    if fLogin = '0' then begin
       Try
         Application.CreateForm(TfrmClientes, frmClientes);
         frmClientes.ShowModal;
       Finally
            frmClientes.Free;
       End;
    end
    else begin
       if fLogin = '3' then begin
          Try
         Application.CreateForm(TfrmClientes, frmClientes);
         frmClientes.ShowModal;
       Finally
            frmClientes.Free;
       End;
       end
       else begin
          ShowMessage('Você não tem permissão para acessar esse Controle.');
       end;
    end;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
var cCor, vStatus : String;
    fFoto : TStream;
    Jpeg : TJPEGImage;
begin
    Try
      Application.CreateForm(TfrmSenha, frmSenha);
      frmSenha.ShowModal;
    Finally
         frmSenha.Free;
    end;
    dtpDataAtual.Date := Date;
    With dmContato.fdqContato do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select r_data from registro');
       Active := True;
       dtpLicenca.Date := FieldByName('r_data').AsDateTime;
       if dtpLicenca.Date = dtpDataAtual.Date then begin
          Active := False;
          SQL.Clear;
          SQL.Add('Update registro set r_status = ''NÃO'' where r_cod = 1');
          ExecSQL;
       end;
    end;
    With dmContato.fdqContato do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select r_status from registro');
       Active := True;
       vStatus := FieldByName('r_status').AsString;
       if vStatus = 'NÃO' then begin
          ShowMessage('O MyContatos está bloqueado com a licença expirada. Contate o Desenvolvedor para liberar a licença');
          Panel1.Enabled := False;
          Cadastros1.Enabled := False;
          Controles1.Enabled := False;
          RelatrioseGrficos1.Enabled := False;
          Ferramentas1.Enabled := False;
       end;
    end;
    Jpeg := nil;
    With dmContato.fdqContato do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select r_nome from registro');
       Active := True;
       frmPrincipal.Caption := 'MyContatos - Sistema Para Gerenciamento de Contatos e Auditoria de Pós Venda ['+FieldByName('r_nome').AsString+']';
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

procedure TfrmPrincipal.GeradordeRelatrios1Click(Sender: TObject);
begin
    Try
      Application.CreateForm(TfrmRelatorios, frmRelatorios);
      frmRelatorios.ShowModal;
    Finally
         frmRelatorios.Free;
    End;
end;

procedure TfrmPrincipal.InserirAlterarImagem1Click(Sender: TObject);
var iImagem : String;
begin
    if fLogin = '0' then begin
       If OpenPictureDialog1.Execute then begin
          Image1.Picture.Assign(nil);
          Image1.Picture.LoadFromFile(OpenPictureDialog1.FileName);
          iImagem := OpenPictureDialog1.FileName;
          With dmContato.fdqContato do begin
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
       ShowMessage('Você não tem permissão para acessar esse Controle.');
    end;
end;

procedure TfrmPrincipal.InserirTrocarImagem1Click(Sender: TObject);
begin
    InserirAlterarImagem1Click(Self);
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

procedure TfrmPrincipal.Motocicletas1Click(Sender: TObject);
begin
    if fLogin = '0' then begin
       Try
         Application.CreateForm(TfrmMotos, frmMotos);
         frmMotos.ShowModal;
       Finally
            frmMotos.Free;
       End;
    end
    else begin
       if fLogin = '3' then begin
          Try
            Application.CreateForm(TfrmMotos, frmMotos);
            frmMotos.ShowModal;
          Finally
               frmMotos.Free;
          End;
       end
       else begin
          if fLogin = '2' then begin
             Try
               Application.CreateForm(TfrmMotos, frmMotos);
               frmMotos.ShowModal;
             Finally
                  frmMotos.Free;
             End;
          end
          else begin
             ShowMessage('Você não tem permissão para acessar esse Controle.');
          end;
       end;
    end;
end;

procedure TfrmPrincipal.Ocultar1Click(Sender: TObject);
begin
    BarradeStatus1Click(Self);
end;

procedure TfrmPrincipal.Registro1Click(Sender: TObject);
begin
    if fLogin = '0' then begin
       Try
         Application.CreateForm(TfrmRegistro, frmRegistro);
         frmRegistro.ShowModal;
       Finally
            frmRegistro.Free;
       End;
    end
    else begin
       if fLogin = '5' then begin
          Try
            Application.CreateForm(TfrmRegistro, frmRegistro);
            frmRegistro.ShowModal;
          Finally
               frmRegistro.Free;
          End;
       end
       else begin
          ShowMessage('Você não tem permissão para acessar esse Controle.');
       end;
    end;
end;

procedure TfrmPrincipal.RemoverCorClick(Sender: TObject);
begin
    RemovercordoFundo1Click(Self);
end;

procedure TfrmPrincipal.RemovercordoFundo1Click(Sender: TObject);
var cCor : String;
begin
    frmPrincipal.Color := clBtnFace;
    cCor := ColorToString(frmPrincipal.Color);
    With dmContato.fdqContato do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Update imagem set cor = '+QuotedStr(cCor)+' where cod = 1');
       ExecSQL;
    end;
end;

procedure TfrmPrincipal.RemoverImagem1Click(Sender: TObject);
begin
    if fLogin = '0' then begin
       With dmContato.fdqContato do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Update imagem set foto = null where cod =1');
          ExecSQL;
          Image1.Picture.Assign(nil);
       end;
    end
    else begin
       ShowMessage('Você não tem permissão para acessar esse Controle.');
    end;
end;

procedure TfrmPrincipal.RemoverImagem2Click(Sender: TObject);
begin
    RemoverImagem1Click(Self);
end;

procedure TfrmPrincipal.Retorno1Click(Sender: TObject);
begin
    if fLogin = '0' then begin
       Try
         Application.CreateForm(TfrmPosVenda, frmPosVenda);
         frmPosVenda.ShowModal;
       Finally
            frmPosVenda.Free;
       End;
    end
    else begin
       if fLogin = '4' then begin
          Try
            Application.CreateForm(TfrmPosVenda, frmPosVenda);
            frmPosVenda.ShowModal;
          Finally
               frmPosVenda.Free;
          End;
       end
       else begin
          ShowMessage('Você não tem permissão para acessar esse Controle.');
       end;
   end;
end;

procedure TfrmPrincipal.Ajuda2Click(Sender: TObject);
begin
    SobreoMyContatosClick(Self);
end;

procedure TfrmPrincipal.AuditoriaPsVenda1Click(Sender: TObject);
begin
    if fLogin = '0' then begin
       Try
         Application.CreateForm(TfrmAuditoria, frmAuditoria);
         frmAuditoria.ShowModal;
       Finally
            frmAuditoria.Free;
       End;
    end
    else begin
       if fLogin = '1' then begin
          Try
            Application.CreateForm(TfrmAuditoria, frmAuditoria);
            frmAuditoria.ShowModal;
          Finally
               frmAuditoria.Free;
          End;
       end
       else begin
             ShowMessage('Você não tem permissão para acessar esse Controle.');
       end;
    end;
end;

procedure TfrmPrincipal.BackupRestore1Click(Sender: TObject);
begin
    if fLogin = '0' then begin
       If Application.MessageBox('O MyContatos será fechado para que seja executada a cópia de segurança. Deseja Encerrar o MyContatos?','MyContatos - Confirmar',MB_YESNO+MB_ICONQUESTION) = ID_YES then begin;
          WinExec('D:\Robson\Documents\Embarcadero\Studio\Projects\Contato\Backup',SW_SHOW);
          Application.Terminate;
       end;
    end
    else begin
       ShowMessage('Você não tem permissão para acessar esse Controle.');
    end;
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

procedure TfrmPrincipal.btnAuditoriaClick(Sender: TObject);
begin
    AuditoriaPsVenda1Click(Self);
end;

procedure TfrmPrincipal.btnBackupClick(Sender: TObject);
begin
    BackupRestore1Click(self);
end;

procedure TfrmPrincipal.btnCalculadoraClick(Sender: TObject);
begin
    Calculadora1Click(Self);
end;

procedure TfrmPrincipal.btnCalendarioClick(Sender: TObject);
begin
    ClientePosVenda1Click(Self);
end;

procedure TfrmPrincipal.btnClientesClick(Sender: TObject);
begin
    Clientes1Click(Self);
end;

procedure TfrmPrincipal.btnUsuarioClick(Sender: TObject);
begin
    Usuario1Click(Self);
end;

procedure TfrmPrincipal.btnMotosClick(Sender: TObject);
begin
    Motocicletas1Click(Sender);
end;

procedure TfrmPrincipal.btnRelatoriosClick(Sender: TObject);
begin
    GeradordeRelatrios1Click(Self);
end;

procedure TfrmPrincipal.btnRetornoClick(Sender: TObject);
begin
    Retorno1Click(Self);
end;

procedure TfrmPrincipal.Calculadora1Click(Sender: TObject);
begin
    Try
      WinExec('Calc.exe',Sw_Show);
    Except
      ShowMessage('Verifique se a Calculadora foi Instalada pelo Windows!');
    end;
end;

procedure TfrmPrincipal.Calculadora2Click(Sender: TObject);
begin
    Calculadora1Click(Self);
end;

procedure TfrmPrincipal.Usuario1Click(Sender: TObject);
begin
    if fLogin = '0' then begin
       Try
         Application.CreateForm(TfrmUsuario, frmUsuario);
         frmUsuario.ShowModal;
       Finally
            frmUsuario.Free;
       End;
    end
    else begin
       if fLogin = '5' then begin
          Try
            Application.CreateForm(TfrmUsuario, frmUsuario);
            frmUsuario.ShowModal;
          Finally
               frmUsuario.Free;
          End;
       end
       else begin
          ShowMessage('Você não tem permissão para acessar esse Controle.');
       end;
    end;
end;

procedure TfrmPrincipal.Sair1Click(Sender: TObject);
begin
    Application.Terminate;
end;

procedure TfrmPrincipal.SobreoMyContatosClick(Sender: TObject);
begin
    if fLogin = '0' then begin
       Try
         Application.CreateForm(TfrmSobre, frmSobre);
         frmSobre.ShowModal;
       Finally
            frmSobre.Free;
       End;
    end
    else begin
       if fLogin = '5' then begin
          Try
            Application.CreateForm(TfrmSobre, frmSobre);
            frmSobre.ShowModal;
          Finally
               frmSobre.Free;
          End;
       end
       else begin
             ShowMessage('Você não tem permissão para acessar esse Controle.');
       end;
    end;
end;

procedure TfrmPrincipal.Timer1Timer(Sender: TObject);
begin
    StatusBar1.Panels[3].Text:= TimeToStr(Time);
    StatusBar1.Panels[4].Text:= DateToStr(Date);
end;

procedure TfrmPrincipal.TrocarCorClick(Sender: TObject);
begin
    trocarcordoFundo1Click(Self);
end;

procedure TfrmPrincipal.trocarcordoFundo1Click(Sender: TObject);
var cCor : String;
begin
    If ColorDialog1.Execute then begin
       frmPrincipal.Color := ColorDialog1.Color;
    end;
    cCor := ColorToString(Color);
    With dmContato.fdqContato do begin
       Active :=  False;
       SQL.Clear;
       SQL.Add('Update imagem set cor = '+QuotedStr(cCor)+' where cod = 1');
       ExecSQL;
    end;
end;

end.
