unit MgBackendGDI;

interface

uses
  Classes, Graphics, Controls, MgScene, MgBackend;

type
  TMgBackendGDI = class(TMgBackend)
  private
    FCanvas: TControlCanvas;
  public
    constructor Create;
    destructor Destroy; override;

    procedure RenderScene(Scene: TMgScene; AHandle: THandle); override;
  end;

implementation

uses
  MgPrimitives;

{ TMgBackendGDI }

constructor TMgBackendGDI.Create;
begin
  FCanvas := TControlCanvas.Create;
end;

destructor TMgBackendGDI.Destroy;
begin
  FCanvas.Free;
end;

procedure TMgBackendGDI.RenderScene(Scene: TMgScene; AHandle: THandle);
var
  Index: Cardinal;
begin
  inherited;

  if Scene.Count = 0 then
    Exit;

  FCanvas.Handle := AHandle;

  FCanvas.Pen.Color := clBlack;
  FCanvas.Pen.Mode := pmCopy;
  FCanvas.Brush.Color := clBlack;
  FCanvas.Brush.Style := bsSolid;


  for Index := 0 to Scene.Count - 1 do
  begin
    if Scene[Index] is TMgPrimitiveVerticalLine then
      with TMgPrimitiveVerticalLine(Scene[Index]) do
      begin
        FCanvas.MoveTo(X, Y1);
        FCanvas.LineTo(X, Y2);
      end else
    if Scene[Index] is TMgPrimitiveHorizontalLine then
      with TMgPrimitiveHorizontalLine(Scene[Index]) do
      begin
        FCanvas.MoveTo(X1, Y);
        FCanvas.LineTo(X2, Y);
      end else
    if Scene[Index] is TMgPrimitiveLine then
      with TMgPrimitiveLine(Scene[Index]) do
      begin
        FCanvas.MoveTo(X1, Y1);
        FCanvas.LineTo(X2, Y2);
      end else
    if Scene[Index] is TMgPrimitiveRect then
      with TMgPrimitiveRect(Scene[Index]) do
      begin
        FCanvas.Rectangle(Left, Top, Right, Bottom);
      end else
  end;
end;

end.

