program Simple;

uses
  Vcl.Forms,
  MainUnit in 'MainUnit.pas' {FmMetaGraphics};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFmMetaGraphics, FmMetaGraphics);
  Application.Run;
end.

