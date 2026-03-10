unit Flag;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TFlagForm = class(TForm)
    Label1: TLabel;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FlagForm: TFlagForm;

implementation

{$R *.dfm}



function Rot13(const S: string): string;
var
  I: Integer;
  C: Char;
begin
  Result := S;

  for I := 1 to Length(Result) do
  begin
    C := Result[I];

    case C of
      'A'..'Z':
        Result[I] := Chr(((Ord(C) - Ord('A') + 13) mod 26) + Ord('A'));
      'a'..'z':
        Result[I] := Chr(((Ord(C) - Ord('a') + 13) mod 26) + Ord('a'));
    end;
  end;
end;

function HexToBytes(const Hex: string): TBytes;
var
  I: Integer;
begin
  SetLength(Result, Length(Hex) div 2);
  for I := 0 to Length(Result) - 1 do
    Result[I] := StrToInt('$' + Copy(Hex, I * 2 + 1, 2));
end;

function ReverseString(const S: string): string;
var
  I, L: Integer;
begin
  L := Length(S);
  SetLength(Result, L);

  for I := 1 to L do
    Result[I] := S[L - I + 1];
end;

function XorBytes(const Data, Key: TBytes): TBytes;
var
  I: Integer;
begin
  SetLength(Result, Length(Data));

  for I := 0 to High(Data) do
    Result[I] := Data[I] xor Key[I mod Length(Key)];
end;
function BytesToString(const Bytes: TBytes): string;
begin
  Result := TEncoding.UTF8.GetString(Bytes);
end;

procedure TFlagForm.FormShow(Sender: TObject);
var
  flag, temp: string;
  data, key, decrypted: TBytes;
begin
  data := HexToBytes(Label1.Caption);
  key := TEncoding.UTF8.GetBytes(Caption);
  decrypted := XorBytes(data, key);
  Label1.Caption := Rot13(BytesToString(decrypted));
  Caption := 'Success';

end;

end.
