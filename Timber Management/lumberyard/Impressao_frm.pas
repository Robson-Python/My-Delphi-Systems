unit Impressao_frm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, DB, ADODB, Jpeg, ExtCtrls;

type
  TfrmImpressao = class(TForm)
    ADOQuery3: TADOQuery;
    ADOQuery2: TADOQuery;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    ADOQuery4: TADOQuery;
    ADOQuery5: TADOQuery;
    PageControl1: TPageControl;
    Resumo: TTabSheet;
    Estoque: TTabSheet;
    Entradas: TTabSheet;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    cbxEmpresa: TComboBox;
    GroupBox3: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    btnOk: TBitBtn;
    btnFechar: TBitBtn;
    Edit1: TEdit;
    ADOQuery6: TADOQuery;
    ADOQuery7: TADOQuery;
    btnImpriRes: TBitBtn;
    RadioGroup1: TRadioGroup;
    GroupBox4: TGroupBox;
    CheckBox1: TCheckBox;
    GroupBox5: TGroupBox;
    GroupBox6: TGroupBox;
    Label2: TLabel;
    cbxMes: TComboBox;
    edtAno: TEdit;
    Label5: TLabel;
    GroupBox7: TGroupBox;
    Label6: TLabel;
    cbxEmpEstoq: TComboBox;
    btnImpriEstoq: TBitBtn;
    Edit2: TEdit;
    Saida: TTabSheet;
    CheckBox2: TCheckBox;
    Label7: TLabel;
    cbxEmpresaResumo: TComboBox;
    Edit3: TEdit;
    GroupBox8: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    DateTimePicker3: TDateTimePicker;
    DateTimePicker4: TDateTimePicker;
    GroupBox9: TGroupBox;
    GroupBox10: TGroupBox;
    Label10: TLabel;
    cbxEmpresaSaida: TComboBox;
    GroupBox11: TGroupBox;
    Label11: TLabel;
    Label12: TLabel;
    DateTimePicker5: TDateTimePicker;
    DateTimePicker6: TDateTimePicker;
    BitBtn1: TBitBtn;
    Edit4: TEdit;
    procedure btnFecharClick(Sender: TObject);
    procedure EntradasShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure cbxEmpresaChange(Sender: TObject);
    procedure btnImpriResClick(Sender: TObject);
    procedure EstoqueShow(Sender: TObject);
    procedure btnImpriEstoqClick(Sender: TObject);
    procedure cbxEmpEstoqChange(Sender: TObject);
    procedure ResumoShow(Sender: TObject);
    procedure cbxEmpresaResumoChange(Sender: TObject);
    procedure SaidaShow(Sender: TObject);
    procedure cbxEmpresaSaidaChange(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmImpressao: TfrmImpressao;

implementation

uses ImprimeEstoque_frm, Carro_Comando_dm, ImprimeEntrada_frm, DateUtils,
  ImprimeResEntrada_frm,
  ImprimeAprazo_frm, ImprimeAvista_frm, ImprimeCompra_frm, Entrada_frm,
  ImprimeResFornFret_frm, ImprimFret_frm, ImprEstoqUtil_frm,
  PlanilhaForn_frm, PlanilhaFrete_frm, ImprimeSaida_frm;

{$R *.dfm}

procedure TfrmImpressao.btnFecharClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmImpressao.EntradasShow(Sender: TObject);
begin
    DateTimePicker1.Date := Date -15;
    DateTimePicker2.Date := Date + 15;
    cbxEmpresa.Clear;
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select * from empresa order by razaoSocial');
       Active := True;
       while not Eof do begin
          cbxEmpresa.Items.Add(FieldByName('razaoSocial').AsString);
          Next;
       end;
    end;
    cbxEmpresa.SetFocus;
end;

procedure TfrmImpressao.btnOkClick(Sender: TObject);
begin
    DateSeparator := '/';
    ShortDateFormat := 'yyyy-mm-dd';
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select * from entrada EN, empresa E, plaqueta P, especie ES, classificacao C where EN.empresa_id = '+QuotedStr(Edit1.Text)+' and EN.empresa_id = E.id and P.empresa_id = EN.empresa_id and P.especie_id = ES.id and P.classificacao_id = C.id and EN.dataEntrada between '+QuotedStr(DateToStr(DateTimePicker1.Date))+' and '+QuotedStr(DateToStr(DateTimePicker2.Date))+'');
       Active := True;
       ShortDateFormat := 'dd/mm/yyyy';
    end;
    DateSeparator := '/';
    ShortDateFormat := 'yyyy-mm-dd';
    With ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('select count(*) p_numero from plaqueta P, entrada EN where EN.empresa_id = '+QuotedStr(Edit1.Text)+' and P.empresa_id = EN.empresa_id and EN.dataEntrada between '+QuotedStr(DateToStr(DateTimePicker1.Date))+' and '+QuotedStr(DateToStr(DateTimePicker2.Date))+'');
       Active := True;
       ShortDateFormat := 'dd/mm/yyyy';
    end;
    DateSeparator := '/';
    ShortDateFormat := 'yyyy-mm-dd';
    With ADOQuery3 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('select sum(p_volume) from plaqueta P, entrada EN where EN.empresa_id = '+QuotedStr(Edit1.Text)+' and P.empresa_id = EN.empresa_id and EN.dataEntrada between '+QuotedStr(DateToStr(DateTimePicker1.Date))+' and '+QuotedStr(DateToStr(DateTimePicker2.Date))+'');
       Active := True;
       ShortDateFormat := 'dd/mm/yyyy';
    end;
    DateSeparator := '/';
    ShortDateFormat := 'yyyy-mm-dd';
    With ADOQuery4 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('select sum(p_preco) from plaqueta P, entrada EN where EN.empresa_id = '+QuotedStr(Edit1.Text)+' and P.empresa_id = EN.empresa_id and EN.dataEntrada between '+QuotedStr(DateToStr(DateTimePicker1.Date))+' and '+QuotedStr(DateToStr(DateTimePicker2.Date))+'');
       Active := True;
       ShortDateFormat := 'dd/mm/yyyy';
    end;
    DateSeparator := '/';
    ShortDateFormat := 'yyyy-mm-dd';
    With ADOQuery5 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('select AVG(p_custo) from plaqueta P, entrada EN where EN.empresa_id = '+QuotedStr(Edit1.Text)+' and P.empresa_id = EN.empresa_id and EN.entradaEntrada between '+QuotedStr(DateToStr(DateTimePicker1.Date))+' and '+QuotedStr(DateToStr(DateTimePicker2.Date))+'');
       Active := True;
       ShortDateFormat := 'dd/mm/yyyy';
    end;
    DateSeparator := '/';
    ShortDateFormat := 'yyyy-mm-dd';
    With ADOQuery6 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('select sum(en_vl_frete) from entrada where e_cnpj = '+QuotedStr(Edit1.Text)+' and en_dt_entrada between '+QuotedStr(DateToStr(DateTimePicker1.Date))+' and '+QuotedStr(DateToStr(DateTimePicker2.Date))+'');
       Active := True;
       ShortDateFormat := 'dd/mm/yyyy';
    end;
    DateSeparator := '/';
    ShortDateFormat := 'yyyy-mm-dd';
    With ADOQuery7 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('select AVG(p_preco) from plaquetas P, entrada EN where EN.e_cnpj = '+QuotedStr(Edit1.Text)+' and P.en_cod = EN.en_cod and EN.en_dt_entrada between '+QuotedStr(DateToStr(DateTimePicker1.Date))+' and '+QuotedStr(DateToStr(DateTimePicker2.Date))+'');
       Active := True;
       ShortDateFormat := 'dd/mm/yyyy';
    end;
    Try
      Application.CreateForm(TfrmImprimeEntrada, frmImprimeEntrada);
      frmImprimeEntrada.QRLabel10.Caption := DateToStr(DateTimePicker1.Date);
      frmImprimeEntrada.QRLabel12.Caption := DateToStr(DateTimePicker2.Date);
      frmImprimeEntrada.qrpEntrada.Preview;
      Finally
           frmImprimeEntrada.Free;
      end;
end;

procedure TfrmImpressao.cbxEmpresaChange(Sender: TObject);
begin
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select e_cnpj from empresas where e_rsocial = '+QuotedStr(cbxEmpresa.Text)+'');
       Active := True;
       Edit1.Text := FieldByName('e_cnpj').AsString;
    end;
end;

procedure TfrmImpressao.btnImpriResClick(Sender: TObject);
begin
    DateSeparator := '/';
    ShortDateFormat := 'yyyy-mm-dd';
    If RadioGroup1.ItemIndex = 0 then begin
       If CheckBox1.Checked = False then begin
          ShortDateFormat := 'dd/mm/yyyy';
          Try
            Application.CreateForm(TfrmImpResFornFret, frmImpResFornFret);
            frmImpResFornFret.QuickRep1.Preview;
            Finally
                 frmImpResFornFret.Free;
          end;
       end
       else begin
          If CheckBox1.Checked = True then begin
             DateSeparator := '/';
             ShortDateFormat := 'yyyy-mm-dd';
             With dmVendas.ADOQuery1 do begin
                Active := False;
                SQL.Clear;
                SQL.Add('Select * from entrada EN, empresas E, plaquetas P, sub_especie SE, materia_prima MP, fornecedores F where EN.e_cnpj = '+QuotedStr(Edit3.Text)+' and EN.e_cnpj = E.e_cnpj and P.en_cod = EN.en_cod and P.se_cod = SE.se_cod and P.mp_cod = MP.mp_cod and F.f_cod = EN.f_cod and EN.en_dt_entrada between '+QuotedStr(DateToStr(DateTimePicker3.Date))+' and '+QuotedStr(DateToStr(DateTimePicker4.Date))+' order by SE.se_descricao');
                Active := True;
                ShortDateFormat := 'dd/mm/yyyy';
             end;
             DateSeparator := '/';
             ShortDateFormat := 'yyyy-mm-dd';
             With ADOQuery3 do begin
                Active := False;
                SQL.Clear;
                SQL.Add('select sum(p_volume) from plaquetas P, entrada EN where EN.e_cnpj = '+QuotedStr(Edit3.Text)+' and P.en_cod = EN.en_cod and EN.en_dt_entrada between '+QuotedStr(DateToStr(DateTimePicker3.Date))+' and '+QuotedStr(DateToStr(DateTimePicker4.Date))+'');
                Active := True;
                ShortDateFormat := 'dd/mm/yyyy';
            end;
            DateSeparator := '/';
            ShortDateFormat := 'yyyy-mm-dd';
            With ADOQuery4 do begin
               Active := False;
               SQL.Clear;
               SQL.Add('select sum(p_custo) from plaquetas P, entrada EN where EN.e_cnpj = '+QuotedStr(Edit3.Text)+' and P.en_cod = EN.en_cod and EN.en_dt_entrada between '+QuotedStr(DateToStr(DateTimePicker3.Date))+' and '+QuotedStr(DateToStr(DateTimePicker4.Date))+'');
               Active := True;
               ShortDateFormat := 'dd/mm/yyyy';
             end;
             DateSeparator := '/';
             ShortDateFormat := 'yyyy-mm-dd';
             With ADOQuery7 do begin
                Active := False;
                SQL.Clear;
                SQL.Add('select sum(p_preco) from plaquetas P, entrada EN where EN.e_cnpj = '+QuotedStr(Edit3.Text)+' and P.en_cod = EN.en_cod and EN.en_dt_entrada between '+QuotedStr(DateToStr(DateTimePicker3.Date))+' and '+QuotedStr(DateToStr(DateTimePicker4.Date))+'');
                Active := True;
                ShortDateFormat := 'dd/mm/yyyy';
             end;
             Try
               Application.CreateForm(TfrmPlanilhaForn, frmPlanilhaForn);
               frmPlanilhaForn.QRLabel10.Caption := DateToStr(DateTimePicker3.Date);
               frmPlanilhaForn.QRLabel12.Caption := DateToStr(DateTimePicker4.Date);
               frmPlanilhaForn.qrpPlanilhaForn.Preview;
             Finally
                   frmPlanilhaForn.Free;
             end;
          end;
       end;
    end
    else begin
       If RadioGroup1.ItemIndex = 1 then begin
          If CheckBox1.Checked = False then begin
          Try
            Application.CreateForm(TfrmImprFret, frmImprFret);
            frmImprFret.QuickRep1.Preview;
          Finally
               frmImprFret.Free;
          end;
       end
       else begin
          If CheckBox1.Checked = True then begin
             DateSeparator := '/';
             ShortDateFormat := 'yyyy-mm-dd';
             With dmVendas.ADOQuery1 do begin
                Active := False;
                SQL.Clear;
                SQL.Add('Select * from entrada EN, empresas E, plaquetas P, sub_especie SE, materia_prima MP, freteiros FR where EN.e_cnpj = '+QuotedStr(Edit3.Text)+' and EN.e_cnpj = E.e_cnpj and P.en_cod = EN.en_cod and P.se_cod = SE.se_cod and P.mp_cod = MP.mp_cod and FR.fr_cod = EN.fr_cod and EN.en_dt_entrada between '+QuotedStr(DateToStr(DateTimePicker3.Date))+' and '+QuotedStr(DateToStr(DateTimePicker4.Date))+' order by SE.se_descricao');
                Active := True;
                ShortDateFormat := 'dd/mm/yyyy';
             end;
             DateSeparator := '/';
             ShortDateFormat := 'yyyy-mm-dd';
             With ADOQuery3 do begin
                Active := False;
                SQL.Clear;
                SQL.Add('select sum(p_volume) from plaquetas P, entrada EN where EN.e_cnpj = '+QuotedStr(Edit3.Text)+' and P.en_cod = EN.en_cod and EN.en_dt_entrada between '+QuotedStr(DateToStr(DateTimePicker3.Date))+' and '+QuotedStr(DateToStr(DateTimePicker4.Date))+'');
                Active := True;
                ShortDateFormat := 'dd/mm/yyyy';
            end;
            DateSeparator := '/';
            ShortDateFormat := 'yyyy-mm-dd';
            With ADOQuery4 do begin
               Active := False;
               SQL.Clear;
               SQL.Add('select sum(p_custo) from plaquetas P, entrada EN where EN.e_cnpj = '+QuotedStr(Edit3.Text)+' and P.en_cod = EN.en_cod and EN.en_dt_entrada between '+QuotedStr(DateToStr(DateTimePicker3.Date))+' and '+QuotedStr(DateToStr(DateTimePicker4.Date))+'');
               Active := True;
               ShortDateFormat := 'dd/mm/yyyy';
             end;
             DateSeparator := '/';
             ShortDateFormat := 'yyyy-mm-dd';
             With ADOQuery7 do begin
                Active := False;
                SQL.Clear;
                SQL.Add('select sum(p_preco) from plaquetas P, entrada EN where EN.e_cnpj = '+QuotedStr(Edit3.Text)+' and P.en_cod = EN.en_cod and EN.en_dt_entrada between '+QuotedStr(DateToStr(DateTimePicker3.Date))+' and '+QuotedStr(DateToStr(DateTimePicker4.Date))+'');
                Active := True;
                ShortDateFormat := 'dd/mm/yyyy';
             end;
             Try
               Application.CreateForm(TfrmPlanilhaFrete, frmPlanilhaFrete);
               frmPlanilhaFrete.QRLabel10.Caption := DateToStr(DateTimePicker3.Date);
               frmPlanilhaFrete.QRLabel12.Caption := DateToStr(DateTimePicker4.Date);
               frmPlanilhaFrete.qrpPlanilhaFrete.Preview;
             Finally
                  frmPlanilhaFrete.Free;
             end;
          end;
       end;
    end;
end;
end;

procedure TfrmImpressao.EstoqueShow(Sender: TObject);
begin
    cbxEmpresa.Clear;
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select * from empresas order by e_rsocial');
       Active := True;
       while not Eof do begin
          cbxEmpEstoq.Items.Add(FieldByName('e_rsocial').AsString);
          Next;
       end;
    end;
    cbxEmpEstoq.SetFocus;
end;

procedure TfrmImpressao.btnImpriEstoqClick(Sender: TObject);
begin
    DateSeparator := '/';
    ShortDateFormat := 'yyyy-mm-dd';
    If CheckBox2.Checked = False then begin
       With dmVendas.ADOQuery1 do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Select E.e_rsocial, SE.se_descricao, P.p_cod, sum(P.p_volume), sum(P.p_saldo) from empresas E, plaquetas P, entrada EN, sub_especie SE where EN.e_cnpj = '+QuotedStr(Edit2.Text)+' and E.e_cnpj = EN.e_cnpj and EN.en_cod = P.en_cod and P.se_cod = SE.se_cod group by P.se_cod');
          Active := True;
          ShortDateFormat := 'dd/mm/yyyy';
       end;
       With ADOQuery1 do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Select sum(p_volume) from plaquetas, entrada where entrada.e_cnpj = '+QuotedStr(Edit2.Text)+' and entrada.en_cod = plaquetas.en_cod');
          Active := True;
          ShortDateFormat := 'dd/mm/yyyy';
       end;
       With ADOQuery2 do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Select sum(p_saldo) from plaquetas, entrada where entrada.e_cnpj = '+QuotedStr(Edit2.Text)+' and entrada.en_cod = plaquetas.en_cod');
          Active := True;
          ShortDateFormat := 'dd/mm/yyyy';
       end;
       Try
         Application.CreateForm(TfrmImprimeEstoq, frmImprimeEstoq);
//         frmImprimeEstoq.QRLabel4.Caption := cbxMes.Text;
//         frmImprimeEstoq.QRLabel6.Caption := edtAno.Text;
         frmImprimeEstoq.qrpEstoque.Preview;
       Finally
            frmImprimeEstoq.Free;
       end;
    end
    else begin
       If CheckBox2.Checked = True then begin
          With dmVendas.ADOQuery1 do begin
             Active := False;
             SQL.Clear;
             SQL.Add('Select E.e_rsocial, SE.se_descricao, P.p_cod, sum(S.sd_util_m3) from empresas E, plaquetas P, saida S, sub_especie SE, entrada EN where EN.e_cnpj = '+QuotedStr(Edit2.Text)+' and E.e_cnpj = EN.e_cnpj and EN.en_cod = P.en_cod and P.se_cod = SE.se_cod and P.p_cod = S.p_cod group by P.se_cod');
             Active := True;
             ShortDateFormat := 'dd/mm/yyyy';
          end;
          With ADOQuery1 do begin
             Active := False;
             SQL.Clear;
             SQL.Add('Select sum(sd_util_m3) from plaquetas, entrada, saida where entrada.e_cnpj = '+QuotedStr(Edit2.Text)+' and entrada.en_cod = plaquetas.en_cod and plaquetas.p_cod = saida.p_cod');
             Active := True;
             ShortDateFormat := 'dd/mm/yyyy';
          end;
          Try
            Application.CreateForm(TfrmImprEstqUtil, frmImprEstqUtil);
            frmImprEstqUtil.QRLabel4.Caption := cbxMes.Text;
            frmImprEstqUtil.QRLabel6.Caption := edtAno.Text;
            frmImprEstqUtil.qrpEstoqueUtil.Preview;
          Finally
               frmImprEstqUtil.Free;
          end;
       end;
    end;
end;

procedure TfrmImpressao.cbxEmpEstoqChange(Sender: TObject);
begin
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select e_cnpj from empresas where e_rsocial = '+QuotedStr(cbxEmpEstoq.Text)+'');
       Active := True;
       Edit2.Text := FieldByName('e_cnpj').AsString;
    end;
end;

procedure TfrmImpressao.ResumoShow(Sender: TObject);
begin
    DateTimePicker3.Date := Date -15;
    DateTimePicker4.Date := Date + 15;
    cbxEmpresaResumo.Clear;
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select * from empresas order by e_rsocial');
       Active := True;
       while not Eof do begin
          cbxEmpresaResumo.Items.Add(FieldByName('e_rsocial').AsString);
          Next;
       end;
    end;
end;

procedure TfrmImpressao.cbxEmpresaResumoChange(Sender: TObject);
begin
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select e_cnpj from empresas where e_rsocial = '+QuotedStr(cbxEmpresaResumo.Text)+'');
       Active := True;
       Edit3.Text := FieldByName('e_cnpj').AsString;
    end;
end;

procedure TfrmImpressao.SaidaShow(Sender: TObject);
begin
    DateTimePicker5.Date := Date -15;
    DateTimePicker6.Date := Date + 15;
    cbxEmpresaSaida.Clear;
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select * from empresas order by e_rsocial');
       Active := True;
       while not Eof do begin
          cbxEmpresaSaida.Items.Add(FieldByName('e_rsocial').AsString);
          Next;
       end;
    end;
end;

procedure TfrmImpressao.cbxEmpresaSaidaChange(Sender: TObject);
begin
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select e_cnpj from empresas where e_rsocial = '+QuotedStr(cbxEmpresaSaida.Text)+'');
       Active := True;
       Edit4.Text := FieldByName('e_cnpj').AsString;
    end;
end;

procedure TfrmImpressao.BitBtn1Click(Sender: TObject);
begin
    DateSeparator := '/';
    ShortDateFormat := 'yyyy-mm-dd';
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select * from entrada EN, empresas E, plaquetas P, sub_especie SE, materia_prima MP, saida S where E.e_cnpj = '+QuotedStr(Edit4.Text)+' and EN.e_cnpj = E.e_cnpj and P.en_cod = EN.en_cod and P.se_cod = SE.se_cod and P.mp_cod = MP.mp_cod and P.p_cod = S.p_cod and S.sd_dt_saida between '+QuotedStr(DateToStr(DateTimePicker5.Date))+' and '+QuotedStr(DateToStr(DateTimePicker6.Date))+'');
       Active := True;
       ShortDateFormat := 'dd/mm/yyyy';
    end;
    DateSeparator := '/';
    ShortDateFormat := 'yyyy-mm-dd';
    With ADOQuery4 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('select sum(sd_util_m3) from plaquetas P, entrada EN, saida S where EN.e_cnpj = '+QuotedStr(Edit4.Text)+' and P.en_cod = EN.en_cod and P.p_cod = S.p_cod and S.sd_dt_saida between '+QuotedStr(DateToStr(DateTimePicker5.Date))+' and '+QuotedStr(DateToStr(DateTimePicker6.Date))+'');
       Active := True;
       ShortDateFormat := 'dd/mm/yyyy';
    end;
    DateSeparator := '/';
    ShortDateFormat := 'yyyy-mm-dd';
    With ADOQuery3 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('select sum(sd_disp_ml) from plaquetas P, entrada EN, saida S where EN.e_cnpj = '+QuotedStr(Edit4.Text)+' and P.en_cod = EN.en_cod and P.p_cod = S.p_cod and S.sd_dt_saida between '+QuotedStr(DateToStr(DateTimePicker5.Date))+' and '+QuotedStr(DateToStr(DateTimePicker6.Date))+'');
       Active := True;
       ShortDateFormat := 'dd/mm/yyyy';
    end;
    Try
      Application.CreateForm(TfrmImprimeSaida, frmImprimeSaida);
      frmImprimeSaida.QRLabel10.Caption := DateToStr(DateTimePicker5.Date);
      frmImprimeSaida.QRLabel12.Caption := DateToStr(DateTimePicker6.Date);
      frmImprimeSaida.qrpSaida.Preview;
      Finally
           frmImprimeSaida.Free;
      end;
end;

end.
