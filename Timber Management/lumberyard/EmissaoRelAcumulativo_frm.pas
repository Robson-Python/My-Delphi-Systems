unit EmissaoRelAcumulativo_frm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, DB, ADODB, ExtCtrls;

type
  TfrmEmissaoRelAcumulativo = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox7: TGroupBox;
    Label6: TLabel;
    cbxEmpEstoq: TComboBox;
    edtIdEmp: TEdit;
    GroupBox2: TGroupBox;
    btnFechar: TBitBtn;
    btnImprimir: TBitBtn;
    Label1: TLabel;
    cbxMes: TComboBox;
    edtAno: TLabeledEdit;
    procedure btnFecharClick(Sender: TObject);
    procedure cbxEmpEstoqChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEmissaoRelAcumulativo: TfrmEmissaoRelAcumulativo;

implementation

uses Carro_Comando_dm, ImprimeCompra_frm;

{$R *.dfm}

procedure TfrmEmissaoRelAcumulativo.btnFecharClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmEmissaoRelAcumulativo.cbxEmpEstoqChange(Sender: TObject);
begin
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select Id from empresa where razaoSocial = '+QuotedStr(cbxEmpEstoq.Text)+'');
       Active := True;
       edtIdEmp.Text := FieldByName('id').AsString;
    end;
end;

procedure TfrmEmissaoRelAcumulativo.FormCreate(Sender: TObject);
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

procedure TfrmEmissaoRelAcumulativo.FormShow(Sender: TObject);
begin
    cbxMes.SetFocus;
end;

procedure TfrmEmissaoRelAcumulativo.btnImprimirClick(Sender: TObject);
begin
    With dmVendas.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('select EA.*, E.descricao from estoque_acumulativo EA, especie E where EA.empresa_id = '+QuotedStr(edtIdEmp.Text)+' and EA.ea_periodo = '+QuotedStr(cbxMes.Text+' '+edtAno.Text)+' and E.id = EA.especie_id order by E.descricao');
       Active := True;
    end;
    Try
      Application.CreateForm(TfrmReltCompra, frmReltCompra);
      frmReltCompra.QRLabel14.Caption := cbxEmpEstoq.Text;
      frmReltCompra.qrpEstoque.Preview;
    Finally
         frmReltCompra.Free;
    end;
end;


end.
