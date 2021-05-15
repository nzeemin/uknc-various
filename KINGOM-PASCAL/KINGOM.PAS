PROGRAM KINGOM;
{$S+}
type FArray = array [1..10] of integer;

procedure L65754(var F:FArray); external; { Работа с KIND.DAT }
function L57170(A:integer; var B:integer):real; external;
procedure ESC161; external; {L57412}
procedure ESCJ; external; {L57444}
procedure CURSORTO(R,C:integer); external; {L57476}
procedure L57632; external; { Курсор в 0,0; ESCJ }
procedure L57660(var A:integer; var B:integer; var C:real); external; { Разделяем на тысячи и остаток }
procedure L60060(K,B,C,D,E,F:real); external; { Вывод статистики }
procedure L62010(
	var A:real; var B:real; var C:real; var D:real; var E:real; var F:real;
	G:integer; H:integer; I:integer; J:integer; K:integer; L:integer;
	M:integer; N:integer; O:integer; P:integer; Q:integer; R:integer); external;

var	VARF0:array [1..10] of integer;
	VAR24:integer;
	VAR26:integer;
	VAR30:array [1..10] of char; { Ваш псевдоним }
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
	VAR100:integer;
	VAR102:integer; { Временная переменная }
	VAR104:integer; { Временная переменная }
	VAR106:integer; { Временная переменная }
	VAR110:integer; { Временная переменная }
	VAR112:integer;
	VAR114:integer;
	VAR116:integer;
	VAR120:integer;
	VAR122:integer;
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
	VAR172:integer; { YEAR - Год правления, от 1986 }
	VAR174:integer; { YRNUM - Номер года правления, от 1 }
	VAR176:integer; { YRCNT - Сколько лет будем править }
	VAR200:integer;
	VAR202:integer;
	VAR204:integer;
	VAR206:integer;
	VAR210:integer;
	VAR212:integer;
	VAR214:integer;
	VAR216:integer;
	VAR220:integer;
	VAR222:integer;
	VAR224:integer;
	VAR226:real;
	VAR232:real;
	VAR236:real; { GOLD - Золото }
	VAR242:real; { MONEY - Денег в казне }
	VAR246:real; { LAND - Земля }
	VAR252:real; { GRAIN - Зерно }
	VAR256:real; { WORKS - Рабочие }
	VAR262:real; { GUARD - Солдаты }
	VAR266:real; { Золото купить/продать }
	VAR272:real;
	VAR276:real; { Земля купить/продать }
	VAR302:real; { Зерно купить/продать }
	VAR306:real; { Рабочие купить/продать }
	VAR312:real; { Солдаты купить/продать }
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
	VAR376:real;
	VAR402:real;
	VAR406:array [1..6] of real;{filler}

function L01044(A:real):integer;
begin
	if A > 32000.0 then
		L01044 := 32000
	else
		L01044 := TRUNC(A);
end;

label 0,1,2,3,4,5,6,7,8;
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
VAR104 := ORD(VAR30[1]) + ORD(VAR30[2]); {L01630}
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
0: {L02512}
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
	VAR54, VAR56, VAR60, VAR62, VAR64, VAR66,
	VAR70, VAR72, VAR74, VAR76, VAR172, VAR174);
1: {L03530}
CURSORTO(15,0);
ESCJ;
VAR346 := L57170(0,VAR224); {L03546}
if VAR346 < 0.5 then begin {L03576}
	WRITELN(' t o r g o w l q  -  d w i g a t e l x   p r o g r e s s a');
end;
VAR352 := L57170(0,VAR224);
if (VAR346 > 0.5) and (VAR352 > 0.5) then begin
	WRITELN('   ~   p    !    | k o n o m i ~ e s k a q   b l o k a d a');
	goto 3;
end; {L04034}
CURSORTO(18,0);
ESCJ;
VAR346 := VAR242 * L57170(0,VAR224);
L57660(VAR102,VAR104,VAR346); { Разделяем на тысячи и остаток } {L04114}
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
	if (VAR236 > 0) and (VAR66 > 100) then begin
		WRITE(' zoloto,'); {L04542}
		VAR352 := VAR236; {L04560}
	end;
	if (VAR246 > 0) and (VAR70 > 100) and (VAR246 > VAR256 + 50) then begin {L04600}
		WRITE(' zeml`,'); {L04742}
		VAR356 := VAR246 - VAR256 - 50; {L04760}
	end;
	if VAR256 < VAR246 then {L05024}
		VAR346 := VAR256
	else
		VAR346 := VAR246;
	VAR376 := VAR252 - (VAR346 * VAR200) + (VAR256 + VAR262) * VAR202;
	if (VAR252 > 0) and (VAR72 > 100) and (VAR376 > 0) then begin {L05224}
		WRITE(' hleb,');
		VAR362 := VAR376; {L05370}
	end;
	if (VAR256 > 0) and (VAR256 > VAR246) and (VAR74 > 100) then begin {L05410}
		WRITE(' rabo~ih,');
		VAR366 := VAR256 / VAR246;
	end;
	if (VAR262 > 0) AND (VAR76 > 100) then begin {L05610}
		WRITE(' soldat');
		VAR372 := VAR262;
	end;
	VAR102 := 0; {L05734}
	if (VAR352 <> 0) OR (VAR356 <> 0) OR (VAR362 <> 0) OR (VAR366 <> 0) OR (VAR372 <> 0) then begin
		WRITE(' predlaga` wygodno prodatx. soglasny ? (0/1) ');
		READLN(VAR102);
		if VAR102 = 0 then {L06224}
			goto 2; {L06236}
	end;
	if VAR102 = 1 then begin {L06246}
		VAR346 := VAR352 * VAR54 + VAR356 * VAR56 + VAR362 * VAR60 + VAR366 * VAR62 + VAR372 * VAR64; {L06262}
		VAR242 := VAR242 + VAR346; {L06434}
		VAR236 := VAR236 - VAR352; {L06466}
		VAR246 := VAR246 - VAR356; {L06520}
		VAR252 := VAR252 - VAR362; {L06552}
		VAR256 := VAR256 - VAR366; {L06604}
		VAR262 := VAR262 - VAR372; {L06636}
		L62010(VAR242, VAR236, VAR246, VAR252, VAR256, VAR262,
			VAR54, VAR56, VAR60, VAR62, VAR64, VAR66,
			VAR70, VAR72, VAR74, VAR76, VAR172, VAR174);
	end;
	VAR402 := VAR242 - VAR262 * VAR210; {L07034}
	if (VAR402 < VAR54) AND (VAR402 > VAR60) then begin {L07100}
		goto 3; {L07206}
	end;
	CURSORTO(18,0);
	ESCJ; {L07230}
	L57660(VAR102,VAR104,VAR402); { Разделяем на тысячи и остаток }
	WRITE('
  w kazne');
	WRITE(VAR102);
	WRITE(' t.');
	WRITE(VAR104);
	WRITE(' rublej ( iskl`~aq valowanie )
==> skolxko deneg wy rashoduete na optowu` zakupku ? ');
	READLN(VAR346);
	if VAR346 > VAR402 then
		VAR402 := VAR346;
	CURSORTO(18,0); {L07460}
	ESCJ;
	VAR352 := 0;
	VAR356 := 0;
	VAR362 := 0;
	if VAR256 > VAR246 then {L07550}
		VAR346 := VAR246
	else
		VAR346 := VAR256;
	VAR346 := VAR346 * VAR200 + (VAR256 + VAR262) * VAR202; {L07736}
	if (VAR72 < 100) AND (VAR346 > VAR252) then begin
		WRITE(' zerno,'); {L10026}
		VAR352 := TRUNC(VAR402 / VAR60); {L10044}
		if VAR352 > VAR346 - VAR252 then
			VAR352 := VAR346 - VAR252; {L10152}
		VAR402 := VAR402 - VAR352 * VAR60; {L10204}
	end;
	if (VAR66 < 100) AND (VAR402 > VAR54) AND (VAR66 < VAR70) then begin
		WRITE(' zoloto');
		VAR356 := TRUNC(VAR402 / VAR54); {L10402}
		VAR402 := VAR402 - VAR356 * VAR54; {L10444}
	end;
	if (VAR70 < 100) AND (VAR402 > VAR56) AND (VAR70 < VAR66) then begin {L10510}
		WRITE(' zeml`');
		VAR362 := TRUNC(VAR402 / VAR56); {L10642}
		VAR402 := VAR402 - VAR362 * VAR56; {L10704}
	end;
	VAR102 := 0; {L10750}
	if (VAR352 <> 0) OR (VAR356 <> 0) OR (VAR362 <> 0) then begin
		WRITE(' predlaga` wygodno kupitx. soglasny ? (0/1) ');
		READLN(VAR102);
		if VAR102 = 0 then {L11144}
			goto 2; {L11156}
	end;
	if VAR102 = 1 then begin {L11166}
		VAR346 := VAR352 * VAR60 + VAR356 * VAR54 + VAR362 * VAR56;
		VAR242 := VAR242 - VAR346; {L11304}
		VAR252 := VAR252 + VAR352; {L11336}
		VAR236 := VAR236 + VAR356; {L11370}
		VAR246 := VAR246 + VAR362; {L11422}
		L62010(VAR242, VAR236, VAR246, VAR252, VAR256, VAR262,
			VAR54, VAR56, VAR60, VAR62, VAR64, VAR66,
			VAR70, VAR72, VAR74, VAR76, VAR172, VAR174);
	end;
	goto 3;
end;
2: {L11630}
CURSORTO(18,0);
ESCJ;
WRITE('==> velaete sami torgowatx ? (0/1) ');
READLN(VAR102);
if VAR102 = 0 then {L11700}
	goto 3;
CURSORTO(18,0);
ESCJ;
WRITELN('_           (+) pokupajte / prodawajte (-) :'); {NOTE: Тут в начале символ 016}
WRITELN('  zoloto(kg),zemlq(ga),zerno(t),rabo~ie,soldaty(~el)?');
WRITE('==> ');
READLN(VAR266,VAR276,VAR302,VAR306,VAR312); {L12022}
VAR346 := VAR236 + VAR266; {L12122}
VAR352 := VAR246 + VAR276; {L12154}
VAR356 := VAR252 + VAR302; {L12206}
VAR362 := VAR256 + VAR306; {L12240}
VAR366 := VAR262 + VAR312; {L12272}
if (VAR346 < 0) OR (VAR352 < 0) OR (VAR352 < 0) OR (VAR356 < 0) OR (VAR366 < 0) then begin {L12324}
	CURSORTO(18,0);
	ESCJ;
	WRITE('  wy prodaete towara bolx{e, ~em u was estx !
==> powtoritx ? (0/1) ');
	READLN(VAR102);
	if VAR102 = 1 then
		goto 1 {L12642}
	else
		goto 3; {L12656}
end;
VAR346 := -(VAR242 - VAR266 * VAR54 - VAR276 * VAR56 - VAR302 * VAR60
	- VAR306 * VAR62 - VAR312 * VAR64); {L12666}
if VAR346 > 0 then begin {L13056}
	CURSORTO(18,0);
	ESCJ;
	L57660(VAR102,VAR104,VAR346); {L13124}
	WRITE('  sdelka rastorgnuta - nehwataet');
	WRITE(VAR102);
	WRITE(' tys.');
	WRITE(VAR104);
	WRITE(' rub.
==> powtoritx ? (0/1) ');
	READLN(VAR102);
	if VAR102 = 1 then {L13272}
		goto 1 {L13306}
	else
		goto 3; {L13322}
end;
VAR242 := VAR242 - VAR266 * VAR54 - VAR276 * VAR56
	- VAR302 * VAR60 - VAR306 * VAR62 - VAR312 * VAR64;
VAR236 := VAR236 + VAR266; {L13516}
VAR246 := VAR246 + VAR276; {L13550}
VAR252 := VAR252 + VAR302; {L13602}
VAR256 := VAR256 + VAR306; {L13634}
VAR262 := VAR262 + VAR312; {L13666}
L62010(VAR242, VAR236, VAR246, VAR252, VAR256, VAR262,
		VAR54, VAR56, VAR60, VAR62, VAR64, VAR66,
		VAR70, VAR72, VAR74, VAR76, VAR172, VAR174);
3: {L14064}
CURSORTO(18,0);
ESCJ;
WRITE('==> velaete sami rasporqditxsq zapasami zerna ? (0/1) '); {L14102}
READLN(VAR102);
if VAR256 < VAR246 then
	VAR352 := VAR256
else
	VAR352 := VAR246;
VAR356 := VAR200 * VAR352; {L14232}
VAR362 := VAR202 * (VAR256 + VAR262); {L14264}
VAR366 := VAR356 + VAR262; {L14330}
VAR112 := L01044(VAR366); {L14362}
CURSORTO(18,0); {L14406}
ESCJ; {L14420}
if VAR102 = 0 then begin
	if (VAR366 < VAR252) OR (VAR366 = VAR252) then begin
		WRITE('--->  wydelena norma :');
		WRITE(VAR112);
		WRITELN(' t. zerna');
		VAR252 := VAR252 - VAR366; {L14614}
		VAR226 := VAR356; {L14646}
		VAR232 := VAR362;
		VAR102 := L01044(VAR252);
		WRITE('  izli{ki zerna w ambarah :');
		WRITE(VAR102);
		WRITELN(' tonn.');
		goto 4;
	end;
end;
CURSORTO(18,0); {L15014}
ESCJ;
WRITE('==> skolxko tonn zerna na edu, skolxko na posew ? ');
READLN(VAR232,VAR226);
VAR346 := VAR226 + VAR232; {L15104}
if VAR346 > VAR252 then begin
	VAR102 := L01044(VAR346 - VAR252);
	WRITE('  razberitesx! nehwataet');
	WRITE(VAR102);
	WRITELN(' tonn zerna.');
	goto 3; {L15300}
end;
VAR252 := VAR252 - VAR346; {L15310}
VAR102 := L01044(VAR252); {L15342}
WRITE('  ostatok zerna w ambarah');
WRITE(VAR102);
WRITELN(' tonn.');
4: {L15440}
VAR124 := 0;
VAR126 := 0;
VAR130 := 0;
VAR132 := 0;
VAR134 := 0;
VAR136 := 0;
VAR140 := 0;
VAR142 := 0;
VAR144 := 0; {L15500}
VAR346 := VAR232 / VAR202 - VAR262 - VAR256; {L15504}
VAR322 := -(VAR346 / VAR256); {L15562}
VAR316 := VAR316 + VAR322; {L15620}
if VAR316 > 0 then
	VAR316 := 0; {L15702}
if VAR316 > 1 then begin
	L57632;
	CURSORTO(10,0);
	WRITELN(' n a r o d  w  o  s  s  t  a  l  ! ! !');
	ESCJ;
	goto 8; {L16016}
end;
VAR346 := VAR232 / VAR202; {L16026}
VAR352 := VAR346 - VAR262; {L16060}
if VAR352 < 0 then begin {L16112}
	L57632;
	CURSORTO(10,0);
	WRITELN(' wy  z a m o r i l i  swoj narod golodom.');
	ESCJ;
	goto 8; {L16206}
end;
VAR362 := VAR256; {L16216}
if VAR352 - VAR256 < 0 then begin
	VAR256 := VAR352 + (VAR256 - VAR352) * L57170(0,VAR224) * 0.5; {L16300}
	VAR130 := L01044(VAR362 - VAR362); {L16376}
	VAR212 := VAR212 + VAR130; {L16434}
end;
VAR346 := VAR226 / VAR200; {L16442}
if VAR346 > VAR246 then
	VAR346 := VAR246;
if VAR346 > VAR256 then
	VAR346 := VAR256
else begin
	VAR124 := L01044((VAR256 - VAR346) * L57170(0,VAR224)); {L16624}
	VAR256 := VAR256 - VAR124; {L16704}
end;
VAR252 := VAR252 + VAR204 * VAR346 * (L57170(0,VAR224) + 0.5); {L16736}
VAR152 := L01044(VAR256 / 10 * VAR206 * (L57170(0,VAR224) + 0.5)); {L17034}
VAR256 := VAR256 + VAR152; {L17136}
VAR346 := L57170(0,VAR224); {L17170}
if VAR346 > 0.8 then begin
	VAR132 := L01044(VAR252 * L57170(0,VAR224) * 0.3); {L17252}
end;
VAR346 := L57170(0,VAR224); {L17332}
if VAR346 > 0.8 then begin
	VAR134 := L01044(VAR252 * L57170(0,VAR224) * 0.3); {L17414}
end;
VAR346 := L57170(0,VAR224); {L17474}
if VAR346 > 0.8 then begin
	VAR136 := L01044(VAR252 * L57170(0,VAR224) * 0.3); {L17556}
end;
VAR252 := VAR252 - VAR132 - VAR134 - VAR136; {L17636}
if VAR252 < 0 then
	VAR252 := 0;
VAR242 := VAR242 - VAR262 * VAR210; {L17762}
if VAR242 < 0 then
	VAR242 := 0;
if VAR242 = 0 then begin {L20074}
	VAR126 := L01044(VAR262 * L57170(0,VAR224) * 0.5);
end;
VAR262 := VAR262 - VAR126; {L20202}
VAR346 := L57170(0,VAR224);
if VAR346 < 0.2 then begin {L20264}
	VAR140 := L01044(VAR236 * L57170(0,VAR224) * 0.5);
	VAR236 := VAR236 - VAR140; {L20374}
end;
VAR346 := L57170(0,VAR224); {L20426}
if (VAR346 < 0.2) AND (VAR342 <> 0) then begin {L20456}
	VAR142 := L01044(VAR342 * L57170(0,VAR224) * 0.5); {L20562}
	VAR342 := VAR342 - VAR142; {L20640}
end;
VAR346 := L57170(0,VAR224); {L20672}
if (VAR346 < 0.2) AND (VAR326 <> 0) then begin {L20722}
	VAR144 := L01044(VAR326 * L57170(0,VAR224) * 0.5); {L21026}
	VAR326 := VAR326 - VAR144; {L21104}
end;
WRITE('==> wa{e wyso~estwo! pribyl wizirx, wpustitx ? (0/1) ');
READLN(VAR102);
if VAR102 = 0 then
	goto 5;
L57632; {L21212}
CURSORTO(2,0);
VAR346 := VAR262 * VAR210;
if VAR346 <> 0 then begin {L21262}
	L57660(VAR102,VAR104,VAR346); {L21312}
	WRITE('
   valowanie soldat :');
	WRITE(VAR102);
	WRITE(' tys.');
	WRITE(VAR104);
	WRITELN(' rublej
  ---------------------------------------------------------------');
end;
VAR346 := L57170(0,VAR224); {L21450}
if VAR346 > 0.5 then begin {L21500}
	WRITELN('  t a j n a q  k a n c e l q r i q  soob}aet :');
	VAR102 := ROUND(VAR316 * 100); {L21552}
	if VAR102 > 1 then begin {L21604}
		WRITE('  w narode');
		WRITE(VAR102); {L21636}
		WRITELN(' procentow zagowor}ikow !!');
		if VAR316 > 0.8 then {L21672}
			WRITELN('  polovenie  o ~ e n x  opasnoe, wozmoven pereworot.');
		if (VAR316 > 0.5) AND (VAR316 < 0.8) then {L21746}
			WRITELN('  polovenie opasnoe, sdelajte }edru` poda~ku.');
		if (VAR316 > 0.2) AND (VAR316 < 0.5) then {L22074}
			WRITELN('  w narode golod, rastet nedowolxstwo.');
		if VAR316 < 0.2 then {L22222}
			WRITELN('  narod dowolen, wysok awtoritet wa{ego weli~estwa.');
		if VAR132 <> 0 then begin
			WRITE('  -  krysy sovrali');
			WRITE(VAR132);
			WRITELN(' tonn zerna.');
		end;
		if VAR134 <> 0 then {L22362}
			WRITELN('  -  stra{naq  z a s u h a  porazila posewy.');
		if VAR136 <> 0 then {L22416}
			WRITELN('  -  gigantskie  p o v a r y  pogubili urovaj.');
		if VAR132 + VAR134 + VAR136 = 0 then
			WRITELN(' -  u r o v a j n y j   g o d');
		if VAR124 <> 0 then begin {L22516}
			WRITE('  - rabo~im nehwataet zemli. sbevalo');
			WRITE(VAR124);
			WRITELN(' ~elowek.'); {L22560}
		end;
		if VAR126 <> 0 then begin {L22602}
			WRITE('  - gwardiq ne polu~ila denevnogo dowolxstwiq,
   ');
			WRITE(VAR126);
			WRITELN(' soldat pokinuli kazarmy i u{li za kordon.');
		end;
		if VAR130 <> 0 then begin {L22666}
			WRITE('  - wy zamorili golodom');
			WRITE(VAR130);
			WRITELN(' wa{ih wernopoddannyh !');
		end;
		if VAR140 <> 0 then begin {L22752}
			WRITE('  - s k a n d a l !!! ukradeno');
			WRITE(VAR140);
			WRITELN(' kg zolota !!!');
		end;
		if VAR142 <> 0 then begin {L23036}
			WRITE('  - wa{  k a r a w a n  ograblen na');
			WRITE(VAR142);
			WRITELN(' rublej.');
		end;
		if VAR144 <> 0 then begin {L23122}
			WRITE('  - p o z o r ! ! !  iz hrama ukrali');
			WRITE(VAR144);
			WRITELN(' rublej.');
		end;
		if VAR152 <> 0 then begin {L23206}
			WRITE('  - w gosudarstwe rodilosx');
			WRITE(VAR152);
			WRITELN(' detej.'); {L23250}
		end;
		VAR346 := L57170(0,VAR224); {L23272}
		if VAR346 < 0.05 then begin {L23322}
			VAR346 := L57170(0,VAR224) * VAR242;
			L57660(VAR102,VAR104,VAR346);
			VAR242 := VAR242 - VAR346;
			WRITE('  - wizirx  u k r a l  ');
			WRITE(VAR102);
			WRITE(' tys.');
			WRITE(VAR104);
			WRITELN(' rub. i skrylsq !!!'); {L23564}
		end;
		VAR346 := L57170(0,VAR224);
		if VAR346 < 0.1 then begin
			VAR102 := ROUND(VAR256 * L57170(0,VAR224));
			VAR256 := VAR256 - VAR102;
			WRITE('  - |pidemiq  ~ u m y  pogubila');
			WRITE(VAR102);
			WRITELN(' rabo~ih.');
		end;
	end;
end;
5: {L24036}
VAR346 := L57170(0,VAR224);
if (VAR346 < 0.3) AND (VAR242 > 10000) then begin
	L57660(VAR102,VAR104,VAR242);
	WRITE('
 mitropolit wa{ego gosudarstwa ovidaet sredstw dlq postrojki
            n o w o g o        h r a m a
  
 ==> w kazne');
	WRITE(VAR102);
	WRITE(' tysq~');
	WRITE(VAR104);
	WRITE(' rublej. skolxko wydelqete ? ');
	READLN(VAR332);
end;
if VAR332 > VAR242 then begin
	L57632;
	WRITELN('u was net stolxko deneg!');
	goto 5; {L24426}
end;
L57632; {L24436}
VAR242 := VAR242 - VAR342;
VAR326 := VAR326 + VAR332;
if VAR242 <> 0 then {L24526}
	VAR346 := VAR332 / VAR242
else
	VAR346 := 1;
if VAR346 < 0.1 then
	WRITELN('wy ~to nasmehaetesx ?! skrqga !!!');
if (VAR346 > 0.1) AND (VAR346 < 0.3) then
	WRITELN('wy ~rezmerno skupy wa{e weli~estwo !');
if (VAR346 > 0.3) AND (VAR346 < 0.6) then
	WRITELN('slawa korol`, }edromu i mudromu prawitel` !!!');
if (VAR346 > 0.6) AND (VAR346 < 0.9) then
	WRITELN('wo wseh hramah sluvat zdrawnicu welikomu korol`.');
if VAR346 > 0.9 then
	WRITELN('wsewy{nij blagoslowit wa{e prawlenie na dolgie gody.');
if VAR326 > 100000.0 then begin {L25374}
	VAR102 := TRUNC(VAR326 / 100000.0);
	VAR214 := VAR214 + VAR102;
	VAR326 := VAR326 - VAR102 * 100000.0;
	for VAR216 := 1 to VAR102 do begin
		WRITELN(' -=-   w o z d w i g n u t  h r a m   -=-');
	end;
end;
VAR346 := L57170(0,VAR224); {L25630}
if VAR346 > 0.5 then begin {L25660}
	if VAR342 > 0 then begin {L25710}
		VAR346 := L57170(0,VAR224); {L25740}
		if VAR346 > 0.5 then begin {L25770}
			WRITE('==> pribyl gonec s izwestiqmi, wpustitx ? (0/1) ');
			READLN(VAR106);
			if VAR106 = 1 then begin
				L57632; {L26066}
				VAR346 := L57170(0,VAR224);
				if VAR346 > 0.5 then begin {L26122}
					VAR346 := VAR342 * 10 * (L57170(0,VAR224) + 0.5); {L26152}
					L57660(VAR106,VAR110,VAR346);
					WRITE('
--->        w e r n u l s q   k a r a w a n 
 
  ot torgowli polu~ena pribylx');
					WRITE(VAR106);
					WRITE(' tysq~');
					WRITE(VAR110);
					WRITELN(' rublej.');
					VAR242 := VAR242 + VAR346; {L26374}
					VAR342 := 0;
				end else begin {L26450}
					WRITELN('karawan   r a z g r a b l e n   p i r a t a m i !');
					VAR342 := 0;
				end;
			end;
		end;
	end else begin {L26514}
		if VAR242 > 1000.0 then begin
			WRITE('
zamorskij kupec predlagaet snarqditx karawan.
==> wy soglasny ? (0/1) ');
			READLN(VAR106);
			if VAR106 = 1 then begin {L26576}
				L57660(VAR102,VAR104,VAR242);
				WRITE('w kazne');
				WRITE(VAR102);
				WRITE(' tysq~');
				WRITE(VAR104);
				WRITE(' rublej. skolxko w karawan ? ');
				READLN(VAR342);
				if VAR342 > VAR242 then
					VAR342 := VAR242;
				VAR242 := VAR242 - VAR342; {L27036}
			end;
			if VAR342 > 0 then
				WRITELN('karawan otprawilsq za tridewqtx zemelx ')
			else
				WRITELN('karawan u{el w dalxnie strany bez wa{ih towarow.');
			VAR346 := L57170(0,VAR224);
			if VAR346 < 0.3 then begin
				VAR346 := VAR242 * L57170(0,VAR224);
				VAR356 := VAR236 * L57170(0,VAR224);
				VAR362 := VAR246 * L57170(0,VAR224);
				VAR366 := VAR252 * L57170(0,VAR224);
				VAR372 := VAR256 * L57170(0,VAR224);
				VAR376 := VAR262 * L57170(0,VAR224);
				WRITELN('---> wam dostalosx nasledstwo :');
				L60060(VAR346,VAR356,VAR362,VAR366,VAR372,VAR376);
				VAR242 := VAR242 + VAR346;
				VAR236 := VAR236 + VAR356;
				VAR246 := VAR246 + VAR362;
				VAR252 := VAR252 + VAR366;
				VAR256 := VAR256 + VAR372;
				VAR262 := VAR262 + VAR376;
			end;
			VAR346 := L57170(0,VAR224); {L30130}
			if VAR346 < 0.2 then begin {L30160}
				if VAR170 = 0 then begin {L30212}
					VAR346 := VAR242 * L57170(0,VAR224);
					VAR356 := VAR236 * L57170(0,VAR224);
					VAR362 := VAR246 * L57170(0,VAR224);
					VAR366 := VAR252 * L57170(0,VAR224);
					VAR372 := VAR256 * L57170(0,VAR224);
					VAR376 := VAR262 * L57170(0,VAR224);
					WRITELN('---> imperator swataet do~x, pridannoe newesty:');
					L60060(VAR346,VAR356,VAR362,VAR366,VAR372,VAR376);
					WRITE('==> wy soglasny ? (0/1) ');
					READLN(VAR102);
					if VAR102 = 1 then begin
						VAR170 := 1;
						VAR242 := VAR242 + VAR346;
						VAR236 := VAR236 + VAR356;
						VAR246 := VAR246 + VAR362;
						VAR252 := VAR252 + VAR366;
						VAR256 := VAR256 + VAR372;
						VAR262 := VAR262 + VAR376; {L31124}
						L57632;
						VAR346 := VAR242 * L57170(0,VAR224) * 0.5;
						VAR242 := VAR242 - VAR346; {L31234}
						L57660(VAR102,VAR104,VAR346);
						WRITE('swadebnye rashody :');
						WRITE(VAR102);
						WRITE(' tysq~');
						WRITE(VAR104);
						WRITELN(' rublej.');
					end else begin
						WRITELN('oskorblenie !  v d i t e   w o j n y  !');
						VAR150 := VAR150 + 1;
					end;
				end else begin {L31462}
					VAR346 := VAR242 * L57170(0,VAR224) * 0.3;
					L57660(VAR102,VAR104,VAR346);
					VAR242 := VAR242 - VAR346;
					VAR346 := L57170(0,VAR224) + VAR336;
					WRITE('  u   was   r o d i l');
					if VAR346 > 0.5 then begin
						VAR146 := VAR146 + 1;
						WRITELN(' s q   s y n  !');
						VAR336 := 0;
					end else begin
						WRITELN(' a s x   do~x  !')
					end;
					WRITE('na torvestwennyj pir potra~eno :');
					WRITE(VAR102);
					WRITE(' tysq~');
					WRITE(VAR104);
					WRITELN(' rublej.');
				end;
			end;
			VAR346 := L57170(0,VAR224); {L32130}
			if (VAR346 < 0.2) AND (VAR170 <> 0) then begin
				VAR346 := L57170(0,VAR224); {L32246}
				WRITE('==> k wam pribyl sluga korolewy. wpustitx ? (0/1) ');
				READLN(VAR102);
				L57632;
				if VAR346 > 0.5 then {L32334}
					VAR102 := 1;
				if VAR102 = 0 then begin {L32372}
					WRITELN('k o r o l e w a   na was obidelasx !');
					VAR336 := 0;
				end else begin {L32450}
					VAR346 := L57170(0,VAR224);
					if VAR346 > 0.2 then begin
						VAR170 := 0;
						VAR346 := L57170(0,VAR224) * VAR242;
						VAR242 := VAR242 - VAR346;
						L57660(VAR102,VAR104,VAR346);
						WRITE(' 
       -   u m e r l a   k o r o l e w a   -
  
      na pohorony potra~eno');
						WRITE(VAR102);
						WRITE(' tysq~');
						WRITE(VAR104);
						WRITELN(' rublej.');
					end else begin {L32774}
						VAR346 := L57170(0,VAR224) * 0.5 * VAR242;
						L57660(VAR102,VAR104,VAR346);
						WRITE('
korolewa prosit na narqdy');
						WRITE(VAR102);
						WRITE(' tysq~');
						WRITE(VAR104);
						WRITE(' rublej.
==> kazna~e` wydatx denxgi ? (0/1) ');
						READLN(VAR102);
						if VAR102 = 1 then begin
							VAR242 := VAR242 - VAR346;
							VAR336 := VAR336 + VAR346 / VAR242;
							WRITELN('korolewa   b l a g o d a r i t   w a s   ! ! !');
						end else begin
							WRITELN('korolewa nikogda ne rodit wam   s y n a  !');
							VAR336 := 0;
						end;
					end;
				end;
			end;
			VAR346 := L57170(0,VAR224) * 0.2 + VAR174 / 30; {L33414}
			if VAR346 > 0.8 then begin
				VAR352 := VAR242 * L57170(0,VAR224) * 0.5;
				L57660(VAR102,VAR104,VAR352);
				WRITE(' 
  w y   z a b o l e l i  !
  zamorskij lekarx trebuet za le~enie');
				WRITE(VAR102);
				WRITE(' tysq~');
				WRITE(VAR104);
				WRITE(' rublej. 
==> wy budete le~itxsq ? (0/1) ');
				READLN(VAR102);
				if VAR102 = 0 then begin
					VAR346 := L57170(0,VAR224);
					if VAR346 > 0.5 then
						goto 6; {L34046}
				end else begin {L34062}
					VAR242 := VAR242 - VAR352;
					VAR346 := L57170(0,VAR224);
					if VAR346 < 0.3 then begin {L34144}
						VAR346 := L57170(0,VAR224);
						if VAR346 > 0.5 then begin {L34226}
							VAR346 := VAR242 * L57170(0,VAR224) * 0.8;
							L57660(VAR102,VAR104,VAR352);
							WRITE('
wam stalo  h u v e , na lekarstwa trebuetsq');
							WRITE(VAR102);
							WRITE(' tys.');
							WRITE(VAR104);
							WRITE(' rub.
p o k u p a e t e   l e k a r s t w a ? (0/1) ');
							READLN(VAR102);
							if VAR102 = 0 then begin {L34500}
								VAR346 := L57170(0,VAR224);
								if VAR346 > 0.5 then
									goto 6; {L34572}
							end;
						end else begin {L34602}
							VAR242 := VAR242 - VAR352;
							VAR346 := L57170(0,VAR224);
							if VAR346 < 0.5 then begin {L34670}
								WRITE('
 w y  p r i s m e r t i  -  koldun movet wyle~itx was,  n o  on trebuet
  za le~enie - polowinu zolota iz wa{ej sokrowi}nicy! soglasny ? (0/1) ');
								READLN(VAR102);
								if VAR102 = 0 then begin
									VAR346 := L57170(0,VAR224);
									if VAR346 > 0.5 then
										goto 6 {L35044}
									else begin
										VAR236 := VAR236 / 2;
										VAR346 := L57170(0,VAR224);
										if VAR346 < 0.05 then
											goto 6; {L35174}
									end;
									goto 6; {L35204}
								end;
							end;
						end;
					end;
				end;
			end;
			goto 7; {L35214}
		end;
	end;
end;
6: {L35224}
if VAR146 = 0 then begin
	WRITELN('k o r o l x  u m e r ! ! !');
	goto 8;
end else begin
	WRITELN('s y n   k o r o n o w a n ,  c a r s t w u j t e !');
	VAR146 := 0;
	VAR150 := 0;
	VAR170 := 0;
end;
7: {L35332}
VAR346 := (VAR242 + VAR246 * VAR56 + VAR236 * VAR54 / 2) / 1000 + 1;
VAR352 := L57170(0,VAR224) * (VAR150 * 0.5 + (VAR346 - VAR262) / VAR346);
if VAR352 > 0.7 then begin
	VAR150 := 0;
	WRITE(' 
              -  w o z m o v n a   w o j n a  -
  
==> ob"qwlqete wseob}u` mobilizaci` ? (0/1) ');
	READLN(VAR102);
	L57632;
	if VAR102 = 1 then begin
		VAR154 := L01044(VAR256 / 2 + VAR262);
		VAR322 := 0.2;
		VAR316 := VAR316 + VAR322;
		if VAR316 > 1.0 then
			VAR316 := 1.0;
		WRITELN('w narode rastet nedowolxstwo!');
	end else begin {L36116}
		VAR154 := ROUND(VAR262);
	end;
	VAR156 := L01044((VAR256 / 2 + VAR262) * (L57170(0,VAR224) + 0.5));
	if VAR346 > VAR262 * 10.0 then begin
		VAR156 := L01044(VAR346 + VAR256 / 2); {L36302}
	end;
	WRITE(' 
 w a { a    a r m i q         :');
	WRITE(VAR154);
	WRITE(' soldat. 
 --------------------------------------------
 p r o t i w n i k  (razwedka):');
	WRITE(VAR156);
	WRITELN(' soldat.');
	if (VAR242 < 10000) AND (VAR236 > 10) then begin
		WRITE('
    polovenie opasnoe, wizirx sowetuet prodatx zoloto
==> rostow}ik soglasen datx polowinu ceny, soglasny ? (0/1) ');
		READLN(VAR102);
		if VAR102 = 1 then begin
			VAR242 := VAR242 + VAR236 / 2 * VAR54;
			VAR236 := 0; {L36706}
		end;
		if VAR242 > 1000 then begin
			L57660(VAR102,VAR104,VAR242);
			WRITE('w kazne');
			WRITE(VAR102);
			WRITE(' tys.');
			WRITE(VAR104);
			WRITE(' rublej.
==> skolxko hotite wzqtx naemnikow (naemnik - 100 rub) ? ');
			READLN(VAR102);
			if VAR102 * 100.0 < VAR242 then begin
				VAR242 := VAR242 - (VAR102 * 100);
				VAR154 := VAR154 + VAR102;
			end;
		end;
		VAR346 := L57170(0,VAR224); {L37236}
		if VAR346 < 0.1 then
			WRITELN('zakl`~en   m i r n y j   d o g o w o r  !!!')
		else begin {L37346}
			VAR156 := L01044(VAR156 * (L57170(0,VAR224) + 0.5));
			VAR346 := VAR154 / VAR156; {L37424}
			WRITE('
           n a ~ a t y   w o e n n y e   d e j s t i q .
           -------------------------------------------
           w wernyh korol` wojskah: ');
			WRITE(VAR154);
			WRITE(' soldat 
           u wa{ego protiwnika    : ');
			WRITE(VAR156);
			WRITELN(' soldat');
			if VAR346 > 1 then {L37560}
				WRITELN('---> weroqtno wa{a armiq pobedit ....')
			else
				WRITELN('---> |ksperty proro~at poravenie ....');
			if VAR102 <> 0 then begin
				VAR346 := L57170(0,VAR224);
				if VAR346 < 0.1 then begin
					VAR104 := ROUND(VAR102 * L57170(0,VAR224));
					if VAR104 > 0 then begin
						WRITE('i z m e n a ! ! !');
						WRITE(VAR104);
						WRITELN(' naemnikow pere{li na storonu wraga !');
						VAR154 := VAR154 + VAR102 + VAR104;
						VAR156 := VAR156 + VAR104;
					end;
				end;
			end;
			VAR154 := ROUND(VAR154 * (L57170(0,VAR224) * 0.2 + 0.9)); {L40132}
			VAR156 := ROUND(VAR156 * (L57170(0,VAR224) * 0.2 + 0.9));
			for VAR102 := 1 to 300 do begin
				VAR346 := SIN(0.5);
			end;
			VAR346 := VAR242 * L57170(0,VAR224); {L40404}
			VAR356 := VAR236 * L57170(0,VAR224);
			VAR362 := VAR246 * L57170(0,VAR224);
			VAR366 := VAR242 * L57170(0,VAR224);
			VAR372 := VAR256 * L57170(0,VAR224);
			VAR376 := VAR262 * L57170(0,VAR224);
			if VAR154 > VAR156 then
				VAR120 := 1
			else
				VAR120 := -1;
			VAR242 := VAR242 + VAR346 * VAR120; {L40754}
			VAR236 := VAR236 + VAR356 * VAR120;
			VAR246 := VAR246 + VAR362 * VAR120;
			VAR252 := VAR252 + VAR366 * VAR120;
			VAR256 := VAR256 + VAR372 * VAR120;
			VAR262 := VAR262 + VAR376 * VAR120;
			if VAR154 > VAR156 then
				WRITELN(' 
       p  o  b  e  d  a . zahwa~eno :')
			else
				WRITELN('
       p o r a v e n i e . utra~eno :');
			L60060(VAR346,VAR356,VAR362,VAR366,VAR372,VAR376);
			WRITE('==> wstre~aete nowyj god ? (0/1) ');
			READLN(VAR102);
			if VAR102 = 1 then begin
				if VAR242 > 1000 then begin
					WRITE('==> ustraiwaete nowogodnij bal ? (0/1) ');
					READLN(VAR102);
					if VAR102 = 1 then begin
						L57660(VAR102,VAR104,VAR242);
						WRITE('==> w kazne');
						WRITE(VAR102);
						WRITE(' tys.');
						WRITE(VAR104);
						WRITE(' rub. skolxko na rovdestwo ? ');
						READLN(VAR346);
						VAR316 := VAR316 - (VAR346 / VAR256) / 100.0; {L41774}
						if VAR316 < 0 then
							VAR316 := 0;
						VAR242 := VAR242 - VAR346;
					end else begin {L42154}
						goto 8;
					end;
					VAR172 := VAR172 + 1; {L42164}
					VAR174 := VAR174 + 1;
					if VAR174 > VAR176 then
						goto 8; {L42210}
					goto 0; {L42220}
				end;
			end;
		end;
	end;
end;
8: {L42230}
if VAR174 > VAR176 then begin
	WRITELN('
      -   w a {   s r o k   i s t e k   -');
	VAR174 := VAR174 - 1;
end;
VAR150 := VAR174 * 10; {L42272}
VAR100 := L01044(VAR242 / 1000);
VAR102 := L01044(VAR236);
VAR104 := L01044(VAR246 / 10);
VAR152 := L01044(VAR246);
VAR106 := L01044(VAR252 / 100);
VAR154 := L01044(VAR252);
VAR110 := L01044(VAR256 / 10);
VAR156 := L01044(VAR256);
VAR112 := L01044(VAR262 / 5);
VAR160 := L01044(VAR262);
VAR114 := VAR214 * 100;
VAR116 := -VAR212;
VAR120 := -L01044(VAR316 * 100);
VAR122 := VAR150 + VAR100 + VAR102 + VAR104 + VAR106 + VAR110
	+ VAR112 + VAR114 + VAR116 + VAR120;
WRITE(' 
 c e n n o s t i     k o l - w o       b a l l y 
 -----------------------------------------------
  srok   ( let  )');
WRITE(VAR174,VAR150);
WRITE('
  kapital( tys. )');
WRITE(VAR100,VAR100);
WRITE('
  zoloto (  kg  )');
WRITE(VAR102,VAR102);
WRITE(' 
  zemlq  (  ga  )'); {L43220}
WRITE(VAR152,VAR104);
WRITE('  
  zerno  ( tonn )');
WRITE(VAR154,VAR106);
WRITE('   
  rabo~ie( ~el. )');
WRITE(VAR156,VAR110);
WRITE('    
  gwardiq( sol. )');
WRITE(VAR160,VAR112);
WRITE('     
  hramy  ( {tuk )'); {L43430}
WRITE(VAR214,VAR114);
WRITE(' 
  umerlo rabo~ih:');
WRITE(VAR212,VAR116);
WRITE(' 
  gnew naroda   :');
WRITE(-VAR120,VAR120);
WRITE('
  ---------------------------------------------- 
  itogo:');
WRITE(VAR122);
WRITELN(' ballow.');
for VAR216 := 1 to 10 do begin {L43654}
	VARF0[VAR216] := ORD(VAR30[VAR216]);
end;
VAR24 := VAR122;
VAR26 := VAR174; { Номер года правления }
L65754(VARF0); { Работа с KIND.DAT }
END. {L44040}
