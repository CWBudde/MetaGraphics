unit MainUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  MgCanvas;

type
  TFmMetaGraphics = class(TForm)
    MgCanvas: TMgCanvas;
    procedure FormCreate(Sender: TObject);
  end;

var
  FmMetaGraphics: TFmMetaGraphics;

implementation

{$R *.dfm}

procedure TFmMetaGraphics.FormCreate(Sender: TObject);
begin
  MgCanvas.Line(10, 10, 20, 20);
end;

end.

