unit Splash_frm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, jpeg;

type
  TfrmSplash = class(TForm)
    ProgramIcon: TImage;
    Label1: TLabel;
    Panel1: TPanel;
    Shape1: TShape;
    Label22: TLabel;
    Label2: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSplash: TfrmSplash;

implementation

{$R *.dfm}

end.
