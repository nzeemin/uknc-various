{$E+}

procedure L57170(var A:integer);
begin
	{TODO}
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
