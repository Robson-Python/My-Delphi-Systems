unit ImprimeTerceiro_frm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ADODB, Buttons, ComCtrls;

type
  TfrmImprimeTerceiro = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    dtpDtInicial: TDateTimePicker;
    dtpDtFinal: TDateTimePicker;
    GroupBox3: TGroupBox;
    Label3: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    edtIdEmp: TEdit;
    edtIForn: TEdit;
    edtRomaneio: TEdit;
    cbxEmpresa: TComboBox;
    cbxForn: TComboBox;
    btnImprimir: TBitBtn;
    btnFechar: TBitBtn;
    GroupBox4: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    ADOQuery1: TADOQuery;
    ADOQuery2: TADOQuery;
    CheckBox1: TCheckBox;
    btnImprimir2: TBitBtn;
    procedure cbxEmpresaChange(Sender: TObject);
    procedure cbxFornChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure btnImprimir2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmImprimeTerceiro: TfrmImprimeTerceiro;

implementation

uses ImprimFret_frm, Carro_Comando_dm, ImprimeResFornFret_frm,
  PlanilhaForn_frm, PlanilhaFrete_frm;

{$R *.dfm}

procedure TfrmImprimeTerceiro.cbxEmpresaChange(Sender: TObject);
begin
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select Id from empresa where razaoSocial = '+QuotedStr(cbxEmpresa.Text)+'');
       Active := True;
       edtIdEmp.Text := FieldByName('id').AsString;
    end;
end;

procedure TfrmImprimeTerceiro.cbxFornChange(Sender: TObject);
begin
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select Id from terceiro where nome = '+QuotedStr(cbxForn.Text)+'');
       Active := True;
       edtIForn.Text := FieldByName('id').AsString;
    end;
end;

procedure TfrmImprimeTerceiro.FormCreate(Sender: TObject);
begin
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
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select * from terceiro order by nome');
       Active := True;
       while not Eof do begin
          cbxForn.Items.Add(FieldByName('nome').AsString);
          Next;
       end;
    end;
end;

procedure TfrmImprimeTerceiro.FormShow(Sender: TObject);
begin
    dtpDtInicial.Date := Date - 15;
    dtpDtFinal.Date := Date + 15;
end;

procedure TfrmImprimeTerceiro.btnFecharClick(Sender: TObject);
begin
    Close; 
end;

procedure TfrmImprimeTerceiro.btnImprimirClick(Sender: TObject);
begin
    DateSeparator := '/';
    ShortDateFormat := 'yyyy-mm-dd';
    If RadioButton1.Checked = True then begin
       If edtRomaneio.Text = '0' then begin
          with dmVendas.ADOQuery1 do begin
             Active := False;
             SQL.Clear;
             SQL.Add('select ET.romaneio, ET.dataEntrada, E.descricao, C.descricao ''clas'', sum(((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854) ''volume'', '+
             'P.custo, sum(((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854)* P.custo ''valor'' '+
             'from entrada ET, plaqueta P, classificacao C, Especie E '+
             'where ET.empresa_id = '+QuotedStr(edtIdEmp.Text)+' and ET.fornecedor_id = '+QuotedStr(edtIForn.Text)+' and ET.romaneio = P.romaneio and C.id = P.classificacao_id and E.id = P.especie_id and P.empresa_id = ET.empresa_id and ET.dataEntrada between '+QuotedStr(DateToStr(dtpDtInicial.Date))+' and '+QuotedStr(DateToStr(dtpDtFinal.Date))+' group by et.id, e.descricao order by ET.dataEntrada, ET.romaneio');
             Active := True;
             ShortDateFormat := 'dd/mm/yyyy';
          end;
          DateSeparator := '/';
          ShortDateFormat := 'yyyy-mm-dd';
          With ADOQuery1 do begin
             Active := false;
             SQL.Clear;
             SQL.Add('SELECT P.romaneio ''roman'', count(*) ''total'', sum(((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854) ''vol'', sum(((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854)* P.custo ''pre�o'' '+
             'FROM plaqueta P, entrada E '+
             'where P.empresa_id = '+QuotedStr(edtIdEmp.Text)+' and E.fornecedor_id = '+QuotedStr(edtIForn.Text)+' and E.romaneio = P.romaneio and P.empresa_id = E.empresa_id and P.dataEntrada between '+QuotedStr(DateToStr(dtpDtInicial.Date))+' and '+QuotedStr(DateToStr(dtpDtFinal.Date))+' group by P.romaneio');
             Active := True;
             ShortDateFormat := 'dd/mm/yyyy';
          end;
          DateSeparator := '/';
          ShortDateFormat := 'yyyy-mm-dd';
          With ADOQuery2 do begin
             Active := false;
             SQL.Clear;
             SQL.Add('SELECT count(*) from plaqueta P, entrada E where P.empresa_id = '+QuotedStr(edtIdEmp.Text)+' and E.fornecedor_id = '+QuotedStr(edtIForn.Text)+' and E.romaneio = P.romaneio and P.empresa_id = E.empresa_id and P.dataEntrada between '+QuotedStr(DateToStr(dtpDtInicial.Date))+' and '+QuotedStr(DateToStr(dtpDtFinal.Date))+'');
             Active := True;
             ShortDateFormat := 'dd/mm/yyyy';
          end;
       end;
       If edtRomaneio.Text <> '0' then begin
          with dmVendas.ADOQuery1 do begin
             Active := False;
             SQL.Clear;
             SQL.Add('select ET.romaneio, ET.dataEntrada, E.descricao, C.descricao ''clas'', sum(((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854) ''volume'', '+
             'P.custo, sum(((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854)* P.custo ''valor'' '+
             'from entrada ET, plaqueta P, classificacao C, Especie E '+
             'where ET.empresa_id = '+QuotedStr(edtIdEmp.Text)+' and ET.fornecedor_id = '+QuotedStr(edtIForn.Text)+' and P.romaneio = '+QuotedStr(edtRomaneio.Text)+' and ET.romaneio = P.romaneio and C.id = P.classificacao_id and E.id = P.especie_id and P.empresa_id = ET.empresa_id and ET.dataEntrada between '+QuotedStr(DateToStr(dtpDtInicial.Date))+' and '+QuotedStr(DateToStr(dtpDtFinal.Date))+' group by et.id, e.descricao order by ET.dataEntrada, ET.romaneio');
             Active := True;
             ShortDateFormat := 'dd/mm/yyyy';
          end;
          DateSeparator := '/';
          ShortDateFormat := 'yyyy-mm-dd';
          With ADOQuery1 do begin
             Active := false;
             SQL.Clear;
             SQL.Add('SELECT P.romaneio ''roman'', count(*) ''total'', sum(((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854) ''vol'', sum(((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854)* P.custo ''pre�o'' '+
             'FROM plaqueta P, entrada E '+
             'where P.empresa_id = '+QuotedStr(edtIdEmp.Text)+' and E.fornecedor_id = '+QuotedStr(edtIForn.Text)+' and P.romaneio = '+QuotedStr(edtRomaneio.Text)+' and E.romaneio = P.romaneio and P.empresa_id = E.empresa_id and P.dataEntrada between '+QuotedStr(DateToStr(dtpDtInicial.Date))+' and '+QuotedStr(DateToStr(dtpDtFinal.Date))+' group by P.romaneio');
             Active := True;
             ShortDateFormat := 'dd/mm/yyyy';
          end;
          DateSeparator := '/';
          ShortDateFormat := 'yyyy-mm-dd';
          With ADOQuery2 do begin
             Active := false;
             SQL.Clear;
             SQL.Add('SELECT count(*) from plaqueta P, entrada E where P.empresa_id = '+QuotedStr(edtIdEmp.Text)+' and E.fornecedor_id = '+QuotedStr(edtIForn.Text)+'and P.romaneio = '+QuotedStr(edtRomaneio.Text)+' and E.romaneio = P.romaneio and P.empresa_id = E.empresa_id and P.dataEntrada between '+QuotedStr(DateToStr(dtpDtInicial.Date))+' and '+QuotedStr(DateToStr(dtpDtFinal.Date))+'');
             Active := True;
             ShortDateFormat := 'dd/mm/yyyy';
          end;
       end;
       Try
         Application.CreateForm(TfrmImpResFornFret, frmImpResFornFret);
         frmImpResFornFret.QRLabel12.Caption := DateToStr(dtpDtInicial.Date);
         frmImpResFornFret.QRLabel14.Caption := DateToStr(dtpDtFinal.Date);
         frmImpResFornFret.QRLabel15.Caption := cbxEmpresa.Text;
         frmImpResFornFret.QRLabel16.Caption := cbxForn.Text;
         frmImpResFornFret.QuickRep1.Preview;
       Finally
            frmImpResFornFret.Free;
       end;
    end;
    DateSeparator := '/';
    ShortDateFormat := 'yyyy-mm-dd';
    If RadioButton2.Checked = True then begin
       If edtRomaneio.Text = '0' then begin
          With dmVendas.ADOQuery1 do begin
             Active := False;
             SQL.Clear;
             SQL.Add('select ET.romaneio, ET.dataEntrada, E.descricao, C.descricao ''clas'', sum(((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854) ''volume'', '+
             'P.custo, sum(((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854)* P.custo ''valor'' '+
             'from entrada ET, plaqueta P, classificacao C, Especie E '+
             'where ET.empresa_id = '+QuotedStr(edtIdEmp.Text)+' and ET.freteiro_id = '+QuotedStr(edtIForn.Text)+' and ET.romaneio = P.romaneio and C.id = P.classificacao_id and E.id = P.especie_id and P.empresa_id = ET.empresa_id and ET.dataEntrada between '+QuotedStr(DateToStr(dtpDtInicial.Date))+' and '+QuotedStr(DateToStr(dtpDtFinal.Date))+' group by et.id, e.descricao order by ET.dataEntrada, ET.romaneio');
             Active := True;
             ShortDateFormat := 'dd/mm/yyyy';
          end;
          DateSeparator := '/';
          ShortDateFormat := 'yyyy-mm-dd';
          With ADOQuery1 do begin
             Active := false;
             SQL.Clear;
             SQL.Add('SELECT P.romaneio ''roman'', count(*) ''total'', sum(((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854) ''vol'', sum(((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854)* P.custo ''pre�o'' '+
             'FROM plaqueta P, entrada E '+
             'where P.empresa_id = '+QuotedStr(edtIdEmp.Text)+' and E.freteiro_id = '+QuotedStr(edtIForn.Text)+' and E.romaneio = P.romaneio and P.empresa_id = E.empresa_id and P.dataEntrada between '+QuotedStr(DateToStr(dtpDtInicial.Date))+' and '+QuotedStr(DateToStr(dtpDtFinal.Date))+' group by P.romaneio');
             Active := True;
             ShortDateFormat := 'dd/mm/yyyy';
          end;
          DateSeparator := '/';
          ShortDateFormat := 'yyyy-mm-dd';
          With ADOQuery2 do begin
             Active := false;
             SQL.Clear;
             SQL.Add('SELECT count(*) from plaqueta P, entrada E where P.empresa_id = '+QuotedStr(edtIdEmp.Text)+' and E.freteiro_id = '+QuotedStr(edtIForn.Text)+' and E.romaneio = P.romaneio and P.empresa_id = E.empresa_id and P.dataEntrada between '+QuotedStr(DateToStr(dtpDtInicial.Date))+' and '+QuotedStr(DateToStr(dtpDtFinal.Date))+'');
             Active := True;
             ShortDateFormat := 'dd/mm/yyyy';
          end;
       end;
       If edtRomaneio.Text <> '0' then begin
          With dmVendas.ADOQuery1 do begin
             Active := False;
             SQL.Clear;
             SQL.Add('select ET.romaneio, ET.dataEntrada, E.descricao, C.descricao ''clas'', sum(((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854) ''volume'', '+
             'P.custo, sum(((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854)* P.custo ''valor'' '+
             'from entrada ET, plaqueta P, classificacao C, Especie E '+
             'where ET.empresa_id = '+QuotedStr(edtIdEmp.Text)+' and ET.freteiro_id = '+QuotedStr(edtIForn.Text)+' and P.romaneio = '+QuotedStr(edtRomaneio.Text)+' and ET.romaneio = P.romaneio and C.id = P.classificacao_id and E.id = P.especie_id and P.empresa_id = ET.empresa_id and ET.dataEntrada between '+QuotedStr(DateToStr(dtpDtInicial.Date))+' and '+QuotedStr(DateToStr(dtpDtFinal.Date))+' group by et.id, e.descricao order by ET.dataEntrada, ET.romaneio');
             Active := True;
             ShortDateFormat := 'dd/mm/yyyy';
          end;
          DateSeparator := '/';
          ShortDateFormat := 'yyyy-mm-dd';
          With ADOQuery1 do begin
             Active := false;
             SQL.Clear;
             SQL.Add('SELECT P.romaneio ''roman'', count(*) ''total'', sum(((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854) ''vol'', sum(((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854)* P.custo ''pre�o'' '+
             'FROM plaqueta P, entrada E '+
             'where P.empresa_id = '+QuotedStr(edtIdEmp.Text)+' and E.freteiro_id = '+QuotedStr(edtIForn.Text)+' and P.romaneio = '+QuotedStr(edtRomaneio.Text)+' and E.romaneio = P.romaneio and P.empresa_id = E.empresa_id and P.dataEntrada between '+QuotedStr(DateToStr(dtpDtInicial.Date))+' and '+QuotedStr(DateToStr(dtpDtFinal.Date))+' group by P.romaneio');
             Active := True;
             ShortDateFormat := 'dd/mm/yyyy';
          end;
          DateSeparator := '/';
          ShortDateFormat := 'yyyy-mm-dd';
          With ADOQuery2 do begin
             Active := false;
             SQL.Clear;
             SQL.Add('SELECT count(*) from plaqueta P, entrada E where P.empresa_id = '+QuotedStr(edtIdEmp.Text)+' and E.freteiro_id = '+QuotedStr(edtIForn.Text)+'and P.romaneio = '+QuotedStr(edtRomaneio.Text)+' and E.romaneio = P.romaneio and P.empresa_id = E.empresa_id and P.dataEntrada between '+QuotedStr(DateToStr(dtpDtInicial.Date))+' and '+QuotedStr(DateToStr(dtpDtFinal.Date))+'');
             Active := True;
             ShortDateFormat := 'dd/mm/yyyy';
          end;
       end;
       Try
         Application.CreateForm(TfrmImprFret, frmImprFret);
         frmImprFret.QRLabel12.Caption := DateToStr(dtpDtInicial.Date);
         frmImprFret.QRLabel14.Caption := DateToStr(dtpDtFinal.Date);
         frmImprFret.QRLabel15.Caption := cbxEmpresa.Text;
         frmImprFret.QRLabel16.Caption := cbxForn.Text;
         frmImprFret.QuickRep1.Preview;
       Finally
            frmImprFret.Free;
       end;
    end;
    ShortDateFormat := 'dd/mm/yyyy';
end;

procedure TfrmImprimeTerceiro.CheckBox1Click(Sender: TObject);
begin
    If CheckBox1.Checked = True then
       btnImprimir2.Visible := True
    else
       btnImprimir2.Visible := False;
end;

procedure TfrmImprimeTerceiro.btnImprimir2Click(Sender: TObject);
begin
    DateSeparator := '/';
    ShortDateFormat := 'yyyy-mm-dd';
    If RadioButton1.Checked = True then begin
       If edtRomaneio.Text = '0' then begin
          With dmVendas.ADOQuery1 do begin
             Active := False;
             SQL.Clear;
             SQL.Add('select E.descricao, C.descricao ''clas'', sum(((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854) ''cubicos'', P.custo, sum(custo*((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854) ''valor'' '+
             'from especie E, classificacao C, plaqueta P, entrada EN where P.empresa_id = '+QuotedStr(edtIdEmp.Text)+' and EN.fornecedor_id = '+QuotedStr(edtIForn.Text)+' and P.empresa_id = EN.empresa_id and P.romaneio = EN.romaneio and P.classificacao_id = C.id and P.especie_id = E.id and EN.dataEntrada between '+QuotedStr(DateToStr(dtpDtInicial.Date))+' and '+QuotedStr(DateToStr(dtpDtFinal.Date))+' group by P.especie_id, P.custo');
             Active := True;
             ShortDateFormat := 'dd/mm/yyyy';
          end;
       end;
       If edtRomaneio.Text <> '0' then begin
          With dmVendas.ADOQuery1 do begin
             Active := False;
             SQL.Clear;
             SQL.Add('select E.descricao, C.descricao ''clas'', sum(((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854) ''cubicos'', P.custo, sum(custo*((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854) ''valor'' '+
             'from especie E, classificacao C, plaqueta P, entrada EN where P.empresa_id = '+QuotedStr(edtIdEmp.Text)+' and EN.fornecedor_id = '+QuotedStr(edtIForn.Text)+' and P.romaneio = '+QuotedStr(edtRomaneio.Text)+' and P.empresa_id = EN.empresa_id and P.romaneio = EN.romaneio and P.classificacao_id = C.id and P.especie_id = E.id and EN.dataEntrada between '+QuotedStr(DateToStr(dtpDtInicial.Date))+' and '+QuotedStr(DateToStr(dtpDtFinal.Date))+' group by P.especie_id, P.custo');
             Active := True;
             ShortDateFormat := 'dd/mm/yyyy';
          end;
       end;
       Try
         Application.CreateForm(TfrmPlanilhaForn, frmPlanilhaForn);
         frmPlanilhaForn.QRLabel10.Caption := DateToStr(dtpDtInicial.Date);
         frmPlanilhaForn.QRLabel12.Caption := DateToStr(dtpDtFinal.Date);
         frmPlanilhaForn.QRLabel23.Caption := cbxForn.Text;
         frmPlanilhaForn.QRLabel2.Caption := cbxEmpresa.Text;
         frmPlanilhaForn.qrpPlanilhaForn.Preview;
       Finally
         frmPlanilhaForn.Free;
       end;
    end;
    DateSeparator := '/';
    ShortDateFormat := 'yyyy-mm-dd';
    If RadioButton2.Checked = True then begin
       If edtRomaneio.Text = '0' then begin
          With dmVendas.ADOQuery1 do begin
             Active := False;
             SQL.Clear;
             SQL.Add('select E.descricao, C.descricao ''clas'', sum(((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854) ''cubicos'', P.custo, sum(custo*((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854) ''valor'' '+
             'from especie E, classificacao C, plaqueta P, entrada EN where P.empresa_id = '+QuotedStr(edtIdEmp.Text)+' and EN.freteiro_id = '+QuotedStr(edtIForn.Text)+' and P.empresa_id = EN.empresa_id and P.romaneio = EN.romaneio and P.classificacao_id = C.id and P.especie_id = E.id and EN.dataEntrada between '+QuotedStr(DateToStr(dtpDtInicial.Date))+' and '+QuotedStr(DateToStr(dtpDtFinal.Date))+' group by P.especie_id, P.custo');
             Active := True;
             ShortDateFormat := 'dd/mm/yyyy';
          end;
       end;
       If edtRomaneio.Text <> '0' then begin
          With dmVendas.ADOQuery1 do begin
             Active := False;
             SQL.Clear;
             SQL.Add('select E.descricao, C.descricao ''clas'', sum(((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854) ''cubicos'', P.custo, sum(custo*((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854) ''valor'' '+
             'from especie E, classificacao C, plaqueta P, entrada EN where P.empresa_id = '+QuotedStr(edtIdEmp.Text)+' and EN.freteiro_id = '+QuotedStr(edtIForn.Text)+' and P.romaneio = '+QuotedStr(edtRomaneio.Text)+' and P.empresa_id = EN.empresa_id and P.romaneio = EN.romaneio and P.classificacao_id = C.id and P.especie_id = E.id and EN.dataEntrada between '+QuotedStr(DateToStr(dtpDtInicial.Date))+' and '+QuotedStr(DateToStr(dtpDtFinal.Date))+' group by P.especie_id, P.custo');
             Active := True;
             ShortDateFormat := 'dd/mm/yyyy';
          end;
       end;
       Try
         Application.CreateForm(TfrmPlanilhaFrete, frmPlanilhaFrete);
         frmPlanilhaFrete.QRLabel10.Caption := DateToStr(dtpDtInicial.Date);
         frmPlanilhaFrete.QRLabel12.Caption := DateToStr(dtpDtFinal.Date);
         frmPlanilhaFrete.QRLabel23.Caption := cbxForn.Text;
         frmPlanilhaFrete.QRLabel2.Caption := cbxEmpresa.Text;
         frmPlanilhaFrete.qrpPlanilhaFrete.Preview;
       Finally
            frmPlanilhaFrete.Free;
       end;
    end;
end;

end.
