unit ACBrIAClass;

interface

uses Classes, SysUtils, Variants;

type
  TACBrFormatoResposta = (frJson, frText);

  //TACBrModelo = () virtual;

  TACBrIAClass = class(TObject)
  private
    FChaveAPI: string;
    //FModelo: TACBrModelo;
    FTemperatura: Double;
    FMaximoTokens: Integer;
    FTopP: Double;
    FFormatoResposta: TACBrFormatoResposta;
  public
    property ChaveAPI: string read FChaveAPI write FChaveAPI;
  //  property Modelo: TACBrModelo read FModelo write FModelo;
    property Temperatura: Double read FTemperatura write FTemperatura;
    property MaximoTokens: Integer read FMaximoTokens write FMaximoTokens;
    property TopP: Double read FTopP write FTopP;
    property FormatoResposta: TACBrFormatoResposta read FFormatoResposta write FFormatoResposta;
  end;

implementation

end.
