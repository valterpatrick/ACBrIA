unit ACBrOpenAI;

interface

uses Classes, SysUtils, Variants, ACBrIAClass, System.JSON, System.Generics.Collections;

Const
  UrlChatCompletion = 'https://api.openai.com/v1/chat/completions';
  SJ_UFPercursoMDFe = '';//https://platform.openai.com/docs/guides/structured-outputs/how-to-use?context=without_parse

type
  TACBrModelo = (gpt4o, // gpt-4o
    gpt4o2024_05_13, // gpt-4o-2024-05-13
    gpt4o2024_08_06, // gpt-4o-2024-08-06
    gpt4olatest, // chatgpt-4o-latest
    gpt4omini, // gpt-4o-mini
    gpt4omini2024_07_18, // gpt-4o-mini-2024-07-18
    o1preview, // o1-preview
    o1preview2024_09_12, // o1-preview-2024-09-12
    o1mini, // o1-mini
    o1mini2024_09_12, // o1-mini-2024-09-12
    gpt4turbo, // gpt-4-turbo
    gpt4turbo2024_04_09, // gpt-4-turbo-2024-04-09
    gpt4turbopreview, // gpt-4-turbo-preview
    gpt4_0125preview, // gpt-4-0125-preview
    gpt4_1106preview, // gpt-4-1106-preview
    gpt4, // gpt-4
    gpt4_0613, // gpt-4-0613
    gpt35turbo0125, // gpt-3.5-turbo-0125
    gpt35turbo, // gpt-3.5-turbo
    gpt35turbo1106, // gpt-3.5-turbo-1106
    gpt35turboinstruct, // gpt-3.5-turbo-instruct
    dalle3, // dall-e-3
    dalle2, // dall-e-2
    tts1, // tts-1
    tts1hd, // tts-1-hd
    whisper, // whisper
    textembedding3large, // text-embedding-3-large
    textembedding3small, // text-embedding-3-small
    textembeddingada002, // text-embedding-ada-002
    textmoderationlatest, // text-moderation-latest
    textmoderationstable, // text-moderation-stable
    textmoderation007 // text-moderation-007
    );

  TACBrOpenAI = class(TACBrIAClass)
  private
    FModelo: TACBrModelo;
  public
    property Modelo: TACBrModelo read FModelo write FModelo;
    function ModeloToStr(AModelo: TACBrModelo): String;
    function StrToModelo(ATexto: String): TACBrModelo;
  end;

implementation


{ TACBrOpenAI }

function TACBrOpenAI.ModeloToStr(AModelo: TACBrModelo): String;
begin
  case AModelo of
    gpt4o:
      Result := 'gpt-4o';
    gpt4o2024_05_13:
      Result := 'gpt-4o-2024-05-13';
    gpt4o2024_08_06:
      Result := 'gpt-4o-2024-08-06';
    gpt4olatest:
      Result := 'chatgpt-4o-latest';
    gpt4omini:
      Result := 'gpt-4o-mini';
    gpt4omini2024_07_18:
      Result := 'gpt-4o-mini-2024-07-18';
    o1preview:
      Result := 'o1-preview';
    o1preview2024_09_12:
      Result := 'o1-preview-2024-09-12';
    o1mini:
      Result := 'o1-mini';
    o1mini2024_09_12:
      Result := 'o1-mini-2024-09-12';
    gpt4turbo:
      Result := 'gpt-4-turbo';
    gpt4turbo2024_04_09:
      Result := 'gpt-4-turbo-2024-04-09';
    gpt4turbopreview:
      Result := 'gpt-4-turbo-preview';
    gpt4_0125preview:
      Result := 'gpt-4-0125-preview';
    gpt4_1106preview:
      Result := 'gpt-4-1106-preview';
    gpt4:
      Result := 'gpt-4';
    gpt4_0613:
      Result := 'gpt-4-0613';
    gpt35turbo0125:
      Result := 'gpt-3.5-turbo-0125';
    gpt35turbo:
      Result := 'gpt-3.5-turbo';
    gpt35turbo1106:
      Result := 'gpt-3.5-turbo-1106';
    gpt35turboinstruct:
      Result := 'gpt-3.5-turbo-instruct';
    dalle3:
      Result := 'dall-e-3';
    dalle2:
      Result := 'dall-e-2';
    tts1:
      Result := 'tts-1';
    tts1hd:
      Result := 'tts-1-hd';
    whisper:
      Result := 'whisper';
    textembedding3large:
      Result := 'text-embedding-3-large';
    textembedding3small:
      Result := 'text-embedding-3-small';
    textembeddingada002:
      Result := 'text-embedding-ada-002';
    textmoderationlatest:
      Result := 'text-moderation-latest';
    textmoderationstable:
      Result := 'text-moderation-stable';
    textmoderation007:
      Result := 'text-moderation-007';
  else
    raise Exception.Create('Modelo não encontrado');
  end;
end;

function TACBrOpenAI.StrToModelo(ATexto: String): TACBrModelo;
begin
  if ATexto = 'gpt-4o' then
    Result := gpt4o
  else if ATexto = 'gpt-4o-2024-05-13' then
    Result := gpt4o2024_05_13
  else if ATexto = 'gpt-4o-2024-08-06' then
    Result := gpt4o2024_08_06
  else if ATexto = 'chatgpt-4o-latest' then
    Result := gpt4olatest
  else if ATexto = 'gpt-4o-mini' then
    Result := gpt4omini
  else if ATexto = 'gpt-4o-mini-2024-07-18' then
    Result := gpt4omini2024_07_18
  else if ATexto = 'o1-preview' then
    Result := o1preview
  else if ATexto = 'o1-preview-2024-09-12' then
    Result := o1preview2024_09_12
  else if ATexto = 'o1-mini' then
    Result := o1mini
  else if ATexto = 'o1-mini-2024-09-12' then
    Result := o1mini2024_09_12
  else if ATexto = 'gpt-4-turbo' then
    Result := gpt4turbo
  else if ATexto = 'gpt-4-turbo-2024-04-09' then
    Result := gpt4turbo2024_04_09
  else if ATexto = 'gpt-4-turbo-preview' then
    Result := gpt4turbopreview
  else if ATexto = 'gpt-4-0125-preview' then
    Result := gpt4_0125preview
  else if ATexto = 'gpt-4-1106-preview' then
    Result := gpt4_1106preview
  else if ATexto = 'gpt-4' then
    Result := gpt4
  else if ATexto = 'gpt-4-0613' then
    Result := gpt4_0613
  else if ATexto = 'gpt-3.5-turbo-0125' then
    Result := gpt35turbo0125
  else if ATexto = 'gpt-3.5-turbo' then
    Result := gpt35turbo
  else if ATexto = 'gpt-3.5-turbo-1106' then
    Result := gpt35turbo1106
  else if ATexto = 'gpt-3.5-turbo-instruct' then
    Result := gpt35turboinstruct
  else if ATexto = 'dall-e-3' then
    Result := dalle3
  else if ATexto = 'dall-e-2' then
    Result := dalle2
  else if ATexto = 'tts-1' then
    Result := tts1
  else if ATexto = 'tts-1-hd' then
    Result := tts1hd
  else if ATexto = 'whisper' then
    Result := whisper
  else if ATexto = 'text-embedding-3-large' then
    Result := textembedding3large
  else if ATexto = 'text-embedding-3-small' then
    Result := textembedding3small
  else if ATexto = 'text-embedding-ada-002' then
    Result := textembeddingada002
  else if ATexto = 'text-moderation-latest' then
    Result := textmoderationlatest
  else if ATexto = 'text-moderation-stable' then
    Result := textmoderationstable
  else if ATexto = 'text-moderation-007' then
    Result := textmoderation007
  else
    raise Exception.Create('Texto não corresponde a nenhum modelo válido');
end;

end.
