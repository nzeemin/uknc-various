{$E+}
{$S+}

var	VAR102:integer;
	VAR104:integer;

procedure L62010(
	var A:real; { Деньги }
	var B:real; { Золото }
	var C:real; { Земля }
	var D:real; { Рабочие }
	var E:real; { Солдаты }
	var F:real;
	G:integer; H:integer; I:integer; J:integer; K:integer; L:integer;
	M:integer; N:integer; O:integer; P:integer; Q:integer; R:integer);
var N1,N2,N3,N4,N5:integer;

procedure L61530(var A:real; B:integer; var C:integer);
var T:real;
label 1;
begin
1:
	T := A + (-32000.0);
	if T > 0.0 then begin
		{TODO}
		goto 1;
	end;
	{TODO}
{$C	.BLKW	48} {TODO}	
end;

procedure L57632; external;
procedure L57660; external; { Разделяем на тысячи и остаток }

procedure L64564;
begin
{$C	.BLKW	178} {TODO}
	{TODO}
	WRITE(' :'); {L65322}
	WRITE(VAR102);
	WRITE(' ballow za');
	WRITE(VAR104);
	WRITELN(' let.');
end;

{ Вывод статистики }
begin {L62010}
	L61530(B,G,N1);{TODO}
	L61530(B,G,N1);{TODO}
	L61530(B,G,N1);{TODO}
	L61530(B,G,N1);{TODO}
	L61530(B,G,N1);{TODO}
	L57632;
	{TODO}
{$C	.BLKW	612} {TODO}
end;
