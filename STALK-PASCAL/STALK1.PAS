PROGRAM STALK;
{$S+}
{$A-}
{$T-}
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
	VAR32:	integer; { Заряд батарей фонаря }
	VAR34:	integer; { Y }
	VAR36:	integer; { X }
	VAR40:	integer;
	VAR42:	integer; { Число для генератора случайных чисел }
	VAR44:	integer; { Число для генератора случайных чисел }
	VAR46:	char;
	VAR47:	char; { Фонарь 1 - горит, 0 - не горит }
	VAR50:	char;
	VAR51:	char;
	VAR52:	char;
	VAR53:	char;
	VAR54:	char; { Символ в клетке на которой стоит игрок }
	VAR55:	char;
	IND:	array[1..5] of integer; { Индикаторы справа: }
	{ 1 - Рейтинг, 2 - Энергия, 3 - Оружие, 4 - Защита, 5 - В банке денег }
	F:	array[0..8,1..16,1..32] of char;
	V11070:	charptr; { Указатель на клетку в F }
	V11072:	charptr; { Указатель на клетку в F }
	F2:	array[0..8,1..16,1..32] of integer;
	V33074: intptr; { Указатель на клетку в F2 }
	V33076: intptr; { Указатель на клетку в F2 }
	RUKSAK:	array[1..6] of char;	{033100..033105}
	V33106: array[1..6] of integer;	{033106..033120}
	V33122: array[1..4] of char;	{033122..033125}
	V33126:	array[1..4] of integer;	{033126..033134}
	V33136: array[1..4] of integer;	{033136..033144}
	V33146: array[1..4] of integer; {033146..033154}
	V33156:	char;
	TITLE:	array[0..29] of char;

function RANDU(var A,B:integer):real; fortran; {L01000}

function RANDOM(A,B:integer):integer; {L01046}
begin
	RANDOM:=ROUND(A+(B-A)*RANDU(VAR42,VAR44));
end;

procedure READCHAR(var CH:char); {L01166}
begin
{$C
	BIS	#^O010000, @#^O000044
	EMT	^O340
	BLO	.-2
	MOVB	R0, @000002(SP)
}
end;

{ Поставить курсор на позицию (X*2,Y) }
procedure CURSORTO(Y,X:integer); {L01216}
begin
	WRITE(CHR(33B),CHR(131B));
	WRITE(CHR(Y+32),CHR(X+X+32));
end;

procedure CLEARMSG; {L01320}
begin
	CURSORTO(16,0);
	for VAR16:=1 to 7 do begin
		WRITE(CHR(12B),CHR(33B),CHR(113B));
	end;
	CURSORTO(17,0);
end;

procedure L01460(A,B,C:integer);
var I,J:integer;
begin
	for I:=-1 TO 1 do begin
		for J:=-1 TO 1 do begin
			VAR22:=B+I;
			VAR24:=C+J;
			if (F[A,VAR22,VAR24] = '^') and ((F2[A,VAR22,VAR24] and 6) <> 4) then begin
				CURSORTO(VAR22,VAR24);
				WRITE('.');
			end else begin
				F2[A,VAR22,VAR24]:=F2[A,VAR22,VAR24] or 100B;
				CURSORTO(VAR22,VAR24);
				WRITE(F[A,VAR22,VAR24]);
			end;
		end;
	end;
end;

function L02332(A,B:char):integer;
var K:integer;
begin
	K:=1; {L02340}
	while (RUKSAK[K] <> A) and (RUKSAK[K] <> B) and (K < 7) do begin
		K:=K+1;
	end;
	L02332:=K;
	V33156:=CHR(1);
end;

procedure NELZYA;
begin
	WRITELN(' Н е л ь з я ! ! !');
end;

procedure L02574(V,Y,X:integer);
var FV:char; FV2:integer;
begin
	FV:=F[V,Y,X];
	FV2:=F2[V,Y,X];
	WRITELN('З в е р ь !');
	if (FV2 and 4) <> 0 then begin
		if (FV <> V33122[1]) and (FV <> V33122[2]) and (FV <> V33122[3]) then begin
			VAR16:=0;
			for VAR20:=1 to 3 do begin
				VAR16:=VAR16+1;
				if V33122[VAR16] = ' ' then
					EXIT;
			end;
			V33122[VAR16]:=FV;
			V33126[VAR16]:=FV2;
			V33136[VAR16]:=Y;
			V33146[VAR16]:=X;
		end;
	end;
end;

procedure ZAKLYATIE;
begin
	WRITELN('На этой штуке заклятие');
end;

{ Параметр: 'J' - обновить экран; '.' - вверх; '5' - вниз }
procedure L03362(A:char);
begin
	V33156:=CHR(1);
	if A <> 'J' then begin {L03370}
		if V11070^ = '%' then begin { Мы стоим на лестнице? }
			for VAR16:=1 TO 4 do begin
				V33122[VAR16]:=' ';
			end;
			if (A = '.') and (VAR4 <> 0) then begin {L03510}
				VAR4:=VAR4-1; { Этаж вниз } {L03560}
				IND[2]:=IND[2]-2; { Энергия минус 2 }
				IND[1]:=IND[1]+1;
			end else if VAR4 <> 8 then begin
				VAR4:=VAR4+1;
				IND[1]:=IND[1]+3;
			end else begin
				V11070:=@F[VAR4,VAR12,VAR14]; {L03644}
				V33074:=@F2[VAR4,VAR12,VAR14]; {L03716}
				V11072:=@F[VAR4,VAR6,VAR10]; {L04000}
				V33074:=@F2[VAR4,VAR6,VAR10]; {L04052}
			end;
			{$C	.BLKW	5}{TODO: разобраться с R4}
		end else begin { не на лестнице }
			WRITELN(' Без лестницы?'); {L04140}
		end;
	end;
	{$C	.BLKW	8}
	WRITE(CHR(3B),CHR(110B),CHR(33)); {L04172}
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
			if F2[VAR4,VAR16,VAR20] & 100B <> 0 then begin
				CURSORTO(VAR16,VAR20);
				WRITE(F[VAR4,VAR16,VAR20]);
			end;
		end;
	end;
	CLEARMSG;
end;

procedure L05370(DY,DX:integer);
begin
	if not (F[VAR4,VAR12+DY,VAR14+DX] in ['!','-']) then begin
		VAR12:=VAR12+DY; {L05500}
		VAR14:=VAR14+DX;
		V11070:=@F[VAR4,VAR12,VAR14];
		V33074:=@F2[VAR4,VAR12,VAR14];
	end else
		NELZYA;
end;

procedure L05702(A:integer);
begin
{$C
	.BLKW	72
}
	{TODO}
end;
{$A-}
{$D-}
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
Readln(VAR42);
DUNGEON:=1; { Подземелье = 1 }
{$C
	BIS	#^O010000, @#^O000044
}
{ Начало игры, или рестарт на следующем подземелье }
WRITE(CHR(33B),CHR(110B),CHR(33B),CHR(112B));
CURSORTO(10,1);
for VAR4:=0 to 8 do begin { цикл по этажам }
	VAR22:=RANDOM(0,88);
	for VAR20:=1 to 32 do begin
		F[VAR4,1,VAR20]:='-'; { стенка вверху }
	end;
	for VAR16:=2 to 15 do begin
		F[VAR4,VAR16,1]:='!'; { стенка слева }
		for VAR20:=2 to 31 do begin
			F[VAR4,VAR16,VAR20]:='.';
			F2[VAR4,VAR16,VAR20]:=VAR22;
		end;
		F[VAR4,VAR16,32]:='!'; { стенка слева }
	end;
	for VAR20:=1 to 32 do begin
		F[VAR4,16,VAR20]:='-'; { стенка снизу }
	end;
end;
WRITELN('   Для подсказки нажимайте "H" ');
for VAR4:=1 to 8 do begin { цикл по этажам } {L07652}
	VAR16:=RANDOM(2,7); {L07712}
	while VAR16 < 16 do begin {L07736}
		VAR22:=2; {L07752}
		VAR24:=RANDOM(1,7); {L07760}
		while VAR24 < 32 do begin {L10004}
			for VAR20:=VAR22 to VAR24 do begin {L10020}
				F[VAR4,VAR16,VAR20]:='-'; {L10060}
			end;
			VAR22:=RANDOM(1,5)+VAR24; {L10144}
			VAR24:=RANDOM(3,10)+VAR24; {L10174}
		end;
		VAR16:=RANDOM(0,7)+VAR16; {L10230}
	end;
end;
WRITE(CHR(15B));
WRITE('		Темный  коридор ...     ');
for VAR4:=1 to 8 do begin { цикл по этажам } {L10326}
	VAR20:=RANDOM(2,7); {L10366}
	while VAR20 < 32 do begin {L10412}
		VAR22:=2; {L10426}
		VAR24:=RANDOM(1,7);
		while VAR24 < 16 do begin {L10460}
			for VAR16:=VAR22 to VAR24 do begin {L10474}
				if F[VAR4,VAR16,VAR20] = '.' then begin {L10576}
					F[VAR4,VAR16,VAR20]:='!'; {L10654}
				end else begin
					F[VAR4,VAR16,VAR20]:='#'; {L10730}
				end;
			end;
			VAR22:=RANDOM(1,5)+VAR24; {L10752}
			VAR24:=RANDOM(2,7)+VAR24; {L11002}
		end;
		VAR20:=RANDOM(2,5)+VAR20; {L11036}
	end;
end;
WRITE(CHR(15B));
WRITE('		С к е л е т ы . . .   ');
for VAR20:=1 to DUNGEON do begin {L11136}
	for VAR16:=32 to 127 do begin {L11174}
		VAR4:=RANDOM(0,8);
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
	VAR32:=400; { Заряд батарей } {L11742}
	VAR26:=0; { Количество ходов после того как отдохнул = 0 }
end;
for VAR16:=1 to 6 do begin {L11762}
	V33106[VAR16]:=RANDOM(0,-1)&175777B; {L12022}
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
V11070:=@F[VAR4,VAR12,VAR14]; {L12266}
V33074:=@F2[VAR4,VAR12,VAR14]; {L12340}
for VAR16:=-1 to 1 do begin {L12422}
	for VAR20:=-1 to 1 do begin {L12462}
		VAR6:=VAR12+VAR16; { новый Y }
		VAR10:=VAR14+VAR20; { новый X }
		V11072:=@F[VAR4,VAR6,VAR10]; {L12552}
		V33076:=@F2[VAR4,VAR6,VAR10]; {L12624}
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
	end;
end;
V33156:=CHR(0); {L20520}
CURSORTO(0,0);
{ Ввод символа - команда игрока }
READCHAR(VAR53); {L20534}
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
'Q':	begin { пить }
		VAR16:=L02332('$','+');
		if VAR16 < 7 then begin
			RUKSAK[VAR16]:='.';
			VAR30:=VAR30-1;
			if (V33106[VAR16] AND 6) = 0 then begin {L21122}
				for VAR16:=2 to 15 do begin
					for VAR20:=2 to 31 do begin
						if F[VAR4,VAR16,VAR20] <> '.' then begin
							CURSORTO(VAR16,VAR20);
							VAR53:=F[VAR4,VAR16,VAR20]; {L21342}
							{TODO}
						end;
					end;
				end;
				CLEARMSG; {L21600}
			end else if (V33106[VAR16] AND 6) = 2 then begin
				IND[2]:=IND[2]+20; { выпил }
				VAR26:=0;
				WRITELN('Чувствуете прилив сил?'); {L21654}
			end else if (V33106[VAR16] AND 6) = 4 then begin
				for VAR16:=2 to 13 do begin {L21734}
					for VAR20:=2 to 31 do begin
						if F[VAR4,VAR16,VAR20] <> '.' then begin
							CURSORTO(VAR16,VAR20); {L22112}
							WRITE(F[VAR4,VAR16,VAR20]); {L22126}
							F2[VAR4,VAR16,VAR20]:=F2[VAR4,VAR16,VAR20] OR 100B; {L22204}
						end;
					end;
				end;
				CLEARMSG;
			end else begin
				VAR40:=20; {L22404}
				WRITELN('Напился - сдай стеклотару!!!!');
			end;
		end else
			WRITELN('Пить нечего');
	end;
'D':	begin { выбросить предмет } {L22466}
		{TODO}
	end;
'Z':	begin { перевести деньги в банк на счёт пещеры } {L23010}
		{TODO}
	end;
'S':	begin { свистнуть }
		{TODO}
	end;
'E':	begin { поесть }
		{TODO}
	end;
'T':	begin { взять предмет, на котором стоишь }
		{TODO}
	end;
'P':	begin { надеть доспехи }
		{TODO}
	end;
'L':	begin { включить фонарь } {L25436}
		if VAR32 > 0 then begin
			VAR47:=CHR(1);
			WRITELN('Фонарь включен');
		end else begin
			WRITELN('Батареи сели.Надо было экономить ... ');
		end;
	end;
'O':	begin { выключить фонарь } {L25532}
		VAR47:=CHR(0);
		WRITELN('Фонарь выключен');
	end;
'W':	begin { взмахнуть волшебной палочкой }
		{TODO}
	end;
'/','?': begin { переложить вещи в рюкзаке }
		{TODO}
	end;
'F':	begin { приготовиться к сражению }
		VAR50:=CHR(1);
		WRITELN('У-р-р-р-а-a ! ! !');
	end;
'N':	begin { идёт начальник }
		{TODO}
	end;
'X':	begin { закончить }
		{TODO}
	end;
'M':	begin { приготовить оружие }
		{TODO}
	end;
'B':	begin { заменить батареи }
		{TODO}
	end;
'J':	L03362('J'); { обновить экран }
'R':	begin { читать папирус }
		{TODO}
	end;
'I':	begin { надеть кольцо }
		{TODO}
	end;
'V':	begin { снять кольцо }
		{TODO}
	end;
'A':	begin { купить (на золото) } {L32222}
		{TODO}
	end;
'K':	begin { сломать стенку киркой } {L32600}
		{TODO}
	end;
'Y':	begin { зажарить убегающего зверя }
		{if (V33074^ AND 6) = 2}
		{TODO}
	end;
'H':	begin { хелп } {L34046}
		WRITE(CHR(33B),CHR(110B),CHR(33B));
		WRITE('J
Ладно, я кое-что подскажу. Итак: здесь творится черт знает что,
но на восьмом уровне лежит золотой шар. Только достав его, Вы
сможете выйти из подземелья,придя на то же место, откуда вы вышли
вначале. Своим глазам не всегда стоит доверять!
 Вы можете использовать команды:
A - Купить (на золото)
B - Заменить батареи
D - Выбросить предмет
E - Поесть
F - Приготовиться к сражению
H - HELP (этот текст)
I - Надеть кольцо
J - Обновить экран
K - Сломать стенку (киркой)
L - Включить фонарь
M - Приготовить оружие
N - Клавиша "Идет начальник" (отбой тревоги - "P")
O - Выключить фонарь
P - Надеть доспехи
Q - Пить
R - Читать папирус
S - Свистнуть
T - Взять предмет, на клтором стоишь
U - Вызвать джинна (только в безнадежном случае!)...
	Дальше? ');
		READCHAR(VAR53);
		if VAR53 = CHR(15B) then begin
			READCHAR(VAR53);
		end;
		WRITE('
V - Снять кольцо
W - Взмахнуть волшебной палочкой
X - Закончить
Y - Зажарить убегающего зверя
Z - Перевести деньги в банк на счет пещеры.
/ - Переложить вещи в рюкзаке
   П Е Р Е Д В И Ж Е Н И Е:
	7 8 9
	4   6
	1 2 3
5 - Внмз по лестнице
. - Вверх по лестнице
0 - Отдыхать.

Использовать можно лишь вещи, лежащие в рюкзаке.
Примечание:
	Волшебная кирка вынесет вас из "комариной плеши" при ударе ей вниз.

Ну, что, пойдем дальше?');
		READCHAR(VAR53);
		if VAR53 = CHR(15B) then begin
			READCHAR(VAR53);
		end;
		L03362('J'); { Обновить экран }
		IND[1]:=IND[1] - 2; { Рейтинг }
		{TODO}
	end;
'U':	begin { вызвать джинна }
		{TODO}
	end;
else	WRITELN('Что-что?')
end; { case of }
{L35274}
{TODO}
if IND[5] >= 0 then begin { В банке есть деньги? }
	WRITE('Как, Вы вернулись?! Ну и ну !!!
А дальше пойдете?');
	READCHAR(VAR53);
	if VAR53 = 'Y' then begin
		DUNGEON:=DUNGEON+1; { следующее подземелье }
		IND[1]:=IND[1]+50; { Рейтинг }
		{TODO:рестарт игры - как?}
	end else
		exit;
	{TODO}
end else
	WRITELN('А расплачиваться кто будет?');
{ конец игрового цикла }
end;
{TODO: расчёт счёта игрока}
WRITE('Ваш счет -');
WRITE(VAR16:5);
{$C
	.BLKW	4908
	.GLOBL	PSHSET
	.GLOBL	UNSMUL
}
END.
