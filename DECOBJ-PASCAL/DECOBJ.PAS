PROGRAM DECOBJ;
{$S+}

type
	CHSTATE = (CHST0, CHST1, CHST2);
	RECA14 = record
		RA00: integer;
		RA02: array [1..6] of char;
		RA10: integer;	{ index in VAR3712 }
		RA12: integer;
	end;

	RECE = record
		RE00: char;
		RE02: array [1..6] of char;
		RE10: char;
		RE12: set of char;
		RE22: integer;
		RE24: integer;
		RE26: integer;
		RE30: integer;
		RE32: integer;
		RE34: integer;
		RE36: char;
		RE40: integer;
		RE42: integer;
		RE44: integer;
		RE46: integer;
	END;

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
	VAR402: RECF;
	VAR1414: RECF;
	VAR2426: boolean;
	VAR2436: RECE;
	VAR2506: RECE;

procedure L01000; external;
procedure L01304(var RECIO: RECF; var CHN: integer; CHS: CHSTATE); external;
procedure L01522(var RECIO: RECF; var VAL: integer); external;
procedure L02020(var RECIO: RECF; VAL: char); external;
procedure L02276(var RECIO: RECF); external;

{function L02554: integer; external;}
procedure L03004; external;

BEGIN

	{$C
		.BLKW 9520 }
	WRITE('?DEC-I-LABELS USED : ');
END.
