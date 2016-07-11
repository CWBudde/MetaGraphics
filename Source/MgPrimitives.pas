unit MgPrimitives;

interface

uses
  Classes;

type
  TMgCustomPrimitive = class(TPersistent)
  private
    FOnChange : TNotifyEvent;
  protected
    procedure AssignTo(Dest: TPersistent); override;
    procedure Changed; virtual;
  public
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
  end;

  TMgPrimitiveVerticalLine = class(TMgCustomPrimitive)
  private
    FY1: Integer;
    FY2: Integer;
    FX: Integer;
    procedure SetY1(const Value: Integer);
    procedure SetY2(const Value: Integer);
    procedure SetX(const Value: Integer);
  protected
    procedure AssignTo(Dest: TPersistent); override;
    procedure Y1Changed;
    procedure Y2Changed;
    procedure XChanged;
  public
    constructor Create(X, Y1, Y2: Integer); virtual;
    property X: Integer read FX write SetX;
    property Y1: Integer read FY1 write SetY1;
    property Y2: Integer read FY2 write SetY2;
  end;

  TMgPrimitiveHorizontalLine = class(TMgCustomPrimitive)
  private
    FX1: Integer;
    FX2: Integer;
    FY: Integer;
    procedure SetX1(const Value: Integer);
    procedure SetX2(const Value: Integer);
    procedure SetY(const Value: Integer);
  protected
    procedure AssignTo(Dest: TPersistent); override;
    procedure X1Changed;
    procedure X2Changed;
    procedure YChanged;
  public
    constructor Create(X1, X2, Y: Integer); virtual;
    property Y: Integer read FY write SetY;
    property X1: Integer read FX1 write SetX1;
    property X2: Integer read FX2 write SetX2;
  end;

  TMgPrimitiveLine = class(TMgCustomPrimitive)
  private
    FX2: Integer;
    FY2: Integer;
    FX1: Integer;
    FY1: Integer;
    procedure SetX1(const Value: Integer);
    procedure SetX2(const Value: Integer);
    procedure SetY1(const Value: Integer);
    procedure SetY2(const Value: Integer);
  protected
    procedure AssignTo(Dest: TPersistent); override;
    procedure X1Changed;
    procedure X2Changed;
    procedure Y1Changed;
    procedure Y2Changed;
  public
    constructor Create(X1, Y1, X2, Y2: Integer); virtual;
    property Y1: Integer read FY1 write SetY1;
    property Y2: Integer read FY2 write SetY2;
    property X1: Integer read FX1 write SetX1;
    property X2: Integer read FX2 write SetX2;
  end;

  TMgPrimitiveRect = class(TMgCustomPrimitive)
  private
    FLeft: Integer;
    FTop: Integer;
    FRight: Integer;
    FBottom: Integer;
    procedure SetLeft(const Value: Integer);
    procedure SetRight(const Value: Integer);
    procedure SetTop(const Value: Integer);
    procedure SetBottom(const Value: Integer);
  protected
    procedure AssignTo(Dest: TPersistent); override;
    procedure LeftChanged;
    procedure RightChanged;
    procedure TopChanged;
    procedure BottomChanged;
  public
    constructor Create(Left, Right, Top, Bottom: Integer); virtual;
    property Top: Integer read FTop write SetTop;
    property Bottom: Integer read FBottom write SetBottom;
    property Left: Integer read FLeft write SetLeft;
    property Right: Integer read FRight write SetRight;
  end;

  TMgPrimitiveCircle = class(TMgCustomPrimitive)
  end;

  TMgPrimitivePolygon = class(TMgCustomPrimitive)
  end;

implementation


{ TMgCustomPrimitive }

procedure TMgCustomPrimitive.AssignTo(Dest: TPersistent);
begin
  if Dest is TMgCustomPrimitive then
    with TMgCustomPrimitive(Dest) do
    begin
      FOnChange := Self.FOnChange;
    end
  else
    inherited;
end;

procedure TMgCustomPrimitive.Changed;
begin
  if Assigned(FOnChange) then
    FOnChange(Self);
end;


{ TMgPrimitiveVerticalLine }

constructor TMgPrimitiveVerticalLine.Create(X, Y1, Y2: Integer);
begin
  FX := X;
  FY1 := Y1;
  FY2 := Y2;
end;

procedure TMgPrimitiveVerticalLine.AssignTo(Dest: TPersistent);
begin
  inherited;
  if Dest is TMgPrimitiveVerticalLine then
    with TMgPrimitiveVerticalLine(Dest) do
    begin
      FX := Self.X;
      FY1 := Self.Y1;
      FY2 := Self.Y2;
    end else
  if Dest is TMgPrimitiveLine then
    with TMgPrimitiveLine(Dest) do
    begin
      FX1 := Self.X;
      FX2 := Self.X;
      FY1 := Self.Y1;
      FY2 := Self.Y2;
    end;
end;

procedure TMgPrimitiveVerticalLine.SetY1(const Value: Integer);
begin
  if FY1 <> Value then
  begin
    FY1 := Value;
    Y1Changed;
  end;
end;

procedure TMgPrimitiveVerticalLine.SetY2(const Value: Integer);
begin
  if FY2 <> Value then
  begin
    FY2 := Value;
    Y2Changed;
  end;
end;

procedure TMgPrimitiveVerticalLine.SetX(const Value: Integer);
begin
  if FX <> Value then
  begin
    FX := Value;
    XChanged;
  end;
end;

procedure TMgPrimitiveVerticalLine.Y1Changed;
begin
  Changed;
end;

procedure TMgPrimitiveVerticalLine.Y2Changed;
begin
  Changed;
end;

procedure TMgPrimitiveVerticalLine.XChanged;
begin
  Changed;
end;


{ TMgPrimitiveHorizontalLine }

constructor TMgPrimitiveHorizontalLine.Create(X1, X2, Y: Integer);
begin
  FX1 := X1;
  FX2 := X2;
  FY := Y;
end;

procedure TMgPrimitiveHorizontalLine.AssignTo(Dest: TPersistent);
begin
  inherited;
  if Dest is TMgPrimitiveHorizontalLine then
    with TMgPrimitiveHorizontalLine(Dest) do
    begin
      FX1 := Self.X1;
      FX2 := Self.X2;
      FY := Self.Y;
    end else
  if Dest is TMgPrimitiveLine then
    with TMgPrimitiveLine(Dest) do
    begin
      FX1 := Self.X1;
      FX2 := Self.X2;
      FY1 := Self.Y;
      FY2 := Self.Y;
    end;
end;

procedure TMgPrimitiveHorizontalLine.SetX1(const Value: Integer);
begin
  if FX1 <> Value then
  begin
    FX1 := Value;
    X1Changed;
  end;
end;

procedure TMgPrimitiveHorizontalLine.SetX2(const Value: Integer);
begin
  if FX2 <> Value then
  begin
    FX2 := Value;
    X2Changed;
  end;
end;

procedure TMgPrimitiveHorizontalLine.SetY(const Value: Integer);
begin
  if FY <> Value then
  begin
    FY := Value;
    YChanged;
  end;
end;

procedure TMgPrimitiveHorizontalLine.YChanged;
begin
  Changed;
end;

procedure TMgPrimitiveHorizontalLine.X1Changed;
begin
  Changed;
end;

procedure TMgPrimitiveHorizontalLine.X2Changed;
begin
  Changed;
end;


{ TMgPrimitiveLine }

constructor TMgPrimitiveLine.Create(X1, Y1, X2, Y2: Integer);
begin
  FX1 := X1;
  FX2 := X2;
  FY1 := Y1;
  FY2 := Y2;
end;

procedure TMgPrimitiveLine.AssignTo(Dest: TPersistent);
begin
  inherited;
  if Dest is TMgPrimitiveLine then
    with TMgPrimitiveLine(Dest) do
    begin
      FX1 := Self.X1;
      FX2 := Self.X2;
      FY1 := Self.Y1;
      FY2 := Self.Y2;
    end;
end;

procedure TMgPrimitiveLine.SetX1(const Value: Integer);
begin
  if FX1 <> Value then
  begin
    FX1 := Value;
    X1Changed;
  end;
end;

procedure TMgPrimitiveLine.SetX2(const Value: Integer);
begin
  if FX2 <> Value then
  begin
    FX2 := Value;
    X2Changed;
  end;
end;

procedure TMgPrimitiveLine.SetY1(const Value: Integer);
begin
  if FY1 <> Value then
  begin
    FY1 := Value;
    Y1Changed;
  end;
end;

procedure TMgPrimitiveLine.SetY2(const Value: Integer);
begin
  if FY2 <> Value then
  begin
    FY2 := Value;
    Y2Changed;
  end;
end;

procedure TMgPrimitiveLine.X1Changed;
begin
  Changed;
end;

procedure TMgPrimitiveLine.X2Changed;
begin
  Changed;
end;

procedure TMgPrimitiveLine.Y1Changed;
begin
  Changed;
end;

procedure TMgPrimitiveLine.Y2Changed;
begin
  Changed;
end;


{ TMgPrimitiveRect }

constructor TMgPrimitiveRect.Create(Left, Right, Top, Bottom: Integer);
begin
  FLeft := Left;
  FTop := Top;
  FRight := Right;
  FBottom := Bottom;
end;

procedure TMgPrimitiveRect.AssignTo(Dest: TPersistent);
begin
  inherited;
  if Dest is TMgPrimitiveRect then
    with TMgPrimitiveRect(Dest) do
    begin
      FLeft := Self.Left;
      FTop := Self.Top;
      FRight := Self.Right;
      FBottom := Self.Bottom;
    end;
end;

procedure TMgPrimitiveRect.SetLeft(const Value: Integer);
begin
  FLeft := Value;
end;

procedure TMgPrimitiveRect.SetTop(const Value: Integer);
begin
  FTop := Value;
end;

procedure TMgPrimitiveRect.SetRight(const Value: Integer);
begin
  FRight := Value;
end;

procedure TMgPrimitiveRect.SetBottom(const Value: Integer);
begin
  FBottom := Value;
end;

procedure TMgPrimitiveRect.LeftChanged;
begin
  Changed;
end;

procedure TMgPrimitiveRect.TopChanged;
begin
  Changed;
end;

procedure TMgPrimitiveRect.RightChanged;
begin
  Changed;
end;

procedure TMgPrimitiveRect.BottomChanged;
begin
  Changed;
end;

end.
