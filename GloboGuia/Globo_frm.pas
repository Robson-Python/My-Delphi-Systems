unit Globo_frm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Objects, FMX.Layouts;

type
  TfrmGlobo = class(TForm)
    ToolBar1: TToolBar;
    btnPrior: TButton;
    Label1: TLabel;
    ScrollBox1: TScrollBox;
    Image1: TImage;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Button1: TButton;
    procedure btnPriorClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGlobo: TfrmGlobo;

implementation

{$R *.fmx}

uses QuemSomos_frm;

procedure TfrmGlobo.btnPriorClick(Sender: TObject);
begin
    Close;
end;

procedure TfrmGlobo.Button1Click(Sender: TObject);
begin
    Close;
    Try
      Application.CreateForm(TfrmQuemSomos, frmQuemSomos);
      frmQuemSomos.Show;
    Finally
         frmQuemSomos.Free;
    End;
end;

end.
