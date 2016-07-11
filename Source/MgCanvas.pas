unit MgCanvas;

interface

uses
  Windows, Classes, Controls, MgScene, MgBackend;

type
  TMgCanvas = class(TCustomControl)
  private
    FScene: TMgScene;
    FBackEnd: TMgBackend;
  protected
    procedure Paint; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    procedure Line(X1, Y1, X2, Y2: Integer);
    procedure VerticalLine(X, Y1, Y2: Integer);
    procedure HorizontalLine(X1, X2, Y: Integer);
  published
    property Scene: TMgScene read FScene;

    property Align;
    property Anchors;
    property AutoSize;
    property Constraints;
    property Cursor;
    property DragCursor;
    property DragMode;
    property ParentShowHint;
    property PopupMenu;
    property ShowHint;
    property TabOrder;
    property TabStop;
    property Visible;

    property OnClick;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDrag;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnMouseWheel;
    property OnMouseWheelDown;
    property OnMouseWheelUp;
    property OnMouseEnter;
    property OnMouseLeave;
    property OnResize;
    property OnStartDrag;
  end;

implementation

uses
  MgPrimitives, MgBackendGDI;

{ TMgCanvas }

constructor TMgCanvas.Create(AOwner: TComponent);
begin
  inherited;

  FScene := TMgScene.Create(Self);
  FBackEnd := TMgBackendGDI.Create;
end;

destructor TMgCanvas.Destroy;
begin
  FBackEnd.Free;
  FScene.Free;

  inherited;
end;

procedure TMgCanvas.Paint;
begin
  inherited;

  FBackEnd.RenderScene(FScene, Canvas.Handle);
end;

procedure TMgCanvas.Line(X1, Y1, X2, Y2: Integer);
begin
  FScene.AddPrimitive(TMgPrimitiveLine.Create(X1, Y1, X2, Y2));
end;

procedure TMgCanvas.VerticalLine(X, Y1, Y2: Integer);
begin
  FScene.AddPrimitive(TMgPrimitiveVerticalLine.Create(X, Y1, Y2));
end;

procedure TMgCanvas.HorizontalLine(X1, X2, Y: Integer);
begin
  FScene.AddPrimitive(TMgPrimitiveHorizontalLine.Create(X1, X2, Y));
end;

end.

