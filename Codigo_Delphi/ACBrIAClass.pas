unit ACBrIAClass;

interface

uses Classes, SysUtils, Variants;

type
  TACBrFormatoResposta = (frText, frJson, frJsonSchema);

  TACBrIAClass = class(TObject)
  private
    FChaveAPI: String;//ApiKey
    FSchemaJson: String;//json_schema
    FSemente : String;//seed
    FNivelServico: String;//service_tier
    FFerramentas : String;//tools
    FTipoFerramentas : String;//tool_choice
    FFormatoResposta: TACBrFormatoResposta;
    FMaximoTokens: Integer;//max_tokens
    FMaximoTokensResultado: Integer;//max_completion_tokens
    FQuantResultados: Integer;//n
    FProblemasLogTop: Integer;//top_logprobs
    FTemperatura: Double;//temperature
    FTopP: Double;//top_p
    FFrequenciaPenalidade: Double;//frequency_penalty
    FPresencaPenalidade: Double;//presence_penalty
    FProblemasLog : Boolean;//logprobs
  public
    property FormatoResposta: TACBrFormatoResposta read FFormatoResposta write FFormatoResposta;
    property ChaveAPI: String read FChaveAPI write FChaveAPI;
    property SchemaJson: String read FSchemaJson write FSchemaJson;
    property Semente: String read FSemente write FSemente;
    property NivelServico: String read FNivelServico write FNivelServico;
    property Ferramentas: String read FFerramentas write FFerramentas;
    property TipoFerramentas: String read FTipoFerramentas write FTipoFerramentas;
    property MaximoTokens: Integer read FMaximoTokens write FMaximoTokens;
    property MaximoTokensResultado: Integer read FMaximoTokensResultado write FMaximoTokensResultado;
    property QuantResultados: Integer read FQuantResultados write FQuantResultados;
    property ProblemasLogTop: Integer read FProblemasLogTop write FProblemasLogTop;
    property Temperatura: Double read FTemperatura write FTemperatura;
    property TopP: Double read FTopP write FTopP;
    property FrequenciaPenalidade: Double read FFrequenciaPenalidade write FFrequenciaPenalidade;
    property PresencaPenalidade: Double read FPresencaPenalidade write FPresencaPenalidade;
    property ProblemasLog: Boolean read FProblemasLog write FProblemasLog;

  end;

implementation

end.
