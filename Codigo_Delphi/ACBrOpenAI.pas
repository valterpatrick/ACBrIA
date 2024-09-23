unit ACBrOpenAI;

interface

uses Classes, SysUtils, Variants, ACBrIAClass;

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

  end;

implementation


end.
