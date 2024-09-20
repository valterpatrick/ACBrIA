unit uFrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, REST.Client, REST.Types, IdURI,
  System.JSON, System.Generics.Collections;

type
  TFrmPrincipal = class(TForm)
    MemoPrompt: TMemo;
    MemoUsuario: TMemo;
    MemoModelo: TMemo;
    BtnGerar: TBitBtn;
    Label1: TLabel;
    EdtKey: TEdit;
    procedure BtnGerarClick(Sender: TObject);
  private
    procedure SendOpenAIRequest;
    procedure ProcessResponse(RespJson: String);
    function PrepareMemoTextForJSON(Memo: TMemo): string;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

{$R *.dfm}


procedure TFrmPrincipal.BtnGerarClick(Sender: TObject);
begin
  SendOpenAIRequest;
end;

function TFrmPrincipal.PrepareMemoTextForJSON(Memo: TMemo): string;
var
  S: string;
begin
  S := Memo.Text;

  // Substituir quebras de linha por \n para manter o formato JSON correto
  S := StringReplace(S, sLineBreak, '\n', [rfReplaceAll]);

  // Escapar aspas duplas
  S := StringReplace(S, '"', '\"', [rfReplaceAll]);

  // Escapar barras invertidas (se não estiverem já escapando algo)
  S := StringReplace(S, '\', '\\', [rfReplaceAll]);

  Result := S;
end;

procedure TFrmPrincipal.SendOpenAIRequest;
var
  RESTClient: TRESTClient;
  RESTRequest: TRESTRequest;
  FURLBase: string;

  MainObject, ResponseFormatObject, MessageObject, ContentObject: TJSONObject;
  MessagesArray, ContentArray: TJSONArray;
  str: string;
begin
  FURLBase := 'https://api.openai.com/v1/chat/completions';
  RESTClient := TRESTClient.Create(FURLBase);
  try
    RESTRequest := TRESTRequest.Create(nil);
    try
      RESTRequest.Client := RESTClient;
      RESTRequest.Method := rmPOST;
      RESTClient.BaseURL := FURLBase;
      RESTClient.Accept := RESTRequest.Accept;
      RESTClient.AcceptCharset := RESTRequest.AcceptCharset;
      RESTClient.RaiseExceptionOn500 := False;

      RESTRequest.Params.AddItem('Authorization', 'Bearer ' + EdtKey.Text, pkHTTPHEADER, [poDoNotEncode]);

      MainObject := TJSONObject.Create;

      MainObject.AddPair('model', 'gpt-4o');

      MessagesArray := TJSONArray.Create;

      MessageObject := TJSONObject.Create;
      MessageObject.AddPair('role', 'system');
      ContentArray := TJSONArray.Create;
      ContentObject := TJSONObject.Create;
      ContentObject.AddPair('type', 'text');
      ContentObject.AddPair('text', PrepareMemoTextForJSON(MemoPrompt));
      ContentArray.AddElement(ContentObject);
      MessageObject.AddPair('content', ContentArray);
      MessagesArray.AddElement(MessageObject);

      MessageObject := TJSONObject.Create;
      MessageObject.AddPair('role', 'user');
      ContentArray := TJSONArray.Create;
      ContentObject := TJSONObject.Create;
      ContentObject.AddPair('type', 'text');
      ContentObject.AddPair('text', '{"uf":["RS", "MG", "SP", "MT"]}');
      ContentArray.AddElement(ContentObject);
      MessageObject.AddPair('content', ContentArray);
      MessagesArray.AddElement(MessageObject);

      MainObject.AddPair('messages', MessagesArray);

      MainObject.AddPair('temperature', TJSONNumber.Create(1));
      MainObject.AddPair('max_tokens', TJSONNumber.Create(2048));
      MainObject.AddPair('top_p', TJSONNumber.Create(1));
      MainObject.AddPair('frequency_penalty', TJSONNumber.Create(0));
      MainObject.AddPair('presence_penalty', TJSONNumber.Create(0));

      ResponseFormatObject := TJSONObject.Create;
      ResponseFormatObject.AddPair('type', 'json_object');
      MainObject.AddPair('response_format', ResponseFormatObject);

      str := MainObject.ToString;
      RESTRequest.Body.Add(MainObject);

      try
        RESTRequest.Execute;
      except
        on E: Exception do
          MemoModelo.Lines.Add(E.Message);
      end;
      if RESTRequest.Response.StatusCode = 200 then
      begin
        ProcessResponse(RESTRequest.Response.Content);
        MemoModelo.Lines.Add('');
        MemoModelo.Lines.Add(RESTRequest.Response.Content);
      end
      else
        MemoModelo.Lines.Add('Failed to get response: ' + RESTRequest.Response.StatusCode.ToString + ' - ' + RESTRequest.Response.ErrorMessage);

    finally
      RESTRequest.Free;
    end;
  finally
    RESTClient.Free;
  end;
end;

procedure TFrmPrincipal.ProcessResponse(RespJson : String);
var
  JSONValue, ChoicesValue, MessageValue, ContentValue: TJSONValue;
  JSONObj: TJSONObject;
  JSONArray: TJSONArray;
  i: Integer;
begin
  // Parse the JSON response from the string
  JSONValue := TJSONObject.ParseJSONValue(RespJson);

  if JSONValue <> nil then
  try
    // Acessar o objeto JSON principal
    if JSONValue is TJSONObject then
    begin
      JSONObj := JSONValue as TJSONObject;

      // Verificar se existe o campo 'choices' e se é um array
      if JSONObj.TryGetValue('choices', ChoicesValue) and (ChoicesValue is TJSONArray) then
      begin
        JSONArray := ChoicesValue as TJSONArray;

        // Iterar sobre o array (supondo que pode haver múltiplos 'choices')
        for i := 0 to JSONArray.Count - 1 do
        begin
          if JSONArray.Items[i].GetValue<TJSONObject>.TryGetValue('message', MessageValue) then
          begin
            // Aqui você tem o conteúdo de 'choices.content'
            if TJSONObject(MessageValue).TryGetValue('content', ContentValue) then
            begin
              // Aqui você tem o conteúdo de 'choices.message.content'
              MemoModelo.Lines.add(ContentValue.Value);
            end;
          end;
        end;
      end;
    end;
  finally
    JSONValue.Free;
  end
  else
    MemoModelo.Lines.add('Invalid JSON response');
end;

end.
