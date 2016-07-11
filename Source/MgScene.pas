unit MgScene;

interface

uses
  Classes, SysUtils, MgPrimitives;

type
  TMgScene = class(TComponent)
  private
    FPrimitiveList: TList;
    function GetCount: Cardinal;
    function GetPrimitive(Index: Cardinal): TMgCustomPrimitive;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    procedure AddPrimitive(Primitive: TMgCustomPrimitive);
    procedure Clear;

    property Primitive[Index: Cardinal]: TMgCustomPrimitive read GetPrimitive; default;
    property Count: Cardinal read GetCount;
  end;

implementation

resourcestring
  RCStrIndexOutOfBounds = 'Index out of bounds (%d)';

{ TMgScene }

constructor TMgScene.Create(AOwner: TComponent);
begin
  inherited;
  FPrimitiveList := TList.Create;
end;

destructor TMgScene.Destroy;
begin
  FPrimitiveList.Free;
  inherited;
end;

procedure TMgScene.AddPrimitive(Primitive: TMgCustomPrimitive);
begin
  FPrimitiveList.Add(Primitive)
end;

procedure TMgScene.Clear;
begin
  FPrimitiveList.Clear;
end;

function TMgScene.GetCount: Cardinal;
begin
  Result := FPrimitiveList.Count;
end;

function TMgScene.GetPrimitive(Index: Cardinal): TMgCustomPrimitive;
begin
  if Index < FPrimitiveList.Count then
    Result := TMgCustomPrimitive(FPrimitiveList.Items[Index])
  else
    raise Exception.CreateFmt(RCStrIndexOutOfBounds, [Index]);
end;

end.

