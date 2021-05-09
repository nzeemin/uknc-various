PROGRAM KINGOM;
{$S+}

procedure L65754; external; { Работа с KIND.DAT }
procedure L57170(var A:integer); external;
procedure ESC161; external; {L57412}
procedure ESCJ; external; {L57444}
procedure CURSORTO(R,C:integer); external; {L57476}
procedure L57632; external;
procedure L57660; external;
procedure L60060; external;
procedure L62010; external;

var	VAR30:char;
	VAR31:char;
	VAR42:integer;
	VAR44:integer;
	VAR46:integer;
	VAR50:integer;
	VAR52:integer;
	VAR54:integer;
	VAR56:integer;
	VAR60:integer;
	VAR62:integer;
	VAR64:integer;
	VAR66:integer;
	VAR70:integer;
	VAR72:integer;
	VAR74:integer;
	VAR76:integer;
	VAR102:integer;
	VAR104:integer;
	VAR106:integer;
	VAR146:integer;
	VAR150:integer;
	VAR152:integer;
	VAR154:integer;
	VAR156:integer;
	VAR176:integer; { Сколько лет будем править }
	VAR236:real;
	VAR242:real;
	VAR246:real;
	VAR256:real;
	VAR316:real;
	VAR322:real;
	VAR326:real;
	VAR332:real;
	VAR336:real;
	VAR342:real;
	VAR346:real;
	VAR352:real;
	VAR356:real;
	VAR362:real;
	VAR366:real;
	VAR372:real;

function L01044(A:real):integer;
begin
	if A > 32000.0 then
		L01044 := 32000
	else
		L01044 := TRUNC(A);
end;

BEGIN {L01150}
VAR316 := 0; {L01162}
VAR322 := 0; {L01200}
VAR336 := 0; {L01216}
VAR342 := 0; {L01234}
VAR326 := 0; {L01252}
VAR332 := 0; {L01270}
VAR146 := 0; {L01306}
{TODO}
CURSORTO(10,15); {L01436}
WRITE('_k o r o l e w s t w o   | j f o r i q'); {NOTE: Тут в начале символ 016}
CURSORTO(20,0);
WRITE('==> skolxko let wy sobiraetesx prawitx ?');
READLN(VAR176);
WRITE('==> wa{ psewdonim ? ');
{TODO}
WRITELN(' t o r g o w l q  -  d w i g a t e l x   p r o g r e s s a');
{TODO}
WRITELN('   ~   p    !    | k o n o m i ~ e s k a q   b l o k a d a');
{TODO}
WRITE('     makler prosit :');
{TODO}
WRITE(' tysq~');
{TODO}
WRITELN(' rublej
==> velaete ispolxzowatx maklera ? (0/1)');
if VAR102 = 1 then begin {L04262}
	CURSORTO(18,0);
	ESCJ;
	VAR242 := VAR242 - VAR346; {L04314}
	VAR352 := 0; {L04346}
	VAR356 := 0; {L04364}
	VAR362 := 0; {L04402}
	VAR366 := 0; {L04420}
	VAR372 := 0; {L04436}
	if (VAR236 > 0) AND (VAR66 > 100) then begin
		WRITE(' zoloto,'); {L04542}
		VAR352 := VAR236; {L04560}
	end;
	if (VAR246 > 0) AND (VAR70 > 100) AND (VAR246 > VAR256 + 50) then begin {L04600}
		WRITE(' zeml`,'); {L04742}
		VAR356 := VAR246 - VAR256 - 50; {L04760}
	end;
	{L04600}

	{TODO}
end;

{TODO}
L65754; { Работа с KIND.DAT }
END.
