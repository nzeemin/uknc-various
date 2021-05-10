PROGRAM KINGOM;
{$S+}

procedure L65754; external; { Работа с KIND.DAT }
function L57170(A:integer; var B:real):real; external;
procedure ESC161; external; {L57412}
procedure ESCJ; external; {L57444}
procedure CURSORTO(R,C:integer); external; {L57476}
procedure L57632; external;
procedure L57660(var A:integer; var B:integer; var C:real); external;
procedure L60060; external;
procedure L62010(
	var A:real; var B:real; var C:real; var D:real; var E:real; var F:real;
	G:integer; H:integer; I:integer; J:integer; K:integer; L:integer;
	M:integer; N:integer; O:integer; P:integer; Q:integer; R:integer); external;

var	VARF0:array [0..11] of integer; {filler}
	VAR30:array [0..9] of char; { Ваш псевдоним }
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
	VAR124:integer;
	VAR126:integer;
	VAR130:integer;
	VAR132:integer;
	VAR134:integer;
	VAR136:integer;
	VAR140:integer;
	VAR142:integer;
	VAR144:integer;
	VAR146:integer;
	VAR150:integer;
	VAR152:integer;
	VAR154:integer;
	VAR156:integer;
	VAR160:integer;
	VAR162:integer;
	VAR164:integer;
	VAR166:integer;
	VAR170:integer;
	VAR172:integer; { Год правления, от 1986 }
	VAR174:integer; { Номер года правления, от 1 }
	VAR176:integer; { Сколько лет будем править }
	VAR200:integer;
	VAR202:integer;
	VAR204:integer;
	VAR206:integer;
	VAR210:integer;
	VAR212:integer;
	VAR214:integer;
	VAR216:integer;
	VAR224:real;
	VAR236:real;
	VAR242:real;
	VAR246:real;
	VAR252:real;
	VAR256:real;
	VAR262:real;
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

label 1;
BEGIN {L01150}
VAR316 := 0; {L01162}
VAR322 := 0; {L01200}
VAR336 := 0; {L01216}
VAR342 := 0; {L01234}
VAR326 := 0; {L01252}
VAR332 := 0; {L01270}
VAR146 := 0; {L01306}
VAR150 := 0;
VAR152 := 0;
VAR154 := 0;
VAR156 := 0;
VAR160 := 0;
VAR162 := 0;
VAR164 := 0;
VAR166 := 0;
VAR170 := 0;
VAR124 := 0;
VAR126 := 0;
VAR130 := 0;
VAR132 := 0;
VAR134 := 0;
VAR136 := 0;
VAR140 := 0;
VAR142 := 0;
VAR144 := 0;
VAR212 := 0;
VAR214 := 0; {L01426}
L57632; {L01432}
CURSORTO(10,15); {L01436}
WRITE('_k o r o l e w s t w o   | j f o r i q'); {NOTE: Тут в начале символ 016}
CURSORTO(20,0);
WRITE('==> skolxko let wy sobiraetesx prawitx ?');
READLN(VAR176);
WRITE('==> wa{ psewdonim ? '); {L01534}
READLN(VAR30);
VAR102 := ROUND(L57170(1177, VAR224));
VAR104 := ORD(VAR30[0] + VAR30[1]); {L01630}
VAR106 := VAR104 + VAR176; {L01646}
for VAR216 := 1 to VAR106 do begin
	VAR102 := ROUND(L57170(0,VAR224));
end;
VAR172 := 1986; { Год правления }
VAR174 := 1; { Номер года правления }
VAR42 := 1000;
VAR44 := 100;
VAR46 := 10;
VAR50 := 100;
VAR52 := 200;
VAR236 := 0; {L02040}
VAR242 := TRUNC(100 * (L57170(0,VAR224) + 0.5)); {L02056}
VAR246 := TRUNC(100 * (L57170(0,VAR224) + 0.5)); {L02140}
VAR252 := TRUNC(300 * (L57170(0,VAR224) + 0.5)); {L02222}
VAR256 := TRUNC(100 * (L57170(0,VAR224) + 0.5)); {L02304}
VAR262 := TRUNC(100 * (L57170(0,VAR224) + 0.5)); {L02366}
VAR200 := 1; {L02450}
VAR202 := 1;
VAR204 := 4;
VAR206 := 1;
VAR210 := 10; {L02500}
L57632; {L02506}
VAR54 := ROUND(VAR42 * (L57170(0,VAR224) * L57170(0,VAR224) + 0.8));
VAR56 := ROUND(VAR44 * (L57170(0,VAR224) * 0.4 + 0.8));
VAR60 := ROUND(VAR46 * (L57170(0,VAR224) + 0.5));
VAR62 := ROUND(VAR50 * (L57170(0,VAR224) + 0.5));
VAR64 := ROUND(VAR52 * (L57170(0,VAR224) + 0.5)); {L03022}
VAR66 := ROUND(VAR54 / VAR42 * 100);
VAR70 := ROUND(VAR56 / VAR44 * 100);
VAR72 := ROUND(VAR60 / VAR46 * 100);
VAR74 := ROUND(VAR62 / VAR50 * 100);
VAR76 := ROUND(VAR64 / VAR52 * 100); {L03314}
L57632; {L03360}
L62010(VAR242, VAR236, VAR246, VAR252, VAR256, VAR262,
	VAR54, VAR56, VAR60, VAR62, VAR54, VAR66,
	VAR70, VAR72, VAR74, VAR76, VAR172, VAR174);
CURSORTO(15,0);
ESCJ;
VAR346 := L57170(0,VAR224); {L03546}
if VAR346 < 0.5 then begin {L03576}
	WRITELN(' t o r g o w l q  -  d w i g a t e l x   p r o g r e s s a');
end;
VAR352 := L57170(0,VAR224);
if (VAR346 > 0.5) AND (VAR352 > 0.5) then begin
	WRITELN('   ~   p    !    | k o n o m i ~ e s k a q   b l o k a d a');
	goto 1;
end; {L04034}
CURSORTO(18,0);
ESCJ;
VAR346 := VAR242 * L57170(0,VAR224);
L57660(VAR102,VAR104,VAR346); {L04114}
WRITE('
     makler prosit :');
WRITE(VAR102); {L04166}
WRITE(' tysq~');
WRITE(VAR104);
WRITE(' rublej
==> velaete ispolxzowatx maklera ? (0/1)');
READLN(VAR102); {L04246}
if VAR102 = 1 then begin {L04276}
	CURSORTO(18,0);
	ESCJ; {L04310}
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
	{L05024}

	{TODO}
end;

1:

{TODO}
L65754; { Работа с KIND.DAT }
END.
