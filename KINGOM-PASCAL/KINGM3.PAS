{$E+}
{$S+}

procedure CURSORTO(R,C:integer); external; {L57476}
procedure ESCJ; external; {L57444}

procedure L57632;
begin
	CURSORTO(0,0);
	ESCJ;
end;

procedure L57660(var A:integer; var B:integer; var C:real);
begin
	{TODO}
end;
