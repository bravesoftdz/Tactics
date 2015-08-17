unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls, Buttons, Crt;

type

  { TForm1 }

  TForm1 = class(TForm)

    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Bevel4: TBevel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;


    Label10: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;


    P1U: TButton;
    P2R: TButton;
    P1L: TButton;
    P1R: TButton;
    P1D: TButton;
    P1F: TButton;
    P2F: TButton;
    P2D: TButton;
    P2L: TButton;
    P2U: TButton;

    Label1: TLabel;
    Shape1: TShape;
    P1P: TShape;
    Shape24: TShape;
    Shape25: TShape;
    Shape26: TShape;
    P2P: TShape;
    Shape32: TShape;
    Shape35: TShape;
    Shape8: TShape;
    Shape9: TShape;

    P1TU: TTimer;
    P1TD: TTimer;
    P1TR: TTimer;
    P1TL: TTimer;
    P2TU: TTimer;
    P2TD: TTimer;
    P2TR: TTimer;
    P2TL: TTimer;

    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3KeyPress(Sender: TObject; var Key: char);
    procedure Button3MouseEnter(Sender: TObject);
    procedure Button3MouseLeave(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure P1DClick(Sender: TObject);
    procedure P1FClick(Sender: TObject);
    procedure P1LClick(Sender: TObject);
    procedure P1RClick(Sender: TObject);
    procedure P1TDTimer(Sender: TObject);
    procedure P1TLTimer(Sender: TObject);
    procedure P1TRTimer(Sender: TObject);
    procedure P1TUTimer(Sender: TObject);
    procedure P1UClick(Sender: TObject);
    procedure P2DClick(Sender: TObject);
    procedure P2FClick(Sender: TObject);
    procedure P2LClick(Sender: TObject);
    procedure P2RClick(Sender: TObject);
    procedure P2TDTimer(Sender: TObject);
    procedure P2TLTimer(Sender: TObject);
    procedure P2TRTimer(Sender: TObject);
    procedure P2TUTimer(Sender: TObject);
    procedure P2UClick(Sender: TObject);

  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;

  //Pressed Button
  PB:Char;

  //Pozicija
  Pos: array [0..33, 0..17] of integer;

  //Orientacija Gore = 1 Desno = 2 Dole = 3 Levo = 4
  P1O: Integer;
  P2O: Integer;


  //Proektil na player 1
  P1PX: Integer;
  P1PY: Integer;

  //Proektil na player 2
  P2PX: Integer;
  P2PY: Integer;

  //Pomosni Koordinati
  X: Integer;
  y: Integer;

  //X I Y Koordinati Na Player 1
  P1X: Integer;
  P1Y: Integer;

  //X I Y Koordinati Na Player 2
  P2X: Integer;
  P2Y: Integer;

implementation

{$R *.lfm}

{ TForm1 }

//Potrebni Pocetni Informacii
procedure TForm1.FormActivate(Sender: TObject);
begin
  //Pozicija na Objectite

  //Pozicija na formata
  form1.Left := 0;
  form1.Top := 0;
  form1.Width := Screen.Width - 15;
  form1.Height := Screen.Height;
  //Pozicija na Kopcinja
  //Pozicija na kopcinja na Player 1
  //Gore
  P1U.Left:= Round(0.025 * Screen.Width);
  P1U.Top:= Round(0.030 * Screen.Height);
  P1U.Width:= Round(0.039 * Screen.Width);
  P1U.Height:= Round(0.069 * Screen.Height);
  //Desno
  P1R.Left:= Round(0.046 * Screen.Width);
  P1R.Top:= Round(0.104 * Screen.Height);
  P1R.Width:= Round(0.039 * Screen.Width);
  P1R.Height:= Round(0.069 * Screen.Height);
  //Dole
  P1D.Left:= Round(0.025 * Screen.Width);
  P1D.Top:= Round(0.178 * Screen.Height);
  P1D.Width:= Round(0.039 * Screen.Width);
  P1D.Height:= Round(0.069 * Screen.Height);
  //Levo
  P1L.Left:= Round(0.004 * Screen.Width);
  P1L.Top:= Round(0.104 * Screen.Height);
  P1L.Width:= Round(0.039 * Screen.Width);
  P1L.Height:= Round(0.069 * Screen.Height);
  //Fire!
  P1F.left:= Round(0.013 * Screen.Width);
  P1F.Top:= Round(0.274 * Screen.Height);
  P1F.Width:= Round(0.064 * Screen.Width);
  P1F.Height:= Round(0.097 * Screen.Height);
  //Pozicija na kopcinja na Player 2
  //Gore
  P2U.Left:= Round(0.938 * Screen.Width);
  P2U.Top:= Round(0.030 * Screen.Height);
  P2U.Width:= Round(0.039 * Screen.Width);
  P2U.Height:= Round(0.069 * Screen.Height);
  //Desno
  P2R.Left:= Round(0.958 * Screen.Width);
  P2R.Top:= Round(0.104 * Screen.Height);
  P2R.Width:= Round(0.039 * Screen.Width);
  P2R.Height:= Round(0.069 * Screen.Height);
  //Dole
  P2D.Left:= Round(0.938 * Screen.Width);
  P2D.Top:= Round(0.178 * Screen.Height);
  P2D.Width:= Round(0.039 * Screen.Width);
  P2D.Height:= Round(0.069 * Screen.Height);
  //Levo
  P2L.Left:= Round(0.917 * Screen.Width);
  P2L.Top:= Round(0.104 * Screen.Height);
  P2L.Width:= Round(0.039 * Screen.Width);
  P2L.Height:= Round(0.069 * Screen.Height);
  //Fire!
  P2F.left:= Round(0.925 * Screen.Width);
  P2F.Top:= Round(0.274 * Screen.Height);
  P2F.Width:= Round(0.064 * Screen.Width);
  P2F.Height:= Round(0.097 * Screen.Height);
  //Pozicija na WhiteBoard
  Label1.Left:= Round(0.092 * Screen.Width);
  Label1.Top:= Round(0.007 * Screen.Height);
  Label1.Width:= Round(0.817 * Screen.Width);
  Label1.Height:= Round(0.726 * Screen.Height);
  //Bevel Pozicii
  //Pozicija na Bevel za Player 1
  Bevel1.Left:= 0;
  Bevel1.Top:= 0;
  Bevel1.Width:= Round(0.088 * Screen.Width);
  Bevel1.Height:= Screen.Height;
  //Pozicija na Bevel za Player 2
  Bevel2.Left:= Round(0.913 * Screen.Width);
  Bevel2.Top:= 0;
  Bevel2.Width:= Round(0.088 * Screen.Width);
  Bevel2.Height:= Screen.Height;
  //Pozicija za Informativen Bevel
  Bevel3.Left:= Round(0.096 * Screen.Width);
  Bevel3.Top:= Round(0.741 * Screen.Height);
  Bevel3.Width:= Round(0.808 * Screen.Width);
  Bevel3.Height:= Round(0.202 * Screen.Height);
  //Pozicija na Playeri
  //Pozicija na Player 1
  Shape1.Left:= Round(0.117 * Screen.Width);
  Shape1.Top:= Round(0.506 * Screen.Height);
  Shape1.Width:= Round(0.026 * Screen.Width);
  Shape1.Height:= Round(0.045 * Screen.Height);
  //Pozicija na Player 2
  Shape8.Left:= Round(0.858 * Screen.Width);
  Shape8.Top:= Round(0.186 * Screen.Height);
  Shape8.Width:= Round(0.026 * Screen.Width);
  Shape8.Height:= Round(0.045 * Screen.Height);
  //Pozicija na Dzidovi
  //Pozicija na Vertikalen Shape Gore
  Shape24.Left:= Round(0.500 * Screen.Width);
  Shape24.Top:= Round(0.007 * Screen.Height);
  Shape24.Width:= Round(0.026 * Screen.Width);
  Shape24.Height:= Round(0.268 * Screen.Height);
  //Pozicija na Horizontalen Shape Gore
  Shape26.Left:= Round(0.500 * Screen.Width);
  Shape26.Top:= Round(0.467 * Screen.Height);
  Shape26.Width:= Round(0.026 * Screen.Width);
  Shape26.Height:= Round(0.267 * Screen.Height);
  //Pozicija na Horizontalen Shape Dole
  Shape25.Left:= Round(0.450 * Screen.Width);
  Shape25.Top:= Round(0.230 * Screen.Height);
  Shape25.Width:= Round(0.126 * Screen.Width);
  Shape25.Height:= Round(0.045 * Screen.Height);
  //Pozicija na Vertikalen Shape Dole
  Shape9.Left:= Round(0.450 * Screen.Width);
  Shape9.Top:= Round(0.467 * Screen.Height);
  Shape9.Width:= Round(0.126 * Screen.Width);
  Shape9.Height:= Round(0.045 * Screen.Height);
  //Pozicija na vertikalen Shape Levo
  Shape35.Left:= Round(0.375 * Screen.Width);
  Shape35.Top:= Round(0.185 * Screen.Height);
  Shape35.Width:= Round(0.026 * Screen.Width);
  Shape35.Height:= Round(0.371 * Screen.Height);
  //Pozicija na Vertikalen Shape Desno
  Shape32.Left:= Round(0.625 * Screen.Width);
  Shape32.Top:= Round(0.185 * Screen.Height);
  Shape32.Width:= Round(0.026 * Screen.Width);
  Shape32.Height:= Round(0.371 * Screen.Height);
  //Pozicija na Informacionite Labeli
  //Pozicija na label za informacija na pobeda
  Label10.Left:= Round(0.383 * Screen.Width);
  Label10.Top:= Round(0.800 * Screen.Height);
  Label10.Width:= Round(0.263 * Screen.Width);
  Label10.Height:= Round(0.067 * Screen.Height);
  label10.font.Height:=Round(0.079 * label10.Width - (2 * (0.079 * label10.Width)));
  //Pozicija na Bevel za Label za informacija na pobeda
  Bevel4.Left:= Round(0.383 * Screen.Width);
  Bevel4.Top:= Round(0.800 * Screen.Height);
  Bevel4.Width:= Round(0.263 * Screen.Width);
  Bevel4.Height:= Round(0.067 * Screen.Height);
  //Pozicija na kopce za Reset
  Button1.Left:= Round(0.117 * Screen.Width);
  Button1.Top:= Round(0.778 * Screen.Height);
  Button1.Width:= Round(0.121 * Screen.Width);
  Button1.Height:= Round(0.126 * Screen.Height);
  //Pozicija na Kopce za Exit
  Button2.Left:= Round(0.763 * Screen.Width);
  Button2.Top:= Round(0.778 * Screen.Height);
  Button2.Width:= Round(0.121 * Screen.Width);
  Button2.Height:= Round(0.126 * Screen.Height);
  //Pozicija na Score za Player 1
  Label2.Left:= Round(0.288 * Screen.Width);
  Label2.Top:= Round(0.800 * Screen.Height);
  Label2.Width:= Round(0.051 * Screen.Width);
  Label2.Height:= Round(0.067 * Screen.Height);
  //Pozicija na score za Player 2
  Label3.Left:= Round(0.683 * Screen.Width);
  Label3.Top:= Round(0.800 * Screen.Height);
  Label3.Width:= Round(0.051 * Screen.Width);
  Label3.Height:= Round(0.067 * Screen.Height);
  //Pozicija na Switch To Keyboard Button
  Button3.Left:= Round(0.450 * Screen.Width);
  Button3.Top:= Round(0.755 * Screen.Height);
  Button3.Width:= Round(0.127 * Screen.Width);
  Button3.Height:= Round(0.038 * Screen.Height);
  //pozicija na Switch To Keyboard Label
  Label4.Left:= Round(0.579 * Screen.Width);
  Label4.Top:= Round(0.745 * Screen.Height);

  //Pozicija na Praznite mesta

  for x := 0 to 33 do
      for y := 0 to 17 do
          Pos[x][y]:= 0;

  //Pozicija I Orientacija na Players

  P1O:=1;
  P2O:=1;
  Pos[2][12]:=1;
  Pos[31][5]:=4;

  //Pozicija na Dzidovite

  Pos[17][0]:=2;
  Pos[17][1]:=2;
  Pos[17][2]:=2;
  Pos[17][3]:=2;
  Pos[17][4]:=2;
  Pos[17][5]:=2;
  Pos[17][6]:=2;

  Pos[16][6]:=2;
  Pos[15][6]:=2;
  Pos[18][6]:=2;
  Pos[19][6]:=2;

  Pos[15][11]:=2;
  Pos[16][11]:=2;
  Pos[17][11]:=2;
  Pos[18][11]:=2;
  Pos[19][11]:=2;

  Pos[12][5]:=2;
  Pos[12][6]:=2;
  Pos[12][7]:=2;
  Pos[12][8]:=2;
  Pos[12][9]:=2;
  Pos[12][10]:=2;
  Pos[12][11]:=2;
  Pos[12][12]:=2;

  Pos[22][5]:=2;
  Pos[22][6]:=2;
  Pos[22][7]:=2;
  Pos[22][8]:=2;
  Pos[22][9]:=2;
  Pos[22][10]:=2;
  Pos[22][11]:=2;
  Pos[22][12]:=2;

  Pos[17][11]:=2;
  Pos[17][12]:=2;
  Pos[17][13]:=2;
  Pos[17][14]:=2;
  Pos[17][15]:=2;
  Pos[17][16]:=2;

  //Go smetase kako dzid ova e popravka od bug
  Pos[16][16]:= 0;
  Pos[12][1]:=0;
  Pos[12][2]:=0;
  Pos[12][3]:=0;
  Pos[12][4]:=0;

  //Davanje na Potrebnite Pocetni informacii
  P1X:= 2;
  P1Y:= 12;
  P2X:= 31;
  P2Y:= 5;
end;

//kopce za Reset
procedure TForm1.Button1Click(Sender: TObject);
begin
  Shape1.Visible:=True;
  Shape8.Visible:=True;
  Label10.Caption:='';
  //Pozicija na Objectite

  //Pozicija na formata
  form1.Left := 0;
  form1.Top := 0;
  form1.Width := Screen.Width - 15;
  form1.Height := Screen.Height;
  //Pozicija na Kopcinja
  //Pozicija na kopcinja na Player 1
  //Gore
  P1U.Left:= Round(0.025 * Screen.Width);
  P1U.Top:= Round(0.030 * Screen.Height);
  P1U.Width:= Round(0.039 * Screen.Width);
  P1U.Height:= Round(0.069 * Screen.Height);
  //Desno
  P1R.Left:= Round(0.046 * Screen.Width);
  P1R.Top:= Round(0.104 * Screen.Height);
  P1R.Width:= Round(0.039 * Screen.Width);
  P1R.Height:= Round(0.069 * Screen.Height);
  //Dole
  P1D.Left:= Round(0.025 * Screen.Width);
  P1D.Top:= Round(0.178 * Screen.Height);
  P1D.Width:= Round(0.039 * Screen.Width);
  P1D.Height:= Round(0.069 * Screen.Height);
  //Levo
  P1L.Left:= Round(0.004 * Screen.Width);
  P1L.Top:= Round(0.104 * Screen.Height);
  P1L.Width:= Round(0.039 * Screen.Width);
  P1L.Height:= Round(0.069 * Screen.Height);
  //Fire!
  P1F.left:= Round(0.013 * Screen.Width);
  P1F.Top:= Round(0.274 * Screen.Height);
  P1F.Width:= Round(0.064 * Screen.Width);
  P1F.Height:= Round(0.097 * Screen.Height);
  //Pozicija na kopcinja na Player 2
  //Gore
  P2U.Left:= Round(0.938 * Screen.Width);
  P2U.Top:= Round(0.030 * Screen.Height);
  P2U.Width:= Round(0.039 * Screen.Width);
  P2U.Height:= Round(0.069 * Screen.Height);
  //Desno
  P2R.Left:= Round(0.958 * Screen.Width);
  P2R.Top:= Round(0.104 * Screen.Height);
  P2R.Width:= Round(0.039 * Screen.Width);
  P2R.Height:= Round(0.069 * Screen.Height);
  //Dole
  P2D.Left:= Round(0.938 * Screen.Width);
  P2D.Top:= Round(0.178 * Screen.Height);
  P2D.Width:= Round(0.039 * Screen.Width);
  P2D.Height:= Round(0.069 * Screen.Height);
  //Levo
  P2L.Left:= Round(0.917 * Screen.Width);
  P2L.Top:= Round(0.104 * Screen.Height);
  P2L.Width:= Round(0.039 * Screen.Width);
  P2L.Height:= Round(0.069 * Screen.Height);
  //Fire!
  P2F.left:= Round(0.925 * Screen.Width);
  P2F.Top:= Round(0.274 * Screen.Height);
  P2F.Width:= Round(0.064 * Screen.Width);
  P2F.Height:= Round(0.097 * Screen.Height);
  //Pozicija na WhiteBoard
  Label1.Left:= Round(0.092 * Screen.Width);
  Label1.Top:= Round(0.007 * Screen.Height);
  Label1.Width:= Round(0.817 * Screen.Width);
  Label1.Height:= Round(0.726 * Screen.Height);
  //Bevel Pozicii
  //Pozicija na Bevel za Player 1
  Bevel1.Left:= 0;
  Bevel1.Top:= 0;
  Bevel1.Width:= Round(0.088 * Screen.Width);
  Bevel1.Height:= Screen.Height;
  //Pozicija na Bevel za Player 2
  Bevel2.Left:= Round(0.913 * Screen.Width);
  Bevel2.Top:= 0;
  Bevel2.Width:= Round(0.088 * Screen.Width);
  Bevel2.Height:= Screen.Height;
  //Pozicija za Informativen Bevel
  Bevel3.Left:= Round(0.096 * Screen.Width);
  Bevel3.Top:= Round(0.741 * Screen.Height);
  Bevel3.Width:= Round(0.808 * Screen.Width);
  Bevel3.Height:= Round(0.202 * Screen.Height);
  //Pozicija na Playeri
  //Pozicija na Player 1
  Shape1.Left:= Round(0.117 * Screen.Width);
  Shape1.Top:= Round(0.506 * Screen.Height);
  Shape1.Width:= Round(0.026 * Screen.Width);
  Shape1.Height:= Round(0.045 * Screen.Height);
  //Pozicija na Player 2
  Shape8.Left:= Round(0.858 * Screen.Width);
  Shape8.Top:= Round(0.186 * Screen.Height);
  Shape8.Width:= Round(0.026 * Screen.Width);
  Shape8.Height:= Round(0.045 * Screen.Height);
  //Pozicija na Dzidovi
  //Pozicija na Vertikalen Shape Gore
  Shape24.Left:= Round(0.500 * Screen.Width);
  Shape24.Top:= Round(0.007 * Screen.Height);
  Shape24.Width:= Round(0.026 * Screen.Width);
  Shape24.Height:= Round(0.268 * Screen.Height);
  //Pozicija na Horizontalen Shape Gore
  Shape26.Left:= Round(0.500 * Screen.Width);
  Shape26.Top:= Round(0.467 * Screen.Height);
  Shape26.Width:= Round(0.026 * Screen.Width);
  Shape26.Height:= Round(0.267 * Screen.Height);
  //Pozicija na Horizontalen Shape Dole
  Shape25.Left:= Round(0.450 * Screen.Width);
  Shape25.Top:= Round(0.230 * Screen.Height);
  Shape25.Width:= Round(0.126 * Screen.Width);
  Shape25.Height:= Round(0.045 * Screen.Height);
  //Pozicija na Vertikalen Shape Dole
  Shape9.Left:= Round(0.450 * Screen.Width);
  Shape9.Top:= Round(0.467 * Screen.Height);
  Shape9.Width:= Round(0.126 * Screen.Width);
  Shape9.Height:= Round(0.045 * Screen.Height);
  //Pozicija na vertikalen Shape Levo
  Shape35.Left:= Round(0.375 * Screen.Width);
  Shape35.Top:= Round(0.185 * Screen.Height);
  Shape35.Width:= Round(0.026 * Screen.Width);
  Shape35.Height:= Round(0.371 * Screen.Height);
  //Pozicija na Vertikalen Shape Desno
  Shape32.Left:= Round(0.625 * Screen.Width);
  Shape32.Top:= Round(0.185 * Screen.Height);
  Shape32.Width:= Round(0.026 * Screen.Width);
  Shape32.Height:= Round(0.371 * Screen.Height);
  //Pozicija na Informacionite Labeli
  //Pozicija na label za informacija na pobeda
  Label10.Left:= Round(0.383 * Screen.Width);
  Label10.Top:= Round(0.800 * Screen.Height);
  Label10.Width:= Round(0.263 * Screen.Width);
  Label10.Height:= Round(0.067 * Screen.Height);
  //Pozicija na Bevel za Label za informacija na pobeda
  Bevel4.Left:= Round(0.383 * Screen.Width);
  Bevel4.Top:= Round(0.800 * Screen.Height);
  Bevel4.Width:= Round(0.263 * Screen.Width);
  Bevel4.Height:= Round(0.067 * Screen.Height);
  //Pozicija na kopce za Reset
  Button1.Left:= Round(0.117 * Screen.Width);
  Button1.Top:= Round(0.778 * Screen.Height);
  Button1.Width:= Round(0.121 * Screen.Width);
  Button1.Height:= Round(0.126 * Screen.Height);
  //Pozicija na Kopce za Exit
  Button2.Left:= Round(0.763 * Screen.Width);
  Button2.Top:= Round(0.778 * Screen.Height);
  Button2.Width:= Round(0.121 * Screen.Width);
  Button2.Height:= Round(0.126 * Screen.Height);

  //Pozicija na Praznite mesta

  for x := 1 to 32 do
      for y := 1 to 16 do
          Pos[x][y]:= 0;

  //Pozicija I Orientacija na Players

  P1O:=1;
  P2O:=1;
  Pos[2][12]:=1;
  Pos[31][5]:=4;

  //Pozicija na Dzidovite

  Pos[17][0]:=2;
  Pos[17][1]:=2;
  Pos[17][2]:=2;
  Pos[17][3]:=2;
  Pos[17][4]:=2;
  Pos[17][5]:=2;
  Pos[17][6]:=2;

  Pos[16][6]:=2;
  Pos[15][6]:=2;
  Pos[18][6]:=2;
  Pos[19][6]:=2;

  Pos[15][11]:=2;
  Pos[16][11]:=2;
  Pos[17][11]:=2;
  Pos[18][11]:=2;
  Pos[19][11]:=2;

  Pos[12][5]:=2;
  Pos[12][6]:=2;
  Pos[12][7]:=2;
  Pos[12][8]:=2;
  Pos[12][9]:=2;
  Pos[12][10]:=2;
  Pos[12][11]:=2;
  Pos[12][12]:=2;

  Pos[22][5]:=2;
  Pos[22][6]:=2;
  Pos[22][7]:=2;
  Pos[22][8]:=2;
  Pos[22][9]:=2;
  Pos[22][10]:=2;
  Pos[22][11]:=2;
  Pos[22][12]:=2;

  Pos[17][11]:=2;
  Pos[17][12]:=2;
  Pos[17][13]:=2;
  Pos[17][14]:=2;
  Pos[17][15]:=2;
  Pos[17][16]:=2;

  //Go smetase kako dzid ova e popravka od bug
  Pos[16][16]:= 0;
  Pos[12][1]:=0;
  Pos[12][2]:=0;
  Pos[12][3]:=0;
  Pos[12][4]:=0;

  //Davanje na Potrebnite Pocetni informacii
  P1X:= 2;
  P1Y:= 12;
  P2X:= 31;
  P2Y:= 5;
end;

//Kopce za Exit
procedure TForm1.Button2Click(Sender: TObject);
begin
  application.Terminate;
end;

//KeyBindings
procedure TForm1.Button3KeyPress(Sender: TObject; var Key: char);
begin
  case key of
    //Kontroli na Player 1

    //Kontrola za Gore
    'w':Begin
        if (Pos[P1X][P1Y - 1] = 0) AND (P1Y - 1 > 0) AND (Shape1.Visible =  True) AND (Label10.caption = '')
     then
     begin
     Shape1.Top:=Shape1.Top - Round(0.045 * Screen.Height);
     Pos[P1X][P1Y]:= 0;
     P1Y:= P1Y - 1;
     Pos[P1X][P1Y]:= 1;
     P1O:= 1;
     end;
end;
    //Kontrola za Desno
    'd':Begin
        if (Pos[P1X + 1][P1Y] = 0) AND (P1X + 1 <= 32) AND (Shape1.Visible =  True)  AND (Label10.caption = '')
     then
     begin
     Shape1.Left:=Shape1.Left + Round(0.0254 * Screen.Width);
     Pos[P1X][P1Y]:= 0;
     P1X:= P1X + 1;
     Pos[P1X][P1Y]:= 1;
     P1O:= 2;
     end;
end;
    //Kontrola za Dole
    's':Begin
        if (Pos[P1X][P1Y + 1] = 0) AND (P1Y + 1 <= 16) AND (Shape1.Visible =  True)  AND (Label10.caption = '')
     then
     Begin
     Shape1.Top:=Shape1.Top + Round(0.045 * Screen.Height);
     Pos[P1X][P1Y]:= 0;
     P1Y:= P1Y + 1;
     Pos[P1X][P1Y]:= 1;
     P1O:= 3;
     end;
end;
    //Kontrola za Levo
    'a':Begin
        if (Pos[P1X - 1][P1Y] = 0) AND (P1X - 1 > 0) AND (Shape1.Visible =  True)  AND (Label10.caption = '')
     then
     begin
     Shape1.Left:=Shape1.Left - Round(0.0254 * Screen.Width);
     Pos[P1X][P1Y]:= 0;
     P1X:= P1X - 1;
     Pos[P1X][P1Y]:= 1;
     P1O:= 4;
     end;
end;
    //Kontrola za Pukanje
    'q':Begin
  if (P1P.Visible = false) AND (Label10.caption = '')
  then
    Case P1O of
    1: Begin
         with P1P do
         begin
           Visible:= true;
           Brush.Color:=ClGreen;
           Left := shape1.Left + Round(0.009 * Screen.Width);
           Top := shape1.top - Round(0.045 * Screen.Height) + Round(0.019 * Screen.Height);
           Width := 15;
           Height := 15;
           Parent := Form1;
         end;

         Case Pos[P1X][P1Y-1] of
         0: Begin
              Pos[P1X][P1Y-1]:=3;
              P1PX:= P1X;
              P1PY:= P1Y - 1;
              P1TU.enabled:=true;
            end;
         1: Begin
              shape1.Visible:=False;
              P1P.Visible:=False;
              Pos[P1PX][P1PY]:= 0;
              label10.Font.color:=clRed;
              label10.Caption:='The Red Player Won!';
              label3.caption:=IntToStr(StrToint(Label3.caption) + 1);
              P1TU.Enabled:=False;
            end;
         2: Begin
              P1P.Visible:=False;
            end;
         3: Begin
              P1P.Visible:=False;
              Pos[P1PX][P1PY]:= 0;
              P2P.Visible:=False;
              Pos[P2PX][P2PY]:= 0;
              P1TU.Enabled:=False;
              P1TD.Enabled:=False;
              P1TR.Enabled:=False;
              P1TL.Enabled:=False;
              P2TU.Enabled:=False;
              P2TD.Enabled:=False;
              P2TR.Enabled:=False;
              P2TL.Enabled:=False;
            end;
         4: Begin
              shape8.Visible:=False;
              P1P.Visible:=False;
              Pos[P1PX][P1PY]:= 0;
              label10.Font.color:=cllime;
              label10.Caption:='The Green Player Won!';
              label2.caption:=IntToStr(StrToint(Label2.caption) + 1);
              P1TU.Enabled:=False;
            end;
         end;
       end;
    2: Begin
         with P1P do
         begin
           Visible:= true;
           Brush.Color:=ClGreen;
           Left := shape1.Left + Round(0.026 * Screen.Width) + Round(0.010 * Screen.Width);
           Top := shape1.top + Round(0.017 * Screen.Height);
           Width := 15;
           Height := 15;
           Parent := Form1;
         end;

         Case Pos[P1X + 1][P1Y] of
         0: Begin
              Pos[P1X + 1][P1Y]:=3;
              P1PX:= P1X + 1;
              P1PY:= P1Y;
              P1TR.enabled:=true;
            end;
         1: Begin
              shape1.Visible:=False;
              P1P.Visible:=False;
              Pos[P1PX][P1PY]:= 0;
              label10.Font.color:=clRed;
              label10.Caption:='The Red Player Won!';
              label3.caption:=IntToStr(StrToint(Label3.caption) + 1);
              P1TR.Enabled:=False;
            end;
         2: Begin
              P1P.Visible:=False;
            end;
         3: Begin
              P1P.Visible:=False;
              Pos[P1PX][P1PY]:= 0;
              P2P.Visible:=False;
              Pos[P2PX][P2PY]:= 0;
              P1TU.Enabled:=False;
              P1TD.Enabled:=False;
              P1TR.Enabled:=False;
              P1TL.Enabled:=False;
              P2TU.Enabled:=False;
              P2TD.Enabled:=False;
              P2TR.Enabled:=False;
              P2TL.Enabled:=False;
            end;
         4: Begin
              shape8.Visible:=False;
              P1P.Visible:=False;
              Pos[P1PX][P1PY]:= 0;
              label10.Font.color:=cllime;
              label10.Caption:='The Green Player Won!';
              label2.caption:=IntToStr(StrToint(Label2.caption) + 1);
              P1TR.Enabled:=False;
            end;
         end;
       end;
    3: Begin
         with P1P do
         begin
           Visible:= true;
           Brush.Color:=ClGreen;
           Left := shape1.Left + Round(0.009 * Screen.Width);
           Top := shape1.top + Round(0.045 * Screen.Height) + Round(0.019 * Screen.Height);
           Width := 15;
           Height := 15;
           Parent := Form1;
         end;

         Case Pos[P1X][P1Y + 1] of
         0: Begin
              Pos[P1X][P1Y + 1]:=3;
              P1PX:= P1X;
              P1PY:= P1Y + 1;
              P1TD.enabled:=true;
            end;
         1: Begin
              shape1.Visible:=False;
              P1P.Visible:=False;
              Pos[P1PX][P1PY]:= 0;
              label10.Font.color:=clRed;
              label10.Caption:='The Red Player Won!';
              label3.caption:=IntToStr(StrToint(Label3.caption) + 1);
              P1TD.Enabled:=False;
            end;
         2: Begin
              P1P.Visible:=False;
            end;
         3: Begin
              P1P.Visible:=False;
              Pos[P1PX][P1PY]:= 0;
              P2P.Visible:=False;
              Pos[P2PX][P2PY]:= 0;
              P1TU.Enabled:=False;
              P1TD.Enabled:=False;
              P1TR.Enabled:=False;
              P1TL.Enabled:=False;
              P2TU.Enabled:=False;
              P2TD.Enabled:=False;
              P2TR.Enabled:=False;
              P2TL.Enabled:=False;
            end;
         4: Begin
              shape8.Visible:=False;
              P1P.Visible:=False;
              Pos[P1PX][P1PY]:= 0;
              label10.Font.color:=cllime;
              label10.Caption:='The Green Player Won!';
              label2.caption:=IntToStr(StrToint(Label2.caption) + 1);
              P1TD.Enabled:=False;
            end;
         end;
       end;
    4: Begin
         with P1P do
         begin
           Visible:= true;
           Brush.Color:=ClGreen;
           Left := shape1.Left - Round(0.026 * Screen.Width) + Round(0.009 * Screen.Width);
           Top := shape1.top + Round(0.019 * Screen.Height);
           Width := 15;
           Height := 15;
           Parent := Form1;
         end;

         Case Pos[P1X - 1][P1Y] of
         0: Begin
              Pos[P1X - 1][P1Y]:=3;
              P1PX:= P1X - 1;
              P1PY:= P1Y;
              P1TL.enabled:=true;
            end;
         1: Begin
              shape1.Visible:=False;
              P1P.Visible:=False;
              Pos[P1PX][P1PY]:= 0;
              label10.Font.color:=clRed;
              label10.Caption:='The Red Player Won!';
              label3.caption:=IntToStr(StrToint(Label3.caption) + 1);
              P1TL.Enabled:=False;
            end;
         2: Begin
              P1P.Visible:=False;
            end;
         3: Begin
              P1P.Visible:=False;
              Pos[P1PX][P1PY]:= 0;
              P2P.Visible:=False;
              Pos[P2PX][P2PY]:= 0;
              P1TU.Enabled:=False;
              P1TD.Enabled:=False;
              P1TR.Enabled:=False;
              P1TL.Enabled:=False;
              P2TU.Enabled:=False;
              P2TD.Enabled:=False;
              P2TR.Enabled:=False;
              P2TL.Enabled:=False;
            end;
         4: Begin
              shape8.Visible:=False;
              P1P.Visible:=False;
              Pos[P1PX][P1PY]:= 0;
              label10.Font.color:=cllime;
              label10.Caption:='The Green Player Won!';
              label2.caption:=IntToStr(StrToint(Label2.caption) + 1);
              P1TL.Enabled:=False;
            end;
         end;
       end;
    end;
end;
    //Kontrola za Pukanje Opcija 2
    'e':Begin
  if (P1P.Visible = false) AND (Label10.caption = '')
  then
    Case P1O of
    1: Begin
         with P1P do
         begin
           Visible:= true;
           Brush.Color:=ClGreen;
           Left := shape1.Left + Round(0.009 * Screen.Width);
           Top := shape1.top - Round(0.045 * Screen.Height) + Round(0.019 * Screen.Height);
           Width := 15;
           Height := 15;
           Parent := Form1;
         end;

         Case Pos[P1X][P1Y-1] of
         0: Begin
              Pos[P1X][P1Y-1]:=3;
              P1PX:= P1X;
              P1PY:= P1Y - 1;
              P1TU.enabled:=true;
            end;
         1: Begin
              shape1.Visible:=False;
              P1P.Visible:=False;
              Pos[P1PX][P1PY]:= 0;
              label10.Font.color:=clRed;
              label10.Caption:='The Red Player Won!';
              label3.caption:=IntToStr(StrToint(Label3.caption) + 1);
              P1TU.Enabled:=False;
            end;
         2: Begin
              P1P.Visible:=False;
            end;
         3: Begin
              P1P.Visible:=False;
              Pos[P1PX][P1PY]:= 0;
              P2P.Visible:=False;
              Pos[P2PX][P2PY]:= 0;
              P1TU.Enabled:=False;
              P1TD.Enabled:=False;
              P1TR.Enabled:=False;
              P1TL.Enabled:=False;
              P2TU.Enabled:=False;
              P2TD.Enabled:=False;
              P2TR.Enabled:=False;
              P2TL.Enabled:=False;
            end;
         4: Begin
              shape8.Visible:=False;
              P1P.Visible:=False;
              Pos[P1PX][P1PY]:= 0;
              label10.Font.color:=cllime;
              label10.Caption:='The Green Player Won!';
              label2.caption:=IntToStr(StrToint(Label2.caption) + 1);
              P1TU.Enabled:=False;
            end;
         end;
       end;
    2: Begin
         with P1P do
         begin
           Visible:= true;
           Brush.Color:=ClGreen;
           Left := shape1.Left + Round(0.026 * Screen.Width) + Round(0.010 * Screen.Width);
           Top := shape1.top + Round(0.017 * Screen.Height);
           Width := 15;
           Height := 15;
           Parent := Form1;
         end;

         Case Pos[P1X + 1][P1Y] of
         0: Begin
              Pos[P1X + 1][P1Y]:=3;
              P1PX:= P1X + 1;
              P1PY:= P1Y;
              P1TR.enabled:=true;
            end;
         1: Begin
              shape1.Visible:=False;
              P1P.Visible:=False;
              Pos[P1PX][P1PY]:= 0;
              label10.Font.color:=clRed;
              label10.Caption:='The Red Player Won!';
              label3.caption:=IntToStr(StrToint(Label3.caption) + 1);
              P1TR.Enabled:=False;
            end;
         2: Begin
              P1P.Visible:=False;
            end;
         3: Begin
              P1P.Visible:=False;
              Pos[P1PX][P1PY]:= 0;
              P2P.Visible:=False;
              Pos[P2PX][P2PY]:= 0;
              P1TU.Enabled:=False;
              P1TD.Enabled:=False;
              P1TR.Enabled:=False;
              P1TL.Enabled:=False;
              P2TU.Enabled:=False;
              P2TD.Enabled:=False;
              P2TR.Enabled:=False;
              P2TL.Enabled:=False;
            end;
         4: Begin
              shape8.Visible:=False;
              P1P.Visible:=False;
              Pos[P1PX][P1PY]:= 0;
              label10.Font.color:=cllime;
              label10.Caption:='The Green Player Won!';
              label2.caption:=IntToStr(StrToint(Label2.caption) + 1);
              P1TR.Enabled:=False;
            end;
         end;
       end;
    3: Begin
         with P1P do
         begin
           Visible:= true;
           Brush.Color:=ClGreen;
           Left := shape1.Left + Round(0.009 * Screen.Width);
           Top := shape1.top + Round(0.045 * Screen.Height) + Round(0.019 * Screen.Height);
           Width := 15;
           Height := 15;
           Parent := Form1;
         end;

         Case Pos[P1X][P1Y + 1] of
         0: Begin
              Pos[P1X][P1Y + 1]:=3;
              P1PX:= P1X;
              P1PY:= P1Y + 1;
              P1TD.enabled:=true;
            end;
         1: Begin
              shape1.Visible:=False;
              P1P.Visible:=False;
              Pos[P1PX][P1PY]:= 0;
              label10.Font.color:=clRed;
              label10.Caption:='The Red Player Won!';
              label3.caption:=IntToStr(StrToint(Label3.caption) + 1);
              P1TD.Enabled:=False;
            end;
         2: Begin
              P1P.Visible:=False;
            end;
         3: Begin
              P1P.Visible:=False;
              Pos[P1PX][P1PY]:= 0;
              P2P.Visible:=False;
              Pos[P2PX][P2PY]:= 0;
              P1TU.Enabled:=False;
              P1TD.Enabled:=False;
              P1TR.Enabled:=False;
              P1TL.Enabled:=False;
              P2TU.Enabled:=False;
              P2TD.Enabled:=False;
              P2TR.Enabled:=False;
              P2TL.Enabled:=False;
            end;
         4: Begin
              shape8.Visible:=False;
              P1P.Visible:=False;
              Pos[P1PX][P1PY]:= 0;
              label10.Font.color:=cllime;
              label10.Caption:='The Green Player Won!';
              label2.caption:=IntToStr(StrToint(Label2.caption) + 1);
              P1TD.Enabled:=False;
            end;
         end;
       end;
    4: Begin
         with P1P do
         begin
           Visible:= true;
           Brush.Color:=ClGreen;
           Left := shape1.Left - Round(0.026 * Screen.Width) + Round(0.009 * Screen.Width);
           Top := shape1.top + Round(0.019 * Screen.Height);
           Width := 15;
           Height := 15;
           Parent := Form1;
         end;

         Case Pos[P1X - 1][P1Y] of
         0: Begin
              Pos[P1X - 1][P1Y]:=3;
              P1PX:= P1X - 1;
              P1PY:= P1Y;
              P1TL.enabled:=true;
            end;
         1: Begin
              shape1.Visible:=False;
              P1P.Visible:=False;
              Pos[P1PX][P1PY]:= 0;
              label10.Font.color:=clRed;
              label10.Caption:='The Red Player Won!';
              label3.caption:=IntToStr(StrToint(Label3.caption) + 1);
              P1TL.Enabled:=False;
            end;
         2: Begin
              P1P.Visible:=False;
            end;
         3: Begin
              P1P.Visible:=False;
              Pos[P1PX][P1PY]:= 0;
              P2P.Visible:=False;
              Pos[P2PX][P2PY]:= 0;
              P1TU.Enabled:=False;
              P1TD.Enabled:=False;
              P1TR.Enabled:=False;
              P1TL.Enabled:=False;
              P2TU.Enabled:=False;
              P2TD.Enabled:=False;
              P2TR.Enabled:=False;
              P2TL.Enabled:=False;
            end;
         4: Begin
              shape8.Visible:=False;
              P1P.Visible:=False;
              Pos[P1PX][P1PY]:= 0;
              label10.Font.color:=cllime;
              label10.Caption:='The Green Player Won!';
              label2.caption:=IntToStr(StrToint(Label2.caption) + 1);
              P1TL.Enabled:=False;
            end;
         end;
       end;
    end;
end;

    //Kontroli Za Player 2

    //Kontrola za Gore
    'i':Begin
          if (Pos[P2X][P2Y - 1] = 0) AND (P2Y - 1 > 0) AND (Shape1.Visible =  True) AND (Label10.caption = '')
     then
     begin
     Shape8.Top:=Shape8.Top - Round(0.045 * Screen.Height);
     Pos[P2X][P2Y]:= 0;
     P2Y:= P2Y - 1;
     Pos[P2X][P2Y]:= 4;
     P2O:= 1;
     end;
end;
    //Kontrola za Desno
    'l':Begin
          if (Pos[P2X + 1][P2Y] = 0) AND (P2X + 1 <= 32) AND (Shape1.Visible =  True) AND (Label10.caption = '')
     then
     begin
     Shape8.Left:=Shape8.Left + Round(0.0254 * Screen.Width);
     Pos[P2X][P2Y]:= 0;
     P2X:= P2X + 1;
     Pos[P2X][P2Y]:= 4;
     P2O:= 2;
     end;
end;
    //Kontrola za Dole
    'k':Begin
          if (Pos[P2X][P2Y + 1] = 0) AND (P2Y + 1 <= 16) AND (Shape1.Visible =  True) AND (Label10.caption = '')
     then
     Begin
     Shape8.Top:=Shape8.Top + Round(0.045 * Screen.Height);
     Pos[P2X][P2Y]:= 0;
     P2Y:= P2Y + 1;
     Pos[P2X][P2Y]:= 4;
     P2O:= 3;
     end;
    end;
    //Kontrola za Levo
    'j':Begin
          if (Pos[P2X - 1][P2Y] = 0) AND (P2X - 1 > 0) AND (Shape1.Visible =  True) AND (Label10.caption = '')
     then
     begin
     Shape8.Left:=Shape8.Left - Round(0.0254 * Screen.Width);
     Pos[P2X][P2Y]:= 0;
     P2X:= P2X - 1;
     Pos[P2X][P2Y]:= 4;
     P2O:= 4;
     end;
end;
    //Kontrola za Pukanje
    'u':Begin
  if (P2P.Visible = false) AND (Label10.caption = '')
  then
    Case P2O of
    1: Begin
         with P2P do
         begin
           Visible:= true;
           Brush.Color:=ClMaroon;
           Left := Shape8.Left + Round(0.009 * Screen.Width);
           Top := Shape8.top - Round(0.045 * Screen.Height) + Round(0.019 * Screen.Height);
           Width := 15;
           Height := 15;
           Parent := Form1;
         end;

         Case Pos[P2X][P2Y - 1] of
         0: Begin
              Pos[P2X][P2Y - 1]:=3;
              P2PX:= P2X;
              P2PY:= P2Y - 1;
              P2TU.enabled:=true;
            end;
         1: Begin
              shape1.Visible:=False;
              P2P.Visible:=False;
              Pos[P2PX][P2PY]:= 0;
              label10.Font.color:=clred;
              label10.Caption:='The Red Player Won!';
              Label3.caption:=IntToStr(StrToInt(Label3.Caption) + 1);
              P2TU.Enabled:=False;
            end;
         2: Begin
              P2P.Visible:=False;
            end;
         3: Begin
              P2P.Visible:=False;
              Pos[P2PX][P2PY]:= 0;
              P1P.Visible:=False;
              Pos[P1PX][P1PY]:= 0;
              P1TU.Enabled:=False;
              P1TD.Enabled:=False;
              P1TR.Enabled:=False;
              P1TL.Enabled:=False;
              P2TU.Enabled:=False;
              P2TD.Enabled:=False;
              P2TR.Enabled:=False;
              P2TL.Enabled:=False;
            end;
         4: Begin
              shape8.Visible:=False;
              P2P.Visible:=False;
              Pos[P2PX][P2PY]:= 0;
              label10.Font.color:=clLime;
              label10.Caption:='The Green Player Won!';
              Label2.caption:=IntToStr(StrToInt(Label2.Caption) + 1);
              P2TU.Enabled:=False;
            end;
         end;
       end;
    2: Begin
       with P2P do
       begin
         Visible:= true;
         Brush.Color:=ClMaroon;
         Left := Shape8.Left + Round(0.026 * Screen.Width) + Round(0.010 * Screen.Width);
         Top := Shape8.top + Round(0.017 * Screen.Height);
         Width := 15;
         Height := 15;
         Parent := Form1;
       end;

       Case Pos[P2X + 1][P2Y] of
         0: Begin
              Pos[P2X + 1][P2Y]:=3;
              P2PX:= P2X + 1;
              P2PY:= P2Y;
              P2TR.enabled:=true;
            end;
         1: Begin
              shape1.Visible:=False;
              P2P.Visible:=False;
              Pos[P2PX][P2PY]:= 0;
              label10.Font.color:=clred;
              label10.Caption:='The Red Player Won!';
              Label3.caption:=IntToStr(StrToInt(Label3.Caption) + 1);
              P2TR.Enabled:=False;
            end;
         2: Begin
              P2P.Visible:=False;
            end;
         3: Begin
              P2P.Visible:=False;
              Pos[P2PX][P2PY]:= 0;
              P1P.Visible:=False;
              Pos[P1PX][P1PY]:= 0;
              P1TU.Enabled:=False;
              P1TD.Enabled:=False;
              P1TR.Enabled:=False;
              P1TL.Enabled:=False;
              P2TU.Enabled:=False;
              P2TD.Enabled:=False;
              P2TR.Enabled:=False;
              P2TL.Enabled:=False;
            end;
         4: Begin
              shape8.Visible:=False;
              P2P.Visible:=False;
              Pos[P2PX][P2PY]:= 0;
              label10.Font.color:=clLime;
              label10.Caption:='The Green Player Won!';
              Label2.caption:=IntToStr(StrToInt(Label2.Caption) + 1);
              P1TR.Enabled:=False;
            end;
         end;
     end;
  3: Begin
       with P2P do
       begin
         Visible:= true;
         Brush.Color:=ClMaroon;
         Left := Shape8.Left + Round(0.009 * Screen.Width);
         Top := Shape8.top + Round(0.045 * Screen.Height) + Round(0.019 * Screen.Height);
         Width := 15;
         Height := 15;
         Parent := Form1;
       end;

       Case Pos[P2X][P2Y + 1] of
         0: Begin
              Pos[P2X][P2Y + 1]:=3;
              P2PX:= P2X;
              P2PY:= P2Y + 1;
              P2TD.enabled:=true;
            end;
         1: Begin
              shape1.Visible:=False;
              P2P.Visible:=False;
              Pos[P2PX][P2PY]:= 0;
              label10.Font.color:=clred;
              label10.Caption:='The Red Player Won!';
              Label3.caption:=IntToStr(StrToInt(Label3.Caption) + 1);
              P2TD.Enabled:=False;
            end;
         2: Begin
              P2P.Visible:=False;
            end;
         3: Begin
              P2P.Visible:=False;
              Pos[P2PX][P2PY]:= 0;
              P1P.Visible:=False;
              Pos[P1PX][P1PY]:= 0;
              P1TU.Enabled:=False;
              P1TD.Enabled:=False;
              P1TR.Enabled:=False;
              P1TL.Enabled:=False;
              P2TU.Enabled:=False;
              P2TD.Enabled:=False;
              P2TR.Enabled:=False;
              P2TL.Enabled:=False;
            end;
         4: Begin
              shape8.Visible:=False;
              P2P.Visible:=False;
              Pos[P2PX][P2PY]:= 0;
              label10.Font.color:=clLime;
              label10.Caption:='The Green Player Won!';
              Label2.caption:=IntToStr(StrToInt(Label2.Caption) + 1);
              P1TD.Enabled:=False;
            end;
         end;
     end;
  4: Begin
       with P2P do
       begin
         Visible:= true;
         Brush.Color:=ClMaroon;
         Left := Shape8.Left - Round(0.026 * Screen.Width) + Round(0.009 * Screen.Width);
         Top := Shape8.top + Round(0.019 * Screen.Height);
         Width := 15;
         Height := 15;
         Parent := Form1;
       end;

       Case Pos[P2X - 1][P2Y] of
         0: Begin
              Pos[P2X - 1][P2Y]:=3;
              P2PX:= P2X - 1;
              P2PY:= P2Y;
              P2TL.enabled:=true;
            end;
         1: Begin
              shape1.Visible:=False;
              P2P.Visible:=False;
              Pos[P2PX][P2PY]:= 0;
              label10.Font.color:=clred;
              label10.Caption:='The Red Player Won!';
              Label3.caption:=IntToStr(StrToInt(Label3.Caption) + 1);
              P2TL.Enabled:=False;
            end;
         2: Begin
              P2P.Visible:=False;
            end;
         3: Begin
              P2P.Visible:=False;
              Pos[P2PX][P2PY]:= 0;
              P1P.Visible:=False;
              Pos[P1PX][P1PY]:= 0;
              P1TU.Enabled:=False;
              P1TD.Enabled:=False;
              P1TR.Enabled:=False;
              P1TL.Enabled:=False;
              P2TU.Enabled:=False;
              P2TD.Enabled:=False;
              P2TR.Enabled:=False;
              P2TL.Enabled:=False;
            end;
         4: Begin
              shape8.Visible:=False;
              P2P.Visible:=False;
              Pos[P2PX][P2PY]:= 0;
              label10.Font.color:=clLime;
              label10.Caption:='The Green Player Won!';
              Label2.caption:=IntToStr(StrToInt(Label2.Caption) + 1);
              P2TL.Enabled:=False;
            end;
         end;
     end;
  end;
end;
    //Kontrola za Pukanje Opcija 2
    'o':Begin
  if (P2P.Visible = false) AND (Label10.caption = '')
  then
    Case P2O of
    1: Begin
         with P2P do
         begin
           Visible:= true;
           Brush.Color:=ClMaroon;
           Left := Shape8.Left + Round(0.009 * Screen.Width);
           Top := Shape8.top - Round(0.045 * Screen.Height) + Round(0.019 * Screen.Height);
           Width := 15;
           Height := 15;
           Parent := Form1;
         end;

         Case Pos[P2X][P2Y - 1] of
         0: Begin
              Pos[P2X][P2Y - 1]:=3;
              P2PX:= P2X;
              P2PY:= P2Y - 1;
              P2TU.enabled:=true;
            end;
         1: Begin
              shape1.Visible:=False;
              P2P.Visible:=False;
              Pos[P2PX][P2PY]:= 0;
              label10.Font.color:=clred;
              label10.Caption:='The Red Player Won!';
              Label3.caption:=IntToStr(StrToInt(Label3.Caption) + 1);
              P2TU.Enabled:=False;
            end;
         2: Begin
              P2P.Visible:=False;
            end;
         3: Begin
              P2P.Visible:=False;
              Pos[P2PX][P2PY]:= 0;
              P1P.Visible:=False;
              Pos[P1PX][P1PY]:= 0;
              P1TU.Enabled:=False;
              P1TD.Enabled:=False;
              P1TR.Enabled:=False;
              P1TL.Enabled:=False;
              P2TU.Enabled:=False;
              P2TD.Enabled:=False;
              P2TR.Enabled:=False;
              P2TL.Enabled:=False;
            end;
         4: Begin
              shape8.Visible:=False;
              P2P.Visible:=False;
              Pos[P2PX][P2PY]:= 0;
              label10.Font.color:=clLime;
              label10.Caption:='The Green Player Won!';
              Label2.caption:=IntToStr(StrToInt(Label2.Caption) + 1);
              P2TU.Enabled:=False;
            end;
         end;
       end;
    2: Begin
       with P2P do
       begin
         Visible:= true;
         Brush.Color:=ClMaroon;
         Left := Shape8.Left + Round(0.026 * Screen.Width) + Round(0.010 * Screen.Width);
         Top := Shape8.top + Round(0.017 * Screen.Height);
         Width := 15;
         Height := 15;
         Parent := Form1;
       end;

       Case Pos[P2X + 1][P2Y] of
         0: Begin
              Pos[P2X + 1][P2Y]:=3;
              P2PX:= P2X + 1;
              P2PY:= P2Y;
              P2TR.enabled:=true;
            end;
         1: Begin
              shape1.Visible:=False;
              P2P.Visible:=False;
              Pos[P2PX][P2PY]:= 0;
              label10.Font.color:=clred;
              label10.Caption:='The Red Player Won!';
              Label3.caption:=IntToStr(StrToInt(Label3.Caption) + 1);
              P2TR.Enabled:=False;
            end;
         2: Begin
              P2P.Visible:=False;
            end;
         3: Begin
              P2P.Visible:=False;
              Pos[P2PX][P2PY]:= 0;
              P1P.Visible:=False;
              Pos[P1PX][P1PY]:= 0;
              P1TU.Enabled:=False;
              P1TD.Enabled:=False;
              P1TR.Enabled:=False;
              P1TL.Enabled:=False;
              P2TU.Enabled:=False;
              P2TD.Enabled:=False;
              P2TR.Enabled:=False;
              P2TL.Enabled:=False;
            end;
         4: Begin
              shape8.Visible:=False;
              P2P.Visible:=False;
              Pos[P2PX][P2PY]:= 0;
              label10.Font.color:=clLime;
              label10.Caption:='The Green Player Won!';
              Label2.caption:=IntToStr(StrToInt(Label2.Caption) + 1);
              P1TR.Enabled:=False;
            end;
         end;
     end;
  3: Begin
       with P2P do
       begin
         Visible:= true;
         Brush.Color:=ClMaroon;
         Left := Shape8.Left + Round(0.009 * Screen.Width);
         Top := Shape8.top + Round(0.045 * Screen.Height) + Round(0.019 * Screen.Height);
         Width := 15;
         Height := 15;
         Parent := Form1;
       end;

       Case Pos[P2X][P2Y + 1] of
         0: Begin
              Pos[P2X][P2Y + 1]:=3;
              P2PX:= P2X;
              P2PY:= P2Y + 1;
              P2TD.enabled:=true;
            end;
         1: Begin
              shape1.Visible:=False;
              P2P.Visible:=False;
              Pos[P2PX][P2PY]:= 0;
              label10.Font.color:=clred;
              label10.Caption:='The Red Player Won!';
              Label3.caption:=IntToStr(StrToInt(Label3.Caption) + 1);
              P2TD.Enabled:=False;
            end;
         2: Begin
              P2P.Visible:=False;
            end;
         3: Begin
              P2P.Visible:=False;
              Pos[P2PX][P2PY]:= 0;
              P1P.Visible:=False;
              Pos[P1PX][P1PY]:= 0;
              P1TU.Enabled:=False;
              P1TD.Enabled:=False;
              P1TR.Enabled:=False;
              P1TL.Enabled:=False;
              P2TU.Enabled:=False;
              P2TD.Enabled:=False;
              P2TR.Enabled:=False;
              P2TL.Enabled:=False;
            end;
         4: Begin
              shape8.Visible:=False;
              P2P.Visible:=False;
              Pos[P2PX][P2PY]:= 0;
              label10.Font.color:=clLime;
              label10.Caption:='The Green Player Won!';
              Label2.caption:=IntToStr(StrToInt(Label2.Caption) + 1);
              P1TD.Enabled:=False;
            end;
         end;
     end;
  4: Begin
       with P2P do
       begin
         Visible:= true;
         Brush.Color:=ClMaroon;
         Left := Shape8.Left - Round(0.026 * Screen.Width) + Round(0.009 * Screen.Width);
         Top := Shape8.top + Round(0.019 * Screen.Height);
         Width := 15;
         Height := 15;
         Parent := Form1;
       end;

       Case Pos[P2X - 1][P2Y] of
         0: Begin
              Pos[P2X - 1][P2Y]:=3;
              P2PX:= P2X - 1;
              P2PY:= P2Y;
              P2TL.enabled:=true;
            end;
         1: Begin
              shape1.Visible:=False;
              P2P.Visible:=False;
              Pos[P2PX][P2PY]:= 0;
              label10.Font.color:=clred;
              label10.Caption:='The Red Player Won!';
              Label3.caption:=IntToStr(StrToInt(Label3.Caption) + 1);
              P2TL.Enabled:=False;
            end;
         2: Begin
              P2P.Visible:=False;
            end;
         3: Begin
              P2P.Visible:=False;
              Pos[P2PX][P2PY]:= 0;
              P1P.Visible:=False;
              Pos[P1PX][P1PY]:= 0;
              P1TU.Enabled:=False;
              P1TD.Enabled:=False;
              P1TR.Enabled:=False;
              P1TL.Enabled:=False;
              P2TU.Enabled:=False;
              P2TD.Enabled:=False;
              P2TR.Enabled:=False;
              P2TL.Enabled:=False;
            end;
         4: Begin
              shape8.Visible:=False;
              P2P.Visible:=False;
              Pos[P2PX][P2PY]:= 0;
              label10.Font.color:=clLime;
              label10.Caption:='The Green Player Won!';
              Label2.caption:=IntToStr(StrToInt(Label2.Caption) + 1);
              P2TL.Enabled:=False;
            end;
         end;
     end;
  end;
  end
    end;
end;

//Utility
procedure TForm1.Button3MouseEnter(Sender: TObject);
begin
  label4.Visible:=true;
end;

//Utility
procedure TForm1.Button3MouseLeave(Sender: TObject);
begin
  label4.Visible:=false;
end;

//Kopcinja na Player 1

//Kopce za player 1 Gore
procedure TForm1.P1UClick(Sender: TObject);
begin
  if (Pos[P1X][P1Y - 1] = 0) AND (P1Y - 1 > 0) AND (Shape1.Visible =  True) AND (Label10.caption = '')
     then
     begin
     Shape1.Top:=Shape1.Top - Round(0.045 * Screen.Height);
     Pos[P1X][P1Y]:= 0;
     P1Y:= P1Y - 1;
     Pos[P1X][P1Y]:= 1;
     P1O:= 1;
     end;
end;

//Kopce za player 1 Desno
procedure TForm1.P1RClick(Sender: TObject);
begin
  if (Pos[P1X + 1][P1Y] = 0) AND (P1X + 1 <= 32) AND (Shape1.Visible =  True) AND (Label10.caption = '')
     then
     begin
     Shape1.Left:=Shape1.Left + Round(0.0254 * Screen.Width);
     Pos[P1X][P1Y]:= 0;
     P1X:= P1X + 1;
     Pos[P1X][P1Y]:= 1;
     P1O:= 2;
     end;
end;

//Kopce za player 1 Levo
procedure TForm1.P1LClick(Sender: TObject);
begin
  if (Pos[P1X - 1][P1Y] = 0) AND (P1X - 1 > 0) AND (Shape1.Visible =  True)  AND (Label10.caption = '')
     then
     begin
     Shape1.Left:=Shape1.Left - Round(0.0254 * Screen.Width);
     Pos[P1X][P1Y]:= 0;
     P1X:= P1X - 1;
     Pos[P1X][P1Y]:= 1;
     P1O:= 4;
     end;
end;

//Kopce za player 1 Dole
procedure TForm1.P1DClick(Sender: TObject);
begin
  if (Pos[P1X][P1Y + 1] = 0) AND (P1Y + 1 <= 16) AND (Shape1.Visible =  True)  AND (Label10.caption = '')
     then
     Begin
     Shape1.Top:=Shape1.Top + Round(0.045 * Screen.Height);
     Pos[P1X][P1Y]:= 0;
     P1Y:= P1Y + 1;
     Pos[P1X][P1Y]:= 1;
     P1O:= 3;
     end;
end;

//Kopce za player 1 Pukanje
procedure TForm1.P1FClick(Sender: TObject);
begin
  if (P1P.Visible = false)  AND (Label10.caption = '')
  then
    Case P1O of
    1: Begin
         with P1P do
         begin
           Visible:= true;
           Brush.Color:=ClGreen;
           Left := shape1.Left + Round(0.009 * Screen.Width);
           Top := shape1.top - Round(0.045 * Screen.Height) + Round(0.019 * Screen.Height);
           Width := 15;
           Height := 15;
           Parent := Form1;
         end;

         Case Pos[P1X][P1Y-1] of
         0: Begin
              Pos[P1X][P1Y-1]:=3;
              P1PX:= P1X;
              P1PY:= P1Y - 1;
              P1TU.enabled:=true;
            end;
         1: Begin
              shape1.Visible:=False;
              P1P.Visible:=False;
              Pos[P1PX][P1PY]:= 0;
              label10.Font.color:=clRed;
              label10.Caption:='The Red Player Won!';
              label3.caption:=IntToStr(StrToint(Label3.caption) + 1);
              P1TU.Enabled:=False;
            end;
         2: Begin
              P1P.Visible:=False;
            end;
         3: Begin
              P1P.Visible:=False;
              Pos[P1PX][P1PY]:= 0;
              P2P.Visible:=False;
              Pos[P2PX][P2PY]:= 0;
              P1TU.Enabled:=False;
              P1TD.Enabled:=False;
              P1TR.Enabled:=False;
              P1TL.Enabled:=False;
              P2TU.Enabled:=False;
              P2TD.Enabled:=False;
              P2TR.Enabled:=False;
              P2TL.Enabled:=False;
            end;
         4: Begin
              shape8.Visible:=False;
              P1P.Visible:=False;
              Pos[P1PX][P1PY]:= 0;
              label10.Font.color:=cllime;
              label10.Caption:='The Green Player Won!';
              label2.caption:=IntToStr(StrToint(Label2.caption) + 1);
              P1TU.Enabled:=False;
            end;
         end;
       end;
    2: Begin
         with P1P do
         begin
           Visible:= true;
           Brush.Color:=ClGreen;
           Left := shape1.Left + Round(0.026 * Screen.Width) + Round(0.010 * Screen.Width);
           Top := shape1.top + Round(0.017 * Screen.Height);
           Width := 15;
           Height := 15;
           Parent := Form1;
         end;

         Case Pos[P1X + 1][P1Y] of
         0: Begin
              Pos[P1X + 1][P1Y]:=3;
              P1PX:= P1X + 1;
              P1PY:= P1Y;
              P1TR.enabled:=true;
            end;
         1: Begin
              shape1.Visible:=False;
              P1P.Visible:=False;
              Pos[P1PX][P1PY]:= 0;
              label10.Font.color:=clRed;
              label10.Caption:='The Red Player Won!';
              label3.caption:=IntToStr(StrToint(Label3.caption) + 1);
              P1TR.Enabled:=False;
            end;
         2: Begin
              P1P.Visible:=False;
            end;
         3: Begin
              P1P.Visible:=False;
              Pos[P1PX][P1PY]:= 0;
              P2P.Visible:=False;
              Pos[P2PX][P2PY]:= 0;
              P1TU.Enabled:=False;
              P1TD.Enabled:=False;
              P1TR.Enabled:=False;
              P1TL.Enabled:=False;
              P2TU.Enabled:=False;
              P2TD.Enabled:=False;
              P2TR.Enabled:=False;
              P2TL.Enabled:=False;
            end;
         4: Begin
              shape8.Visible:=False;
              P1P.Visible:=False;
              Pos[P1PX][P1PY]:= 0;
              label10.Font.color:=cllime;
              label10.Caption:='The Green Player Won!';
              label2.caption:=IntToStr(StrToint(Label2.caption) + 1);
              P1TR.Enabled:=False;
            end;
         end;
       end;
    3: Begin
         with P1P do
         begin
           Visible:= true;
           Brush.Color:=ClGreen;
           Left := shape1.Left + Round(0.009 * Screen.Width);
           Top := shape1.top + Round(0.045 * Screen.Height) + Round(0.019 * Screen.Height);
           Width := 15;
           Height := 15;
           Parent := Form1;
         end;

         Case Pos[P1X][P1Y + 1] of
         0: Begin
              Pos[P1X][P1Y + 1]:=3;
              P1PX:= P1X;
              P1PY:= P1Y + 1;
              P1TD.enabled:=true;
            end;
         1: Begin
              shape1.Visible:=False;
              P1P.Visible:=False;
              Pos[P1PX][P1PY]:= 0;
              label10.Font.color:=clRed;
              label10.Caption:='The Red Player Won!';
              label3.caption:=IntToStr(StrToint(Label3.caption) + 1);
              P1TD.Enabled:=False;
            end;
         2: Begin
              P1P.Visible:=False;
            end;
         3: Begin
              P1P.Visible:=False;
              Pos[P1PX][P1PY]:= 0;
              P2P.Visible:=False;
              Pos[P2PX][P2PY]:= 0;
              P1TU.Enabled:=False;
              P1TD.Enabled:=False;
              P1TR.Enabled:=False;
              P1TL.Enabled:=False;
              P2TU.Enabled:=False;
              P2TD.Enabled:=False;
              P2TR.Enabled:=False;
              P2TL.Enabled:=False;
            end;
         4: Begin
              shape8.Visible:=False;
              P1P.Visible:=False;
              Pos[P1PX][P1PY]:= 0;
              label10.Font.color:=cllime;
              label10.Caption:='The Green Player Won!';
              label2.caption:=IntToStr(StrToint(Label2.caption) + 1);
              P1TD.Enabled:=False;
            end;
         end;
       end;
    4: Begin
         with P1P do
         begin
           Visible:= true;
           Brush.Color:=ClGreen;
           Left := shape1.Left - Round(0.026 * Screen.Width) + Round(0.009 * Screen.Width);
           Top := shape1.top + Round(0.019 * Screen.Height);
           Width := 15;
           Height := 15;
           Parent := Form1;
         end;

         Case Pos[P1X - 1][P1Y] of
         0: Begin
              Pos[P1X - 1][P1Y]:=3;
              P1PX:= P1X - 1;
              P1PY:= P1Y;
              P1TL.enabled:=true;
            end;
         1: Begin
              shape1.Visible:=False;
              P1P.Visible:=False;
              Pos[P1PX][P1PY]:= 0;
              label10.Font.color:=clRed;
              label10.Caption:='The Red Player Won!';
              label3.caption:=IntToStr(StrToint(Label3.caption) + 1);
              P1TL.Enabled:=False;
            end;
         2: Begin
              P1P.Visible:=False;
            end;
         3: Begin
              P1P.Visible:=False;
              Pos[P1PX][P1PY]:= 0;
              P2P.Visible:=False;
              Pos[P2PX][P2PY]:= 0;
              P1TU.Enabled:=False;
              P1TD.Enabled:=False;
              P1TR.Enabled:=False;
              P1TL.Enabled:=False;
              P2TU.Enabled:=False;
              P2TD.Enabled:=False;
              P2TR.Enabled:=False;
              P2TL.Enabled:=False;
            end;
         4: Begin
              shape8.Visible:=False;
              P1P.Visible:=False;
              Pos[P1PX][P1PY]:= 0;
              label10.Font.color:=cllime;
              label10.Caption:='The Green Player Won!';
              label2.caption:=IntToStr(StrToint(Label2.caption) + 1);
              P1TL.Enabled:=False;
            end;
         end;
       end;
    end;
end;

//Timer za Player 1 Proektil

//Timer za Player 1 Proektil Gore
procedure TForm1.P1TUTimer(Sender: TObject);
begin
   P1P.top:= P1P.top - Round(0.045 * Screen.Height);
   Pos[P1PX][P1PY]:= 0;
   P1PY:= P1PY - 1;
  case Pos[P1PX][P1PY] of
  0: begin
       if (Pos[P1PX][P1PY] = 0) AND (P1PY >= 0)
          then
          begin
          Pos[P1PX][P1PY]:= 3;
          end
          else
          begin
          P1P.Visible:=False;
          Pos[P1PX][P1PY]:= 0;
          P1TU.Enabled:=False;
          end;
       end;
  1: begin
       shape1.Visible:=False;
       P1P.Visible:=False;
       Pos[P1PX][P1PY]:= 0;
       label10.Font.color:=clRed;
       label10.Caption:='The Red Player Won!';
       Label3.caption:=IntToStr(StrToInt(Label3.Caption) + 1);
       P1TU.Enabled:=False;
     end;
  2: Begin
       P1P.Visible:=False;
       Pos[P1PX][P1PY]:= 2;
       P1TU.Enabled:=False;
     end;
  3: Begin
       P1P.Visible:=False;
       Pos[P1PX][P1PY]:= 0;
       P2P.Visible:=False;
       Pos[P2PX][P2PY]:= 0;
       P1TU.Enabled:=False;
       P1TD.Enabled:=False;
       P1TR.Enabled:=False;
       P1TL.Enabled:=False;
       P2TU.Enabled:=False;
       P2TD.Enabled:=False;
       P2TR.Enabled:=False;
       P2TL.Enabled:=False;
      end;
  4: Begin
       shape8.Visible:=False;
       P1P.Visible:=False;
       Pos[P1PX][P1PY]:= 0;
       label10.Font.color:=cllime;
       label10.Caption:='The Green Player Won!';
       Label2.caption:=IntToStr(StrToInt(Label2.Caption) + 1);
       P1TU.Enabled:=False;
     end;
  end;
end;

//Timer za Player 1 Proektil Desno
procedure TForm1.P1TRTimer(Sender: TObject);
begin
   P1P.Left:= P1P.Left + Round(0.026 * Screen.Width);
   Pos[P1PX][P1PY]:= 0;
   P1PX:= P1PX + 1;
  case Pos[P1PX][P1PY] of
  0: begin
       if (Pos[P1PX][P1PY] = 0) AND (P1PX <= 32)
       then
           Begin
            Pos[P1PX][P1PY]:= 3;
            end
       else
           Begin
            P1P.Visible:=False;
            Pos[P1PX][P1PY]:= 0;
            P1TR.Enabled:=False;
            end;
     end;
  1: begin
       shape1.Visible:=False;
       P1P.Visible:=False;
       Pos[P1PX][P1PY]:= 0;
       label10.Font.color:=clRed;
       label10.Caption:='The Red Player Won!';
       Label3.caption:=IntToStr(StrToInt(Label3.Caption) + 1);
       P1TU.Enabled:=False;

     end;
  2: Begin
       P1P.Visible:=False;
       Pos[P1PX][P1PY]:= 2;
       P1TR.Enabled:=False;
     end;
  3: Begin
       P1P.Visible:=False;
       Pos[P1PX][P1PY]:= 0;
       P2P.Visible:=False;
       Pos[P2PX][P2PY]:= 0;
       P1TU.Enabled:=False;
            P1TD.Enabled:=False;
            P1TR.Enabled:=False;
            P1TL.Enabled:=False;
            P2TU.Enabled:=False;
            P2TD.Enabled:=False;
            P2TR.Enabled:=False;
            P2TL.Enabled:=False;
     end;
  4: Begin
       shape8.visible:=False;
       P1P.Visible:=False;
       Pos[P1PX][P1PY]:= 0;
       label10.Font.color:=cllime;
       label10.Caption:='The Green Player Won!';
       Label2.caption:=IntToStr(StrToInt(Label2.Caption) + 1);
       P1TR.Enabled:=False;
     end;
  end;
end;

//Timer za Player 1 Proektil Levo
procedure TForm1.P1TLTimer(Sender: TObject);
begin
   P1P.Left:= P1P.Left - Round(0.026 * Screen.Width);
   Pos[P1PX][P1PY]:= 0;
   P1PX:= P1PX - 1;
  case Pos[P1PX][P1PY] of
  0: begin
       if (Pos[P1PX][P1PY] = 0) AND (P1PX >= 1)
       then
         begin
              Pos[P1PX][P1PY]:= 3;
         end
        else
        Begin
            P1P.Visible:=False;
            Pos[P1PX][P1PY]:= 0;
            P1TL.Enabled:=False;
        end;
     end;
  1: begin
       shape1.Visible:=False;
       P1P.Visible:=False;
       Pos[P1PX][P1PY]:= 0;
       label10.Font.color:=clRed;
       label10.Caption:='The Red Player Won!';
       Label3.caption:=IntToStr(StrToInt(Label3.Caption) + 1);
       P1TU.Enabled:=False;
      end;
  2: begin
       P1P.Visible:=False;
       Pos[P1PX][P1PY]:= 2;
       P1TL.Enabled:=False;
     end;
  3: Begin
       P1P.Visible:=False;
       Pos[P1PX][P1PY]:= 0;
       P2P.Visible:=False;
       Pos[P2PX][P2PY]:= 0;
       P1TU.Enabled:=False;
            P1TD.Enabled:=False;
            P1TR.Enabled:=False;
            P1TL.Enabled:=False;
            P2TU.Enabled:=False;
            P2TD.Enabled:=False;
            P2TR.Enabled:=False;
            P2TL.Enabled:=False;
     end;
  4: Begin
       shape8.Visible:=False;
       P1P.Visible:=False;
       Pos[P1PX][P1PY]:= 0;
       label10.Font.color:=cllime;
       label10.Caption:='The Green Player Won!';
       Label2.caption:=IntToStr(StrToInt(Label2.Caption) + 1);
       P1TL.Enabled:=False;
     end;
    end;
end;

//Timer za Player 1 Proektil Dole
procedure TForm1.P1TDTimer(Sender: TObject);
begin
   P1P.top:= P1P.top + Round(0.045 * Screen.Height);
   Pos[P1PX][P1PY]:= 0;
   P1PY:= P1PY + 1;;
  case Pos[P1PX][P1PY] of
    0: begin
         if (Pos[P1PX][P1PY] = 0) AND (P1PY <= 16)
         then
         Begin
            Pos[P1PX][P1PY]:= 3;
         end
         else
         Begin
            P1P.Visible:=False;
            Pos[P1PX][P1PY]:= 0;
            P1TD.Enabled:=False;
         end;
       end;
    1: begin
         shape1.Visible:=False;
         P1P.Visible:=False;
         Pos[P1PX][P1PY]:= 0;
         label10.Font.color:=clRed;
         label10.Caption:='The Red Player Won!';
         Label3.caption:=IntToStr(StrToInt(Label3.Caption) + 1);
         P1TU.Enabled:=False;
       end;
    2: Begin
            P1P.Visible:=False;
            Pos[P1PX][P1PY]:= 2;
            P1TD.Enabled:=False;
       end;
    3: Begin
            P1P.Visible:=False;
            Pos[P1PX][P1PY]:= 0;
            P2P.Visible:=False;
            Pos[P2PX][P2PY]:= 0;
            P1TU.Enabled:=False;
            P1TD.Enabled:=False;
            P1TR.Enabled:=False;
            P1TL.Enabled:=False;
            P2TU.Enabled:=False;
            P2TD.Enabled:=False;
            P2TR.Enabled:=False;
            P2TL.Enabled:=False;
       end;
    4: Begin
         shape8.visible:=False;
            P1P.Visible:=False;
            Pos[P1PX][P1PY]:= 0;
            label10.Font.color:=cllime;
            label10.Caption:='The Green Player Won!';
            Label2.caption:=IntToStr(StrToInt(Label2.Caption) + 1);
            P1TD.Enabled:=False;
       end;
     end;
end;

//Kopcinja na Player 2

//Kopce za player 2 Dole
procedure TForm1.P2DClick(Sender: TObject);
begin
  if (Pos[P2X][P2Y + 1] = 0) AND (P2Y + 1 <= 16) AND (Shape1.Visible =  True) AND (Label10.caption = '')
     then
     Begin
     Shape8.Top:=Shape8.Top + Round(0.045 * Screen.Height);
     Pos[P2X][P2Y]:= 0;
     P2Y:= P2Y + 1;
     Pos[P2X][P2Y]:= 4;
     P2O:= 3;
     end;
end;

//Kopce za player 2 Pukanje
procedure TForm1.P2FClick(Sender: TObject);
begin
  if (P2P.Visible = false) AND (Label10.caption = '')
  then
    Case P2O of
    1: Begin
         with P2P do
         begin
           Visible:= true;
           Brush.Color:=ClMaroon;
           Left := Shape8.Left + Round(0.009 * Screen.Width);
           Top := Shape8.top - Round(0.045 * Screen.Height) + Round(0.019 * Screen.Height);
           Width := 15;
           Height := 15;
           Parent := Form1;
         end;

         Case Pos[P2X][P2Y - 1] of
         0: Begin
              Pos[P2X][P2Y - 1]:=3;
              P2PX:= P2X;
              P2PY:= P2Y - 1;
              P2TU.enabled:=true;
            end;
         1: Begin
              shape1.Visible:=False;
              P2P.Visible:=False;
              Pos[P2PX][P2PY]:= 0;
              label10.Font.color:=clred;
              label10.Caption:='The Red Player Won!';
              label3.caption:=IntToStr(StrToint(Label3.caption) + 1);
              P2TU.Enabled:=False;
            end;
         2: Begin
              P2P.Visible:=False;
            end;
         3: Begin
              P2P.Visible:=False;
              Pos[P2PX][P2PY]:= 0;
              P1P.Visible:=False;
              Pos[P1PX][P1PY]:= 0;
              P1TU.Enabled:=False;
              P1TD.Enabled:=False;
              P1TR.Enabled:=False;
              P1TL.Enabled:=False;
              P2TU.Enabled:=False;
              P2TD.Enabled:=False;
              P2TR.Enabled:=False;
              P2TL.Enabled:=False;
            end;
         4: Begin
              shape8.Visible:=False;
              P2P.Visible:=False;
              Pos[P2PX][P2PY]:= 0;
              label10.Font.color:=clLime;
              label10.Caption:='The Green Player Won!';
              label2.caption:=IntToStr(StrToint(Label2.caption) + 1);
              P2TU.Enabled:=False;
            end;
         end;
       end;
    2: Begin
       with P2P do
       begin
         Visible:= true;
         Brush.Color:=ClMaroon;
         Left := Shape8.Left + Round(0.026 * Screen.Width) + Round(0.010 * Screen.Width);
         Top := Shape8.top + Round(0.017 * Screen.Height);
         Width := 15;
         Height := 15;
         Parent := Form1;
       end;

       Case Pos[P2X + 1][P2Y] of
         0: Begin
              Pos[P2X + 1][P2Y]:=3;
              P2PX:= P2X + 1;
              P2PY:= P2Y;
              P2TR.enabled:=true;
            end;
         1: Begin
              shape1.Visible:=False;
              P2P.Visible:=False;
              Pos[P2PX][P2PY]:= 0;
              label10.Font.color:=clred;
              label10.Caption:='The Red Player Won!';
              label3.caption:=IntToStr(StrToint(Label3.caption) + 1);
              P2TR.Enabled:=False;
            end;
         2: Begin
              P2P.Visible:=False;
            end;
         3: Begin
              P2P.Visible:=False;
              Pos[P2PX][P2PY]:= 0;
              P1P.Visible:=False;
              Pos[P1PX][P1PY]:= 0;
              P1TU.Enabled:=False;
              P1TD.Enabled:=False;
              P1TR.Enabled:=False;
              P1TL.Enabled:=False;
              P2TU.Enabled:=False;
              P2TD.Enabled:=False;
              P2TR.Enabled:=False;
              P2TL.Enabled:=False;
            end;
         4: Begin
              shape8.Visible:=False;
              P2P.Visible:=False;
              Pos[P2PX][P2PY]:= 0;
              label10.Font.color:=clLime;
              label10.Caption:='The Green Player Won!';
              label2.caption:=IntToStr(StrToint(Label2.caption) + 1);
              P1TR.Enabled:=False;
            end;
         end;
     end;
  3: Begin
       with P2P do
       begin
         Visible:= true;
         Brush.Color:=ClMaroon;
         Left := Shape8.Left + Round(0.009 * Screen.Width);
         Top := Shape8.top + Round(0.045 * Screen.Height) + Round(0.019 * Screen.Height);
         Width := 15;
         Height := 15;
         Parent := Form1;
       end;

       Case Pos[P2X][P2Y + 1] of
         0: Begin
              Pos[P2X][P2Y + 1]:=3;
              P2PX:= P2X;
              P2PY:= P2Y + 1;
              P2TD.enabled:=true;
            end;
         1: Begin
              shape1.Visible:=False;
              P2P.Visible:=False;
              Pos[P2PX][P2PY]:= 0;
              label10.Font.color:=clred;
              label10.Caption:='The Red Player Won!';
              label3.caption:=IntToStr(StrToint(Label3.caption) + 1);
              P2TD.Enabled:=False;
            end;
         2: Begin
              P2P.Visible:=False;
            end;
         3: Begin
              P2P.Visible:=False;
              Pos[P2PX][P2PY]:= 0;
              P1P.Visible:=False;
              Pos[P1PX][P1PY]:= 0;
              P1TU.Enabled:=False;
              P1TD.Enabled:=False;
              P1TR.Enabled:=False;
              P1TL.Enabled:=False;
              P2TU.Enabled:=False;
              P2TD.Enabled:=False;
              P2TR.Enabled:=False;
              P2TL.Enabled:=False;
            end;
         4: Begin
              shape8.Visible:=False;
              P2P.Visible:=False;
              Pos[P2PX][P2PY]:= 0;
              label10.Font.color:=clLime;
              label10.Caption:='The Green Player Won!';
              label2.caption:=IntToStr(StrToint(Label2.caption) + 1);
              P1TD.Enabled:=False;
            end;
         end;
     end;
  4: Begin
       with P2P do
       begin
         Visible:= true;
         Brush.Color:=ClMaroon;
         Left := Shape8.Left - Round(0.026 * Screen.Width) + Round(0.009 * Screen.Width);
         Top := Shape8.top + Round(0.019 * Screen.Height);
         Width := 15;
         Height := 15;
         Parent := Form1;
       end;

       Case Pos[P2X - 1][P2Y] of
         0: Begin
              Pos[P2X - 1][P2Y]:=3;
              P2PX:= P2X - 1;
              P2PY:= P2Y;
              P2TL.enabled:=true;
            end;
         1: Begin
              shape1.Visible:=False;
              P2P.Visible:=False;
              Pos[P2PX][P2PY]:= 0;
              label10.Font.color:=clred;
              label10.Caption:='The Red Player Won!';
              label3.caption:=IntToStr(StrToint(Label3.caption) + 1);
              P2TL.Enabled:=False;
            end;
         2: Begin
              P2P.Visible:=False;
            end;
         3: Begin
              P2P.Visible:=False;
              Pos[P2PX][P2PY]:= 0;
              P1P.Visible:=False;
              Pos[P1PX][P1PY]:= 0;
              P1TU.Enabled:=False;
              P1TD.Enabled:=False;
              P1TR.Enabled:=False;
              P1TL.Enabled:=False;
              P2TU.Enabled:=False;
              P2TD.Enabled:=False;
              P2TR.Enabled:=False;
              P2TL.Enabled:=False;
            end;
         4: Begin
              shape8.Visible:=False;
              P2P.Visible:=False;
              Pos[P2PX][P2PY]:= 0;
              label10.Font.color:=clLime;
              label10.Caption:='The Green Player Won!';
              label2.caption:=IntToStr(StrToint(Label2.caption) + 1);
              P2TL.Enabled:=False;
            end;
         end;
     end;
  end;
end;

//Kopce za player 2 Levo
procedure TForm1.P2LClick(Sender: TObject);
begin
  if (Pos[P2X - 1][P2Y] = 0) AND (P2X - 1 > 0) AND (Shape1.Visible = True) AND (Label10.caption = '')
     then
     begin
     Shape8.Left:=Shape8.Left - Round(0.0254 * Screen.Width);
     Pos[P2X][P2Y]:= 0;
     P2X:= P2X - 1;
     Pos[P2X][P2Y]:= 4;
     P2O:= 4;
     end;
end;

//Kopce za player 2 Desno
procedure TForm1.P2RClick(Sender: TObject);
begin
  if (Pos[P2X + 1][P2Y] = 0) AND (P2X + 1 <= 32) AND (Shape1.Visible =  True) AND (Label10.caption = '')
     then
     begin
     Shape8.Left:=Shape8.Left + Round(0.0254 * Screen.Width);
     Pos[P2X][P2Y]:= 0;
     P2X:= P2X + 1;
     Pos[P2X][P2Y]:= 4;
     P2O:= 2;
     end;

end;

//Kopce za player 2 Gore
procedure TForm1.P2UClick(Sender: TObject);
begin
  if (Pos[P2X][P2Y - 1] = 0) AND (P2Y - 1 > 0) AND (Shape1.Visible =  True) AND (Label10.caption = '')
     then
     begin
     Shape8.Top:=Shape8.Top - Round(0.045 * Screen.Height);
     Pos[P2X][P2Y]:= 0;
     P2Y:= P2Y - 1;
     Pos[P2X][P2Y]:= 4;
     P2O:= 1;
     end;

end;

//Timer za Player 2 Proektil

//Timer za Player 2 Proektil Gore
procedure TForm1.P2TUTimer(Sender: TObject);
begin
  P2P.top:= P2P.top - Round(0.045 * Screen.Height);
   Pos[P2PX][P2PY]:= 0;
   P2PY:= P2PY - 1;
  Case Pos[P2PX][P2PY] of
  0: begin
       if (Pos[P2PX][P2PY] = 0) AND (P2PY > 0)
          then
          begin
          Pos[P2PX][P2PY]:= 3;
          end
          else
          begin
          P2P.Visible:=False;
          Pos[P2PX][P2PY]:= 0;
          P2TU.Enabled:=False;
          end;
       end;
  1: begin
       shape1.Visible:=False;
       P2P.Visible:=False;
       Pos[P2PX][P2PY]:= 0;
       label10.Font.color:=clred;
       label10.Caption:='The Red Player Won!';
       Label3.caption:=IntToStr(StrToInt(Label3.Caption) + 1);
       P2TU.Enabled:=False;
     end;
  2: Begin
       P2P.Visible:=False;
       Pos[P2PX][P2PY]:= 2;
       P2TU.Enabled:=False;
     end;
  3: Begin
       P2P.Visible:=False;
       Pos[P2PX][P2PY]:= 0;
       P1P.Visible:=False;
       Pos[P1PX][P1PY]:= 0;
       P1TU.Enabled:=False;
       P1TD.Enabled:=False;
       P1TR.Enabled:=False;
       P1TL.Enabled:=False;
       P2TU.Enabled:=False;
       P2TD.Enabled:=False;
       P2TR.Enabled:=False;
       P2TL.Enabled:=False;
     end;
  4: Begin
       shape8.Visible:=False;
       P2P.Visible:=False;
       Pos[P2PX][P2PY]:= 0;
       label10.Font.color:=clLime;
       label10.Caption:='The Green Player Won!';
       Label2.caption:=IntToStr(StrToInt(Label2.Caption) + 1);
       P2TU.Enabled:=False;
     end;
  end;
end;

//Timer za Player 2 Proektil Desno
procedure TForm1.P2TRTimer(Sender: TObject);
begin
  P2P.Left:= P2P.Left + Round(0.026 * Screen.Width);
   Pos[P2PX][P2PY]:= 0;
   P2PX:= P2PX + 1;
  case Pos[P2PX][P2PY] of
  0: begin
       if (Pos[P2PX][P2PY] = 0) AND (P2PX < 33)
       then
           Begin
            Pos[P2PX][P2PY]:= 3;
            end
       else
           Begin
            P2P.Visible:=False;
            Pos[P2PX][P2PY]:= 0;
            P2TR.Enabled:=False;
            end;
     end;
  1: begin
       shape1.visible:=False;
       P2P.Visible:=False;
       Pos[P2PX][P2PY]:= 0;
       label10.Font.color:=clred;
       label10.Caption:='The Red Player Won!';
       Label3.caption:=IntToStr(StrToInt(Label3.Caption) + 1);
       P2TR.Enabled:=False;
     end;
  2: Begin
       P2P.Visible:=False;
       Pos[P2PX][P2PY]:= 2;
       P2TR.Enabled:=False;
     end;
  3: Begin
       P2P.Visible:=False;
       Pos[P2PX][P2PY]:= 0;
       P1P.Visible:=False;
       Pos[P1PX][P1PY]:= 0;
       P1TU.Enabled:=False;
            P1TD.Enabled:=False;
            P1TR.Enabled:=False;
            P1TL.Enabled:=False;
            P2TU.Enabled:=False;
            P2TD.Enabled:=False;
            P2TR.Enabled:=False;
            P2TL.Enabled:=False;
     end;
  4: Begin
       shape8.Visible:=False;
       P2P.Visible:=False;
       Pos[P2PX][P2PY]:= 0;
       label10.Font.color:=clLime;
       label10.Caption:='The Green Player Won!';
       Label2.caption:=IntToStr(StrToInt(Label2.Caption) + 1);
       P2TU.Enabled:=False;
     end;
  end;
end;

//Timer za Player 2 Proektil Levo
procedure TForm1.P2TLTimer(Sender: TObject);
begin
  P2P.Left:= P2P.Left - Round(0.026 * Screen.Width);
   Pos[P2PX][P2PY]:= 0;
   P2PX:= P2PX - 1;
  case Pos[P2PX][P2PY] of
  0: begin
       if (Pos[P2PX][P2PY] = 0) AND (P2PX >= 1)
       then
         begin
              Pos[P2PX][P2PY]:= 3;
         end
        else
        Begin
            P2P.Visible:=False;
            Pos[P2PX][P2PY]:= 0;
            P2TL.Enabled:=False;
        end;
     end;
  1: begin
       shape1.Visible:=False;
       P2P.Visible:=False;
       Pos[P2PX][P2PY]:= 0;
       label10.Font.color:=clred;
       label10.Caption:='The Red Player Won!';
       Label3.caption:=IntToStr(StrToInt(Label3.Caption) + 1);
       P2TL.Enabled:=False;
      end;
  2: begin
       P2P.Visible:=False;
       Pos[P2PX][P2PY]:= 2;
       P2TL.Enabled:=False;
     end;
  3: Begin
       P2P.Visible:=False;
       Pos[P2PX][P2PY]:= 0;
       P1P.Visible:=False;
       Pos[P1PX][P1PY]:= 0;
       P1TU.Enabled:=False;
            P1TD.Enabled:=False;
            P1TR.Enabled:=False;
            P1TL.Enabled:=False;
            P2TU.Enabled:=False;
            P2TD.Enabled:=False;
            P2TR.Enabled:=False;
            P2TL.Enabled:=False;
     end;
  4: Begin
       shape8.Visible:=False;
       P2P.Visible:=False;
       Pos[P2PX][P2PY]:= 0;
       label10.Font.color:=clLime;
       label10.Caption:='The Green Player Won!';
       Label2.caption:=IntToStr(StrToInt(Label2.Caption) + 1);
       P2TU.Enabled:=False;
     end;
    end;
end;

//Timer za Player 2 Proektil Dole
procedure TForm1.P2TDTimer(Sender: TObject);
begin
  P2P.top:= P2P.top + Round(0.045 * Screen.Height);
   Pos[P2PX][P2PY]:= 0;
   P2PY:= P2PY + 1;
  case Pos[P2PX][P2PY] of
    0: begin
         if (Pos[P2PX][P2PY] = 0) AND (P2PY <= 16)
         then
         Begin
            Pos[P2PX][P2PY]:= 3;
         end
         else
         Begin
            P2P.Visible:=False;
            Pos[P2PX][P2PY]:= 0;
            P2TD.Enabled:=False;
         end;
       end;
    1: begin
            shape1.visible:=False;
            P2P.Visible:=False;
            Pos[P2PX][P2PY]:= 0;
            label10.Font.color:=clred;
            label10.Caption:='The Red Player Won!';
            Label3.caption:=IntToStr(StrToInt(Label3.Caption) + 1);
            P2TD.Enabled:=False;
       end;
    2: Begin
            P2P.Visible:=False;
            Pos[P2PX][P2PY]:= 2;
            P2TD.Enabled:=False;
       end;
    3: Begin
            P1P.Visible:=False;
            Pos[P1PX][P1PY]:= 0;
            P2P.Visible:=False;
            Pos[P2PX][P2PY]:= 0;
            P1TU.Enabled:=False;
            P1TD.Enabled:=False;
            P1TR.Enabled:=False;
            P1TL.Enabled:=False;
            P2TU.Enabled:=False;
            P2TD.Enabled:=False;
            P2TR.Enabled:=False;
            P2TL.Enabled:=False;
       end;
    4: Begin
       shape8.Visible:=False;
       P2P.Visible:=False;
       Pos[P2PX][P2PY]:= 0;
       label10.Font.color:=clLime;
       label10.Caption:='The Green Player Won!';
       Label2.caption:=IntToStr(StrToInt(Label2.Caption) + 1);
       P2TU.Enabled:=False;
       End;
     end;
end;

end.

