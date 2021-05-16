{$E+}
{$S+}
type FArray = array [1..12] of integer;

procedure L61530;
begin
	{TODO}
{$C	.BLKW	81} {TODO}	
end;

var	VAR102:integer;
	VAR104:integer;

procedure L57632; external;
procedure L57660; external; { Разделяем на тысячи и остаток }

{ Вывод статистики }
procedure L62010(
	var A:real; { Деньги }
	var B:real; { Золото }
	var C:real; { Земля }
	var D:real; { Рабочие }
	var E:real; { Солдаты }
	var F:real;
	G:integer; H:integer; I:integer; J:integer; K:integer; L:integer;
	M:integer; N:integer; O:integer; P:integer; Q:integer; R:integer);
begin
	{TODO}
	L61530;
	{TODO}
{$C	.BLKW	685} {TODO}
end;

procedure L64564;
begin
{$C	.BLKW	186} {TODO}
	{TODO}
	WRITE(' :'); {L65322}
	WRITE(VAR102);
	WRITE(' ballow za');
	WRITE(VAR104);
	WRITELN(' let.');
end;

procedure L65504;
begin
	{TODO}
{$C	.BLKW	81} {TODO}
end;

{ Работа с KIND.DAT }
procedure L65754(var F:FArray);
var D: file of char;
begin
	Reset(D,'KING','DAT');
	Put(D);
	{TODO}
	Close(D);
{$C	.BLKW	491} {TODO}
end;
