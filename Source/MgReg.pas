unit MgReg;

interface

uses
  Classes, TypInfo;

procedure Register;

implementation

uses
  MgCanvas;

procedure Register;
begin
  RegisterComponents('Meta Graphics', [TMgCanvas]);
end;

end.

