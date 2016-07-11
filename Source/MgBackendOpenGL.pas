unit MgBackendOpenGL;

interface

uses
  Classes, OpenGL, MgScene, MgBackend;

type
  TMgBackendOpenGL = class(TMgBackend)
  public
    constructor Create;
    destructor Destroy; override;

    procedure RenderScene(Scene: TMgScene; Handle: THandle); override;
  end;

implementation

{ TMgBackendOpenGL }

constructor TMgBackendOpenGL.Create;
begin

end;

destructor TMgBackendOpenGL.Destroy;
begin

end;

procedure TMgBackendOpenGL.RenderScene(Scene: TMgScene; Handle: THandle);
begin
  inherited;

end;

end.

