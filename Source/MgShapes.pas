unit MgShapes;

interface

uses
  Classes;

type
  TMgGeometricShape = class(TPersistent)
  private
    FOnChange : TNotifyEvent;
  protected
    procedure AssignTo(Dest: TPersistent); override;
    procedure Changed; virtual;
  public
    constructor Create; virtual; abstract;

    property OnChange: TNotifyEvent read FOnChange write FOnChange;
  end;

  TMgSimpleShapes = class(TMgGeometricShape)
  end;

(*
  TMgVerticalLine = class(TMgSimpleShapes)
  public
    property Y: TFixed24Dot8 read FY write SetY;
    property X1: TFixed24Dot8 read FX1 write SetX1;
    property X2: TFixed24Dot8 read FX2 write SetX2;
  end;

  TMgHorizontalLine = class(TMgSimpleShapes)
  public
    property Y: TFixed24Dot8 read FY write SetY;
    property X1: TFixed24Dot8 read FX1 write SetX1;
    property X2: TFixed24Dot8 read FX2 write SetX2;
  end;
*)

implementation

{ TMgGeometricShape }

procedure TMgGeometricShape.AssignTo(Dest: TPersistent);
begin
  if Dest is TMgGeometricShape then
    with TMgGeometricShape(Dest) do
    begin
      FOnChange := Self.FOnChange;
    end
  else
    inherited;
end;

procedure TMgGeometricShape.Changed;
begin
  if Assigned(FOnChange) then
    FOnChange(Self);
end;

end.

