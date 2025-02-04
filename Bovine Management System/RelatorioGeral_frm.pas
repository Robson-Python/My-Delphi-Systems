unit RelatorioGeral_frm;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, Jpeg;

type
  TqrpRelatorioGeral = class(TQuickRep)
    PageHeaderBand2: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    qrlDataIni: TQRLabel;
    QRLabel4: TQRLabel;
    qrlUsuario: TQRLabel;
    QRImage1: TQRImage;
    qrlDataFim: TQRLabel;
    PageFooterBand1: TQRBand;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    DetailBand1: TQRBand;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel20: TQRLabel;
    qrlValor9: TQRLabel;
    qrlValor12: TQRLabel;
    qrlValor15: TQRLabel;
    qrlValor21: TQRLabel;
    qrlValor10: TQRLabel;
    qrlValor13: TQRLabel;
    qrlValor16: TQRLabel;
    qrlValor22: TQRLabel;
    qrlValor11: TQRLabel;
    qrlValor14: TQRLabel;
    qrlValor17: TQRLabel;
    qrlValor23: TQRLabel;
    qrValor18: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    qrlValor27: TQRLabel;
    QRLabel30: TQRLabel;
    qrlValor30: TQRLabel;
    QRLabel32: TQRLabel;
    qrlValor36: TQRLabel;
    qrlValor28: TQRLabel;
    qrlValor31: TQRLabel;
    qrlValor37: TQRLabel;
    qrlValor38: TQRLabel;
    qrlValor32: TQRLabel;
    qrlValor29: TQRLabel;
    QRLabel46: TQRLabel;
    QRLabel47: TQRLabel;
    QRLabel52: TQRLabel;
    QRLabel53: TQRLabel;
    QRShape2: TQRShape;
    QRShape1: TQRShape;
    QRLabel55: TQRLabel;
    qrlValor24: TQRLabel;
    qrlValor25: TQRLabel;
    qrlValor26: TQRLabel;
    QRLabel16: TQRLabel;
    qrlValor6: TQRLabel;
    qrlValor7: TQRLabel;
    qrlValor8: TQRLabel;
    QRLabel18: TQRLabel;
    qrlValor18: TQRLabel;
    qrlValor19: TQRLabel;
    qrlValor20: TQRLabel;
    QRLabel27: TQRLabel;
    qrlValor33: TQRLabel;
    qrlValor34: TQRLabel;
    qrlValor35: TQRLabel;
    QRBand1: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    qrValor1: TQRLabel;
    qrValor2: TQRLabel;
    qrValor3: TQRLabel;
    qrValor4: TQRLabel;
    qrValor5: TQRLabel;
    QRLabel54: TQRLabel;
    QRLabel19: TQRLabel;
    qrValor6: TQRLabel;
    QRSubDetail1: TQRSubDetail;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel17: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRLabel24: TQRLabel;
    QRLabel28: TQRLabel;
    qrValor7: TQRLabel;
    QRLabel29: TQRLabel;
    procedure QuickRepStartPage(Sender: TCustomQuickRep);
  private

  public

  end;

var
  qrpRelatorioGeral: TqrpRelatorioGeral;

implementation

uses Carro_Comando_dm, DB, ADODB, Impressao_frm;

{$R *.DFM}

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

procedure TqrpRelatorioGeral.QuickRepStartPage(Sender: TCustomQuickRep);
var fFoto : TStream;
    Jpeg : TJPEGImage;
    vEntrada, vDespesa, vAlimento, vSaida, vArrobaEntrada, vArrobaSaida, vArroba : Double;
    vAno, vControle : String;
begin
    vAno := AnoConfinamento;
    vControle := Controle;
    DateSeparator := '/';
    ShortDateFormat := 'yyyy-mm-dd';
    With dmCarroComando.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('Select usuario, foto from registro where codigo = 1');
       Active := True;
       fFoto := CreateBlobStream(FieldByName('foto'),bmRead);
       If fFoto.Size > 0 then begin
          Jpeg := TJPEGImage.Create;
          Jpeg.LoadFromStream(fFoto);
          QRImage1.Picture.Assign(Jpeg);
       end
       else begin
          QRImage1.Picture.Assign(nil);
       end;
       Jpeg.Free;
       fFoto.Destroy;
       qrlUsuario.Caption := FieldByName('usuario').AsString;
    end;
    With dmCarroComando.ADOQuery1 do begin
       Active := False;
       SQL.Clear;
       SQL.Add('select sum(ea_valorgeral) from entrada_animais where ea_data between '+QuotedStr(DateToStr(frmImpressao.dtpInic.Date))+' and '+QuotedStr(DateToStr(frmImpressao.dtpFin.Date))+' and ea_ano = '+QuotedStr(vAno)+' and ea_controle = '+QuotedStr(vControle)+'');
       Active := True;
       If FieldByName('sum(ea_valorgeral)').AsFloat <> 0 then begin
          qrValor1.Caption := Fieldbyname('sum(ea_valorgeral)').AsString;
       end
       else begin
          qrValor1.Caption := '0';
       end;
       Active := False;
       SQL.Clear;
       SQL.Add('Select sum(d_valor) from despesas where d_data between '+QuotedStr(DateToStr(frmImpressao.dtpInic.Date))+' and '+QuotedStr(DateToStr(frmImpressao.dtpFin.Date))+' and d_ano = '+QuotedStr(vAno)+' and d_controle = '+QuotedStr(vControle)+'');
       Active := True;
       If FieldByName('sum(d_valor)').AsFloat <> 0 then begin
          qrValor2.Caption := Fieldbyname('sum(d_valor)').AsString;
       end
       else begin
          qrValor2.Caption := '0';
       end;
       Active := False;
       SQL.Clear;
       SQL.Add('select sum(dt_vltotal) ''valor'', sum(dt_qtdtotal) ''qtd'' from dieta where dt_data between '+QuotedStr(DateToStr(frmImpressao.dtpInic.Date))+' and '+QuotedStr(DateToStr(frmImpressao.dtpFin.Date))+' and dt_ano = '+QuotedStr(vAno)+' and dt_controle = '+QuotedStr(vControle)+'');
//       SQL.Add('select sum(a_valor) from alimentos where a_dataini between '+QuotedStr(DateToStr(frmImpressao.dtpInic.Date))+' and '+QuotedStr(DateToStr(frmImpressao.dtpFin.Date))+'');
       Active := True;
       If FieldByName('valor').AsFloat <> 0 then begin
          qrValor3.Caption := Fieldbyname('valor').AsString;
          qrValor7.Caption := Fieldbyname('qtd').AsString;
       end
       else begin
          qrValor3.Caption := '0';
          qrValor7.Caption := '0';
       end;
       Active := False;
       SQL.Clear;
       SQL.Add('select sum(sa_totalgeralarroba) from saida_animais where sa_data between '+QuotedStr(DateToStr(frmImpressao.dtpInic.Date))+' and '+QuotedStr(DateToStr(frmImpressao.dtpFin.Date))+' and sa_ano = '+QuotedStr(vAno)+' and sa_controle = '+QuotedStr(vControle)+'');
       Active := True;
       If FieldByName('sum(sa_totalgeralarroba)').AsFloat <> 0 then begin
          qrValor4.Caption := Fieldbyname('sum(sa_totalgeralarroba)').AsString;
       end
       else begin
          qrValor4.Caption := '0';
       end;
       vEntrada := StrToFloat(qrValor1.Caption);
       vDespesa := StrToFloat(qrValor2.Caption);
       vAlimento := StrToFloat(qrValor3.Caption);
       vSaida := StrToFloat(qrValor4.Caption);
       qrValor6.Caption := FloatToStr(vEntrada+vDespesa+vAlimento);
       qrValor5.Caption := FloatToStr(vSaida-(vEntrada+vDespesa+vAlimento));
       Active := False;
       SQL.Clear;
       SQL.Add('select sum(sa_qtdboi), sum(sa_qtdvaca), sum(sa_qtdnovilha) from saida_animais where sa_data between '+QuotedStr(DateToStr(frmImpressao.dtpInic.Date))+' and '+QuotedStr(DateToStr(frmImpressao.dtpFin.Date))+' and sa_ano = '+QuotedStr(vAno)+' and sa_controle = '+QuotedStr(vControle)+'');
       Active := True;
       qrlValor6.Caption := Fieldbyname('sum(sa_qtdboi)').AsString;
       qrlValor7.Caption := Fieldbyname('sum(sa_qtdvaca)').AsString;
       qrlValor8.Caption := Fieldbyname('sum(sa_qtdnovilha)').AsString;
       Active := False;
       SQL.Clear;
       SQL.Add('select replace(format(sum(replace(sa_arrobafrigoboi, ",", ".")),2), ".", ",") ''Boi'', replace(format(sum(replace(sa_arrobafrigovaca, ",", ".")),2), ".", ",") ''Vaca'', replace(format(sum(replace(sa_arrobafrigonovilha, ",", ".")),2), ".", ",") ''Novi'' '+
       'from saida_animais where sa_data between '+QuotedStr(DateToStr(frmImpressao.dtpInic.Date))+' and '+QuotedStr(DateToStr(frmImpressao.dtpFin.Date))+' and sa_ano = '+QuotedStr(vAno)+' and sa_controle = '+QuotedStr(vControle)+'');
       Active := True;
       qrlValor9.Caption := Fieldbyname('Boi').AsString;
       qrlValor10.Caption := Fieldbyname('Vaca').AsString;
       qrlValor11.Caption := Fieldbyname('Novi').AsString;
       Active := False;
       SQL.Clear;
       SQL.Add('select replace(format(sum(sa_pesofrigoboi)/sum(sa_pesoboi)*100,2), ".", ",") ''Boi'', replace(format(sum(sa_pesofrigovaca)/sum(sa_pesovaca)*100,2), ".", ",") ''Vaca'', replace(format(sum(sa_pesofrigonovilha)/sum(sa_pesonovilha)*100,2), ".", ",") ''Novi'' '+
       'from saida_animais where sa_data between '+QuotedStr(DateToStr(frmImpressao.dtpInic.Date))+' and '+QuotedStr(DateToStr(frmImpressao.dtpFin.Date))+' and sa_ano = '+QuotedStr(vAno)+' and sa_controle = '+QuotedStr(vControle)+'');
       Active := True;
       qrlValor12.Caption := Fieldbyname('Boi').AsString;
       qrlValor13.Caption := Fieldbyname('Vaca').AsString;
       qrlValor14.Caption := Fieldbyname('Novi').AsString;
       Active := False;
       SQL.Clear;
       SQL.Add('select replace(format(sum(sa_arrobafrigoboi)/sum(sa_qtdboi),2), ".", ",") ''Boi'', replace(format(sum(sa_arrobafrigovaca)/sum(sa_qtdvaca),2), ".", ",") ''Vaca'', replace(format(sum(sa_arrobafrigonovilha)/sum(sa_qtdnovilha),2), ".", ",") ''Novi'' '+
       'from saida_animais where sa_data between '+QuotedStr(DateToStr(frmImpressao.dtpInic.Date))+' and '+QuotedStr(DateToStr(frmImpressao.dtpFin.Date))+' and sa_ano = '+QuotedStr(vAno)+' and sa_controle = '+QuotedStr(vControle)+'');
       Active := True;
       qrlValor15.Caption := Fieldbyname('Boi').AsString;
       qrlValor16.Caption := Fieldbyname('Vaca').AsString;
       qrlValor17.Caption := Fieldbyname('Novi').AsString;
       Active := False;
       SQL.Clear;
       SQL.Add('select replace(format(sum(sa_pesototalboi)/sum(sa_arrobafrigoboi),2), ".", ",") ''Boi'' from saida_animais where sa_valorarrobaboi <> 0 and sa_data between '+QuotedStr(DateToStr(frmImpressao.dtpInic.Date))+' and '+QuotedStr(DateToStr(frmImpressao.dtpFin.Date))+' and sa_ano = '+QuotedStr(vAno)+' and sa_controle = '+QuotedStr(vControle)+'');
       Active := True;
       qrlValor18.Caption := Fieldbyname('Boi').AsString;
       Active := False;
       SQL.Clear;
       SQL.Add('select replace(format(sum(sa_pesototalvaca)/sum(sa_arrobafrigovaca),2), ".", ",") ''Vaca'' from saida_animais where sa_valorarrobavaca <> 0 and sa_data between '+QuotedStr(DateToStr(frmImpressao.dtpInic.Date))+' and '+QuotedStr(DateToStr(frmImpressao.dtpFin.Date))+' and sa_ano = '+QuotedStr(vAno)+' and sa_controle = '+QuotedStr(vControle)+'');
       Active := True;
       qrlValor19.Caption := Fieldbyname('Vaca').AsString;
       Active := False;
       SQL.Clear;
       SQL.Add('select replace(format(sum(sa_pesototalnovilha)/sum(sa_arrobafrigonovilha),2), ".", ",") ''Novi'' from saida_animais where sa_valorarrobanovilha <> 0 and sa_data between '+QuotedStr(DateToStr(frmImpressao.dtpInic.Date))+' and '+QuotedStr(DateToStr(frmImpressao.dtpFin.Date))+' and sa_ano = '+QuotedStr(vAno)+' and sa_controle = '+QuotedStr(vControle)+'');
       Active := True;
       qrlValor20.Caption := Fieldbyname('Novi').AsString;
       Active := False;
       SQL.Clear;
       SQL.Add('select replace(format(sum(replace(sa_pesototalboi, ",", ".")),2), ".", ",") ''Boi'', replace(format(sum(replace(sa_pesototalvaca, ",", ".")),2), ".", ",") ''Vaca'', replace(format(sum(replace(sa_pesototalnovilha, ",", ".")),2), ".", ",") ''Novi'' '+
       'from saida_animais where sa_data between '+QuotedStr(DateToStr(frmImpressao.dtpInic.Date))+' and '+QuotedStr(DateToStr(frmImpressao.dtpFin.Date))+' and sa_ano = '+QuotedStr(vAno)+' and sa_controle = '+QuotedStr(vControle)+'');
       Active := True;
       qrlValor21.Caption := Fieldbyname('Boi').AsString;
       qrlValor22.Caption := Fieldbyname('Vaca').AsString;
       qrlValor23.Caption := Fieldbyname('Novi').AsString;
       Active := False;
       SQL.Clear;
       SQL.Add('select sum(ea_qtdboi), sum(ea_qtdvaca), sum(ea_qtdnovilha) from entrada_animais where ea_data between '+QuotedStr(DateToStr(frmImpressao.dtpInic.Date))+' and '+QuotedStr(DateToStr(frmImpressao.dtpFin.Date))+' and ea_ano = '+QuotedStr(vAno)+' and ea_controle = '+QuotedStr(vControle)+'');
       Active := True;
       qrlValor24.Caption := Fieldbyname('sum(ea_qtdboi)').AsString;
       qrlValor25.Caption := Fieldbyname('sum(ea_qtdvaca)').AsString;
       qrlValor26.Caption := Fieldbyname('sum(ea_qtdnovilha)').AsString;
       Active := False;
       SQL.Clear;
       SQL.Add('select replace(format(sum(replace(ea_pesoarrobaboi, ",", ".")),2), ".", ",") ''Boi'', replace(format(sum(replace(ea_pesoarrobavaca, ",", ".")),2), ".", ",") ''Vaca'', replace(format(sum(replace(ea_pesoarrobanovilha, ",", ".")),2), ".", ",") ''Novi'' '+
       'from entrada_animais where ea_data between '+QuotedStr(DateToStr(frmImpressao.dtpInic.Date))+' and '+QuotedStr(DateToStr(frmImpressao.dtpFin.Date))+' and ea_ano = '+QuotedStr(vAno)+' and ea_controle = '+QuotedStr(vControle)+'');
       Active := True;
       qrlValor27.Caption := Fieldbyname('Boi').AsString;
       qrlValor28.Caption := Fieldbyname('Vaca').AsString;
       qrlValor29.Caption := Fieldbyname('Novi').AsString;
       Active := False;
       SQL.Clear;
       SQL.Add('select replace(format(sum(ea_pesoarrobaboi)/sum(ea_qtdboi),2), ".", ",") ''Boi'', replace(format(sum(ea_pesoarrobavaca)/sum(ea_qtdvaca),2), ".", ",") ''Vaca'', replace(format(sum(ea_pesoarrobanovilha)/sum(ea_qtdnovilha),2), ".", ",") ''Novi'' '+
       'from entrada_animais where ea_data between '+QuotedStr(DateToStr(frmImpressao.dtpInic.Date))+' and '+QuotedStr(DateToStr(frmImpressao.dtpFin.Date))+' and ea_ano = '+QuotedStr(vAno)+' and ea_controle = '+QuotedStr(vControle)+'');
       Active := True;
       qrlValor30.Caption := Fieldbyname('Boi').AsString;
       qrlValor31.Caption := Fieldbyname('Vaca').AsString;
       qrlValor32.Caption := Fieldbyname('Novi').AsString;
       SQL.Clear;
       SQL.Add('select replace(format(sum(ea_vltotalboi)/sum(ea_pesoarrobaboi),2), ".", ",") ''Boi'' from entrada_animais where ea_valorarrobaboi <> 0 and ea_data between '+QuotedStr(DateToStr(frmImpressao.dtpInic.Date))+' and '+QuotedStr(DateToStr(frmImpressao.dtpFin.Date))+' and ea_ano = '+QuotedStr(vAno)+' and ea_controle = '+QuotedStr(vControle)+'');
       Active := True;
       qrlValor33.Caption := Fieldbyname('Boi').AsString;
       Active := False;
       SQL.Clear;
       SQL.Add('select replace(format(sum(ea_vltotalvaca)/sum(ea_pesoarrobavaca),2), ".", ",") ''Vaca'' from entrada_animais where ea_valorarrobavaca <> 0 and ea_data between '+QuotedStr(DateToStr(frmImpressao.dtpInic.Date))+' and '+QuotedStr(DateToStr(frmImpressao.dtpFin.Date))+' and ea_ano = '+QuotedStr(vAno)+' and ea_controle = '+QuotedStr(vControle)+'');
       Active := True;
       qrlValor34.Caption := Fieldbyname('Vaca').AsString;
       Active := False;
       SQL.Clear;
       SQL.Add('select replace(format(sum(ea_vltotalnovilha)/sum(ea_pesoarrobanovilha),2), ".", ",") ''Novi'' from entrada_animais where ea_valorarrobanovilha <> 0 and ea_data between '+QuotedStr(DateToStr(frmImpressao.dtpInic.Date))+' and '+QuotedStr(DateToStr(frmImpressao.dtpFin.Date))+' and ea_ano = '+QuotedStr(vAno)+' and ea_controle = '+QuotedStr(vControle)+'');
       Active := True;
       qrlValor35.Caption := Fieldbyname('Novi').AsString;
       Active := False;
       SQL.Clear;
       SQL.Add('select replace(format(sum(replace(ea_vltotalboi, ",", ".")),2), ".", ",") ''Boi'', replace(format(sum(replace(ea_vltotalvaca, ",", ".")),2), ".", ",") ''Vaca'', replace(format(sum(replace(ea_vltotalnovilha, ",", ".")),2), ".", ",") ''Novi'' '+
       'from entrada_animais where ea_data between '+QuotedStr(DateToStr(frmImpressao.dtpInic.Date))+' and '+QuotedStr(DateToStr(frmImpressao.dtpFin.Date))+' and ea_ano = '+QuotedStr(vAno)+' and ea_controle = '+QuotedStr(vControle)+'');
       Active := True;
       qrlValor36.Caption := Fieldbyname('Boi').AsString;
       qrlValor37.Caption := Fieldbyname('Vaca').AsString;
       qrlValor38.Caption := Fieldbyname('Novi').AsString;
//       Active := False;
//       SQL.Clear;
//       SQL.Add('select replace(format(sum(replace(ea_vlfreteboi+ea_vldespesaboi, ",", ".")),2), ".", ",") ''Boi'', replace(format(sum(replace(ea_vlfretevaca+ea_vldespesavaca, ",", ".")),2), ".", ",") ''Vaca'', '+
//       'replace(format(sum(replace(ea_vlfretenovilha+ea_vldespesanovilha, ",", ".")),2), ".", ",") ''Novi'' '+
//       'from entrada_animais where ea_data between '+QuotedStr(DateToStr(frmImpressao.dtpInic.Date))+' and '+QuotedStr(DateToStr(frmImpressao.dtpFin.Date))+'');
//       Active := True;
//       qrlValor39.Caption := Fieldbyname('Boi').AsString;
//       qrlValor40.Caption := Fieldbyname('Vaca').AsString;
//       qrlValor41.Caption := Fieldbyname('Novi').AsString;
       Active := False;
       SQL.Clear;
       SQL.Add('select sum(sa_arrobafrigoboi+sa_arrobafrigovaca+sa_arrobafrigonovilha) ''arroba saida'' from saida_animais where sa_data between '+QuotedStr(DateToStr(frmImpressao.dtpInic.Date))+' and '+QuotedStr(DateToStr(frmImpressao.dtpFin.Date))+' and sa_ano = '+QuotedStr(vAno)+' and sa_controle = '+QuotedStr(vControle)+'');
       Active := True;
       vArrobaSaida := FieldByName('arroba saida').AsFloat;
       Active := False;
       SQL.Clear;
       SQL.Add('select sum(ea_pesoarrobaboi+ea_pesoarrobavaca+ea_pesoarrobanovilha) ''arroba entrada'' from entrada_animais where ea_data between '+QuotedStr(DateToStr(frmImpressao.dtpInic.Date))+' and '+QuotedStr(DateToStr(frmImpressao.dtpFin.Date))+' and ea_ano = '+QuotedStr(vAno)+' and ea_controle = '+QuotedStr(vControle)+'');
       Active := True;
       vArrobaEntrada := FieldByName('arroba entrada').AsFloat;
       vArroba := vArrobaSaida-vArrobaEntrada;
       qrValor18.Caption := FloatToStr(vArroba);
       qrValor1.Caption := FormatCurr(',0.00', StrToCurr(qrValor1.Caption));
       qrValor2.Caption := FormatCurr(',0.00', StrToCurr(qrValor2.Caption));
       qrValor3.Caption := FormatCurr(',0.00', StrToCurr(qrValor3.Caption));
       qrValor4.Caption := FormatCurr(',0.00', StrToCurr(qrValor4.Caption));
       qrValor5.Caption := FormatCurr(',0.00', StrToCurr(qrValor5.Caption));
       qrValor6.Caption := FormatCurr(',0.00', StrToCurr(qrValor6.Caption));
       qrValor7.Caption := FormatCurr(',0.00', StrToCurr(qrValor7.Caption));
       DateSeparator := '/';
       ShortDateFormat := 'yyyy-mm-dd';
       With dmCarroComando.ADOQuery1 do begin
          Active := False;
          SQL.Clear;
          SQL.Add('select P.p_nome, sum(DT.dt_qtdtotal) ''quantidade'', sum(DT.dt_vltotal)/sum(DT.dt_qtdtotal) ''valor uni'', sum(DT.dt_vltotal) ''valor'', p.p_cod from produtos P, dieta DT where P.p_cod = DT.p_cod and DT.dt_data between '+QuotedStr(DateToStr(frmImpressao.dtpInic.Date))+' and '+QuotedStr(DateToStr(frmImpressao.dtpFin.Date))+' and DT.dt_ano = '+QuotedStr(vAno)+' and DT.dt_controle = '+QuotedStr(vControle)+' group by P.p_nome order by P.p_nome');
          Active := True;
       end;
    end;
    ShortDateFormat := 'dd/mm/yyyy';
end;

end.
