PROGRAM STALK;
{$S+}
{$A-}
type	charptr = ^char;
type	intptr = ^integer;
var	DUNGEON: integer; { Номер подземелья }
	VAR2:	integer;
	VAR4:	integer; { Номер этажа }
	VAR6:	integer; { новый X игрока }
	VAR10:	integer; { новый Y игрока }
	VAR12:	integer; { Позиция Y игрока (строка) }
	VAR14:	integer; { Позиция X игрока (столбец) }
	VAR16:	integer; { переменная цикла }
	VAR20:	integer; { переменная цикла }
	VAR22:	integer;
	VAR24:	integer;
	VAR26:	integer; { Количество ходов после того как отдохнул }
	VAR30:	integer; { Вредность }
	VAR32:	integer;{unused}
	VAR34:	integer; { Y }
	VAR36:	integer; { X }
	VAR40:	integer;
	VAR42:	integer;{unused}
	VAR44:	integer;
	VAR46:	char;
	VAR47:	char;
	VAR50:	char;
	VAR51:	char;
	VAR52:	char;
	VAR53:	char;
	VAR54:	char; { Символ в клетке на которой стоит игрок }
	VAR55:	char;
	IND:	array[1..5] of integer; { Индикаторы справа: }
	{ 1 - Рейтинг, 2 -Энергия, 3 - Оружие, 4 - Защита, 5 - В банке денег }
	FIL:	array[1..32,1..16,0..8] of char;
	V11070:	charptr;
	V11072:	charptr;
	FIL2:	array[1..32,1..16,0..8] of integer;
	V33074: intptr;
	V33076: intptr;
	V33077:	char;
	RUKSAK:	array[1..6] of char; {033100..033105}
	V33106: array[1..6] of integer; {033106..033120}
	V33122: array[1..4] of char; {033122..033125}
	V33156:	char;
	TITLE:	array[0..29] of char;

procedure L01000;
begin
	{TODO}
end;

function L01046(A,B:integer):integer;
begin
	{TODO}
end;

{$T-}
procedure READCHAR(addr:charptr); {L01166}
begin
{$C
	BIS	#^O010000, @#^O000044
	EMT	^O340
	BLO	.-2
	MOVB	R0, @000002(SP)
}
end;
{$T-}
{ Поставить курсор на позицию (X*2,Y) }
procedure CURSORTO(Y,X:integer); {L01216}
begin
	WRITE(CHR(33B),CHR(131B));
	WRITE(CHR(Y+32),CHR(X+X+32));
end;
{$T-}
procedure CLEARMSG; {L01320}
begin
	CURSORTO(16,0);
	for VAR16:=1 to 7 do begin
		WRITE(CHR(12B),CHR(33B),CHR(113B));
	end;
	CURSORTO(17,0);
end;
{$T-}
procedure L01460(A,B,C:integer);
begin
	{TODO}
end;
{$T-}
procedure L02332(A,B:integer);
begin
	{TODO}
end;
{$T-}
procedure NELZYA;
begin
	WRITELN(' Н е л ь з я ! ! !');
end;
{$T-}
procedure L02574(V,Y,X:integer);
begin
	{TODO}
	WRITELN('З в е р ь !');
	{TODO}
	for VAR20:=1 to 3 do begin
		{TODO}
	end;
	{TODO}
end;
{$T-}
procedure ZAKLYATIE;
begin
	WRITELN('На этой штуке заклятие');
end;
{$T-}
procedure L03362(A:char);
begin
	{TODO}
	WRITELN(' Без лестницы?');
	{TODO}
	WRITE(CHR(3B),CHR(110B),CHR(33));
	WRITE('J	Подземелье ');
	WRITE(DUNGEON); { Номер подземелья }
	WRITE('
								 Рейтинг
								 Энергия
								 Оружие
								 Защита
								 В банке

								 Вредность

								  Рюкзак:');
	for VAR16:=1 to 5 do begin { выводим значения индикаторов }
		CURSORTO(VAR16,37);
		WRITE(IND[VAR16]:3);
	end;
	CURSORTO(7,37);
	WRITE(VAR30:3); { Вредность }
	CURSORTO(10,33);
	for VAR16:=1 to 6 do begin { выводим содержимое рюкзака }
		WRITE(RUKSAK[VAR16]:2);
	end;
	CURSORTO(0,0);
	for VAR16:=1 to 16 do begin { выводим текущее поле }
		for VAR20:=1 to 32 do begin
			if FIL2[VAR20,VAR16,VAR4] & 100B <> 0 then begin
				CURSORTO(VAR16,VAR20);
				WRITE(FIL[VAR20,VAR16,VAR4]);
			end;
		end;
	end;
	CLEARMSG;
	{TODO}
end;
{$T-}
procedure L05370(A,B:integer);
begin
	{TODO}
end;
{$T-}
procedure L05702(A:integer);
begin
	{TODO}
end;
{$A-}
{$D-}
{$T-}
BEGIN {MAIN}
TITLE[00]:='(';
TITLE[01]:='H';
TITLE[02]:=')';
TITLE[03]:=' ';
TITLE[04]:='H';
TITLE[05]:='a';
TITLE[06]:='c';
TITLE[07]:='k';
TITLE[08]:='e';
TITLE[09]:='d';
TITLE[10]:=' ';
TITLE[11]:='b';
TITLE[12]:='y';
TITLE[13]:=' ';
TITLE[14]:='O';
TITLE[15]:='l';
TITLE[16]:='e';
TITLE[17]:='g';
TITLE[18]:=' ';
TITLE[19]:='H';
TITLE[20]:='.';
TITLE[21]:=' ';
TITLE[22]:=' ';
TITLE[23]:=' ';
TITLE[24]:=' ';
TITLE[25]:=' ';
TITLE[26]:=' ';
TITLE[27]:=' ';
TITLE[28]:=' ';
TITLE[29]:=' ';
WRITE('*** ');
WRITE(TITLE); { Вывод начальной строки}
WRITELN('***');
WRITELN('__ С Т А Л К Е Р __'); {TODO:спецсимволы в строке}
WRITE('загадайте число. может быть, оно вам пригодится... там... ');
{ Ввод числа, которое "может быть пригодится там" }
{$C
	CLR	VAR44(R5)
	BIS	#^O010100, @#^O000044
	EMT	^O340			; Ввод первого символа
	BHIS	.-2			; почему-то его просто проглатываем
	EMT	^O340			; запрашиваем символ
	BHIS	.+20.			; получили символ? => переход
	INC	VAR44(R5)		; крутим значение
	CMP	VAR44(R5), #2500.	; >= 2500. ?
	BLE	.-14.			; нет, продолжаем
	CLR	VAR44(R5)		; обнуляем значение
	BR	.-20.			; продолжаем цикл
	BIC	#^O010100, @#^O000044
}
{TODO}
DUNGEON:=1; { Подземелье = 1 }
{$C
	BIS	#^O010000, @#^O000044
}
{ Начало игры, или рестарт на следующем подземелье }
WRITE(CHR(33B),CHR(110B),CHR(33B),CHR(112B));
CURSORTO(10,1);
for VAR4:=0 to 8 do begin { цикл по этажам }
	VAR22:=L01046(0,88);
	for VAR20:=1 to 32 do begin
		FIL[VAR20,1,VAR4]:='-'; { стенка вверху }
	end;
	for VAR16:=2 to 15 do begin
		FIL[1,VAR16,VAR4]:='!'; { стенка слева }
		for VAR20:=2 to 31 do begin
			FIL[VAR20,VAR16,VAR4]:='.';
			FIL2[VAR20,VAR16,VAR4]:=VAR22;
		end;
		FIL[32,VAR16,VAR4]:='!'; { стенка слева }
	end;
	for VAR20:=1 to 32 do begin
		FIL[VAR20,16,VAR4]:='-'; { стенка снизу }
	end;
end;
WRITELN('   Для подсказки нажимайте "H" ');
for VAR4:=1 to 8 do begin { цикл по этажам } {L07652}
	VAR16:=L01046(2,7); {L07712}
	while VAR16 < 16 do begin {L07736}
		VAR22:=2; {L07752}
		VAR24:=L01046(1,7); {L07760}
		while VAR24 < 32 do begin {L10004}
			for VAR20:=VAR22 to VAR24 do begin {L10020}
				FIL[VAR20,VAR16,VAR4]:='-'; {L10060}
			end;
			VAR22:=L01046(1,5)+VAR24; {L10144}
			VAR24:=L01046(3,10)+VAR24; {L10174}
		end;
		VAR16:=L01046(0,7)+VAR16; {L10230}
	end;
end;
WRITE(CHR(15B));
WRITE('		Темный  коридор ...     ');
for VAR4:=1 to 8 do begin { цикл по этажам } {L10326}
	VAR20:=L01046(2,7); {L10366}
	while VAR20 < 32 do begin {L10412}
		VAR22:=2; {L10426}
		VAR24:=L01046(1,7);
		while VAR24 < 16 do begin {L10460}
			for VAR16:=VAR22 to VAR24 do begin {L10474}
				if FIL[VAR20,VAR16,VAR4] = '.' then begin {L10576}
					FIL[VAR20,VAR16,VAR4]:='!'; {L10654}
				end else begin
					FIL[VAR20,VAR16,VAR4]:='#'; {L10730}
				end;
			end;
			VAR22:=L01046(1,5)+VAR24; {L10752}
			VAR24:=L01046(2,7)+VAR24; {L11002}
		end;
		VAR20:=L01046(2,5)+VAR20; {L11036}
	end;
end;
WRITE(CHR(15B));
WRITE('		С к е л е т ы . . .   ');
for VAR20:=1 to DUNGEON do begin {L11136}
	for VAR16:=32 to 127 do begin {L11174}
		VAR4:=L01046(0,8);
		L05702(VAR16); {L11256}
	end;
end;
WRITE(CHR(15B));
WRITE('	a-a-a-a-a-a-a-a-a-a-a-a-a . . . . . . .');
for VAR4:=0 to 8 do begin {L11350}
	L05702(94); {L11406}
	L05702(42);
	L05702(37);
end;
VAR4:=8; {L11452}
L05702(37);
L05702(44);
if DUNGEON = 1 then begin
	for VAR16:=1 to 6 do begin {L11512}
		RUKSAK[VAR16]:='.'; {L11552}
	end;
	RUKSAK[1]:=']';
	RUKSAK[2]:='(';
	RUKSAK[3]:='<';
	for VAR16:=1 to 5 do begin {L11624}
		IND[VAR16]:=0; { Очищаем индикаторы }
	end;
	{ Инициализация переменных }
	IND[2]:=25; { Энергия }
	VAR47:=CHR(0);
	VAR51:=CHR(0);
	VAR50:=CHR(0);
	VAR40:=0;
	VAR32:=400; {L11742}
	VAR26:=0; { Количество ходов после того как отдохнул = 0 }
end;
for VAR16:=1 to 6 do begin {L11762}
	V33106[VAR16]:=L01046(0,-1)&175777B; {L12022}
end;
VAR46:=CHR(0); {L12074}
for VAR16:=1 to 4 do begin {L12100}
	V33122[VAR16]:=' '; {L12140}
end;
VAR4:=0; { Этаж = 0 } {L12170}
L03362('J');
CLEARMSG;
WRITE('Прогнивший пол провалился...');
VAR2:=0; {L12226}
VAR12:=2; { Позиция Y игрока = 2 }
VAR14:=2; { Позиция X игрока = 2 }
VAR30:=1;
while true do begin {L12254}
{ Начало игрового цикла }
V11070:=@FIL[VAR14,VAR12,VAR4]; {L12266}
V33074:=@FIL2[VAR14,VAR12,VAR4]; {L12340}
for VAR16:=-1 to 1 do begin {L12422}
	for VAR20:=-1 to 1 do begin {L12462}
		VAR6:=VAR12+VAR16; { новый Y }
		VAR10:=VAR14+VAR20; { новый X }
		V11072:=@FIL[VAR10,VAR6,VAR4]; {L12552}
		V33076:=@FIL2[VAR10,VAR6,VAR4]; {L12624}
		case V11072^ of {L12706}
		'%':	WRITE('Лестница.');
		'*':	WRITE('Золото.');
		',':	begin
				WRITE('Золотой шар!!!');
				WRITE('Волшебная кирка.');
			end;
		'$','+': WRITE('Бутылка с надписью "Drink me!"');
		' ':	begin
				WRITELN('Черная дыра');
				IND[2]:=IND[2]-6; { Энергия уменьшается }
				WRITELN('Ой, как больно!...');
			end;
		'=':	WRITE('Кольцо.');
		'^':	begin
				WRITELN('Ведьмин студень!');
			end;
		'#':;
		'(',')': WRITE('Доспехи.');
		{TODO}
		'~':	WRITE('Черт-те что.');
		{TODO}
		end; { case of }
	end; { for VAR20 }
end; { for VAR16 }
VAR54:=V11070^; { Сохраняем символ, на который встал игрок }
V11070^:='@'; {L20006}
if VAR47 <> CHR(0) then begin
	L01460(VAR4,VAR12,VAR14); {L20026}
end else begin
	CURSORTO(VAR12,VAR14); {L20052}
	WRITE('@'); { игрок }
	V33074^:=V33074^ OR 100B; {L20100}
	CURSORTO(VAR34,VAR36); {L20106}
	WRITE(VAR55); {L20122}
end;
V11070^:=VAR54; {L20136}
VAR34:=VAR12; { Позиция Y игрока }
VAR36:=VAR14; { Позиция X игрока }
VAR55:=VAR54;
CURSORTO(1,0); {L20166}
WRITE(VAR4:3); {L20200}
for VAR16:=1 to 5 do begin {L20214}
	CURSORTO(VAR16,37); {L20254}
	WRITE(IND[VAR16]:3); {L20270}
	WRITE(' ');
end;
CURSORTO(7,37); {L20342}
WRITE(VAR30:3); { Вредность } {L20356}
CURSORTO(10,33); { Рюкзак }
if V33156 <> CHR(0) then begin {L20406}
	for VAR16:=1 to 6 do begin
		WRITE(RUKSAK[VAR16]); {L20460}
		WRITE(V33077:2);
	end;
end;
V33156:=CHR(0); {L20520}
CURSORTO(0,0);
{ Ввод символа - команда игрока }
READCHAR(@VAR53); {L20534}
CLEARMSG;
case VAR53 of {L20554}
'1':	L05370(1,-1);	{ влево-вниз }
'2':	L05370(1,0);	{ вниз }
'3':	L05370(1,1);	{ вправо-вниз }
'4':	L05370(0,-1);	{ влево }
'5':	L03362('5');	{ вниз по лестнице }
'6':	L05370(0,1);	{ вправо }
'7':	L05370(-1,-1);	{ влево-вверх }
'8':	L05370(-1,0);	{ вверх }
'9':	L05370(-1,1);	{ вправо-вверх }
'0':	VAR26:=0;	{ отдохнуть }
'.':	L03362('.');	{ вверх по лестнице }
{TODO}
'E':	begin { поесть }
		{TODO}
	end;
'T':	begin { взять предмет, на котором стоишь }
		{TODO}
	end;
{TODO}
'F':	begin { приготовиться к сражению }
		{TODO}
	end;
{TODO}
'J':	begin { обновить экран }
		{TODO}
	end;
{TODO}
end; { case of }
{L35274}
{TODO}
if IND[5] >= 0 then begin { В банке есть деньги? }
	WRITE('Как, Вы вернулись?! Ну и ну !!!
А дальше пойдете?');
	READCHAR(@VAR53);
	if VAR53 = 'Y' then begin
		DUNGEON:=DUNGEON+1; { следующее подземелье }
		{TODO:рестарт игры - как?}
	end else
		exit;
	{TODO}
end else begin
	WRITELN('А расплачиваться кто будет?');
end;
end; { конец игрового цикла }
{TODO: расчёт счёта игрока}
WRITE('Ваш счет -');
{TODO: вывод VAR16}
END.
