unit EmisRelEntrada_frm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, DB, ADODB;

type
  TfrmEmisRelEntrada = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    dtpDtInicial: TDateTimePicker;
    dtpDtFinal: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    GroupBox3: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    edtIdEmp: TEdit;
    edtIdEspecie: TEdit;
    edtIdClass: TEdit;
    edtIForn: TEdit;
    edtRomaneio: TEdit;
    edtIdFreteiro: TEdit;
    cbxEmpresa: TComboBox;
    cbxEspecie: TComboBox;
    cbxClass: TComboBox;
    cbxForn: TComboBox;
    cbxFreteiro: TComboBox;
    cbxUtiliz: TComboBox;
    btnImprimir: TBitBtn;
    btnFechar: TBitBtn;
    Edit1: TEdit;
    procedure btnFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cbxEmpresaChange(Sender: TObject);
    procedure cbxEspecieChange(Sender: TObject);
    procedure cbxClassChange(Sender: TObject);
    procedure cbxFornChange(Sender: TObject);
    procedure cbxFreteiroChange(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure cbxEmpresaEnter(Sender: TObject);
    procedure cbxEspecieEnter(Sender: TObject);
    procedure cbxClassEnter(Sender: TObject);
    procedure cbxFornEnter(Sender: TObject);
    procedure cbxFreteiroEnter(Sender: TObject);
    procedure cbxFornExit(Sender: TObject);
    procedure cbxFreteiroExit(Sender: TObject);
    procedure edtRomaneioEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEmisRelEntrada: TfrmEmisRelEntrada;

implementation

uses Carro_Comando_dm, ImprimeEntrada_frm, Math;

{$R *.dfm}

procedure TfrmEmisRelEntrada.btnFecharClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmEmisRelEntrada.FormShow(Sender: TObject);
begin
    dtpDtInicial.Date := Date - 15;
    dtpDtFinal.Date := Date + 15;
end;

procedure TfrmEmisRelEntrada.FormCreate(Sender: TObject);
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
       SQL.Add('Select * from especie order by descricao');
       Active := True;
       while not Eof do begin
          cbxEspecie.Items.Add(FieldByName('descricao').AsString);
          Next;
       end;
    end;
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select * from classificacao order by descricao');
       Active := True;
       while not Eof do begin
          cbxClass.Items.Add(FieldByName('descricao').AsString);
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
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select * from terceiro order by nome');
       Active := True;
       while not Eof do begin
          cbxFreteiro.Items.Add(FieldByName('nome').AsString);
          Next;
       end;
    end;
end;

procedure TfrmEmisRelEntrada.cbxEmpresaChange(Sender: TObject);
begin
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select Id from empresa where razaoSocial = '+QuotedStr(cbxEmpresa.Text)+'');
       Active := True;
       edtIdEmp.Text := FieldByName('id').AsString;
    end;
end;

procedure TfrmEmisRelEntrada.cbxEspecieChange(Sender: TObject);
begin
    If cbxEspecie.Text <> 'TODOS' then begin
       With dmVendas.ADOQuery1 do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Select Id from especie where descricao = '+QuotedStr(cbxEspecie.Text)+'');
          Active := True;
          edtIdEspecie.Text := FieldByName('id').AsString;
       end;
    end
    else begin
       edtIdEspecie.Text := '0';
    end;
end;

procedure TfrmEmisRelEntrada.cbxClassChange(Sender: TObject);
begin
    If cbxClass.Text <> 'TODOS' then begin
       With dmVendas.ADOQuery1 do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Select Id from classificacao where descricao = '+QuotedStr(cbxClass.Text)+'');
          Active := True;
          edtIdClass.Text := FieldByName('id').AsString;
       end;
    end
    else begin
       edtIdClass.Text := '0';
    end;
end;

procedure TfrmEmisRelEntrada.cbxFornChange(Sender: TObject);
begin
    If cbxForn.Text <> 'TODOS' then begin
       With dmVendas.ADOQuery1 do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Select Id from terceiro where nome = '+QuotedStr(cbxForn.Text)+'');
          Active := True;
          edtIForn.Text := FieldByName('id').AsString;
      end;
    end
    else begin
       edtIForn.Text := '0';
    end;
end;

procedure TfrmEmisRelEntrada.cbxFreteiroChange(Sender: TObject);
begin
    If cbxFreteiro.Text <> 'TODOS' then begin
       With dmVendas.ADOQuery1 do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Select Id from terceiro where nome = '+QuotedStr(cbxFreteiro.Text)+'');
          Active := True;
          edtIdFreteiro.Text := FieldByName('id').AsString;
      end;
    end
    else begin
       edtIdFreteiro.Text := '0';
    end;
end;

procedure TfrmEmisRelEntrada.btnImprimirClick(Sender: TObject);
begin
    DateSeparator := '/';
    ShortDateFormat := 'yyyy-mm-dd';
    If Edit1.Text = '0' then begin
       If cbxUtiliz.Text = 'TODOS' then begin
          With dmVendas.ADOQuery1 do begin
             Active := False;
             SQL.Clear;
             SQL.Add('select EM.razaoSocial, P.dataEntrada, P.romaneio, P.plaqueta, E.descricao,'+
             'C.descricao''clas'', P.diametro1, P.diametro2, P.comprimento, (comprimento - saldoLinear), P.saldoLinear, ((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854, P.custo, '+
             '(custo * ((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854)'+
             'from empresa EM, plaqueta P, especie E, classificacao C where EM.id = '+QuotedStr(edtIdEmp.Text)+' and Em.id = P.empresa_id and P.especie_id = E.id = P.classificacao_id = C.id and P.dataEntrada between '+QuotedStr(DateToStr(dtpDtInicial.Date))+' and '+QuotedStr(DateToStr(dtpDtFinal.Date))+' order by P.plaqueta');
             Active := True;
             ShortDateFormat := 'dd/mm/yyyy';
          end;
       end;
       If cbxUtiliz.Text = 'BAIXADAS' then begin
          With dmVendas.ADOQuery1 do begin
             Active := False;
             SQL.Clear;
             SQL.Add('select EM.razaoSocial, P.dataEntrada, P.romaneio, P.plaqueta, E.descricao,'+
             'C.descricao''clas'', P.diametro1, P.diametro2, P.comprimento, (comprimento - saldoLinear), P.saldoLinear, ((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854, '+
             'P.custo, (custo * ((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854)'+
             'from empresa EM, plaqueta P, especie E, classificacao C where EM.id = '+QuotedStr(edtIdEmp.Text)+' and (comprimento - saldoLinear) <> 0 and Em.id = P.empresa_id and P.especie_id = E.id = P.classificacao_id = C.id and P.dataEntrada between '+QuotedStr(DateToStr(dtpDtInicial.Date))+' and '+QuotedStr(DateToStr(dtpDtFinal.Date))+' order by P.plaqueta');
             Active := True;
             ShortDateFormat := 'dd/mm/yyyy';
          end;
       end;
       If cbxUtiliz.Text = 'N�O BAIXADAS' then begin
          With dmVendas.ADOQuery1 do begin
             Active := False;
             SQL.Clear;
             SQL.Add('select EM.razaoSocial, P.dataEntrada, P.romaneio, P.plaqueta, E.descricao,'+
             'C.descricao''clas'', P.diametro1, P.diametro2, P.comprimento, (comprimento - saldoLinear), P.saldoLinear, ((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854, '+
             'P.custo, (custo * ((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854)'+
             'from empresa EM, plaqueta P, especie E, classificacao C where EM.id = '+QuotedStr(edtIdEmp.Text)+' and (comprimento - saldoLinear) = 0 and Em.id = P.empresa_id and P.especie_id = E.id = P.classificacao_id = C.id and P.dataEntrada between '+QuotedStr(DateToStr(dtpDtInicial.Date))+' and '+QuotedStr(DateToStr(dtpDtFinal.Date))+' order by P.plaqueta');
             Active := True;
             ShortDateFormat := 'dd/mm/yyyy';
          end;
       end;
    end;
    If Edit1.Text = '1' then begin
       If cbxUtiliz.Text = 'TODOS' then begin
          With dmVendas.ADOQuery1 do begin
             Active := False;
             SQL.Clear;
             SQL.Add('select EM.razaoSocial, P.dataEntrada, P.romaneio, P.plaqueta, E.descricao,'+
             'C.descricao''clas'', P.diametro1, P.diametro2, P.comprimento, (comprimento - saldoLinear), P.saldoLinear, ((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854, '+
             'P.custo, (custo * ((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854)'+
             'from empresa EM, plaqueta P, especie E, classificacao C where EM.id = '+QuotedStr(edtIdEmp.Text)+' and E.id = '+QuotedStr(edtIdEspecie.Text)+' and Em.id = P.empresa_id and P.especie_id = E.id = P.classificacao_id = C.id and P.dataEntrada between '+QuotedStr(DateToStr(dtpDtInicial.Date))+' and '+QuotedStr(DateToStr(dtpDtFinal.Date))+' order by P.plaqueta');
             Active := True;
             ShortDateFormat := 'dd/mm/yyyy';
          end;
       end;
       If cbxUtiliz.Text = 'BAIXADAS' then begin
          With dmVendas.ADOQuery1 do begin
             Active := False;
             SQL.Clear;
             SQL.Add('select EM.razaoSocial, P.dataEntrada, P.romaneio, P.plaqueta, E.descricao,'+
             'C.descricao''clas'', P.diametro1, P.diametro2, P.comprimento, (comprimento - saldoLinear), P.saldoLinear, ((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854, '+
             'P.custo, (custo * ((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854)'+
             'from empresa EM, plaqueta P, especie E, classificacao C where EM.id = '+QuotedStr(edtIdEmp.Text)+' and E.id = '+QuotedStr(edtIdEspecie.Text)+' and (comprimento - saldoLinear) <> 0 and Em.id = P.empresa_id and P.especie_id = E.id = P.classificacao_id = C.id and P.dataEntrada between '+QuotedStr(DateToStr(dtpDtInicial.Date))+' and '+QuotedStr(DateToStr(dtpDtFinal.Date))+' order by P.plaqueta');
             Active := True;
             ShortDateFormat := 'dd/mm/yyyy';
          end;
       end;
       If cbxUtiliz.Text = 'N�O BAIXADAS' then begin
          With dmVendas.ADOQuery1 do begin
             Active := False;
             SQL.Clear;
             SQL.Add('select EM.razaoSocial, P.dataEntrada, P.romaneio, P.plaqueta, E.descricao,'+
             'C.descricao''clas'', P.diametro1, P.diametro2, P.comprimento, (comprimento - saldoLinear), P.saldoLinear, ((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854, '+
             'P.custo, (custo * ((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854)'+
             'from empresa EM, plaqueta P, especie E, classificacao C where EM.id = '+QuotedStr(edtIdEmp.Text)+' and E.id = '+QuotedStr(edtIdEspecie.Text)+' and (comprimento - saldoLinear) = 0 and Em.id = P.empresa_id and P.especie_id = E.id = P.classificacao_id = C.id and P.dataEntrada between '+QuotedStr(DateToStr(dtpDtInicial.Date))+' and '+QuotedStr(DateToStr(dtpDtFinal.Date))+' order by P.plaqueta');
             Active := True;
             ShortDateFormat := 'dd/mm/yyyy';
          end;
       end;
    end;
    If Edit1.Text = '2' then begin
       If cbxUtiliz.Text = 'TODOS' then begin
          With dmVendas.ADOQuery1 do begin
             Active := False;
             SQL.Clear;
             SQL.Add('select EM.razaoSocial, P.dataEntrada, P.romaneio, P.plaqueta, E.descricao,'+
             'C.descricao''clas'', P.diametro1, P.diametro2, P.comprimento, (comprimento - saldoLinear), P.saldoLinear, ((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854, '+
             'P.custo, (custo * ((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854)'+
             'from empresa EM, plaqueta P, especie E, classificacao C where EM.id = '+QuotedStr(edtIdEmp.Text)+' and C.id = '+QuotedStr(edtIdClass.Text)+' and Em.id = P.empresa_id and P.especie_id = E.id = P.classificacao_id = C.id and P.dataEntrada between '+QuotedStr(DateToStr(dtpDtInicial.Date))+' and '+QuotedStr(DateToStr(dtpDtFinal.Date))+' order by P.plaqueta');
             Active := True;
             ShortDateFormat := 'dd/mm/yyyy';
          end;
       end;
       If cbxUtiliz.Text = 'BAIXADAS' then begin
          With dmVendas.ADOQuery1 do begin
             Active := False;
             SQL.Clear;
             SQL.Add('select EM.razaoSocial, P.dataEntrada, P.romaneio, P.plaqueta, E.descricao,'+
             'C.descricao''clas'', P.diametro1, P.diametro2, P.comprimento, (comprimento - saldoLinear), P.saldoLinear, ((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854, '+
             'P.custo, (custo * ((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854)'+
             'from empresa EM, plaqueta P, especie E, classificacao C where EM.id = '+QuotedStr(edtIdEmp.Text)+' and C.id = '+QuotedStr(edtIdClass.Text)+' and (comprimento - saldoLinear) <> 0 and Em.id = P.empresa_id and P.especie_id = E.id = P.classificacao_id = C.id and P.dataEntrada between '+QuotedStr(DateToStr(dtpDtInicial.Date))+' and '+QuotedStr(DateToStr(dtpDtFinal.Date))+' order by P.plaqueta');
             Active := True;
             ShortDateFormat := 'dd/mm/yyyy';
          end;
       end;
       If cbxUtiliz.Text = 'N�O BAIXADAS' then begin
          With dmVendas.ADOQuery1 do begin
             Active := False;
             SQL.Clear;
             SQL.Add('select EM.razaoSocial, P.dataEntrada, P.romaneio, P.plaqueta, E.descricao,'+
             'C.descricao''clas'', P.diametro1, P.diametro2, P.comprimento, (comprimento - saldoLinear), P.saldoLinear, ((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854, '+
             'P.custo, (custo * ((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854)'+
             'from empresa EM, plaqueta P, especie E, classificacao C where EM.id = '+QuotedStr(edtIdEmp.Text)+' and C.id = '+QuotedStr(edtIdClass.Text)+' and (comprimento - saldoLinear) = 0 and Em.id = P.empresa_id and P.especie_id = E.id = P.classificacao_id = C.id and P.dataEntrada between '+QuotedStr(DateToStr(dtpDtInicial.Date))+' and '+QuotedStr(DateToStr(dtpDtFinal.Date))+' order by P.plaqueta');
             Active := True;
             ShortDateFormat := 'dd/mm/yyyy';
          end;
       end;
    end;
    If Edit1.Text = '3' then begin
       If cbxUtiliz.Text = 'TODOS' then begin
          With dmVendas.ADOQuery1 do begin
             Active := False;
             SQL.Clear;
             SQL.Add('select EM.razaoSocial, P.dataEntrada, P.romaneio, P.plaqueta, E.descricao, C.descricao ''clas'', P.diametro1, P.diametro2, P.comprimento, (comprimento - saldoLinear), P.saldoLinear, '+
             '((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854, P.custo, (custo * ((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854) from empresa EM, plaqueta P, especie E, classificacao C, entrada EN '+
             'where EM.id = '+QuotedStr(edtIdEmp.Text)+' and EN.fornecedor_id = '+QuotedStr(edtIForn.Text)+' and EM.id = P.empresa_id and P.empresa_id = EN.empresa_id and P.romaneio = EN.romaneio and P.especie_id = E.id and P.classificacao_id = C.id and P.dataEntrada between '+QuotedStr(DateToStr(dtpDtInicial.Date))+'and '+QuotedStr(DateToStr(dtpDtFinal.Date))+' order by P.plaqueta');
             Active := True;
             ShortDateFormat := 'dd/mm/yyyy';
          end;
       end;
       If cbxUtiliz.Text = 'BAIXADAS' then begin
          With dmVendas.ADOQuery1 do begin
             Active := False;
             SQL.Clear;
             SQL.Add('select EM.razaoSocial, P.dataEntrada, P.romaneio, P.plaqueta, E.descricao, C.descricao ''clas'', P.diametro1, P.diametro2, P.comprimento, (comprimento - saldoLinear), P.saldoLinear, '+
             '((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854, P.custo, (custo * ((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854) from empresa EM, plaqueta P, especie E, classificacao C, entrada EN '+
             'where EM.id = '+QuotedStr(edtIdEmp.Text)+' and EN.fornecedor_id = '+QuotedStr(edtIForn.Text)+' and (comprimento - saldoLinear) <> 0 and EM.id = P.empresa_id and P.empresa_id = EN.empresa_id and P.romaneio = EN.romaneio and P.especie_id = E.id and P.classificacao_id = C.id and P.dataEntrada between '+QuotedStr(DateToStr(dtpDtInicial.Date))+'and '+QuotedStr(DateToStr(dtpDtFinal.Date))+' order by P.plaqueta');
             Active := True;
             ShortDateFormat := 'dd/mm/yyyy';
          end;
       end;
       If cbxUtiliz.Text = 'N�O BAIXADAS' then begin
          With dmVendas.ADOQuery1 do begin
             Active := False;
             SQL.Clear;
             SQL.Add('select EM.razaoSocial, P.dataEntrada, P.romaneio, P.plaqueta, E.descricao, C.descricao ''clas'', P.diametro1, P.diametro2, P.comprimento, (comprimento - saldoLinear), P.saldoLinear, '+
             '((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854, P.custo, (custo * ((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854 from empresa EM, plaqueta P, especie E, classificacao C, entrada EN '+
             'where EM.id = '+QuotedStr(edtIdEmp.Text)+' and EN.fornecedor_id = '+QuotedStr(edtIForn.Text)+' and (comprimento - saldoLinear) = 0 and EM.id = P.empresa_id and P.empresa_id = EN.empresa_id and P.romaneio = EN.romaneio and P.especie_id = E.id and P.classificacao_id = C.id and P.dataEntrada between '+QuotedStr(DateToStr(dtpDtInicial.Date))+'and '+QuotedStr(DateToStr(dtpDtFinal.Date))+' order by P.plaqueta');
             Active := True;
             ShortDateFormat := 'dd/mm/yyyy';
          end;
       end;
    end;
    If Edit1.Text = '4' then begin
       If cbxUtiliz.Text = 'TODOS' then begin
          With dmVendas.ADOQuery1 do begin
             Active := False;
             SQL.Clear;
             SQL.Add('select EM.razaoSocial, P.dataEntrada, P.romaneio, P.plaqueta, E.descricao, C.descricao ''clas'', P.diametro1, P.diametro2, P.comprimento, (comprimento - saldoLinear), P.saldoLinear, '+
             '((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854, P.custo, (custo * ((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854) from empresa EM, plaqueta P, especie E, classificacao C, entrada EN '+
             'where EM.id = '+QuotedStr(edtIdEmp.Text)+' and EN.freteiro_id = '+QuotedStr(edtIdFreteiro.Text)+' and EM.id = P.empresa_id and P.empresa_id = EN.empresa_id and P.romaneio = EN.romaneio and P.especie_id = E.id and P.classificacao_id = C.id and P.dataEntrada between '+QuotedStr(DateToStr(dtpDtInicial.Date))+'and '+QuotedStr(DateToStr(dtpDtFinal.Date))+' order by P.plaqueta');
             Active := True;
             ShortDateFormat := 'dd/mm/yyyy';
          end;
       end;
       If cbxUtiliz.Text = 'BAIXADAS' then begin
          With dmVendas.ADOQuery1 do begin
             Active := False;
             SQL.Clear;
             SQL.Add('select EM.razaoSocial, P.dataEntrada, P.romaneio, P.plaqueta, E.descricao, C.descricao ''clas'', P.diametro1, P.diametro2, P.comprimento, (comprimento - saldoLinear), P.saldoLinear, '+
             '((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854, P.custo, (custo * ((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854) from empresa EM, plaqueta P, especie E, classificacao C, entrada EN '+
             'where EM.id = '+QuotedStr(edtIdEmp.Text)+' and EN.freteiro_id = '+QuotedStr(edtIdFreteiro.Text)+' and (comprimento - saldoLinear) <> 0 and EM.id = P.empresa_id and P.empresa_id = EN.empresa_id and P.romaneio = EN.romaneio and P.especie_id = E.id and P.classificacao_id = C.id and P.dataEntrada between '+QuotedStr(DateToStr(dtpDtInicial.Date))+'and '+QuotedStr(DateToStr(dtpDtFinal.Date))+' order by P.plaqueta');
             Active := True;
             ShortDateFormat := 'dd/mm/yyyy';
          end;
       end;
       If cbxUtiliz.Text = 'N�O BAIXADAS' then begin
          With dmVendas.ADOQuery1 do begin
             Active := False;
             SQL.Clear;
             SQL.Add('select EM.razaoSocial, P.dataEntrada, P.romaneio, P.plaqueta, E.descricao, C.descricao ''clas'', P.diametro1, P.diametro2, P.comprimento, (comprimento - saldoLinear), P.saldoLinear, '+
             '((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854, P.custo, (custo * ((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854) from empresa EM, plaqueta P, especie E, classificacao C, entrada EN '+
             'where EM.id = '+QuotedStr(edtIdEmp.Text)+' and EN.freteiro_id = '+QuotedStr(edtIdFreteiro.Text)+' and (comprimento - saldoLinear) = 0 and EM.id = P.empresa_id and P.empresa_id = EN.empresa_id and P.romaneio = EN.romaneio and P.especie_id = E.id and P.classificacao_id = C.id and P.dataEntrada between '+QuotedStr(DateToStr(dtpDtInicial.Date))+'and '+QuotedStr(DateToStr(dtpDtFinal.Date))+' order by P.plaqueta');
             Active := True;
             ShortDateFormat := 'dd/mm/yyyy';
          end;
       end;
    end;
    If Edit1.Text = '7' then begin
       If cbxUtiliz.Text = 'TODOS' then begin
          With dmVendas.ADOQuery1 do begin
             Active := False;
             SQL.Clear;
             SQL.Add('select EM.razaoSocial, P.dataEntrada, P.romaneio, P.plaqueta, E.descricao,'+
             'C.descricao''clas'', P.diametro1, P.diametro2, P.comprimento, (comprimento - saldoLinear), P.saldoLinear, ((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854, '+
             'P.custo, (custo * ((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854)'+
             'from empresa EM, plaqueta P, especie E, classificacao C where EM.id = '+QuotedStr(edtIdEmp.Text)+' and P.romaneio = '+QuotedStr(edtRomaneio.Text)+' and Em.id = P.empresa_id and P.especie_id = E.id = P.classificacao_id = C.id and P.dataEntrada between '+QuotedStr(DateToStr(dtpDtInicial.Date))+' and '+QuotedStr(DateToStr(dtpDtFinal.Date))+' order by P.plaqueta');
             Active := True;
             ShortDateFormat := 'dd/mm/yyyy';
          end;
       end;
       If cbxUtiliz.Text = 'BAIXADAS' then begin
          With dmVendas.ADOQuery1 do begin
             Active := False;
             SQL.Clear;
             SQL.Add('select EM.razaoSocial, P.dataEntrada, P.romaneio, P.plaqueta, E.descricao,'+
             'C.descricao''clas'', P.diametro1, P.diametro2, P.comprimento, (comprimento - saldoLinear), P.saldoLinear, ((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854, '+
             'P.custo, (custo * ((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854)'+
             'from empresa EM, plaqueta P, especie E, classificacao C where EM.id = '+QuotedStr(edtIdEmp.Text)+' and P.romaneio = '+QuotedStr(edtRomaneio.Text)+' and (comprimento - saldoLinear) <> 0 and Em.id = P.empresa_id and P.especie_id = E.id = P.classificacao_id = C.id and P.dataEntrada between '+QuotedStr(DateToStr(dtpDtInicial.Date))+' and '+QuotedStr(DateToStr(dtpDtFinal.Date))+' order by P.plaqueta');
             Active := True;
             ShortDateFormat := 'dd/mm/yyyy';
          end;
       end;
       If cbxUtiliz.Text = 'N�O BAIXADAS' then begin
          With dmVendas.ADOQuery1 do begin
             Active := False;
             SQL.Clear;
             SQL.Add('select EM.razaoSocial, P.dataEntrada, P.romaneio, P.plaqueta, E.descricao,'+
             'C.descricao''clas'', P.diametro1, P.diametro2, P.comprimento, (comprimento - saldoLinear), P.saldoLinear, ((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854, '+
             'P.custo, (custo * ((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854)'+
             'from empresa EM, plaqueta P, especie E, classificacao C where EM.id = '+QuotedStr(edtIdEmp.Text)+' and P.romaneio = '+QuotedStr(edtRomaneio.Text)+' and (comprimento - saldoLinear) = 0 and Em.id = P.empresa_id and P.especie_id = E.id = P.classificacao_id = C.id and P.dataEntrada between '+QuotedStr(DateToStr(dtpDtInicial.Date))+' and '+QuotedStr(DateToStr(dtpDtFinal.Date))+' order by P.plaqueta');
             Active := True;
             ShortDateFormat := 'dd/mm/yyyy';
          end;
       end;
    end;
    Try
      Application.CreateForm(TfrmImprimeEntrada, frmImprimeEntrada);
      frmImprimeEntrada.QRLabel10.Caption := DateToStr(dtpDtInicial.Date);
      frmImprimeEntrada.QRLabel12.Caption := DateToStr(dtpDtFinal.Date);
      If edtIForn.Text <> '0' then begin
         frmImprimeEntrada.QRLabel23.Caption := 'Fornecedor:';
         frmImprimeEntrada.QRLabel23.Enabled := True;
         frmImprimeEntrada.QRLabel26.Caption := cbxForn.Text;
         frmImprimeEntrada.QRLabel26.Enabled := True;
      end;
      If edtIdFreteiro.Text <> '0' then begin
         frmImprimeEntrada.QRLabel23.Caption := 'Freteiro:';
         frmImprimeEntrada.QRLabel23.Enabled := True;
         frmImprimeEntrada.QRLabel26.Caption := cbxFreteiro.Text;
         frmImprimeEntrada.QRLabel26.Enabled := True;
      end;
      frmImprimeEntrada.qrpEntrada.Preview;
    Finally
         frmImprimeEntrada.Free;
    end;
end;

procedure TfrmEmisRelEntrada.cbxEmpresaEnter(Sender: TObject);
begin
    Edit1.Text := '0';
end;

procedure TfrmEmisRelEntrada.cbxEspecieEnter(Sender: TObject);
begin
    Edit1.Text := '1';
end;

procedure TfrmEmisRelEntrada.cbxClassEnter(Sender: TObject);
begin
    Edit1.Text := '2';
end;

procedure TfrmEmisRelEntrada.cbxFornEnter(Sender: TObject);
begin
    Edit1.Text := '3';
end;

procedure TfrmEmisRelEntrada.cbxFreteiroEnter(Sender: TObject);
begin
    Edit1.Text := '4';
end;

procedure TfrmEmisRelEntrada.cbxFornExit(Sender: TObject);
begin
    If edtIdEspecie.Text <> '0' then begin
       Edit1.Text := '5';
    end;
end;

procedure TfrmEmisRelEntrada.cbxFreteiroExit(Sender: TObject);
begin
    If edtIdEspecie.Text <> '0' then begin
       Edit1.Text := '6';
    end;
end;

procedure TfrmEmisRelEntrada.edtRomaneioEnter(Sender: TObject);
begin
    If edtIdEmp.Text <> '0' then begin
       Edit1.Text := '7';
    end;
end;

end.
