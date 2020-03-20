unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ToolEdit, Buttons;

type
  TForm1 = class(TForm)
    BitBtn1: TBitBtn;
    lbDiretorio: TLabel;
    File_Plano: TFilenameEdit;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Txt, Txt2 : TextFile;

  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  AssignFile(Txt,File_Plano.Text);
  

end;

end.
