PROGRAM DECOBJ;
{$S+}

type
	CHSTATE = (CHST0, CHST1, CHST2);
	TYPCOM = (TY00, TY01, TY02, TY03, TY04, TY05, TY06, TY07, TY10, TY11, TY12, TY13, TY14, TY15);
	RLDENT = (RLD0,RLDIR,RLDGR,RLDIDR,RLDGDR,RLDGAR,RLDGADR,RLDLCD,RLDLCM,RLDLIM,RLDPR,RLD13,RLDPDR,RLDPAR,RLDPADR,RLDCR);
	GSDENT = (GSDMN,GSDCSN,GSDISN,GSDTA,GSDGSN,GSDPSN,GSDPVI,GSDMAD);
	IDNCOD = (IDN0,GSD,ENDGSD,TXT,RLD,ISD,ENDMOD);
	BITS = (BIT0,BIT1,BIT2,BIT3,BIT4,BIT5,BIT6,BIT7);
	VSET = (VS0,VS1,VS2,VS3,VS4,VS5,VS6,VS7,VS10,VS11);
	STR6 = array [1..6] of char;
	UINT = 0..65535;

	RECA14 = record
		RA00: integer;
		RA02: array [1..6] of char;
		RA10: integer;	{ index in VAR3712 }
		RA12: integer;
	end;

	RECE50 = record
		RE00: IDNCOD; {IDENTIFICATION CODE}
		RE02: STR6;
		RE10: GSDENT;   {ENTRY TYPE GSD}
		RE12: set of BITS; {FLAGS}
		RE22: integer;  {VALUE OF GSD DATA BLOCK}
		RE24: integer;
		RE26: integer;
		RE30: integer;
		RE32: integer;
		RE34: integer;
		RE36: RLDENT;   {ENTRY TYPE RLD}
		RE40: integer;  {MODIFICATION BIT RLD}
		RE42: integer;  {DISPLACEMENT RLD}
		RE44: integer;
		RE46: integer;
	end;

	RECF = record
		RF00: boolean; {ERROR}
		RF02: integer; {CODE OF ERROR}
		RF04: integer; {CHANNEL}
		RF06: integer; {BLOCK}
		RF10: array [1..512] of char; {BUFFER}
		RF1010: integer; {POINTER TO RF10}
	END;

	RECG = record
		RG00: integer; {SIZE OF DATA}
		RG02: IDNCOD; {IDENTIFICATION CODE}
		RG04: array [1..256] of integer;
		RG1004: integer; {CHECKSUM}
		RG1006: integer; {POINTER TO RG04}
		RG1010: boolean; {END OF DATA}
	end;

var
	VAR00: array[0..15] of CHSTATE;
	VAR20: array[1..20] of RECA14;
	VAR400: integer;
	VAR402: RECG;
	VAR1414: RECG;
	VAR2426: boolean;

	VAR2436: RECE50;
	VAR2506: RECE50;
	VAR2556: RECE50;
	VAR2626: RECE50;

procedure L01000; external;
procedure L01304(var RECIO: RECF; var CHN: integer; CHS: CHSTATE); external;
procedure L01522(var RECIO: RECF; var VAL: integer); external;
procedure L02020(var RECIO: RECF; VAL: char); external;
procedure L02276(var RECIO: RECF); external;

procedure L03004; external;
function L05122(VAL: integer): integer; external;
function L05160(VAL: integer): integer; external;
procedure L10104(var RECIO: RECF); external;

procedure L10442;
begin
	{TODO}
end;

BEGIN

	{$C
		.BLKW 8128 }
	WRITE('?DEC-I-LABELS USED : ');
END.
