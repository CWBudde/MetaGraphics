unit MgBackendAgg;

interface

uses
  Classes, MgScene, MgBackend;

type
  TMgBackendAgg = class(TMgBackend)
  public
    constructor Create;
    destructor Destroy; override;

    procedure RenderScene(Scene: TMgScene; Handle: THandle); override;
  end;

implementation

{ TMgBackendAgg }

constructor TMgBackendAgg.Create;
begin

end;

destructor TMgBackendAgg.Destroy;
begin

end;

procedure TMgBackendAgg.RenderScene(Scene: TMgScene; Handle: THandle);
begin
  inherited;

end;

end.

