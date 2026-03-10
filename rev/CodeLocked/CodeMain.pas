unit CodeMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Flag;

type
  TForm2 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button6: TButton;
    Button5: TButton;
    Button7: TButton;
    Button9: TButton;
    Button8: TButton;
    ButtonUnlock: TButton;
    codeBox: TEdit;
    Button0: TButton;
    ButtonAsterisk: TButton;
    ButtonPound: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ButtonUnlockClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button0Click(Sender: TObject);
    procedure ButtonPoundClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;
  f: TFlagForm;
  leMessage: String;

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

procedure x(const s: string);
begin
  if Length(Form2.codeBox.Text) < 6 then
    Form2.codeBox.Text := Form2.codebox.Text + s;
end;

procedure TForm2.Button0Click(Sender: TObject);
begin
  x('0');
end;

procedure TForm2.Button1Click(Sender: TObject);
begin
  x('1');
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
  x('2');
end;

procedure TForm2.Button3Click(Sender: TObject);
begin
  x('3');
end;

procedure TForm2.Button4Click(Sender: TObject);
begin
  x('4');
end;

procedure TForm2.Button5Click(Sender: TObject);
begin
  x('5');
end;

procedure TForm2.Button6Click(Sender: TObject);
begin
  x('6');
end;

procedure TForm2.Button7Click(Sender: TObject);
begin
  x('7');
end;

procedure TForm2.Button8Click(Sender: TObject);
begin
  x('8');
end;

procedure TForm2.Button9Click(Sender: TObject);
begin
  x('9');
end;



procedure TForm2.ButtonPoundClick(Sender: TObject);
var s: string;
begin
  s := codeBox.Text;
  if Length(s) > 0 then
    SetLength(s, Length(s)-1);
  codeBox.Text := s;
end;

procedure TForm2.ButtonUnlockClick(Sender: TObject);
var
  flag, temp: string;
  data, key, decrypted: TBytes;
begin
  data := HexToBytes(leMessage);
  key := TEncoding.UTF8.GetBytes(codeBox.Text);
  decrypted := XorBytes(data, key);
  flag := Rot13(BytesToString(decrypted));
  SetLength(flag, 6);
  if flag = 'skatt{' then
  begin
    f := TFlagForm.Create(nil);
    f.Caption := codeBox.Text + ReverseString(codeBox.Text);
    f.Label1.Caption := leMessage;
    f.Show;
  end
  else
    codeBox.Text := '';
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  leMessage := '524a595f53494346415447426b420749466d4153524a';
end;

end.
