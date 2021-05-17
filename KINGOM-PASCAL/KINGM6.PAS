{$E+}
{$S+}
type FArray = array [1..12] of integer;

procedure L65754(var F:FArray);
var D: file of char;

procedure L65504;
begin {L65504}
	{TODO}
{$C	.BLKW	81} {TODO}
end;

{ Работа с KIND.DAT }
begin
	Reset(D,'KING','DAT');
	Put(D);
	{TODO}
	Close(D);
{$C	.BLKW	491} {TODO}
end;
