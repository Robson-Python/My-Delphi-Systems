unit Cad_Veiculo_frm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, StdCtrls, ComCtrls, Mask, ExtDlgs, Jpeg;

type
  TfrmCadVeiculo = class(TForm)
    Panel1: TPanel;
    btnInserir: TSpeedButton;
    btnSelecionar: TSpeedButton;
    btnAtualizar: TSpeedButton;
    btnDeletar: TSpeedButton;
    btnLimpar: TSpeedButton;
    btnSair: TSpeedButton;
    GroupBox1: TGroupBox;
    edtPlaca: TLabeledEdit;
    edtMarca: TLabeledEdit;
    edtEspcTipo: TLabeledEdit;
    edtCor: TLabeledEdit;
    edtRenavam: TLabeledEdit;
    edtCidEmplac: TLabeledEdit;
    dtpDtAquisi: TDateTimePicker;
    lblDtAquisi: TLabel;
    edtKmInic: TLabeledEdit;
    edtProp: TLabeledEdit;
    edtEnd: TLabeledEdit;
    edtBairro: TLabeledEdit;
    edtCid: TLabeledEdit;
    cbxUf: TComboBox;
    lblUf: TLabel;
    edtKmFin: TLabeledEdit;
    cbxModel: TComboBox;
    lblModel: TLabel;
    mkeAno: TMaskEdit;
    lblAno: TLabel;
    mkeCpf: TMaskEdit;
    lblCpf: TLabel;
    mkeCep: TMaskEdit;
    lblCep: TLabel;
    edtKmParc: TLabeledEdit;
    cbxComb: TComboBox;
    lblComb: TLabel;
    Shape1: TShape;
    btnFoto: TBitBtn;
    OpenPictureDialog1: TOpenPictureDialog;
    Shape2: TShape;
    Panel2: TPanel;
    Image1: TImage;
    btnRemover: TBitBtn;
    procedure btnSairClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure edtPlacaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbxModelKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnAtualizarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure edtKmFinExit(Sender: TObject);
    procedure btnFotoClick(Sender: TObject);
    procedure btnRemoverClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadVeiculo: TfrmCadVeiculo;

implementation

uses Carro_Comando_dm, ADODB, DB, DateUtils, Principal_frm;

{$R *.dfm}

function fConvertImagem() : String;
var valor : String;
    tamanho, i : Integer;
begin
    valor := frmCadVeiculo.OpenPictureDialog1.FileName;
    tamanho := Length(valor);
    for i := 0 to tamanho do begin
    If valor[i] = '\' then
       valor[i] := '/'
    else
       if valor[i] = '/' then
          valor[i] := '\';
    end;
    frmCadVeiculo.OpenPictureDialog1.FileName := valor;
end;

procedure TfrmCadVeiculo.btnSairClick(Sender: TObject);
begin
    dmCarroComando.ADOQuery1.SQL.Clear;
    Close;
end;

procedure TfrmCadVeiculo.btnLimparClick(Sender: TObject);
begin
    edtPlaca.Clear; edtMarca.Clear; cbxModel.Clear; mkeAno.Clear; edtEspcTipo.Clear;
    edtCor.Clear; edtRenavam.Clear; edtCidEmplac.Clear; edtKmInic.Text := '0';
    edtProp.Clear; mkeCpf.Clear; edtEnd.Clear; edtBairro.Clear; edtCid.Clear; mkeCep.Clear;
    edtKmFin.Text := '0'; cbxUf.ClearSelection; dtpDtAquisi.Date := Date; edtKmParc.Text := '0';
    cbxModel.Clear; cbxComb.Text := ''; cbxUf.Text := '';
    Image1.Picture.Assign(nil);
    FormCreate(Sender);
    edtPlaca.SetFocus;
    dmCarroComando.ADOQuery1.SQL.Clear;
end;

procedure TfrmCadVeiculo.FormShow(Sender: TObject);
begin
    edtPlaca.SetFocus;
    dtpDtAquisi.Date := Date;
    edtKmInic.Text := '0';
    edtKmFin.Text := '0';
    edtKmParc.Text := '0';
end;

procedure TfrmCadVeiculo.FormCreate(Sender: TObject);
begin
    With dmCarroComando.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select * from carros order by modelo');
       Active := True;
       while not Eof do begin
          cbxModel.Items.Add(FieldByName('modelo').AsString);
          Next;
       end;
    end;
end;

procedure TfrmCadVeiculo.btnInserirClick(Sender: TObject);
begin
    DateSeparator := '/';
    ShortDateFormat := 'yyyy-mm-dd';
    If edtPlaca.Text <> '' then begin
       If frmPrincipal.StatusBar1.Panels[2].Text = 'Nível:Alto' then begin
          With dmCarroComando.ADOQuery1 do begin
             Active := False;
             SQL.Clear;
             SQL.Add('Insert into carros (placa, marca, modelo, ano, esp_tipo, combs, cor, renav, cid_pl, dt_aquis, km_ini, prop, cpf_prop, ender, bai, cid, uf, cep, km_fin, km_parc, foto) Values ('+QuotedStr(edtPlaca.Text)+','+QuotedStr(edtMarca.Text)+','+ QuotedStr(cbxModel.Text)+','+ QuotedStr(mkeAno.Text)+','+ QuotedStr(edtEspcTipo.Text)+','+ QuotedStr(cbxComb.Text)+','+ QuotedStr(edtCor.Text)+','+ QuotedStr(edtRenavam.Text)+','+ QuotedStr(edtCidEmplac.Text)+','+ QuotedStr(DateToStr(dtpDtAquisi.Date))+','+ QuotedStr(edtKmInic.Text)+','+ QuotedStr(edtProp.Text)+','+ QuotedStr(mkeCpf.Text)+','+ QuotedStr(edtEnd.Text)+','+ QuotedStr(edtBairro.Text)+','+ QuotedStr(edtCid.Text)+','+ QuotedStr(cbxUf.Text)+','+ QuotedStr(mkeCep.Text)+','+ QuotedStr(edtKmFin.Text)+', '+QuotedStr(edtKmParc.Text)+', null)');
             ExecSQL;
             ShortDateFormat := 'dd/mm/yyyy';
             Application.MessageBox('Registro Efetuado com Sucesso!','Carro Comando - Sucesso',MB_OK+MB_ICONINFORMATION);
             btnLimparClick(Sender);
          end;
       end
       else begin
          Application.MessageBox('Seu nível de acesso é Baixo. Você não tem permissão para executar esse comando!','Carro Comando - Atenção',MB_OK+MB_ICONSTOP);
      end;
    end
    else begin
       Application.MessageBox('O campo Placa não pode estar vazio!','Carro Comando - Atenção',MB_OK+MB_ICONWARNING);
    end;
end;

procedure TfrmCadVeiculo.btnSelecionarClick(Sender: TObject);
var fFoto : TStream;
    Jpeg : TJPEGImage;
begin
    Jpeg := nil;
    If cbxModel.Text <> '' then begin
       With dmCarroComando.ADOQuery1 do begin
          Active := False;
          SQL.Clear;
          SQL.Add('Select * from carros where modelo = '+ QuotedStr(cbxModel.Text));
          Active := True;
          If RecordCount = 0 then begin
             Application.MessageBox('Registro não encontrado...','Carro Comando - Informação',MB_OK+MB_ICONINFORMATION);
             btnLimparClick(Sender);
             cbxModel.SetFocus;
          end
          else begin
             edtPlaca.Text := FieldByName ('placa').AsString;
             edtMarca.Text := FieldByName ('marca').AsString;
             cbxModel.Text := FieldByName ('modelo').AsString;
             mkeAno.Text := FieldByName ('ano').AsString;
             edtEspcTipo.Text := FieldByName ('esp_tipo').AsString;
             cbxComb.Text := FieldByName ('combs').AsString;
             edtCor.Text := FieldByName ('cor').AsString;
             edtRenavam.Text := FieldByName ('renav').AsString;
             edtCidEmplac.Text := FieldByName ('cid_pl').AsString;
             dtpDtAquisi.Date := FieldByName ('dt_aquis').AsDateTime;
             edtKmInic.Text := FieldByName ('km_ini').AsString;
             edtProp.Text := FieldByName ('prop').AsString;
             mkeCpf.Text := FieldByName ('cpf_prop').AsString;
             edtEnd.Text := FieldByName ('ender').AsString;
             edtBairro.Text := FieldByName ('bai').AsString;
             edtCid.Text := FieldByName ('cid').AsString;
             cbxUf.Text := FieldByName ('uf').AsString;
             mkeCep.Text := FieldByName ('cep').AsString;
             edtKmFin.Text := FieldByName ('km_fin').AsString;
             edtKmParc.Text := FieldByName('km_parc').AsString;
             fFoto := CreateBlobStream(FieldByName('foto'),bmRead);
             If fFoto.Size > 0 then begin
                Jpeg := TJPEGImage.Create;
                Jpeg.LoadFromStream(fFoto);
                Image1.Picture.Assign(Jpeg);
             end
             else begin
                Image1.Picture.Assign(nil);
             end;
             Jpeg.Free;
             fFoto.Destroy;
          end;
       end;
    end
    else begin
       Application.MessageBox('Selcione o modelo do veículo.','Carro Comando - Atenção',MB_OK+MB_ICONWARNING);
    end;
end;

procedure TfrmCadVeiculo.edtPlacaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var fFoto : TStream;
    Jpeg : TJPEGImage;
begin
    If Key = VK_RETURN then begin
       Jpeg := nil;
       If edtPlaca.Text <> '' then begin
           With dmCarroComando.ADOQuery1 do begin
              Active := False;
              SQL.Clear;
              SQL.Add('Select * from carros where placa = '+ QuotedStr(edtPlaca.Text));
              Active := True;
              If RecordCount = 0 then begin
                 Application.MessageBox('Registro não encontrado...','Carro Comando - Informação',MB_OK+MB_ICONINFORMATION);
                 cbxModel.SetFocus;
              end
              else begin
                 edtPlaca.Text := FieldByName ('placa').AsString;
                 edtMarca.Text := FieldByName ('marca').AsString;
                 cbxModel.Text := FieldByName ('modelo').AsString;
                 mkeAno.Text := FieldByName ('ano').AsString;
                 edtEspcTipo.Text := FieldByName ('esp_tipo').AsString;
                 cbxComb.Text := FieldByName ('combs').AsString;
                 edtCor.Text := FieldByName ('cor').AsString;
                 edtRenavam.Text := FieldByName ('renav').AsString;
                 edtCidEmplac.Text := FieldByName ('cid_pl').AsString;
                 dtpDtAquisi.Date := FieldByName ('dt_aquis').AsDateTime;
                 edtKmInic.Text := FieldByName ('km_ini').AsString;
                 edtProp.Text := FieldByName ('prop').AsString;
                 mkeCpf.Text := FieldByName ('cpf_prop').AsString;
                 edtEnd.Text := FieldByName ('ender').AsString;
                 edtBairro.Text := FieldByName ('bai').AsString;
                 edtCid.Text := FieldByName ('cid').AsString;
                 cbxUf.Text := FieldByName ('uf').AsString;
                 mkeCep.Text := FieldByName ('cep').AsString;
                 edtKmFin.Text := FieldByName ('km_fin').AsString;
                 edtKmParc.Text := FieldByName('km_parc').AsString;
                 fFoto := CreateBlobStream(FieldByName('foto'),bmRead);
                 If fFoto.Size > 0 then begin
                    Jpeg := TJPEGImage.Create;
                    Jpeg.LoadFromStream(fFoto);
                    Image1.Picture.Assign(Jpeg);
                 end
                 else begin
                    Image1.Picture.Assign(nil);
                 end;
                 Jpeg.Free;
                 fFoto.Destroy;
              end;
           end;
       end
       else begin
          Application.MessageBox('Digite o número da Placa.','Carro Comando - Atenção',MB_OK+MB_ICONWARNING);
       end;
    end;
end;

procedure TfrmCadVeiculo.cbxModelKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    If (Key = VK_RETURN) then
       btnSelecionarClick(Sender);
end;

procedure TfrmCadVeiculo.btnAtualizarClick(Sender: TObject);
begin
    DateSeparator := '/';
    ShortDateFormat := 'yyyy-mm-dd';
    If edtPlaca.Text <> '' then begin
       If frmPrincipal.StatusBar1.Panels[2].Text = 'Nível:Alto' then begin
          With dmCarroComando.ADOQuery1 do begin
             Active := False;
             SQL.Clear;
             SQL.Add('Update carros set placa = '+ QuotedStr(edtPlaca.Text)+', marca = '+ QuotedStr(edtMarca.Text)+', modelo = '+ QuotedStr(cbxModel.Text)+', ano = '+ QuotedStr(mkeAno.Text)+', esp_tipo = '+ QuotedStr(edtEspcTipo.Text)+', combs = '+ QuotedStr(cbxComb.Text)+', cor = '+ QuotedStr(edtCor.Text)+', renav = '+ QuotedStr(edtRenavam.Text)+', cid_pl = '+ QuotedStr(edtCidEmplac.Text)+', dt_aquis = '+ QuotedStr(DateToStr(dtpDtAquisi.Date))+', km_ini = '+ QuotedStr(edtKmInic.Text)+', prop = '+ QuotedStr(edtProp.Text)+', cpf_prop = '+ QuotedStr(mkeCpf.Text)+', ender = '+ QuotedStr(edtEnd.Text)+', bai = '+ QuotedStr(edtBairro.Text)+', cid = '+QuotedStr(edtCid.Text)+', uf = '+ QuotedStr(cbxUf.Text)+', cep = '+ QuotedStr(mkeCep.Text)+', km_fin = '+ QuotedStr(edtKmFin.Text)+', km_parc = '+QuotedStr(edtKmParc.Text)+' where placa = '+QuotedStr(edtPlaca.Text)+'');
             ExecSQL;
             ShortDateFormat := 'dd/mm/yyyy';
             Application.MessageBox('Registro Atualizado com Sucesso!','Carro Comando - Sucesso',MB_OK+MB_ICONINFORMATION);
             btnSelecionarClick(Sender);
          end;
       end
       else begin
          Application.MessageBox('Seu nível de acesso é Baixo. Você não tem permissão para executar esse comando!','Carro Comando - Atenção',MB_OK+MB_ICONSTOP);
       end;
    end
    else begin
       Application.MessageBox('O campo placa não pode ser vazio! Selecione um veículo para atualizar dados.','CarroComando - Atenção',MB_OK+MB_ICONWARNING);
    end;
end;

procedure TfrmCadVeiculo.btnDeletarClick(Sender: TObject);
begin
    If edtPlaca.Text <> '' then begin
       If frmPrincipal.StatusBar1.Panels[2].Text = 'Nível:Alto' then begin
          If Application.MessageBox('Excluir Registro?','Carro Comando - Confirmação de Exclusão',MB_YESNO+MB_ICONEXCLAMATION) = ID_YES then begin
             With dmCarroComando.ADOQuery1 do begin
                Active := False;
                SQL.Clear;
                SQL.Add('Delete from carros where placa = '+ QuotedStr(edtPlaca.Text)+'');
                ExecSQL;
                Application.MessageBox('Registro Deletado com Sucesso!','Carro Comando - Sucesso',MB_OK+MB_ICONINFORMATION);
                btnLimparClick(Sender);
                FormShow(Sender);
             end;
          end;
       end
       else begin
          Application.MessageBox('Seu nível de acesso é Baixo. Você não tem permissão para executar esse comando!','Carro Comando - Atenção',MB_OK+MB_ICONSTOP);
       end;
    end
    else begin
       Application.MessageBox('O campo placa não pode ser vazio! Selecione um veículo para poder deletar.','CarroComando - Atenção',MB_OK+MB_ICONWARNING);
    end;
end;

procedure TfrmCadVeiculo.edtKmFinExit(Sender: TObject);
var vKmIni, vKmFin : Double;
begin
    If StrToFloat(edtKmFin.Text) <> 0 then begin
       vKmIni := StrToFloat(edtKmInic.Text);
       vKmFin := StrToFloat(edtKmFin.Text);
       edtKmParc.Text := FloatToStr(vKmFin - vKmIni);
    end;
end;

procedure TfrmCadVeiculo.btnFotoClick(Sender: TObject);
var iImagem : String;
begin
    If frmPrincipal.StatusBar1.Panels[2].Text = 'Nível:Alto' then begin
       If edtPlaca.Text <> '' then begin
          If OpenPictureDialog1.Execute then begin
             Image1.Picture.LoadFromFile(OpenPictureDialog1.FileName);
             fConvertImagem;
             iImagem := OpenPictureDialog1.FileName;
             With dmCarroComando.ADOQuery1 do begin
                Active := False;
                SQL.Clear;
                SQL.Add('Update carros set foto = LOAD_FILE('+QuotedStr(iImagem)+') where placa = '+QuotedStr(edtPlaca.Text)+'');
                ExecSQL;
             end;
             fConvertImagem;
          end;
       end
       else begin
          Application.MessageBox('Os campos não podem ser vazios! Selecione um registro para carregar a foto...','Carro Comando - Atenção',MB_OK+MB_ICONERROR);
       end;
    end
    else begin
       Application.MessageBox('Seu nível de acesso é Baixo. Você não tem permissão para executar esse comando!','Carro Comando - Atenção',MB_OK+MB_ICONSTOP);
    end;
end;

procedure TfrmCadVeiculo.btnRemoverClick(Sender: TObject);
begin
    If frmPrincipal.StatusBar1.Panels[2].Text = 'Nível:Alto' then begin
       If edtPlaca.Text <> '' then begin
          With dmCarroComando.ADOQuery1 do begin
             Active := False;
             SQL.Clear;
             SQL.Add('Update carros set foto = null where placa = '+QuotedStr(edtPlaca.Text)+'');
             ExecSQL;
             Image1.Picture.Assign(nil);
          end;
       end
       else begin
          Application.MessageBox('Os campos não podem ser vazios! Selecione um registro para remover a foto...','Carro Comando - Atenção',MB_OK+MB_ICONERROR);
       end;
    end
    else begin
       Application.MessageBox('Seu nível de acesso é Baixo. Você não tem permissão para executar esse comando!','Carro Comando - Atenção',MB_OK+MB_ICONSTOP);
    end;
end;

end.
