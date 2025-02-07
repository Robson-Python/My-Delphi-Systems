unit Ativar_frm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls;

type
  TfrmAtivar = class(TForm)
    GroupBox1: TGroupBox;
    edtLicenca: TEdit;
    btnRegist: TBitBtn;                        
    edtDia: TEdit;
    edtMes: TEdit;
    edtAno: TEdit;
    Label1: TLabel;
    edtDays: TEdit;
    procedure btnRegistClick(Sender: TObject);
    procedure edtLicencaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAtivar: TfrmAtivar;

implementation

uses ADODB, DB, Principal_frm, Sobre_frm, Enterprise_dm ;

{$R *.dfm}

function Dia(Data:TDateTime): String;
{Retorna uma data por extenso}
var
  NoDia : Integer;
  DiaDaSemana : array [1..7] of String;
  DiaDoMes : array [01..31] of String;
  Meses : array [1..12] of String;
  Dia, Mes, Ano : Word;
begin
{ Dias do Mês }
  DiaDoMes [1]:= '01';
  DiaDoMes [2]:= '02';
  DiaDoMes [3]:= '03';
  DiaDoMes [4]:= '04';
  DiaDoMes [5]:= '05';
  DiaDoMes [6]:= '06';
  DiaDoMes [7]:= '07';
  DiaDoMes [8]:= '08';
  DiaDoMes [9]:= '09';
  DiaDoMes [10]:= '10';
  DiaDoMes [11]:= '11';
  DiaDoMes [12]:= '12';
  DiaDoMes [13]:= '13';
  DiaDoMes [14]:= '14';
  DiaDoMes [15]:= '15';
  DiaDoMes [16]:= '16';
  DiaDoMes [17]:= '17';
  DiaDoMes [18]:= '18';
  DiaDoMes [19]:= '19';
  DiaDoMes [20]:= '20';
  DiaDoMes [21]:= '21';
  DiaDoMes [22]:= '22';
  DiaDoMes [23]:= '23';
  DiaDoMes [24]:= '24';
  DiaDoMes [25]:= '25';
  DiaDoMes [26]:= '26';
  DiaDoMes [27]:= '27';
  DiaDoMes [28]:= '28';
  DiaDoMes [29]:= '29';
  DiaDoMes [30]:= '30';
  DiaDoMes [31]:= '31';
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
  NoDia := DayOfWeek (Data);
  Result := DiaDoMes[Dia];
end;

function Mes(Data:TDateTime): String;
{Retorna uma data por extenso}
var
  NoDia : Integer;
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
  NoDia := DayOfWeek (Data);
  Result := Meses[Mes];
end;

function Ano(Data:TDateTime): String;
{Retorna uma data por extenso}
var
  NoDia : Integer;
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
  NoDia := DayOfWeek (Data);
  Result := IntToStr(Ano);
end;

procedure TfrmAtivar.btnRegistClick(Sender: TObject);
var vStatus : String;
    Days : Integer;
begin
    edtDia.Text := Dia(frmSobre.dtpValidade.Date);
    edtMes.Text := Mes(frmSobre.dtpValidade.Date);
    edtAno.Text := Ano(frmSobre.dtpValidade.Date);
    Days :=  StrToInt(edtDays.Text);
    With dmEnterprise.zqSystem do begin
       Active := False;
       SQL.Clear;
       SQL.Add('select HQVTU00134 from enterprise where codigo = 1');
       Active := True;
       vStatus := FieldByName('HQVTU00134').AsString;
    end;
    If frmSobre.lblDias.Caption <> 'Demo' then begin
       If vStatus = '00100101101010101101110010101001001010011010101110010110010011010101'  then begin
          DateSeparator := '/';
          ShortDateFormat := 'yyyy-mm-dd';
          If Trim(edtLicenca.Text) = '27'+edtDia.Text+'09'+edtDays.Text+edtAno.Text+'197'+edtMes.Text+'735' then begin
             frmSobre.dtpValidade.Date := Date + StrToInt(edtDays.Text);
             frmSobre.dtpDtImplant.Date := Date;
             With dmEnterprise.zqSystem do begin
                Active := False;
                SQL.Clear;
                SQL.Add('Update enterprise set registro = '+QuotedStr(frmSobre.edtRegistro.Text)+', DTIP945C = '+QuotedStr(DateToStr(frmSobre.dtpDtImplant.date))+', CD987VKXL = '+QuotedStr(DateToStr(frmSobre.dtpValidade.Date))+', HQVTU00134 = ''0010110101100011011010111011001100101100110011000110101010010100101'', BGU2762NDS1620 = '+QuotedStr(edtDays.Text)+' where codigo = 1');
                ExecSQL;
                ShortDateFormat := 'dd/mm/yyyy';
                ShowMessage('Sua Licença foi renovada para mais '+IntToStr(Days)+' dias. Para efetivar a Licença feche o Programa e execute-o novamente');
             end;
          end
          else begin
             If Trim(edtLicenca.Text) = '36'+edtDia.Text+'38'+edtDays.Text+edtAno.Text+'743'+edtMes.Text+'527' then begin
                frmSobre.dtpValidade.Date := Date + StrToInt(edtDays.Text);
                frmSobre.dtpDtImplant.Date := Date;
                With dmEnterprise.zqSystem do begin
                   Active := False;
                   SQL.Clear;
                   SQL.Add('Update enterprise set registro = '+QuotedStr(frmSobre.edtRegistro.Text)+', DTIP945C = '+QuotedStr(DateToStr(frmSobre.dtpDtImplant.date))+', CD987VKXL = '+QuotedStr(DateToStr(frmSobre.dtpValidade.Date))+', HQVTU00134 = ''0010110101100011011010111011001100101100110011000110101010010100101'', BGU2762NDS1620 = '+QuotedStr(edtDays.Text)+' where codigo = 1');
                   ExecSQL;
                   ShortDateFormat := 'dd/mm/yyyy';
                   ShowMessage('Sua Licença foi renovada para mais '+IntToStr(Days)+' dias. Para efetivar a Licença feche o Programa e execute-o novamente');
                end;
             end
             else begin
                If Trim(edtLicenca.Text) = '31'+edtDia.Text+'47'+edtDays.Text+edtAno.Text+'020'+edtMes.Text+'593' then begin
                   frmSobre.dtpValidade.Date := Date + StrToInt(edtDays.Text);
                   frmSobre.dtpDtImplant.Date := Date;
                   With dmEnterprise.zqSystem do begin
                      Active := False;
                      SQL.Clear;
                      SQL.Add('Update enterprise set registro = '+QuotedStr(frmSobre.edtRegistro.Text)+', DTIP945C = '+QuotedStr(DateToStr(frmSobre.dtpDtImplant.date))+', CD987VKXL = '+QuotedStr(DateToStr(frmSobre.dtpValidade.Date))+', HQVTU00134 = ''0010110101100011011010111011001100101100110011000110101010010100101'', BGU2762NDS1620 = '+QuotedStr(edtDays.Text)+' where codigo = 1');
                      ExecSQL;
                      ShortDateFormat := 'dd/mm/yyyy';
                      ShowMessage('Sua Licença foi renovada para mais '+IntToStr(Days)+' dias. Para efetivar a Licença feche o Programa e execute-o novamente');
                   end;
                end
                else begin
                   If Trim(edtLicenca.Text) = '41'+edtDia.Text+'22'+edtDays.Text+edtAno.Text+'777'+edtMes.Text+'350' then begin
                      frmSobre.dtpValidade.Date := Date + StrToInt(edtDays.Text);
                      frmSobre.dtpDtImplant.Date := Date;
                      With dmEnterprise.zqSystem do begin
                         Active := False;
                         SQL.Clear;
                         SQL.Add('Update enterprise set registro = '+QuotedStr(frmSobre.edtRegistro.Text)+', DTIP945C = '+QuotedStr(DateToStr(frmSobre.dtpDtImplant.date))+', CD987VKXL = '+QuotedStr(DateToStr(frmSobre.dtpValidade.Date))+', HQVTU00134 = ''0010110101100011011010111011001100101100110011000110101010010100101'', BGU2762NDS1620 = '+QuotedStr(edtDays.Text)+' where codigo = 1');
                         ExecSQL;
                         ShortDateFormat := 'dd/mm/yyyy';
                         ShowMessage('Sua Licença foi renovada para mais '+IntToStr(Days)+' dias. Para efetivar a Licença feche o Programa e execute-o novamente');
                      end;
                   end
                   else begin
                      If Trim(edtLicenca.Text) = '93'+edtDia.Text+'27'+edtDays.Text+edtAno.Text+'078'+edtMes.Text+'586' then begin
                         frmSobre.dtpValidade.Date := Date + StrToInt(edtDays.Text);
                         frmSobre.dtpDtImplant.Date := Date;
                         With dmEnterprise.zqSystem do begin
                            Active := False;
                            SQL.Clear;
                            SQL.Add('Update enterprise set registro = '+QuotedStr(frmSobre.edtRegistro.Text)+', DTIP945C = '+QuotedStr(DateToStr(frmSobre.dtpDtImplant.date))+', CD987VKXL = '+QuotedStr(DateToStr(frmSobre.dtpValidade.Date))+', HQVTU00134 = ''0010110101100011011010111011001100101100110011000110101010010100101'', BGU2762NDS1620 = '+QuotedStr(edtDays.Text)+' where codigo = 1');
                            ExecSQL;
                            ShortDateFormat := 'dd/mm/yyyy';
                            ShowMessage('Sua Licença foi renovada para mais '+IntToStr(Days)+' dias. Para efetivar a Licença feche o Programa e execute-o novamente');
                         end;
                      end
                      else begin
                         If Trim(edtLicenca.Text) = '34'+edtDia.Text+'48'+edtDays.Text+edtAno.Text+'055'+edtMes.Text+'688' then begin
                            frmSobre.dtpValidade.Date := Date + StrToInt(edtDays.Text);
                            frmSobre.dtpDtImplant.Date := Date;
                            With dmEnterprise.zqSystem do begin
                               Active := False;
                               SQL.Clear;
                               SQL.Add('Update enterprise set registro = '+QuotedStr(frmSobre.edtRegistro.Text)+', DTIP945C = '+QuotedStr(DateToStr(frmSobre.dtpDtImplant.date))+', CD987VKXL = '+QuotedStr(DateToStr(frmSobre.dtpValidade.Date))+', HQVTU00134 = ''0010110101100011011010111011001100101100110011000110101010010100101'', BGU2762NDS1620 = '+QuotedStr(edtDays.Text)+' where codigo = 1');
                               ExecSQL;
                               ShortDateFormat := 'dd/mm/yyyy';
                               ShowMessage('Sua Licença foi renovada para mais '+IntToStr(Days)+' dias. Para efetivar a Licença feche o Programa e execute-o novamente');
                            end;
                         end
                         else begin
                            If Trim(edtLicenca.Text) = '36'+edtDia.Text+'97'+edtDays.Text+edtAno.Text+'750'+edtMes.Text+'544' then begin
                               frmSobre.dtpValidade.Date := Date + StrToInt(edtDays.Text);
                               frmSobre.dtpDtImplant.Date := Date;
                               With dmEnterprise.zqSystem do begin
                                  Active := False;
                                  SQL.Clear;
                                  SQL.Add('Update enterprise set registro = '+QuotedStr(frmSobre.edtRegistro.Text)+', DTIP945C = '+QuotedStr(DateToStr(frmSobre.dtpDtImplant.date))+', CD987VKXL = '+QuotedStr(DateToStr(frmSobre.dtpValidade.Date))+', HQVTU00134 = ''0010110101100011011010111011001100101100110011000110101010010100101'', BGU2762NDS1620 = '+QuotedStr(edtDays.Text)+' where codigo = 1');
                                  ExecSQL;
                                  ShortDateFormat := 'dd/mm/yyyy';
                                  ShowMessage('Sua Licença foi renovada para mais '+IntToStr(Days)+' dias. Para efetivar a Licença feche o Programa e execute-o novamente');
                               end;
                            end
                            else begin
                               If Trim(edtLicenca.Text) = '89'+edtDia.Text+'38'+edtDays.Text+edtAno.Text+'755'+edtMes.Text+'667' then begin
                                  frmSobre.dtpValidade.Date := Date + StrToInt(edtDays.Text);
                                  frmSobre.dtpDtImplant.Date := Date;
                                  With dmEnterprise.zqSystem do begin
                                     Active := False;
                                     SQL.Clear;
                                     SQL.Add('Update enterprise set registro = '+QuotedStr(frmSobre.edtRegistro.Text)+', DTIP945C = '+QuotedStr(DateToStr(frmSobre.dtpDtImplant.date))+', CD987VKXL = '+QuotedStr(DateToStr(frmSobre.dtpValidade.Date))+', HQVTU00134 = ''0010110101100011011010111011001100101100110011000110101010010100101'', BGU2762NDS1620 = '+QuotedStr(edtDays.Text)+' where codigo = 1');
                                     ExecSQL;
                                     ShortDateFormat := 'dd/mm/yyyy';
                                     ShowMessage('Sua Licença foi renovada para mais '+IntToStr(Days)+' dias. Para efetivar a Licença feche o Programa e execute-o novamente');
                                  end;
                               end
                               else begin
                                  If Trim(edtLicenca.Text) = '36'+edtDia.Text+'01'+edtDays.Text+edtAno.Text+'186'+edtMes.Text+'721' then begin
                                     frmSobre.dtpValidade.Date := Date + StrToInt(edtDays.Text);
                                     frmSobre.dtpDtImplant.Date := Date;
                                     With dmEnterprise.zqSystem do begin
                                        Active := False;
                                        SQL.Clear;
                                        SQL.Add('Update enterprise set registro = '+QuotedStr(frmSobre.edtRegistro.Text)+', DTIP945C = '+QuotedStr(DateToStr(frmSobre.dtpDtImplant.date))+', CD987VKXL = '+QuotedStr(DateToStr(frmSobre.dtpValidade.Date))+', HQVTU00134 = ''0010110101100011011010111011001100101100110011000110101010010100101'', BGU2762NDS1620 = '+QuotedStr(edtDays.Text)+' where codigo = 1');
                                        ExecSQL;
                                        ShortDateFormat := 'dd/mm/yyyy';
                                        ShowMessage('Sua Licença foi renovada para mais '+IntToStr(Days)+' dias. Para efetivar a Licença feche o Programa e execute-o novamente');
                                     end;
                                  end
                                  else begin
                                     If Trim(edtLicenca.Text) = '26'+edtDia.Text+'38'+edtDays.Text+edtAno.Text+'291'+edtMes.Text+'384' then begin
                                        frmSobre.dtpValidade.Date := Date + StrToInt(edtDays.Text);
                                        frmSobre.dtpDtImplant.Date := Date;
                                        With dmEnterprise.zqSystem do begin
                                           Active := False;
                                           SQL.Clear;
                                           SQL.Add('Update enterprise set registro = '+QuotedStr(frmSobre.edtRegistro.Text)+', DTIP945C = '+QuotedStr(DateToStr(frmSobre.dtpDtImplant.date))+', CD987VKXL = '+QuotedStr(DateToStr(frmSobre.dtpValidade.Date))+', HQVTU00134 = ''0010110101100011011010111011001100101100110011000110101010010100101'', BGU2762NDS1620 = '+QuotedStr(edtDays.Text)+' where codigo = 1');
                                           ExecSQL;
                                           ShortDateFormat := 'dd/mm/yyyy';
                                           ShowMessage('Sua Licença foi renovada para mais '+IntToStr(Days)+' dias. Para efetivar a Licença feche o Programa e execute-o novamente');
                                        end;
                                     end
                                     else begin
                                        If Trim(edtLicenca.Text) = '56'+edtDia.Text+'09'+edtDays.Text+edtAno.Text+'991'+edtMes.Text+'152' then begin
                                           frmSobre.dtpValidade.Date := Date + StrToInt(edtDays.Text);
                                           frmSobre.dtpDtImplant.Date := Date;
                                           With dmEnterprise.zqSystem do begin
                                              Active := False;
                                              SQL.Clear;
                                              SQL.Add('Update enterprise set registro = '+QuotedStr(frmSobre.edtRegistro.Text)+', DTIP945C = '+QuotedStr(DateToStr(frmSobre.dtpDtImplant.date))+', CD987VKXL = '+QuotedStr(DateToStr(frmSobre.dtpValidade.Date))+', HQVTU00134 = ''0010110101100011011010111011001100101100110011000110101010010100101'', BGU2762NDS1620 = '+QuotedStr(edtDays.Text)+' where codigo = 1');
                                              ExecSQL;
                                              ShortDateFormat := 'dd/mm/yyyy';
                                              ShowMessage('Sua Licença foi renovada para mais '+IntToStr(Days)+' dias. Para efetivar a Licença feche o Programa e execute-o novamente');
                                           end;
                                        end
                                        else begin
                                           If Trim(edtLicenca.Text) = '73'+edtDia.Text+'28'+edtDays.Text+edtAno.Text+'391'+edtMes.Text+'638' then begin
                                              frmSobre.dtpValidade.Date := Date + StrToInt(edtDays.Text);
                                              frmSobre.dtpDtImplant.Date := Date;
                                              With dmEnterprise.zqSystem do begin
                                                 Active := False;
                                                 SQL.Clear;
                                                 SQL.Add('Update enterprise set registro = '+QuotedStr(frmSobre.edtRegistro.Text)+', DTIP945C = '+QuotedStr(DateToStr(frmSobre.dtpDtImplant.date))+', CD987VKXL = '+QuotedStr(DateToStr(frmSobre.dtpValidade.Date))+', HQVTU00134 = ''0010110101100011011010111011001100101100110011000110101010010100101'', BGU2762NDS1620 = '+QuotedStr(edtDays.Text)+' where codigo = 1');
                                                 ExecSQL;
                                                 ShortDateFormat := 'dd/mm/yyyy';
                                                 ShowMessage('Sua Licença foi renovada para mais '+IntToStr(Days)+' dias. Para efetivar a Licença feche o Programa e execute-o novamente');
                                              end;
                                            end
                                            else begin
                                               If Trim(edtLicenca.Text) = '45'+edtDia.Text+'84'+edtDays.Text+edtAno.Text+'802'+edtMes.Text+'826' then begin
                                                  frmSobre.dtpValidade.Date := Date + StrToInt(edtDays.Text);
                                                  frmSobre.dtpDtImplant.Date := Date;
                                                  With dmEnterprise.zqSystem do begin
                                                     Active := False;
                                                     SQL.Clear;
                                                     SQL.Add('Update enterprise set registro = '+QuotedStr(frmSobre.edtRegistro.Text)+', DTIP945C = '+QuotedStr(DateToStr(frmSobre.dtpDtImplant.date))+', CD987VKXL = '+QuotedStr(DateToStr(frmSobre.dtpValidade.Date))+', HQVTU00134 = ''0010110101100011011010111011001100101100110011000110101010010100101'', BGU2762NDS1620 = '+QuotedStr(edtDays.Text)+' where codigo = 1');
                                                     ExecSQL;
                                                     ShortDateFormat := 'dd/mm/yyyy';
                                                     ShowMessage('Sua Licença foi renovada para mais '+IntToStr(Days)+' dias. Para efetivar a Licença feche o Programa e execute-o novamente');
                                                  end;
                                               end
                                               else begin
                                                  If Trim(edtLicenca.Text) = '60'+edtDia.Text+'84'+edtDays.Text+edtAno.Text+'957'+edtMes.Text+'248' then begin
                                                     frmSobre.dtpValidade.Date := Date + StrToInt(edtDays.Text);
                                                     frmSobre.dtpDtImplant.Date := Date;
                                                     With dmEnterprise.zqSystem do begin
                                                        Active := False;
                                                        SQL.Clear;
                                                        SQL.Add('Update enterprise set registro = '+QuotedStr(frmSobre.edtRegistro.Text)+', DTIP945C = '+QuotedStr(DateToStr(frmSobre.dtpDtImplant.date))+', CD987VKXL = '+QuotedStr(DateToStr(frmSobre.dtpValidade.Date))+', HQVTU00134 = ''0010110101100011011010111011001100101100110011000110101010010100101'', BGU2762NDS1620 = '+QuotedStr(edtDays.Text)+' where codigo = 1');
                                                        ExecSQL;
                                                        ShortDateFormat := 'dd/mm/yyyy';
                                                        ShowMessage('Sua Licença foi renovada para mais '+IntToStr(Days)+' dias. Para efetivar a Licença feche o Programa e execute-o novamente');
                                                     end;
                                                  end
                                                  else begin
                                                     If Trim(edtLicenca.Text) = '08'+edtDia.Text+'43'+edtDays.Text+edtAno.Text+'082'+edtMes.Text+'486' then begin
                                                        frmSobre.dtpValidade.Date := Date + StrToInt(edtDays.Text);
                                                        frmSobre.dtpDtImplant.Date := Date;
                                                        With dmEnterprise.zqSystem do begin
                                                           Active := False;
                                                           SQL.Clear;
                                                           SQL.Add('Update enterprise set registro = '+QuotedStr(frmSobre.edtRegistro.Text)+', DTIP945C = '+QuotedStr(DateToStr(frmSobre.dtpDtImplant.date))+', CD987VKXL = '+QuotedStr(DateToStr(frmSobre.dtpValidade.Date))+', 0HQVTU00134 = ''0010110101100011011010111011001100101100110011000110101010010100101'', BGU2762NDS1620 = '+QuotedStr(edtDays.Text)+' where codigo = 1');
                                                           ExecSQL;
                                                           ShortDateFormat := 'dd/mm/yyyy';
                                                           ShowMessage('Sua Licença foi renovada para mais '+IntToStr(Days)+' dias. Para efetivar a Licença feche o Programa e execute-o novamente');
                                                        end;
                                                     end
                                                     else begin
                                                        If Trim(edtLicenca.Text) = '11'+edtDia.Text+'09'+edtDays.Text+edtAno.Text+'426'+edtMes.Text+'334' then begin
                                                           frmSobre.dtpValidade.Date := Date + StrToInt(edtDays.Text);
                                                           frmSobre.dtpDtImplant.Date := Date;
                                                           With dmEnterprise.zqSystem do begin
                                                              Active := False;
                                                              SQL.Clear;
                                                              SQL.Add('Update enterprise set registro = '+QuotedStr(frmSobre.edtRegistro.Text)+', DTIP945C = '+QuotedStr(DateToStr(frmSobre.dtpDtImplant.date))+', CD987VKXL = '+QuotedStr(DateToStr(frmSobre.dtpValidade.Date))+', HQVTU00134 = ''0010110101100011011010111011001100101100110011000110101010010100101'', BGU2762NDS1620 = '+QuotedStr(edtDays.Text)+' where codigo = 1');
                                                              ExecSQL;
                                                              ShortDateFormat := 'dd/mm/yyyy';
                                                              ShowMessage('Sua Licença foi renovada para mais '+IntToStr(Days)+' dias. Para efetivar a Licença feche o Programa e execute-o novamente');
                                                           end;
                                                        end
                                                        else begin
                                                           Application.MessageBox('Licença Inválida! Entre em contato com o Programador para obter uma licença válida.','MyShop - Erro Fatal',MB_OK+MB_ICONERROR);
                                                        end;
                                                     end;
                                                  end;
                                               end;
                                            end;
                                         end;
                                      end;
                                   end;
                                end;
                             end;
                          end;
                       end;
                    end;
                 end;
              end;
           end;
        end
        else begin
          Application.MessageBox('Você possui uma licença válida.','MyShop - Aviso',MB_OK+MB_ICONINFORMATION);
       end;
    end
    else begin
       If vStatus = '0010110101100011011010111011001100101100110011000110101010010100101'  then begin
          DateSeparator := '/';
          ShortDateFormat := 'yyyy-mm-dd';
          If Trim(edtLicenca.Text) = '27'+edtDia.Text+'09'+edtDays.Text+edtAno.Text+'197'+edtMes.Text+'735' then begin
             frmSobre.dtpValidade.Date := Date + StrToInt(edtDays.Text);
             frmSobre.dtpDtImplant.Date := Date;
             With dmEnterprise.zqSystem do begin
                Active := False;
                SQL.Clear;
                SQL.Add('Update enterprise set registro = '+QuotedStr(frmSobre.edtRegistro.Text)+', DTIP945C = '+QuotedStr(DateToStr(frmSobre.dtpDtImplant.date))+', CD987VKXL = '+QuotedStr(DateToStr(frmSobre.dtpValidade.Date))+', HQVTU00134 = ''0010110101100011011010111011001100101100110011000110101010010100101'', BGU2762NDS1620 = '+QuotedStr(edtDays.Text)+' where codigo = 1');
                ExecSQL;
                ShortDateFormat := 'dd/mm/yyyy';
                ShowMessage('Sua Licença foi renovada para mais '+IntToStr(Days)+' dias. Para efetivar a Licença feche o Programa e execute-o novamente');
             end;
          end
          else begin
             Application.MessageBox('Licença Inválida! Entre em contato com o Programador para obter uma licença válida.','MyShop - Erro Fatal',MB_OK+MB_ICONERROR);
          end;
       end;
       If vStatus = '00100101101010101101110010101001001010011010101110010110010011010101'  then begin
          DateSeparator := '/';
          ShortDateFormat := 'yyyy-mm-dd';
          If Trim(edtLicenca.Text) = '27'+edtDia.Text+'09'+edtDays.Text+edtAno.Text+'197'+edtMes.Text+'735' then begin
             frmSobre.dtpValidade.Date := Date + StrToInt(edtDays.Text);
             frmSobre.dtpDtImplant.Date := Date;
             With dmEnterprise.zqSystem do begin
                Active := False;
                SQL.Clear;
                SQL.Add('Update enterprise set registro = '+QuotedStr(frmSobre.edtRegistro.Text)+', DTIP945C = '+QuotedStr(DateToStr(frmSobre.dtpDtImplant.date))+', CD987VKXL = '+QuotedStr(DateToStr(frmSobre.dtpValidade.Date))+', HQVTU00134 = ''0010110101100011011010111011001100101100110011000110101010010100101'', BGU2762NDS1620 = '+QuotedStr(edtDays.Text)+' where codigo = 1');
                ExecSQL;
                ShortDateFormat := 'dd/mm/yyyy';
                ShowMessage('Sua Licença foi renovada para mais '+IntToStr(Days)+' dias. Para efetivar a Licença feche o Programa e execute-o novamente');
             end;
          end
          else begin
             Application.MessageBox('Licença Inválida! Entre em contato com o Programador para obter uma licença válida.','MyShop - Erro Fatal',MB_OK+MB_ICONERROR);
          end;
       end;
    end;
    frmSobre.FormShow(Sender);
    Close;
end;

procedure TfrmAtivar.edtLicencaKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    btnRegist.Enabled := True;
    If edtLicenca.Text = '' then
       btnRegist.Enabled := False;
end;

end.












