unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    Pole: TPaintBox;
    procedure Button1Click(Sender: TObject);
    procedure Edit1DblClick(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  x,i:integer;
  PodFunc:array of TEdit;

implementation

{$R *.lfm}

{ TForm1 }
function y(x:integer):integer;
begin
y:=x;
end;
procedure OprPodFunc(s:string);
var a,b,i:integer;
begin
b:=0;
for i:=1 to Length(s) do
if s[i]='+' then inc(b);
SetLength(PodFunc,b);
for a:=0 to b-1 do
begin
PodFunc[a]:=TEdit.Create(Form1);
PodFunc[a].parent:=Form1;
PodFunc[a].Left:=800;
PodFunc[a].Top:=50*a;
i:=1;
repeat
PodFunc[a].Text:=PodFunc[a].Text+s[i];
inc(i);
until s[i]='+';
delete(s,1,i);
showmessage(s);
end;
PodFunc[b]:=TEdit.Create(Form1);
PodFunc[b].parent:=Form1;
PodFunc[b].Left:=800;
PodFunc[b].Top:=50*b;
PodFunc[b].Text:=s;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  for x:=0 to Pole.Width do
  Pole.Canvas.Pixels[x,Pole.Height-y(x)]:=clRed;
end;

procedure TForm1.Edit1DblClick(Sender: TObject);
begin
  OprPodFunc(Edit1.Text);
end;


end.

