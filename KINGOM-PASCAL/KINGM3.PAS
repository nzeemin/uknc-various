{$E+}
{$S+}

procedure CURSORTO(R,C:integer); external; {L57476}
procedure ESCJ; external; {L57444}

procedure L57632;
begin
	CURSORTO(0,0);
	ESCJ;
end;

{ Разделяем C на тысячи A и остаток B }
procedure L57660(var A:integer; var B:integer; var C:real);
begin
	if C > 32000000.0 then
		C := 32000000.0;
	A := TRUNC(C / 1000.0); {L57744}
	B := TRUNC(C - A * 1000.0);
end;
