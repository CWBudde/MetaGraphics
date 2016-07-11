unit MgBackend;

interface

uses
  Classes, MgScene;

type
  TMgBackend = class(TPersistent)
  public
    procedure RenderScene(Scene: TMgScene; Handle: THandle); virtual; abstract;
  end;

implementation

end.

