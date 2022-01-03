{$E+}
{$S+}
type FArray = array [1..12] of integer;

procedure L65754(var F:FArray);
var	T,U,V1,V2:integer;
	D: file of char;
	E: file of char;

procedure L65504;
begin {L65504}
	if 1 = 1{TODO} then begin
		{TODO}
	end;
	{TODO}
{$C	.BLKW	78} {TODO}
end;

{ Работа с KIND.DAT }
begin {L65754}
	Reset(D,'KING','DAT');
	Rewrite(E,'KING','DAT');
	for U := 1 to 12 do begin
		F[U] := -1;{TODO}
	end;
	for U := 1 to 3 do begin
		{TODO}
		Put(E);
	end;
	Close(E);
	{TODO}
	WRITELN('
 w rezulxtate analiza rezulxtatow, dostignutyh prawitelqmi   | j f o r i i
 -------------------------------------------------------------------------');
	WRITE(' rekord ustanowil ');
	WRITE(' wtoroj rezulxtat ');
	WRITE(' tretij rezulxtat ');
{$C	.BLKW	253} {TODO}
end;
