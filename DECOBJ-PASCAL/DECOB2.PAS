{$E+}
{$S+}

type
	CHSTATE = (CHST0, CHST1, CHST2);
	RECA14 = record
		RA00: integer;
		RA02: array [1..6] of char;
		RA10: integer;	{ index in VAR3712 }
		RA12: integer;
	end;

	RECF = record
		RF00: boolean; {ERROR}
		RF02: integer; {CODE OF ERROR}
		RF04: integer; {CHANNEL}
		RF06: integer; {BLOCK}
		RF10: array [1..512] of char; {BUFFER}
		RF1010: integer; {POINTER TO RF10}
	END;
	PRECF = ^RECF;

	RECG = record
		RG00: integer; {SIZE OF DATA}
		RG02: integer; {IDENTIFICATION CODE}
		RG04: array [1..256] of integer;
		RG1004: integer; {CHECKSUM}
		RG1006: integer; {POINTER TO RG04}
		RG1010: boolean; {END OF DATA}
	end;

var
	VAR00: array[0..15] of CHSTATE;
	VAR20: array[1..24] of RECA14;
	VAR400: integer;

procedure L01000; external;
procedure L01304(var SP06: RECF; var SP04: integer; SP02: CHSTATE); external;
procedure L01522(var SP16: integer; SP20: PRECF); external;
procedure L02020(var SP20: RECF; SP16: integer); external;
procedure L02276(var SP02: RECF); external;

function L02554: integer;
var LOC:array[0..7] of integer;
begin
	{TODO}
end;

procedure L03004;
begin
	{TODO}
end;
