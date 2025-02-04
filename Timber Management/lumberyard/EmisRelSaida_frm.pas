unit EmisRelSaida_frm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls;

type
  TfrmEmisRelSaida = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    dtpDtInicial: TDateTimePicker;
    dtpDtFinal: TDateTimePicker;
    GroupBox3: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label9: TLabel;
    edtIdEmp: TEdit;
    edtIdEspecie: TEdit;
    edtIdClass: TEdit;
    cbxEmpresa: TComboBox;
    cbxEspecie: TComboBox;
    cbxClass: TComboBox;
    cbxTipo: TComboBox;
    btnImprimir: TBitBtn;
    btnFechar: TBitBtn;
    Edit1: TEdit;
    procedure btnFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure cbxEmpresaChange(Sender: TObject);
    procedure cbxEspecieChange(Sender: TObject);
    procedure cbxClassChange(Sender: TObject);
    procedure cbxEmpresaEnter(Sender: TObject);
    procedure cbxEspecieEnter(Sender: TObject);
    procedure cbxClassEnter(Sender: TObject);
    procedure cbxClassExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEmisRelSaida: TfrmEmisRelSaida;

implementation

uses Carro_Comando_dm, ImprimeSaida_frm;

{$R *.dfm}

procedure TfrmEmisRelSaida.btnFecharClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmEmisRelSaida.FormShow(Sender: TObject);
begin
    dtpDtInicial.Date := Date - 15;
    dtpDtFinal.Date := Date + 15;
end;

procedure TfrmEmisRelSaida.FormCreate(Sender: TObject);
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
end;

procedure TfrmEmisRelSaida.btnImprimirClick(Sender: TObject);
begin
    DateSeparator := '/';
    ShortDateFormat := 'yyyy-mm-dd';
    If Edit1.Text = '0' then begin
       If cbxTipo.Text = 'TODOS' then begin
          With dmVendas.ADOQuery1 do begin
             Active := False;
             SQL.Clear;
             SQL.Add('select S.dataSaida, P.plaqueta, S.tipo, E.descricao, C.descricao ''clas'', P.diametro1, P.diametro2, P.comprimento, '+
             '((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854 ''M3'', '+
             '((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854-(((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854-saldoLinear*((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*0.7854) ''M3D'', '+
             '((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854-saldoLinear*((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*0.7854 ''M3U'', P.saldoLinear ''MLD'', P.comprimento-P.saldoLinear ''MLU'', EM.razaoSocial '+
             'from empresa EM, plaqueta P, especie E, classificacao C, saida S where EM.id = '+QuotedStr(edtIdEmp.Text)+' and EM.id = S.empresa_id and EM.id = P.empresa_id and P.id = S.plaqueta_id and S.empresa_id = P.empresa_id and P.especie_id = E.id = P.classificacao_id = C.id and S.dataSaida between '+QuotedStr(DateToStr(dtpDtInicial.Date))+' and '+QuotedStr(DateToStr(dtpDtFinal.Date))+' order by P.plaqueta');
             Active := True;
             ShortDateFormat := 'dd/mm/yyyy';
          end;
       end;
       If cbxTipo.Text = 'PRODU플O' then begin
          With dmVendas.ADOQuery1 do begin
             Active := False;
             SQL.Clear;
             SQL.Add('select S.dataSaida, P.plaqueta, S.tipo, E.descricao, C.descricao ''clas'', P.diametro1, P.diametro2, P.comprimento, '+
             '((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854 ''M3'', '+
             '((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854-(((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854-saldoLinear*((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*0.7854) ''M3D'', '+
             '((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854-saldoLinear*((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*0.7854 ''M3U'', P.saldoLinear ''MLD'', P.comprimento-P.saldoLinear ''MLU'', EM.razaoSocial '+
             'from empresa EM, plaqueta P, especie E, classificacao C, saida S where EM.id = '+QuotedStr(edtIdEmp.Text)+' and EM.id = S.empresa_id and EM.id = P.empresa_id and P.id = S.plaqueta_id and S.empresa_id = P.empresa_id and P.especie_id = E.id = P.classificacao_id = C.id and S.dataSaida between '+QuotedStr(DateToStr(dtpDtInicial.Date))+' and '+QuotedStr(DateToStr(dtpDtFinal.Date))+' and S.tipo = ''Producao'' order by P.plaqueta');
             Active := True;
             ShortDateFormat := 'dd/mm/yyyy';
          end;
       end;
       If cbxTipo.Text = 'VENDA' then begin
          With dmVendas.ADOQuery1 do begin
             Active := False;
             SQL.Clear;
             SQL.Add('select S.dataSaida, P.plaqueta, S.tipo, E.descricao, C.descricao ''clas'', P.diametro1, P.diametro2, P.comprimento, '+
             '((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854 ''M3'', '+
             '((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854-(((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854-saldoLinear*((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*0.7854) ''M3D'', '+
             '((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854-saldoLinear*((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*0.7854 ''M3U'', P.saldoLinear ''MLD'', P.comprimento-P.saldoLinear ''MLU'', EM.razaoSocial '+
             'from empresa EM, plaqueta P, especie E, classificacao C, saida S where EM.id = '+QuotedStr(edtIdEmp.Text)+' and EM.id = S.empresa_id and EM.id = P.empresa_id and P.id = S.plaqueta_id and S.empresa_id = P.empresa_id and P.especie_id = E.id = P.classificacao_id = C.id and S.dataSaida between '+QuotedStr(DateToStr(dtpDtInicial.Date))+' and '+QuotedStr(DateToStr(dtpDtFinal.Date))+' and S.tipo = ''Venda'' order by P.plaqueta');
             Active := True;
             ShortDateFormat := 'dd/mm/yyyy';
          end;
       end;
    end;
    If Edit1.Text = '1' then begin
       If cbxTipo.Text = 'TODOS' then begin
          With dmVendas.ADOQuery1 do begin
             Active := False;
             SQL.Clear;
             SQL.Add('select S.dataSaida, P.plaqueta, S.tipo, E.descricao, C.descricao ''clas'', P.diametro1, P.diametro2, P.comprimento, '+
             '((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854 ''M3'', '+
             '((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854-(((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854-saldoLinear*((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*0.7854) ''M3D'', '+
             '((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854-saldoLinear*((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*0.7854 ''M3U'', P.saldoLinear ''MLD'', P.comprimento-P.saldoLinear ''MLU'', EM.razaoSocial '+
             'from empresa EM, plaqueta P, especie E, classificacao C, saida S where EM.id = '+QuotedStr(edtIdEmp.Text)+' and E.id = '+QuotedStr(edtIdEspecie.Text)+' and EM.id = S.empresa_id and EM.id = P.empresa_id and P.id = S.plaqueta_id and S.empresa_id = P.empresa_id and P.especie_id = E.id = P.classificacao_id = C.id and S.dataSaida between '+QuotedStr(DateToStr(dtpDtInicial.Date))+' and '+QuotedStr(DateToStr(dtpDtFinal.Date))+' order by P.plaqueta');
             Active := True;
             ShortDateFormat := 'dd/mm/yyyy';
          end;
       end;
       If cbxTipo.Text = 'PRODU플O' then begin
          With dmVendas.ADOQuery1 do begin
             Active := False;
             SQL.Clear;
             SQL.Add('select S.dataSaida, P.plaqueta, S.tipo, E.descricao, C.descricao ''clas'', P.diametro1, P.diametro2, P.comprimento, '+
             '((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854 ''M3'', '+
             '((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854-(((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854-saldoLinear*((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*0.7854) ''M3D'', '+
             '((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854-saldoLinear*((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*0.7854 ''M3U'', P.saldoLinear ''MLD'', P.comprimento-P.saldoLinear ''MLU'', EM.razaoSocial '+
             'from empresa EM, plaqueta P, especie E, classificacao C, saida S where EM.id = '+QuotedStr(edtIdEmp.Text)+' and E.id = '+QuotedStr(edtIdEspecie.Text)+' and EM.id = S.empresa_id and EM.id = P.empresa_id and P.id = S.plaqueta_id and S.empresa_id = P.empresa_id and P.especie_id = E.id = P.classificacao_id = C.id and S.dataSaida between '+QuotedStr(DateToStr(dtpDtInicial.Date))+' and '+QuotedStr(DateToStr(dtpDtFinal.Date))+' and S.tipo = ''Producao'' order by P.plaqueta');
             Active := True;
             ShortDateFormat := 'dd/mm/yyyy';
          end;
       end;
       If cbxTipo.Text = 'VENDA' then begin
          With dmVendas.ADOQuery1 do begin
             Active := False;
             SQL.Clear;
             SQL.Add('select S.dataSaida, P.plaqueta, S.tipo, E.descricao, C.descricao ''clas'', P.diametro1, P.diametro2, P.comprimento, '+
             '((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854 ''M3'', '+
             '((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854-(((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854-saldoLinear*((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*0.7854) ''M3D'', '+
             '((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854-saldoLinear*((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*0.7854 ''M3U'', P.saldoLinear ''MLD'', P.comprimento-P.saldoLinear ''MLU'', EM.razaoSocial '+
             'from empresa EM, plaqueta P, especie E, classificacao C, saida S where EM.id = '+QuotedStr(edtIdEmp.Text)+' and E.id = '+QuotedStr(edtIdEspecie.Text)+' and EM.id = S.empresa_id and EM.id = P.empresa_id and P.id = S.plaqueta_id and S.empresa_id = P.empresa_id and P.especie_id = E.id = P.classificacao_id = C.id and S.dataSaida between '+QuotedStr(DateToStr(dtpDtInicial.Date))+' and '+QuotedStr(DateToStr(dtpDtFinal.Date))+' and S.tipo = ''Venda'' order by P.plaqueta');
             Active := True;
             ShortDateFormat := 'dd/mm/yyyy';
          end;
       end;
    end;
    If Edit1.Text = '2' then begin
       If cbxTipo.Text = 'TODOS' then begin
          With dmVendas.ADOQuery1 do begin
             Active := False;
             SQL.Clear;
             SQL.Add('select S.dataSaida, P.plaqueta, S.tipo, E.descricao, C.descricao ''clas'', P.diametro1, P.diametro2, P.comprimento, '+
             '((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854 ''M3'', '+
             '((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854-(((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854-saldoLinear*((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*0.7854) ''M3D'', '+
             '((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854-saldoLinear*((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*0.7854 ''M3U'', P.saldoLinear ''MLD'', P.comprimento-P.saldoLinear ''MLU'', EM.razaoSocial '+
             'from empresa EM, plaqueta P, especie E, classificacao C, saida S where EM.id = '+QuotedStr(edtIdEmp.Text)+' and C.id = '+QuotedStr(edtIdClass.Text)+' and EM.id = S.empresa_id and EM.id = P.empresa_id and P.id = S.plaqueta_id and S.empresa_id = P.empresa_id and P.especie_id = E.id = P.classificacao_id = C.id and S.dataSaida between '+QuotedStr(DateToStr(dtpDtInicial.Date))+' and '+QuotedStr(DateToStr(dtpDtFinal.Date))+' order by P.plaqueta');
             Active := True;
             ShortDateFormat := 'dd/mm/yyyy';
          end;
       end;
       If cbxTipo.Text = 'PRODU플O' then begin
          With dmVendas.ADOQuery1 do begin
             Active := False;
             SQL.Clear;
             SQL.Add('select S.dataSaida, P.plaqueta, S.tipo, E.descricao, C.descricao ''clas'', P.diametro1, P.diametro2, P.comprimento, '+
             '((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854 ''M3'', '+
             '((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854-(((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854-saldoLinear*((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*0.7854) ''M3D'', '+
             '((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854-saldoLinear*((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*0.7854 ''M3U'', P.saldoLinear ''MLD'', P.comprimento-P.saldoLinear ''MLU'', EM.razaoSocial '+
             'from empresa EM, plaqueta P, especie E, classificacao C, saida S where EM.id = '+QuotedStr(edtIdEmp.Text)+' and C.id = '+QuotedStr(edtIdClass.Text)+' and EM.id = S.empresa_id and EM.id = P.empresa_id and P.id = S.plaqueta_id and S.empresa_id = P.empresa_id and P.especie_id = E.id = P.classificacao_id = C.id and S.dataSaida between '+QuotedStr(DateToStr(dtpDtInicial.Date))+' and '+QuotedStr(DateToStr(dtpDtFinal.Date))+' and S.tipo = ''Producao'' order by P.plaqueta');
             Active := True;
             ShortDateFormat := 'dd/mm/yyyy';
          end;
       end;
       If cbxTipo.Text = 'VENDA' then begin
          With dmVendas.ADOQuery1 do begin
             Active := False;
             SQL.Clear;
             SQL.Add('select S.dataSaida, P.plaqueta, S.tipo, E.descricao, C.descricao ''clas'', P.diametro1, P.diametro2, P.comprimento, '+
             '((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854 ''M3'', '+
             '((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854-(((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854-saldoLinear*((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*0.7854) ''M3D'', '+
             '((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854-saldoLinear*((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*0.7854 ''M3U'', P.saldoLinear ''MLD'', P.comprimento-P.saldoLinear ''MLU'', EM.razaoSocial '+
             'from empresa EM, plaqueta P, especie E, classificacao C, saida S where EM.id = '+QuotedStr(edtIdEmp.Text)+' and C.id = '+QuotedStr(edtIdClass.Text)+' and EM.id = S.empresa_id and EM.id = P.empresa_id and P.id = S.plaqueta_id and S.empresa_id = P.empresa_id and P.especie_id = E.id = P.classificacao_id = C.id and S.dataSaida between '+QuotedStr(DateToStr(dtpDtInicial.Date))+' and '+QuotedStr(DateToStr(dtpDtFinal.Date))+' and S.tipo = ''Venda'' order by P.plaqueta');
             Active := True;
             ShortDateFormat := 'dd/mm/yyyy';
          end;
       end;
    end;
    If Edit1.Text = '3' then begin
       If cbxTipo.Text = 'TODOS' then begin
          With dmVendas.ADOQuery1 do begin
             Active := False;
             SQL.Clear;
             SQL.Add('select S.dataSaida, P.plaqueta, S.tipo, E.descricao, C.descricao ''clas'', P.diametro1, P.diametro2, P.comprimento, '+
             '((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854 ''M3'', '+
             '((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854-(((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854-saldoLinear*((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*0.7854) ''M3D'', '+
             '((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854-saldoLinear*((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*0.7854 ''M3U'', P.saldoLinear ''MLD'', P.comprimento-P.saldoLinear ''MLU'', EM.razaoSocial '+
             'from empresa EM, plaqueta P, especie E, classificacao C, saida S where EM.id = '+QuotedStr(edtIdEmp.Text)+' and C.id = '+QuotedStr(edtIdClass.Text)+' and E.id = '+QuotedStr(edtIdEspecie.Text)+' and EM.id = S.empresa_id and EM.id = P.empresa_id and P.id = S.plaqueta_id and S.empresa_id = P.empresa_id and P.especie_id = E.id = P.classificacao_id = C.id and S.dataSaida between '+QuotedStr(DateToStr(dtpDtInicial.Date))+' and '+QuotedStr(DateToStr(dtpDtFinal.Date))+' order by P.plaqueta');
             Active := True;
             ShortDateFormat := 'dd/mm/yyyy';
          end;
       end;
       If cbxTipo.Text = 'PRODU플O' then begin
          With dmVendas.ADOQuery1 do begin
             Active := False;
             SQL.Clear;
             SQL.Add('select S.dataSaida, P.plaqueta, S.tipo, E.descricao, C.descricao ''clas'', P.diametro1, P.diametro2, P.comprimento, '+
             '((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854 ''M3'', '+
             '((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854-(((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854-saldoLinear*((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*0.7854) ''M3D'', '+
             '((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854-saldoLinear*((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*0.7854 ''M3U'', P.saldoLinear ''MLD'', P.comprimento-P.saldoLinear ''MLU'', EM.razaoSocial '+
             'from empresa EM, plaqueta P, especie E, classificacao C, saida S where EM.id = '+QuotedStr(edtIdEmp.Text)+' and C.id = '+QuotedStr(edtIdClass.Text)+' and E.id = '+QuotedStr(edtIdEspecie.Text)+' and EM.id = S.empresa_id and EM.id = P.empresa_id and P.id = S.plaqueta_id and S.empresa_id = P.empresa_id and P.especie_id = E.id = P.classificacao_id = C.id and S.dataSaida between '+QuotedStr(DateToStr(dtpDtInicial.Date))+' and '+QuotedStr(DateToStr(dtpDtFinal.Date))+' and S.tipo = ''Producao'' order by P.plaqueta');
             Active := True;
             ShortDateFormat := 'dd/mm/yyyy';
          end;
       end;
       If cbxTipo.Text = 'VENDA' then begin
          With dmVendas.ADOQuery1 do begin
             Active := False;
             SQL.Clear;
             SQL.Add('select S.dataSaida, P.plaqueta, S.tipo, E.descricao, C.descricao ''clas'', P.diametro1, P.diametro2, P.comprimento, '+
             '((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854 ''M3'', '+
             '((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854-(((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854-saldoLinear*((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*0.7854) ''M3D'', '+
             '((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854-saldoLinear*((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*0.7854 ''M3U'', P.saldoLinear ''MLD'', P.comprimento-P.saldoLinear ''MLU'', EM.razaoSocial '+
             'from empresa EM, plaqueta P, especie E, classificacao C, saida S where EM.id = '+QuotedStr(edtIdEmp.Text)+' and C.id = '+QuotedStr(edtIdClass.Text)+' and E.id = '+QuotedStr(edtIdEspecie.Text)+' and EM.id = S.empresa_id and EM.id = P.empresa_id and P.id = S.plaqueta_id and S.empresa_id = P.empresa_id and P.especie_id = E.id = P.classificacao_id = C.id and S.dataSaida between '+QuotedStr(DateToStr(dtpDtInicial.Date))+' and '+QuotedStr(DateToStr(dtpDtFinal.Date))+' and S.tipo = ''Venda'' order by P.plaqueta');
             Active := True;
             ShortDateFormat := 'dd/mm/yyyy';
          end;
       end;
    end;
    Try
      Application.CreateForm(TfrmImprimeSaida, frmImprimeSaida);
      frmImprimeSaida.QRLabel10.Caption := DateToStr(dtpDtInicial.Date);
      frmImprimeSaida.QRLabel12.Caption := DateToStr(dtpDtFinal.Date);
      frmImprimeSaida.qrpSaida.Preview;
    Finally
         frmImprimeSaida.Free;
    end;
end;

procedure TfrmEmisRelSaida.cbxEmpresaChange(Sender: TObject);
begin
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select Id from empresa where razaoSocial = '+QuotedStr(cbxEmpresa.Text)+'');
       Active := True;
       edtIdEmp.Text := FieldByName('id').AsString;
    end;
end;

procedure TfrmEmisRelSaida.cbxEspecieChange(Sender: TObject);
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

procedure TfrmEmisRelSaida.cbxClassChange(Sender: TObject);
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

procedure TfrmEmisRelSaida.cbxEmpresaEnter(Sender: TObject);
begin
    Edit1.Text := '0';
end;

procedure TfrmEmisRelSaida.cbxEspecieEnter(Sender: TObject);
begin
    Edit1.Text := '1';
end;

procedure TfrmEmisRelSaida.cbxClassEnter(Sender: TObject);
begin
    Edit1.Text := '2';
end;

procedure TfrmEmisRelSaida.cbxClassExit(Sender: TObject);
begin
    If edtIdEspecie.Text <> '0' then
       Edit1.Text := '3';
end;

end.
