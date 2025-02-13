unit Impressao_frm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, DB, ADODB, Jpeg, ExtCtrls;

type
  TfrmImpressao = class(TForm)
    GroupBox1: TGroupBox;
    rdbSaida: TRadioButton;
    rdbEstq: TRadioButton;
    rdbEntrada: TRadioButton;
    btnOk: TBitBtn;
    ADOQuery2: TADOQuery;
    ADOQuery1: TADOQuery;
    chbResumo: TCheckBox;
    chbTodos: TCheckBox;
    chbTodosSaida: TCheckBox;
    chbResSaida: TCheckBox;
    DataSource1: TDataSource;
    btnFechar: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    ADOQuery4: TADOQuery;
    ADOQuery5: TADOQuery;
    RadioGroup1: TRadioGroup;
    Label5: TLabel;
    cbxForn: TComboBox;
    Label6: TLabel;
    cbxProd: TComboBox;
    Label7: TLabel;
    cbxCliente: TComboBox;
    procedure btnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Foto;
    procedure FotoEntrada;
    procedure chbResumoClick(Sender: TObject);
    procedure chbTodosSaidaClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure chbTodosClick(Sender: TObject);
    procedure rdbEstqClick(Sender: TObject);
    procedure rdbEntradaClick(Sender: TObject);
    procedure rdbSaidaClick(Sender: TObject);
    procedure chbResSaidaClick(Sender: TObject);
    procedure FotoResEntrada;
    procedure FotoSaida;
    procedure FotoResSaida;
    procedure FotoAvista;
    procedure FotoAprazo;
    procedure RadioGroup1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmImpressao: TfrmImpressao;

implementation

uses ImprimeEstoque_frm, Carro_Comando_dm, ImprimeEntrada_frm, DateUtils,
  ImprimeResEntrada_frm, ImprimeSaida_frm, ImprimResSaida_frm,
  ImprimeAprazo_frm, ImprimeAvista_frm;

{$R *.dfm}

procedure TfrmImpressao.btnOkClick(Sender: TObject);
begin
    If rdbEstq.Checked = True then begin
       With ADOQuery1 do begin
          Active := False;
          SQL.Clear;
          SQL.Add('select * from registro');
          Active := True;
       end;
       With ADOQuery2 do begin
          Active := False;
          SQL.Clear;
          SQL.Add('select *, p_vl_tot/p_qtd from produtos order by p_n_prod');
          Active := True;
       end;
       Try
         Application.CreateForm(TfrmImprimeEstoq, frmImprimeEstoq);
         Foto;
         frmImprimeEstoq.qrpEstoque.Preview;
       Finally
            frmImprimeEstoq.Free;
       end;
    end;
    With ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('select * from registro');
       Active := True;
    end;
    DateSeparator := '/';
    ShortDateFormat := 'yyyy-mm-dd';
    If rdbEntrada.Checked = True then begin
       If chbTodos.Checked = True then begin
          If cbxForn.Text = '' then begin
             With ADOQuery2 do begin
                Active := False;
                SQL.Clear;
                SQL.Add('select EC.ec_cod, EC.ec_dt_entrada, EC.f_cnpj, F.f_nome, EC.ec_n_nf, EC.ec_vl_entrada, IE.ie_qtd from Entrada EC, Fornecedores F, itens_entrada IE where EC.f_cnpj = F.f_cnpj and EC.ec_cod = IE.ec_cod and EC.ec_dt_entrada between '+QuotedStr(DateToStr(DateTimePicker1.Date))+' and '+QuotedStr(DateToStr(DateTimePicker2.Date))+' order by F.f_nome');
                Active := True;
             end;
          end
          else begin
             With ADOQuery2 do begin
                Active := False;
                SQL.Clear;
                SQL.Add('select EC.ec_cod, EC.ec_dt_entrada, EC.f_cnpj, F.f_nome, EC.ec_n_nf, EC.ec_vl_entrada, IE.ie_qtd from Entrada EC, Fornecedores F, itens_entrada IE where EC.f_cnpj = F.f_cnpj and EC.ec_cod = IE.ec_cod and f_nome = '+QuotedStr(cbxForn.Text)+' and EC.ec_dt_entrada between '+QuotedStr(DateToStr(DateTimePicker1.Date))+' and '+QuotedStr(DateToStr(DateTimePicker2.Date))+' order by F.f_nome');
                Active := True;
             end;
          end;
          ShortDateFormat := 'dd/mm/yyyy';
          Try
            Application.CreateForm(TfrmImprimeEntrada, frmImprimeEntrada);
            FotoEntrada;
            frmImprimeEntrada.QRLabel10.Caption := DateToStr(DateTimePicker1.Date);
            frmImprimeEntrada.QRLabel12.Caption := DateToStr(DateTimePicker2.Date);
            frmImprimeEntrada.qrpEntrada.Preview;
          Finally
               frmImprimeEntrada.Free;
          end;
       end;
    end;
    DateSeparator := '/';
    ShortDateFormat := 'yyyy-mm-dd';
    If rdbEntrada.Checked = True then begin
       If chbResumo.Checked = True then begin
          If cbxForn.Text = '' then begin
             With ADOQuery1 do begin
                Active := False;
                SQL.Clear;
                SQL.Add('select * from registro');
                Active := True;
             end;
             With ADOQuery2 do begin
                Active := False;
                SQL.Clear;
                SQL.Add('Select P.p_n_prod, P.p_uni_med, sum(IE.ie_qtd), IE.ie_vl_uni, sum(IE.ie_vl_tot) ''tot'', EC.ec_dt_entrada from produtos P, itens_entrada IE, entrada EC where P.p_cod = IE.p_cod and IE.ec_cod = EC.ec_cod and EC.ec_dt_entrada between '+QuotedStr(DateToStr(DateTimePicker1.Date))+' and '+QuotedStr(DateToStr(DateTimePicker2.Date))+' group by P.p_n_prod');
                Active := True;
             end;
          end
          else begin
             If cbxProd.Text = '' then begin
                With ADOQuery1 do begin
                   Active := False;
                   SQL.Clear;
                   SQL.Add('select * from registro');
                   Active := True;
                end;
                With ADOQuery2 do begin
                   Active := False;
                   SQL.Clear;
                   SQL.Add('Select F.f_nome, P.p_n_prod, P.p_uni_med, sum(IE.ie_qtd), IE.ie_vl_uni, sum(IE.ie_vl_tot) ''tot'', EC.ec_dt_entrada from Fornecedores F, produtos P, itens_entrada IE, entrada EC where F.f_nome = '+QuotedStr(cbxForn.Text)+' and P.p_cod = IE.p_cod and IE.ec_cod = EC.ec_cod and EC.f_cnpj = F.f_cnpj and EC.ec_dt_entrada between '+QuotedStr(DateToStr(DateTimePicker1.Date))+' and '+QuotedStr(DateToStr(DateTimePicker2.Date))+' group by P.p_n_prod');
                   Active := True;
                end;
             end
             else begin
                With ADOQuery1 do begin
                   Active := False;
                   SQL.Clear;
                   SQL.Add('select * from registro');
                   Active := True;
                end;
                With ADOQuery2 do begin
                   Active := False;
                   SQL.Clear;
                   SQL.Add('Select F.f_nome, P.p_n_prod, P.p_uni_med, sum(IE.ie_qtd), IE.ie_vl_uni, sum(IE.ie_vl_tot) ''tot'', EC.ec_dt_entrada from Fornecedores F, produtos P, itens_entrada IE, entrada EC where F.f_nome = '+QuotedStr(cbxForn.Text)+' and P.p_n_prod = '+QuotedStr(cbxProd.Text)+' and P.p_cod = IE.p_cod and IE.ec_cod = EC.ec_cod and EC.f_cnpj = F.f_cnpj and EC.ec_dt_entrada between '+QuotedStr(DateToStr(DateTimePicker1.Date))+' and '+QuotedStr(DateToStr(DateTimePicker2.Date))+' group by P.p_n_prod');
                   Active := True;
                end;
             end;
          end;
          ShortDateFormat := 'dd/mm/yyyy';
          Try
            Application.CreateForm(TfrmImprResEntrada, frmImprResEntrada);
            FotoResEntrada;
            If cbxForn.Text = '' then begin
               frmImprResEntrada.QRLabel13.Enabled := False;
            end
            else begin
               frmImprResEntrada.QRLabel13.Enabled := True;
            end;
            frmImprResEntrada.QRLabel10.Caption := DateToStr(DateTimePicker1.Date);
            frmImprResEntrada.QRLabel12.Caption := DateToStr(DateTimePicker2.Date);
            frmImprResEntrada.qrpResEntrada.Preview;
          Finally
               frmImprResEntrada.Free;
          end;
       end;
    end;
    DateSeparator := '/';
    ShortDateFormat := 'yyyy-mm-dd';
    If rdbSaida.Checked = True then begin
       If chbTodosSaida.Checked = True then begin
          If cbxCliente.Text = '' then begin
             With ADOQuery2 do begin
                Active := False;
                SQL.Clear;
                SQL.Add('select SV.sv_cod, SV.sv_dt_emiss, C.c_nome, SV.sv_tot_saida, sv_situacao from Saida SV, Clientes C where SV.c_cpfj = C.c_cpfj and SV.sv_dt_emiss between '+QuotedStr(DateToStr(DateTimePicker1.Date))+' and '+QuotedStr(DateToStr(DateTimePicker2.Date))+' order by C.c_nome');
                Active := True;
             end;
             With ADOQuery4 do begin
                Active := False;
                SQL.Clear;
                SQL.Add('Select sum(SV.sv_tot_saida) from saida SV where sv_dt_emiss between '+QuotedStr(DateToStr(DateTimePicker1.Date))+' and '+QuotedStr(DateToStr(DateTimePicker2.Date))+' and sv_situacao = ''CONSUMO''');
                Active := True;
             end;
             With ADOQuery5 do begin
                Active := False;
                SQL.Clear;
                SQL.Add('Select sum(SV.sv_tot_saida) from saida SV where sv_dt_emiss between '+QuotedStr(DateToStr(DateTimePicker1.Date))+' and '+QuotedStr(DateToStr(DateTimePicker2.Date))+' and sv_situacao = ''SERVI�O''');
                Active := True;
             end;
          end
          else begin
             With ADOQuery2 do begin
                Active := False;
                SQL.Clear;
                SQL.Add('select SV.sv_cod, SV.sv_dt_emiss, C.c_nome, SV.sv_tot_saida, sv_situacao from Saida SV, Clientes C where C.c_nome = '+QuotedStr(cbxCliente.Text)+' and SV.c_cpfj = C.c_cpfj and SV.sv_dt_emiss between '+QuotedStr(DateToStr(DateTimePicker1.Date))+' and '+QuotedStr(DateToStr(DateTimePicker2.Date))+' order by C.c_nome');
                Active := True;
             end;
             With ADOQuery4 do begin
                Active := False;
                SQL.Clear;
                SQL.Add('Select sum(SV.sv_tot_saida) from saida SV, Clientes C where C.c_nome = '+QuotedStr(cbxCliente.Text)+' and C.c_cpfj = SV.c_cpfj and sv_dt_emiss between '+QuotedStr(DateToStr(DateTimePicker1.Date))+' and '+QuotedStr(DateToStr(DateTimePicker2.Date))+' and sv_situacao = ''CONSUMO''');
                Active := True;
             end;
             With ADOQuery5 do begin
                Active := False;
                SQL.Clear;
                SQL.Add('Select sum(SV.sv_tot_saida) from saida SV, Clientes C where C.c_nome = '+QuotedStr(cbxCliente.Text)+' and C.c_cpfj = SV.c_cpfj and sv_dt_emiss between '+QuotedStr(DateToStr(DateTimePicker1.Date))+' and '+QuotedStr(DateToStr(DateTimePicker2.Date))+' and sv_situacao = ''SERVI�O''');
                Active := True;
             end;
          end;
          ShortDateFormat := 'dd/mm/yyyy';
          Try
            Application.CreateForm(TfrmImprimSaida, frmImprimSaida);
            FotoSaida;
            frmImprimSaida.QRLabel10.Caption := DateToStr(DateTimePicker1.Date);
            frmImprimSaida.QRLabel12.Caption := DateToStr(DateTimePicker2.Date);
            frmImprimSaida.qrpSaida.Preview;
          Finally
               frmImprimSaida.Free;
          end;
       end;
    end;
    DateSeparator := '/';
    ShortDateFormat := 'yyyy-mm-dd';
    If rdbSaida.Checked = True then begin
       If chbResSaida.Checked = True then begin
          If cbxCliente.Text = '' then begin
             With ADOQuery1 do begin
                Active := False;
                SQL.Clear;
                SQL.Add('select * from registro');
                Active := True;
             end;
             With ADOQuery2 do begin
                Active := False;
                SQL.Clear;
                SQL.Add('Select P.p_n_prod, P.p_uni_med, sum(S.is_qtd), S.is_vl_uni, sum(S.is_vl_tot) ''tot'', SV.sv_situacao, SV.sv_dt_emiss from produtos P, itens_saida S, saida SV where P.p_cod = S.p_cod and S.sv_cod = SV.sv_cod and SV.sv_dt_emiss between '+QuotedStr(DateToStr(DateTimePicker1.Date))+' and '+QuotedStr(DateToStr(DateTimePicker2.Date))+' group by P.p_n_prod, SV.sv_situacao');
                Active := True;
             end;
             With ADOQuery4 do begin
                Active := False;
                SQL.Clear;
                SQL.Add('Select sum(is_vl_tot) from itens_saida, saida where itens_saida.sv_cod = saida.sv_cod and sv_dt_emiss between '+QuotedStr(DateToStr(DateTimePicker1.Date))+' and '+QuotedStr(DateToStr(DateTimePicker2.Date))+' and sv_situacao = ''CONSUMO''');
                Active := True;
             end;
             With ADOQuery5 do begin
                Active := False;
                SQL.Clear;
                SQL.Add('Select sum(is_vl_tot) from itens_saida, saida where itens_saida.sv_cod = saida.sv_cod and sv_dt_emiss between '+QuotedStr(DateToStr(DateTimePicker1.Date))+' and '+QuotedStr(DateToStr(DateTimePicker2.Date))+' and sv_situacao = ''SERVI�O''');
                Active := True;
             end;
          end
          else begin
             If cbxProd.Text = '' then begin
                With ADOQuery1 do begin
                   Active := False;
                   SQL.Clear;
                   SQL.Add('select * from registro');
                   Active := True;
                end;
                With ADOQuery2 do begin
                   Active := False;
                   SQL.Clear;
                   SQL.Add('Select C.c_nome, P.p_n_prod, P.p_uni_med, sum(S.is_qtd), S.is_vl_uni, sum(S.is_vl_tot) ''tot'', SV.sv_situacao, SV.sv_dt_emiss from Clientes C, produtos P, itens_saida S, saida SV where C.c_nome = '+QuotedStr(cbxCliente.Text)+' and P.p_cod = S.p_cod and S.sv_cod = SV.sv_cod and C.c_cpfj = SV.c_cpfj and SV.sv_dt_emiss between '+QuotedStr(DateToStr(DateTimePicker1.Date))+' and '+QuotedStr(DateToStr(DateTimePicker2.Date))+' group by P.p_n_prod, SV.sv_situacao');
                   Active := True;
                end;
                With ADOQuery4 do begin
                   Active := False;
                   SQL.Clear;
                   SQL.Add('Select sum(is_vl_tot) from itens_saida, saida, clientes where clientes.c_nome = '+QuotedStr(cbxCliente.Text)+' and saida.c_cpfj = clientes.c_cpfj and itens_saida.sv_cod = saida.sv_cod and sv_dt_emiss between '+QuotedStr(DateToStr(DateTimePicker1.Date))+' and '+QuotedStr(DateToStr(DateTimePicker2.Date))+' and sv_situacao = ''CONSUMO''');
                   Active := True;
                end;
                With ADOQuery5 do begin
                   Active := False;
                   SQL.Clear;
                   SQL.Add('Select sum(is_vl_tot) from itens_saida, saida, clientes where clientes.c_nome = '+QuotedStr(cbxCliente.Text)+' and saida.c_cpfj = clientes.c_cpfj and itens_saida.sv_cod = saida.sv_cod and sv_dt_emiss between '+QuotedStr(DateToStr(DateTimePicker1.Date))+' and '+QuotedStr(DateToStr(DateTimePicker2.Date))+' and sv_situacao = ''SERVI�O''');
                   Active := True;
                end;
             end
             else begin
                With ADOQuery1 do begin
                   Active := False;
                   SQL.Clear;
                   SQL.Add('select * from registro');
                   Active := True;
                end;
                With ADOQuery2 do begin
                   Active := False;
                   SQL.Clear;
                   SQL.Add('Select C.c_nome, P.p_n_prod, P.p_uni_med, sum(S.is_qtd), S.is_vl_uni, sum(S.is_vl_tot) ''tot'', SV.sv_situacao, SV.sv_dt_emiss from Clientes C, produtos P, itens_saida S, saida SV where C.c_nome = '+QuotedStr(cbxCliente.Text)+' and P.p_n_prod = '+QuotedStr(cbxProd.Text)+' and P.p_cod = S.p_cod and S.sv_cod = SV.sv_cod and C.c_cpfj = SV.c_cpfj and SV.sv_dt_emiss between '+QuotedStr(DateToStr(DateTimePicker1.Date))+' and '+QuotedStr(DateToStr(DateTimePicker2.Date))+' group by P.p_n_prod, SV.sv_situacao');
                   Active := True;
                end;
                With ADOQuery4 do begin
                   Active := False;
                   SQL.Clear;
                   SQL.Add('Select sum(is_vl_tot) from itens_saida, saida, clientes, Produtos where clientes.c_nome = '+QuotedStr(cbxCliente.Text)+' and produtos.p_n_prod = '+QuotedStr(cbxProd.Text)+' and produtos.p_cod = itens_saida.p_cod and saida.c_cpfj = clientes.c_cpfj and itens_saida.sv_cod = saida.sv_cod and sv_dt_emiss between '+QuotedStr(DateToStr(DateTimePicker1.Date))+' and '+QuotedStr(DateToStr(DateTimePicker2.Date))+' and sv_situacao = ''CONSUMO''');
                   Active := True;
                end;
                With ADOQuery5 do begin
                   Active := False;
                   SQL.Clear;
                   SQL.Add('Select sum(is_vl_tot) from itens_saida, saida, clientes, produtos where clientes.c_nome = '+QuotedStr(cbxCliente.Text)+' and produtos.p_n_prod = '+QuotedStr(cbxProd.Text)+' and produtos.p_cod = itens_saida.p_cod and saida.c_cpfj = clientes.c_cpfj and itens_saida.sv_cod = saida.sv_cod and sv_dt_emiss between '+QuotedStr(DateToStr(DateTimePicker1.Date))+' and '+QuotedStr(DateToStr(DateTimePicker2.Date))+' and sv_situacao = ''SERVI�O''');
                   Active := True;
                end;
             end;
          end;
          If cbxProd.Text <> '' then begin
             With ADOQuery1 do begin
                Active := False;
                SQL.Clear;
                SQL.Add('select * from registro');
                Active := True;
             end;
             With ADOQuery2 do begin
                Active := False;
                SQL.Clear;
                SQL.Add('Select P.p_n_prod, P.p_uni_med, sum(S.is_qtd), S.is_vl_uni, sum(S.is_vl_tot) ''tot'', SV.sv_situacao, SV.sv_dt_emiss from produtos P, itens_saida S, saida SV where P.p_n_prod = '+QuotedStr(cbxProd.Text)+' and P.p_cod = S.p_cod and S.sv_cod = SV.sv_cod and SV.sv_dt_emiss between '+QuotedStr(DateToStr(DateTimePicker1.Date))+' and '+QuotedStr(DateToStr(DateTimePicker2.Date))+' group by P.p_n_prod, SV.sv_situacao');
                Active := True;
             end;
             With ADOQuery4 do begin
                Active := False;
                SQL.Clear;
                SQL.Add('Select sum(is_vl_tot) from itens_saida, saida, Produtos, clientes where produtos.p_n_prod = '+QuotedStr(cbxProd.Text)+' and clientes.c_cpfj = saida.c_cpfj and produtos.p_cod = itens_saida.p_cod and itens_saida.sv_cod = saida.sv_cod and sv_dt_emiss between '+QuotedStr(DateToStr(DateTimePicker1.Date))+' and '+QuotedStr(DateToStr(DateTimePicker2.Date))+' and sv_situacao = ''CONSUMO''');
                Active := True;
             end;
             With ADOQuery5 do begin
                Active := False;
                SQL.Clear;
                SQL.Add('Select sum(is_vl_tot) from itens_saida, saida, produtos, clientes where produtos.p_n_prod = '+QuotedStr(cbxProd.Text)+' and clientes.c_cpfj = saida.c_cpfj and produtos.p_cod = itens_saida.p_cod and itens_saida.sv_cod = saida.sv_cod and sv_dt_emiss between '+QuotedStr(DateToStr(DateTimePicker1.Date))+' and '+QuotedStr(DateToStr(DateTimePicker2.Date))+' and sv_situacao = ''SERVI�O''');
                Active := True;
             end;
          end;
          ShortDateFormat := 'dd/mm/yyyy';
          Try
            Application.CreateForm(TfrmImprimResSaida, frmImprimResSaida);
            FotoResSaida;
            If cbxCliente.Text = '' then begin
               frmImprimResSaida.QRLabel16.Enabled := False;
            end
            else begin
               frmImprimResSaida.QRLabel16.Enabled := True;
            end;
            frmImprimResSaida.QRLabel10.Caption := DateToStr(DateTimePicker1.Date);
            frmImprimResSaida.QRLabel12.Caption := DateToStr(DateTimePicker2.Date);
            frmImprimResSaida.qrpResSaida.Preview;
          Finally
               frmImprimResSaida.Free;
          end;
       end;
    end;
    DateSeparator := '/';
    ShortDateFormat := 'yyyy-mm-dd';
    If rdbSaida.Checked = True then begin
       If RadioGroup1.ItemIndex = 0 then begin
          If cbxCliente.Text = '' then begin
             With ADOQuery2 do begin
                Active := False;
                SQL.Clear;
                SQL.Add('select SV.sv_cod, SV.sv_dt_emiss, SV.sv_situacao, C.c_nome, SV.sv_tot_saida from Saida SV, Clientes C where SV.c_cpfj = C.c_cpfj and SV.sv_dt_emiss between '+QuotedStr(DateToStr(DateTimePicker1.Date))+' and '+QuotedStr(DateToStr(DateTimePicker2.Date))+' and SV.sv_situacao = ''CONSUMO'' order by C.c_nome');
                Active := True;
             end;
          end
          else begin
             With ADOQuery2 do begin
                Active := False;
                SQL.Clear;
                SQL.Add('select SV.sv_cod, SV.sv_dt_emiss, SV.sv_situacao, C.c_nome, SV.sv_tot_saida from Saida SV, Clientes C where C.c_nome = '+QuotedStr(cbxCliente.Text)+' and SV.c_cpfj = C.c_cpfj and SV.sv_dt_emiss between '+QuotedStr(DateToStr(DateTimePicker1.Date))+' and '+QuotedStr(DateToStr(DateTimePicker2.Date))+' and SV.sv_situacao = ''CONSUMO'' order by C.c_nome');
                Active := True;
             end;
          end;
          ShortDateFormat := 'dd/mm/yyyy';
          Try
            Application.CreateForm(TfrmImprimAvista, frmImprimAvista);
            FotoAvista;
            frmImprimAvista.QRLabel10.Caption := DateToStr(DateTimePicker1.Date);
            frmImprimAvista.QRLabel12.Caption := DateToStr(DateTimePicker2.Date);
            frmImprimAvista.qrpAvista.Preview;
          Finally
               frmImprimAvista.Free;
          end;
       end;
    end;
    DateSeparator := '/';
    ShortDateFormat := 'yyyy-mm-dd';
    If rdbSaida.Checked = True then begin
       If RadioGroup1.ItemIndex = 1 then begin
          If cbxCliente.Text = '' then begin
             With ADOQuery2 do begin
                Active := False;
                SQL.Clear;
                SQL.Add('select SV.sv_cod, SV.sv_dt_emiss, SV.sv_situacao, C.c_nome, SV.sv_tot_saida from Saida SV, Clientes C where SV.c_cpfj = C.c_cpfj and SV.sv_dt_emiss between '+QuotedStr(DateToStr(DateTimePicker1.Date))+' and '+QuotedStr(DateToStr(DateTimePicker2.Date))+' and SV.sv_situacao = ''SERVI�O'' order by C.c_nome');
                Active := True;
             end;
          end
          else begin
             With ADOQuery2 do begin
                Active := False;
                SQL.Clear;
                SQL.Add('select SV.sv_cod, SV.sv_dt_emiss, SV.sv_situacao, C.c_nome, SV.sv_tot_saida from Saida SV, Clientes C where C.c_nome = '+QuotedStr(cbxCliente.Text)+' and SV.c_cpfj = C.c_cpfj and SV.sv_dt_emiss between '+QuotedStr(DateToStr(DateTimePicker1.Date))+' and '+QuotedStr(DateToStr(DateTimePicker2.Date))+' and SV.sv_situacao = ''SERVI�O'' order by C.c_nome');
                Active := True;
             end;
          end;
          ShortDateFormat := 'dd/mm/yyyy';
          Try
            Application.CreateForm(TfrmImprimAprazo, frmImprimAprazo);
            FotoAprazo;
            frmImprimAprazo.QRLabel10.Caption := DateToStr(DateTimePicker1.Date);
            frmImprimAprazo.QRLabel12.Caption := DateToStr(DateTimePicker2.Date);
            frmImprimAprazo.qrpAprazo.Preview;
          Finally
               frmImprimSaida.Free;
          end;
       end;
    end;
end;


procedure TfrmImpressao.FormShow(Sender: TObject);
begin
    DateTimePicker1.Date := Date -15;
    DateTimePicker2.Date := Date + 15;
    DateTimePicker1.SetFocus;
end;

procedure TfrmImpressao.Foto;
var fFoto : TStream;
    Jpeg : TJPEGImage;
begin
    Jpeg := nil;
    If frmImpressao.rdbEstq.Checked = True then begin
       With dmVendas.ADOQuery1 do begin
          Active := False;
          SQL.Clear;
          SQL.Add('select * from registro');
          Active := True;
          fFoto := CreateBlobStream(FieldByName('foto'),bmRead);
          If fFoto.Size > 0 then begin
             Jpeg := TJPEGImage.Create;
             Jpeg.LoadFromStream(fFoto);
             frmImprimeEstoq.QRImage1.Picture.Assign(Jpeg);
          end
          else begin
             frmImprimeEstoq.QRImage1.Picture.Assign(nil);
          end;
          Jpeg.Free;
          fFoto.Destroy;
       end;
    end;
end;

procedure TfrmImpressao.FotoEntrada;
var fFoto : TStream;
    Jpeg : TJPEGImage;
begin
    Jpeg := nil;
    If frmImpressao.rdbEntrada.Checked = True then begin
       With dmVendas.ADOQuery1 do begin
          Active := False;
          SQL.Clear;
          SQL.Add('select * from registro');
          Active := True;
          fFoto := CreateBlobStream(FieldByName('foto'),bmRead);
          If fFoto.Size > 0 then begin
             Jpeg := TJPEGImage.Create;
             Jpeg.LoadFromStream(fFoto);
             frmImprimeEntrada.QRImage1.Picture.Assign(Jpeg);
          end
          else begin
             frmImprimeEntrada.QRImage1.Picture.Assign(nil);
          end;
          Jpeg.Free;
          fFoto.Destroy;
       end;
    end;
end;

procedure TfrmImpressao.FotoResEntrada;
var fFoto : TStream;
    Jpeg : TJPEGImage;
begin
    Jpeg := nil;
    If frmImpressao.rdbEntrada.Checked = True then begin
       With dmVendas.ADOQuery1 do begin
          Active := False;
          SQL.Clear;
          SQL.Add('select * from registro');
          Active := True;
          fFoto := CreateBlobStream(FieldByName('foto'),bmRead);
          If fFoto.Size > 0 then begin
             Jpeg := TJPEGImage.Create;
             Jpeg.LoadFromStream(fFoto);
             frmImprResEntrada.QRImage1.Picture.Assign(Jpeg);
          end
          else begin
             frmImprResEntrada.QRImage1.Picture.Assign(nil);
          end;
          Jpeg.Free;
          fFoto.Destroy;
       end;
    end;
end;

procedure TfrmImpressao.FotoSaida;
var fFoto : TStream;
    Jpeg : TJPEGImage;
begin
    Jpeg := nil;
    If frmImpressao.rdbSaida.Checked = True then begin
       With dmVendas.ADOQuery1 do begin
          Active := False;
          SQL.Clear;
          SQL.Add('select * from registro');
          Active := True;
          fFoto := CreateBlobStream(FieldByName('foto'),bmRead);
          If fFoto.Size > 0 then begin
             Jpeg := TJPEGImage.Create;
             Jpeg.LoadFromStream(fFoto);
             frmImprimSaida.QRImage1.Picture.Assign(Jpeg);
          end
          else begin
             frmImprimSaida.QRImage1.Picture.Assign(nil);
          end;
          Jpeg.Free;
          fFoto.Destroy;
       end;
    end;
end;

procedure TfrmImpressao.FotoResSaida;
var fFoto : TStream;
    Jpeg : TJPEGImage;
begin
    Jpeg := nil;
    If frmImpressao.rdbSaida.Checked = True then begin
       With dmVendas.ADOQuery1 do begin
          Active := False;
          SQL.Clear;
          SQL.Add('select * from registro');
          Active := True;
          fFoto := CreateBlobStream(FieldByName('foto'),bmRead);
          If fFoto.Size > 0 then begin
             Jpeg := TJPEGImage.Create;
             Jpeg.LoadFromStream(fFoto);
             frmImprimResSaida.QRImage1.Picture.Assign(Jpeg);
          end
          else begin
          frmImprimResSaida.QRImage1.Picture.Assign(nil);
       end;
       Jpeg.Free;
       fFoto.Destroy;
       end;
    end;
end;

procedure TfrmImpressao.FotoAvista;
var fFoto : TStream;
    Jpeg : TJPEGImage;
begin
    Jpeg := nil;
    If frmImpressao.rdbSaida.Checked = True then begin
       With dmVendas.ADOQuery1 do begin
          Active := False;
          SQL.Clear;
          SQL.Add('select * from registro');
          Active := True;
          fFoto := CreateBlobStream(FieldByName('foto'),bmRead);
          If fFoto.Size > 0 then begin
             Jpeg := TJPEGImage.Create;
             Jpeg.LoadFromStream(fFoto);
             frmImprimAvista.QRImage1.Picture.Assign(Jpeg);
          end
          else begin
          frmImprimAvista.QRImage1.Picture.Assign(nil);
       end;
       Jpeg.Free;
       fFoto.Destroy;
       end;
    end;
end;

procedure TfrmImpressao.FotoAprazo;
var fFoto : TStream;
    Jpeg : TJPEGImage;
begin
    Jpeg := nil;
    If frmImpressao.rdbSaida.Checked = True then begin
       With dmVendas.ADOQuery1 do begin
          Active := False;
          SQL.Clear;
          SQL.Add('select * from registro');
          Active := True;
          fFoto := CreateBlobStream(FieldByName('foto'),bmRead);
          If fFoto.Size > 0 then begin
             Jpeg := TJPEGImage.Create;
             Jpeg.LoadFromStream(fFoto);
             frmImprimAprazo.QRImage1.Picture.Assign(Jpeg);
          end
          else begin
          frmImprimAprazo.QRImage1.Picture.Assign(nil);
       end;
       Jpeg.Free;
       fFoto.Destroy;
       end;
    end;
end;


procedure TfrmImpressao.chbResumoClick(Sender: TObject);
begin
    If chbResumo.Checked = True then
       chbTodos.Checked := False;
end;

procedure TfrmImpressao.chbTodosSaidaClick(Sender: TObject);
begin
    If chbTodosSaida.Checked = True then begin
       chbResSaida.Checked := False;
       RadioGroup1.Visible := True;
       RadioGroup1.ItemIndex := -1;
    end;
end;

procedure TfrmImpressao.btnFecharClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmImpressao.chbTodosClick(Sender: TObject);
begin
    If chbTodos.Checked = True then
       chbResumo.Checked := False;
end;

procedure TfrmImpressao.rdbEstqClick(Sender: TObject);
begin
    chbResumo.Checked := False;
    chbTodos.Checked := False;
    chbTodosSaida.Checked := False;
    chbResSaida.Checked := False;
    RadioGroup1.Visible := False;
end;

procedure TfrmImpressao.rdbEntradaClick(Sender: TObject);
begin
    rdbEstqClick(Sender);
end;

procedure TfrmImpressao.rdbSaidaClick(Sender: TObject);
begin
    rdbEstqClick(Sender);
end;

procedure TfrmImpressao.chbResSaidaClick(Sender: TObject);
begin
    If chbResSaida.Checked = True then begin
       chbTodosSaida.Checked := False;
       RadioGroup1.Visible := False;
    end;
end;

procedure TfrmImpressao.RadioGroup1Click(Sender: TObject);
begin
    chbTodosSaida.Checked := False;
end;

procedure TfrmImpressao.FormCreate(Sender: TObject);
begin
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select f_nome from fornecedores order by f_nome');
       Active := True;
       While not Eof do begin
           cbxForn.Items.Add(FieldByName('f_nome').AsString);
           Next;
       end;
    end;
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select p_n_prod from produtos order by p_n_prod');
       Active := True;
       While not Eof do begin
           cbxProd.Items.Add(FieldByName('p_n_prod').AsString);
           Next;
       end;
    end;
     With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select c_nome from clientes order by c_nome');
       Active := True;
       While not Eof do begin
           cbxCliente.Items.Add(FieldByName('c_nome').AsString);
           Next;
       end;
    end;
end;

end.
