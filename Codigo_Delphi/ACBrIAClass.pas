unit ACBrIAClass;

interface

uses Classes, SysUtils, Variants;

type
  TACBrIAClass = class(TObject)
  private
    FApiKey: String;//ApiKey
  public
    property ApiKey: String read FApiKey write FApiKey;
  end;

implementation

end.
