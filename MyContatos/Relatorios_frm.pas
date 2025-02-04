unit Relatorios_frm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  Vcl.ComCtrls, frxChart, frxClass;

type
  TfrmRelatorios = class(TForm)
    RadioGroup1: TRadioGroup;
    frxVendasCategoria: TfrxReport;
    frxChartObject1: TfrxChartObject;
    GroupBox2: TGroupBox;
    lblDtPosvenda: TLabel;
    dtpInicio: TDateTimePicker;
    dtpFim: TDateTimePicker;
    btnVisualizar: TBitBtn;
    btnFechar: TBitBtn;
    frxPercaGarantia: TfrxReport;
    frxLigacoes: TfrxReport;
    frxClassifAtend: TfrxReport;
    frxFeedPendente: TfrxReport;
    frxClientesPosVenda: TfrxReport;
    frxClientesSugMelEloRec: TfrxReport;
    frxCliAuditados: TfrxReport;
    frxNiver: TfrxReport;
    cbxMes: TComboBox;
    procedure btnVisualizarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelatorios: TfrmRelatorios;

implementation

{$R *.dfm}

uses Contato_dm;

procedure TfrmRelatorios.btnFecharClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmRelatorios.btnVisualizarClick(Sender: TObject);
begin
    if RadioGroup1.ItemIndex = 0 then begin
       FormatSettings.ShortDateFormat := 'yyyy-mm-dd';
       With dmContato.fdqContato do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Select cp_categoria, count() cp_categoria from clientes_pv where cp_dt_notafiscal between '+QuotedStr(DateToStr(dtpInicio.Date))+' and '+QuotedStr(DateToStr(dtpFim.Date))+' group by cp_categoria');
          Active := True;
       end;
       FormatSettings.ShortDateFormat := 'dd/mm/yyyy';
       frxVendasCategoria.Variables['Inicio'] := QuotedStr(DateToStr(dtpInicio.Date));
       frxVendasCategoria.Variables['Fim'] := QuotedStr(DateToStr(dtpFim.Date));
       frxVendasCategoria.ShowReport;
    end;
    if RadioGroup1.ItemIndex = 1 then begin
       FormatSettings.ShortDateFormat := 'yyyy-mm-dd';
       With dmContato.fdqContato do begin
          Active := False;
          SQL.Clear;
          SQL.Add('select CP.cp_cod, C.c_nome, CP.cp_categoria, CP.cp_modelo, CP.cp_placa, F_data from pos_venda PV, Clientes C, Clientes_pv CP, Feedback F where F.f_data between '+QuotedStr(DateToStr(dtpInicio.Date))+' and '+QuotedStr(DateToStr(dtpFim.Date))+' and C.c_cod = CP.c_cod and CP.cp_cod = PV.cp_cod and PV.cp_cod and F.pv_cod = PV.pv_cod and F.f_status = ''NÃO'' order by C.c_nome');
          Active := True;
       end;
       FormatSettings.ShortDateFormat := 'dd/mm/yyyy';
       frxFeedPendente.Variables['Inicio'] := QuotedStr(DateToStr(dtpInicio.Date));
       frxFeedPendente.Variables['Fim'] := QuotedStr(DateToStr(dtpFim.Date));
       frxFeedPendente.ShowReport;
    end;
    if RadioGroup1.ItemIndex = 2 then begin
       FormatSettings.ShortDateFormat := 'yyyy-mm-dd';
       With dmContato.fdqContato do begin
          Active := False;
          SQL.Clear;
          SQL.Add('select CP.cp_cod, C.c_nome, CP.cp_categoria, CP.cp_modelo, CP.cp_placa, PV.pv_motivo_perda_garantia from pos_venda PV, Clientes C, Clientes_pv CP where PV.pv_dt_realizado between '+QuotedStr(DateToStr(dtpInicio.Date))+' and '+QuotedStr(DateToStr(dtpFim.Date))+' and C.c_cod = CP.c_cod and CP.cp_cod = PV.cp_cod and PV.cp_cod and pv_motivo_perda_garantia <> '''' order by C.c_nome');
          Active := True;
       end;
       FormatSettings.ShortDateFormat := 'dd/mm/yyyy';
       frxPercaGarantia.Variables['Inicio'] := QuotedStr(DateToStr(dtpInicio.Date));
       frxPercaGarantia.Variables['Fim'] := QuotedStr(DateToStr(dtpFim.Date));
       frxPercaGarantia.ShowReport;
    end;
    if RadioGroup1.ItemIndex = 3 then begin
       FormatSettings.ShortDateFormat := 'yyyy-mm-dd';
       With dmContato.fdqContato do begin
          Active := False;
          SQL.Clear;
          SQL.Add('select CP.cp_cod, C.c_nome, CP.cp_categoria, CP.cp_modelo, CP.cp_placa, CT_data from Clientes C, Clientes_pv CP, Contatos_pv CT where CT.ct_data between '+QuotedStr(DateToStr(dtpInicio.Date))+' and '+QuotedStr(DateToStr(dtpFim.Date))+' and C.c_cod = CP.c_cod and CP.cp_cod = CT.cp_cod and ct_realizado = ''NÃO'' order by CT.ct_data');
          Active := True;
       end;
       FormatSettings.ShortDateFormat := 'dd/mm/yyyy';
       frxClientesPosVenda.Variables['Inicio'] := QuotedStr(DateToStr(dtpInicio.Date));
       frxClientesPosVenda.Variables['Fim'] := QuotedStr(DateToStr(dtpFim.Date));
       frxClientesPosVenda.ShowReport;
    end;
    if RadioGroup1.ItemIndex = 4 then begin
       FormatSettings.ShortDateFormat := 'yyyy-mm-dd';
       With dmContato.fdqContato do begin
          Active := False;
          SQL.Clear;
          SQL.Add('select CP.cp_cod, C.c_nome, CP.cp_categoria, CP.cp_modelo, CP.cp_placa, PV.PV_SUGESTAO, PV.PV_ELOGIO, PV.PV_RECLAMACAO, PV.PV_DUVIDA from Clientes C, Clientes_pv CP, Pos_Venda PV where PV.pv_dt_realizado between '+QuotedStr(DateToStr(dtpInicio.Date))+' and '+QuotedStr(DateToStr(dtpFim.Date))+' and C.c_cod = CP.c_cod and CP.cp_cod = PV.cp_cod order by C.c_nome');
          Active := True;
       end;
       FormatSettings.ShortDateFormat := 'dd/mm/yyyy';
       frxClientesSugMelEloRec.Variables['Inicio'] := QuotedStr(DateToStr(dtpInicio.Date));
       frxClientesSugMelEloRec.Variables['Fim'] := QuotedStr(DateToStr(dtpFim.Date));
       frxClientesSugMelEloRec.ShowReport;
    end;
    if RadioGroup1.ItemIndex = 5 then begin
       FormatSettings.ShortDateFormat := 'yyyy-mm-dd';
       With dmContato.fdqContato do begin
          Active := False;
          SQL.Clear;
          SQL.Add('select CP.cp_cod, C.c_nome, CP.cp_categoria, CP.cp_modelo, CP.cp_placa, A.a_dt_auditoria, A.a_confirmacao_contato, A.A_CLASSIFICACAO from Clientes C, Clientes_pv CP, Auditoria A, Pos_venda PV where A.a_dt_auditoria between '+QuotedStr(DateToStr(dtpInicio.Date))+' and '+QuotedStr(DateToStr(dtpFim.Date))+' and C.c_cod = CP.c_cod and CP.cp_cod = PV.cp_cod and A.pv_cod = PV.pv_cod order by C.c_nome');
          Active := True;
       end;
       FormatSettings.ShortDateFormat := 'dd/mm/yyyy';
       frxCliAuditados.Variables['Inicio'] := QuotedStr(DateToStr(dtpInicio.Date));
       frxCliAuditados.Variables['Fim'] := QuotedStr(DateToStr(dtpFim.Date));
       frxCliAuditados.ShowReport;
    end;
    if RadioGroup1.ItemIndex = 6 then begin
       FormatSettings.ShortDateFormat := 'yyyy-mm-dd';
       With dmContato.fdqContato do begin
          Active := False;
          SQL.Clear;
          SQL.Add('select c_nome, c_dia_nasc, c_mes_nasc, c_contato1, c_contato2 from Clientes where c_mes_nasc = '+QuotedStr(cbxMes.Text)+' order by c_dia_nasc');
          Active := True;
       end;
       FormatSettings.ShortDateFormat := 'dd/mm/yyyy';
       frxNiver.Variables['Mes'] := QuotedStr(cbxMes.Text);
       frxNiver.ShowReport;
    end;
    if RadioGroup1.ItemIndex = 7 then begin
       FormatSettings.ShortDateFormat := 'yyyy-mm-dd';
       With dmContato.fdqContato do begin
          Active := False;
          SQL.Clear;
          SQL.Add('select A_CONFIRMACAO_CONTATO, count() A_CONFIRMACAO_CONTATO from auditoria where a_dt_auditoria between '+QuotedStr(DateToStr(dtpInicio.Date))+' and '+QuotedStr(DateToStr(dtpFim.Date))+' group by A_CONFIRMACAO_CONTATO');
          Active := True;
       end;
       FormatSettings.ShortDateFormat := 'dd/mm/yyyy';
       frxLigacoes.Variables['Inicio'] := QuotedStr(DateToStr(dtpInicio.Date));
       frxLigacoes.Variables['Fim'] := QuotedStr(DateToStr(dtpFim.Date));
       frxLigacoes.ShowReport;
    end;
    if RadioGroup1.ItemIndex = 8 then begin
       FormatSettings.ShortDateFormat := 'yyyy-mm-dd';
       With dmContato.fdqContato do begin
          Active := False;
          SQL.Clear;
          SQL.Add('select a_classificacao, count() a_classificacao from auditoria where a_dt_auditoria between '+QuotedStr(DateToStr(dtpInicio.Date))+' and '+QuotedStr(DateToStr(dtpFim.Date))+' group by a_classificacao');
          Active := True;
       end;
       FormatSettings.ShortDateFormat := 'dd/mm/yyyy';
       frxClassifAtend.Variables['Inicio'] := QuotedStr(DateToStr(dtpInicio.Date));
       frxClassifAtend.Variables['Fim'] := QuotedStr(DateToStr(dtpFim.Date));
       frxClassifAtend.ShowReport;
    end;
end;

procedure TfrmRelatorios.FormShow(Sender: TObject);
begin
    dtpInicio.Date := Date-15;
    dtpFim.Date := Date+15;
end;

procedure TfrmRelatorios.RadioGroup1Click(Sender: TObject);
begin
    if RadioGroup1.ItemIndex = 6 then begin
       cbxMes.Visible := True;
    end
    else begin
       cbxMes.Visible := False;
       cbxMes.Text := '';
    end;
end;

end.
