{$E+}
{$S+}

function L57170(A:integer; var B:integer):real;
label 1;
begin
	if A <> 0 then B := A;
	B := B * 5;
1:
	if B >= 16384 then B:=B - 16384;
	if B >= 8192  then B:=B - 8192;
	if B >= 4096  then B:=B - 4096;
	if B > 4096   then goto 1; 
	L57170 := B / 4096;
end;

procedure ESC161; {L57412}
begin
	WRITE(CHR(33B),CHR(161B));
end;

{ ESCJ - Очистить до конца экрана }
procedure ESCJ; {L57444}
begin
	WRITE(CHR(33B),CHR(112B));
end;

{ Установить позицию курсора }
procedure CURSORTO(R,C:integer); {L57476}
var RCH,CCH:char;
begin
	RCH:=CHR(R)+' ';
	CCH:=CHR(C)+' ';
	WRITE(CHR(33B),'Y',RCH,CCH);
end;
