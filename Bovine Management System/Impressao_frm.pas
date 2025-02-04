unit Impressao_frm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, DB, ADODB, DateUtils, ExtCtrls;

type
  TfrmImpressao = class(TForm)
    GroupBox1: TGroupBox;
    RadioButton4: TRadioButton;
    RadioButton3: TRadioButton;
    btnOk: TBitBtn;
    GroupBox2: TGroupBox;
    lblInicio: TLabel;
    lblFinal: TLabel;
    dtpInic: TDateTimePicker;
    dtpFin: TDateTimePicker;
    btnFechar: TBitBtn;
    ADOQuery1: TADOQuery;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    rgpControle: TRadioGroup;
    btnPeriodo: TBitBtn;
    procedure btnOkClick(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure btnPeriodoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmImpressao: TfrmImpressao;

implementation

uses  Carro_Comando_dm, ImprimeEstoque_frm,
      RelatorioGeral_frm, Math, EntradaResumo_qrp, SaidaResumo_qrp;

{$R *.dfm}

function AnoConfinamento: String;
begin
    With dmCarroComando.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('select c_ano from confinamento where c_status = ''ATIVO''');
       Active := True;
       AnoConfinamento := FieldByName('c_ano').AsString;
    end;
end;

function Controle() : String;
begin
    If frmImpressao.rgpControle.ItemIndex = 0 then
       Controle := 'P'
    else
       Controle := 'C';
    If frmImpressao.rgpControle.ItemIndex = -1 then
       Controle := '';
end;

procedure TfrmImpressao.btnOkClick(Sender: TObject);
var vAno, vControle : String;
begin
    vAno := AnoConfinamento;
    vControle := Controle;
    If RadioButton1.Checked = True then begin
       DateSeparator := '/';
       ShortDateFormat := 'yyyy-mm-dd';
       With dmCarroComando.ADOQuery1 do begin
          Active := False;
          SQL.Clear;
          SQL.Add('select ea_cod ''cod'', ea_data ''data'', ea_qtdboi+ea_qtdvaca+ea_qtdnovilha ''cabecas'', ea_pesoboi+ea_pesovaca+ea_pesonovilha ''peso vivo'', ea_pesoarrobaboi+ea_pesoarrobavaca+ea_pesoarrobanovilha ''peso @'', '+
          '(ea_pesoarrobaboi+ea_pesoarrobavaca+ea_pesoarrobanovilha)/(ea_qtdboi+ea_qtdvaca+ea_qtdnovilha) ''media @'', '+
          'ea_vlgeralboi+ea_vlgeralvaca+ea_vlgeralnovilha ''valor @'', ea_vltotalboi+ea_vltotalvaca+ea_vltotalnovilha ''valor total @'' from entrada_animais where ea_data between '+QuotedStr(DateToStr(dtpInic.Date))+' and '+QuotedStr(DateToStr(dtpFin.Date))+' and ea_ano = '+QuotedStr(vAno)+' and ea_controle = '+QuotedStr(vControle)+' order by ea_data');
          Active := True;
       end;
       ShortDateFormat := 'dd/mm/yyyy';
       Try
         Application.CreateForm(TqrpEntradaResumo, qrpEntradaResumo);
         If Controle = 'P' then begin
            qrpEntradaResumo.QRLabel6.Caption := 'Pasto';
         end;
         If Controle = 'C' then begin
            qrpEntradaResumo.QRLabel6.Caption := 'Confinamento';
         end;
         qrpEntradaResumo.Preview;
       Finally
            qrpEntradaResumo.Free;
       end;
    end;
    If RadioButton2.Checked = True then begin
       DateSeparator := '/';
       ShortDateFormat := 'yyyy-mm-dd';
       With dmCarroComando.ADOQuery1 do begin
          Active := False;
          SQL.Clear;
          SQL.Add('select sa_cod ''cod'', sa_data ''data'', sa_qtdboi+sa_qtdvaca+sa_qtdnovilha ''cabecas'', sa_pesoboi+sa_pesovaca+sa_pesonovilha ''peso vivo'', sa_valorarrobaboi+sa_valorarrobavaca+sa_valorarrobanovilha ''valor @'', '+
          'sa_pesofrigoboi+sa_pesofrigovaca+sa_pesofrigonovilha ''frigo'', sa_arrobafrigoboi+sa_arrobafrigovaca+sa_arrobafrigonovilha ''peso @'', '+
          '(sa_arrobafrigoboi+sa_arrobafrigovaca+sa_arrobafrigonovilha)/(sa_qtdboi+sa_qtdvaca+sa_qtdnovilha) ''media @'', sa_rendimboi+sa_rendimvaca+sa_rendimnovilha ''rend'', '+
          'sa_pesototalboi+sa_pesototalvaca+sa_pesototalnovilha ''valor total @'' from saida_animais where sa_data between '+QuotedStr(DateToStr(dtpInic.Date))+' and '+QuotedStr(DateToStr(dtpFin.Date))+' and sa_ano = '+QuotedStr(vAno)+' and sa_controle = '+QuotedStr(vControle)+' order by sa_data');
          Active := True;
       end;
       ShortDateFormat := 'dd/mm/yyyy';
       Try
         Application.CreateForm(TqrpSaidaResumo, qrpSaidaResumo);
         If Controle = 'P' then begin
            qrpSaidaResumo.QRLabel9.Caption := 'Pasto';
         end;
         If Controle = 'C' then begin
            qrpSaidaResumo.QRLabel9.Caption := 'Confinamento';
         end;
         qrpSaidaResumo.Preview;
       Finally
            qrpSaidaResumo.Free;
       end;
    end;
    If RadioButton3.Checked = True then begin
       DateSeparator := '/';
       ShortDateFormat := 'yyyy-mm-dd';
       With dmCarroComando.ADOQuery1 do begin
          Active := False;
          SQL.Clear;
          SQL.Add('select P.p_nome, sum(DT.dt_qtdtotal) ''quantidade'', sum(DT.dt_vltotal)/sum(DT.dt_qtdtotal) ''valor uni'', sum(DT.dt_vltotal) ''valor'', p.p_cod from produtos P, dieta DT where P.p_cod = DT.p_cod and DT.dt_data between '+QuotedStr(DateToStr(frmImpressao.dtpInic.Date))+' and '+QuotedStr(DateToStr(frmImpressao.dtpFin.Date))+' and DT.dt_ano = '+QuotedStr(vAno)+' and DT.dt_controle = '+QuotedStr(vControle)+' group by P.p_nome order by P.p_nome');
          Active := True;
       end;
       ShortDateFormat := 'dd/mm/yyyy';
       Try
         Application.CreateForm(TqrpRelatorioGeral, qrpRelatorioGeral);
         qrpRelatorioGeral.qrlDataIni.Caption := DateToStr(dtpInic.Date);
         qrpRelatorioGeral.qrlDataFim.Caption := DateToStr(dtpFin.Date);
         If Controle = 'P' then begin
            qrpRelatorioGeral.QRLabel29.Caption := 'Pasto';
         end;
         If Controle = 'C' then begin
            qrpRelatorioGeral.QRLabel29.Caption := 'Confinamento';
         end;
         qrpRelatorioGeral.Preview;
       Finally
            qrpRelatorioGeral.Free;
       end;

    end;
    If RadioButton4.Checked = True then begin
       With dmCarroComando.ADOQuery1 do begin
          Active := False;
          SQL.Clear;
          SQL.Add('select P.p_cod ''Código'', P.p_nome ''Produto'', P.p_qtd ''Quantidade em Estoque'', avg(EP.ep_vlunit) ''Valor Unitário'', avg(EP.ep_vlunit)*P.p_qtd ''Valor Total'' from produtos P, entrada_produtos EP where P.p_cod = EP.p_cod and EP.ep_ano = '+QuotedStr(vAno)+' and EP.ep_controle = '+QuotedStr(vControle)+' group by P.p_nome');
          Active := True;
       end;
       Try
         Application.CreateForm(TfrmImprimeEstoque, frmImprimeEstoque);
         If Controle = 'P' then begin
            frmImprimeEstoque.QRLabel9.Caption := 'Pasto';
         end;
         If Controle = 'C' then begin
            frmImprimeEstoque.QRLabel9.Caption := 'Confinamento';
         end;
         frmImprimeEstoque.qrpEstoque.Preview;
       Finally
            frmImprimeEstoque.qrpEstoque.Free;
       end;
    end;
end;

procedure TfrmImpressao.RadioButton1Click(Sender: TObject);
begin
    GroupBox2.Visible := True;
    dtpInic.SetFocus;
end;

procedure TfrmImpressao.FormShow(Sender: TObject);
begin
    dtpInic.Date := Date -15;
    dtpFin.Date := Date +15;
end;

procedure TfrmImpressao.btnFecharClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmImpressao.RadioButton3Click(Sender: TObject);
begin
    GroupBox2.Visible := True;
    dtpInic.SetFocus;
end;

procedure TfrmImpressao.RadioButton2Click(Sender: TObject);
begin
    GroupBox2.Visible := True;
    dtpInic.SetFocus;
end;

procedure TfrmImpressao.btnPeriodoClick(Sender: TObject);
var vAno, vControle : String;
begin
    vAno := AnoConfinamento;
    vControle := Controle;
    With dmCarroComando.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('select strftime(''%d/%m/%Y'', min(EA.ea_data)) ''inicio'', strftime(''%d/%m/%Y'',max(SA.sa_data)) ''fim'' from entrada_animais EA, saida_animais SA where EA.ea_ano = '+QuotedStr(vAno)+' and EA.ea_controle = '+QuotedStr(vControle)+' and SA.sa_ano = '+QuotedStr(vAno)+' and SA.sa_controle = '+QuotedStr(vControle)+'');
       Active := True;
       dtpInic.Date := FieldByName('inicio').AsDateTime;
       dtpFin.Date := FieldByName('fim').AsDateTime;
    end;
end;

end.
