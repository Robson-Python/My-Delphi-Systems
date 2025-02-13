unit EmissEstoq_frm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, DB, ADODB;

type
  TfrmEmisEstoq = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox7: TGroupBox;
    Label6: TLabel;
    cbxEmpEstoq: TComboBox;
    edtIdEmp: TEdit;
    btnFechar: TBitBtn;
    btnImprimir: TBitBtn;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    procedure btnFecharClick(Sender: TObject);
    procedure cbxEmpEstoqChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEmisEstoq: TfrmEmisEstoq;

implementation

uses Carro_Comando_dm, ImprimeEstoque_frm;

{$R *.dfm}

procedure TfrmEmisEstoq.btnFecharClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmEmisEstoq.cbxEmpEstoqChange(Sender: TObject);
begin
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select Id from empresa where razaoSocial = '+QuotedStr(cbxEmpEstoq.Text)+'');
       Active := True;
       edtIdEmp.Text := FieldByName('id').AsString;
    end;
end;

procedure TfrmEmisEstoq.FormCreate(Sender: TObject);
begin
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select * from empresa order by razaoSocial');
       Active := True;
       while not Eof do begin
          cbxEmpEstoq.Items.Add(FieldByName('razaoSocial').AsString);
          Next;
       end;
    end;
end;

procedure TfrmEmisEstoq.btnImprimirClick(Sender: TObject);
begin
    DateSeparator := '/';
    ShortDateFormat := 'yyyy-mm-dd';
       With dmVendas.ADOQuery1 do begin
          Active := False;
          SQL.Clear;
          SQL.Add('select EM.razaoSocial, ES.id, ES.descricao, sum(((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854) ''entrada'', '+
          'sum(((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854-saldoLinear*((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*0.7854) ''utilizado'', '+
          'sum(((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854)-sum(((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*comprimento*0.7854-saldoLinear*((diametro1+diametro2)/2)*((diametro1+diametro2)/2)*0.7854) ''disponivel'' '+
          'from empresa EM, especie ES, plaqueta P where EM.id = '+QuotedStr(edtIdEmp.Text)+' and P.dataEntrada between '+QuotedStr(DateToStr(DateTimePicker1.Date))+' and '+QuotedStr(DateToStr(DateTimePicker2.Date))+' and P.empresa_id = EM.id and P.especie_id = ES.id group by ES.id');
          Active := True;
          ShortDateFormat := 'dd/mm/yyyy';
       end;
       Try
         Application.CreateForm(TfrmImprimeEstoq, frmImprimeEstoq);
         frmImprimeEstoq.QRLabel4.Caption := DateToStr(DateTimePicker1.Date);
         frmImprimeEstoq.QRLabel12.Caption := DateToStr(DateTimePicker2.Date);
         frmImprimeEstoq.qrpEstoque.Preview;
       Finally
            frmImprimeEstoq.Free;
       end;
end;

procedure TfrmEmisEstoq.FormShow(Sender: TObject);
begin
    DateTimePicker1.Date := Date;
    DateTimePicker2.Date := Date + 30;
end;

end.
