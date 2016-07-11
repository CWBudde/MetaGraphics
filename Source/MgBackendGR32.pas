unit MgBackendGR32;

interface

uses
  Classes, MgScene, MgBackend, GR32;

type
  TMgBackendGR32 = class(TMgBackend)
  private
    FBuffer: TBitmap32;
  public
    constructor Create;
    destructor Destroy; override;

    procedure RenderScene(Scene: TMgScene; Handle: THandle); override;
  end;

implementation

{ TMgBackendGR32 }

constructor TMgBackendGR32.Create;
begin
  FBuffer := TBitmap32.Create;
end;

destructor TMgBackendGR32.Destroy;
begin
  FBuffer.Free;
end;

procedure TMgBackendGR32.RenderScene(Scene: TMgScene; Handle: THandle);
begin
  inherited;

end;

end.

