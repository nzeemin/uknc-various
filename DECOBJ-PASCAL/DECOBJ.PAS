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

	RECB14 = record
		RB00: STR6;
		RB06: integer;
		RB10: integer;
		RB12: integer;
	end;

	RECC16 = record
		RC00: STR6;
		RC06: STR6;
		RC14: integer;
	end;

	RECD22 = record
		RD00: integer;
		RD02: integer;
		RD04: integer; {INDEX IN VAR3712}
		RD06: integer;
		RD10: set of VSET;
		RD20: integer; {INDEX IN VAR4372}
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

	RECF1012 = record
		RF00: boolean; {ERROR}
		RF02: integer; {CODE OF ERROR}
		RF04: integer; {CHANNEL}
		RF06: integer; {BLOCK}
		RF10: array [1..512] of char; {BUFFER}
		RF1010: integer; {POINTER TO RF10}
	END;

	RECG1012 = record
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
	VAR402: RECG1012;
	VAR1414: RECG1012;
	VAR2426: boolean;
	VAR2430: STR6;
	VAR2436: RECE50;
	VAR2506: RECE50;
	VAR2556: RECE50;
	VAR2626: RECE50;
    VAR2676: integer;
    VAR2700: RECF1012;
    VAR3712: array [0..24] of RECB14;
    VAR4366: integer;
    VAR4370: integer;
    VAR4372: array [0..100] of RECC16;
    VAR7200: integer;
    VAR7202: integer;
    VAR7204: array [0..1000] of RECD22;
    VAR52346: integer;
    VAR52350: integer;
    VAR52352: integer;
    VAR52354: integer;
    VAR52356: set of VSET;
    VAR52366: RECF1012;
    VAR53400: boolean;
    VAR53402: STR6;
    VAR53410: integer;
    VAR53412: integer;
    VAR53414: set of VSET;
    VAR53424: UINT;
    VAR53426: integer;
    VAR53430: integer;
    VAR53432: integer;
    VAR53434: UINT;
    VAR53436: TYPCOM;
    VAR53440: STR6;
    VAR53446: STR6;
    VAR53454: integer;
    VAR53456: integer;
    VAR53460: integer;
    VAR53462: set of BITS;
    VAR53472: set of BITS;

procedure L01000; external;
procedure L01304(var RECIO: RECF1012; var CHN: integer; CHS: CHSTATE); external;
procedure L01522(var RECIO: RECF1012; var VAL: integer); external;
procedure L02020(var RECIO: RECF1012; VAL: char); external;
procedure L02276(var RECIO: RECF1012); external;

procedure L03004; external;
function L05122(VAL: integer): integer; external;
function L05160(VAL: integer): integer; external;
procedure L10104(var RECIO: RECF1012); external;

procedure L10442(CH: char);
begin
	if VAR2676 = 2 then
		L02020(VAR2700, CH);
end;

procedure L10516;
begin
	L10442(CHR(13));
	L10442(CHR(10));
end;

procedure L10544;
begin
	L10442(CHR(9));
end;

procedure L10562(STR: STR6);
var I: integer;
begin
 I:=1;
 while ((I<6) and (STR[I]<>'\')) do
  begin
   L10442(STR[I]);
   I:=I+1;
   if ((I=6) and (STR[6]<>'\')) then
    L10442(STR[6]);
  end;
end;

procedure L11032(VAL: UINT);
var X,I: integer; OCTNUM: array [1..6] of integer;
begin
 if VAL=0 then
  L10442('0')
 else
  begin
   X:=VAL;
   for I:=6 downto 1 do
    begin
     OCTNUM[I]:=VAL MOD 8;
     VAL:= VAL DIV 8;
    end;
   I:=1;
   while OCTNUM[I]=0 do
    I:=I+1;
   while I<=6 do
    begin
     if I=1 then
      L10442(CHR((OCTNUM[I] MOD 2)+ORD('0')))
     else
      L10442(CHR(OCTNUM[I]+ORD('0')));
     I:=I+1;
    end;
  end;
end;

procedure L11510(VAL: UINT);
begin
 if VAL<32768 then
  L11032(VAL)
 else
  begin
   L10442('-');
   L11032(-VAL);
  end;
end;

procedure L11602(STR: STR6);
var I,J: integer;
begin
 if STR<>'      ' then
  begin
   I:=6;
   while STR[I]=' ' do
    I:=I-1;
   for J:=1 to I do
    L10442(STR[J]);
  end;
end;

procedure L12056(STR: STR6; VAL: integer);
begin
 if STR<>'. ABS.' then
  L11602(STR);
  if VAL>0 then
   begin
    L10442('+');
    L11032(VAL);
   end
  else
   if VAL<0 then
    begin
     L10442('-');
     L11032(-VAL);
    end;
end;

const STRABS='. ABS.';

procedure L12262(STR: STR6);
var A: boolean;
begin
 VAR4370:=0;
 if STR<>STRABS then
  begin
   A:=false;
   while ((VAR4370<VAR4366) and (not A)) do
    begin
     VAR4370:=VAR4370+1;
     A:=STR=VAR3712[VAR4370].RB00;
    end;
   if not A then
    if VAR4366<24 then
     begin
      VAR4366:=VAR4366+1;
      VAR4370:=VAR4366;
      with VAR3712[VAR4370] do
       begin
        RB00:=STR;
        RB10:=0;
        RB12:=0;
       end;
     end
    else
     VAR4370:=0;
  end;
end;

function L12704(STR: STR6): char;
begin
 L12262(STR);
 if VAR4370<>0 then
  if VAR3712[VAR4370].RB00='      ' then
   L12704:='.'
  else
   L12704:=CHR(VAR4370+ORD('@'));
end;

procedure L13120(STR1,STR2: STR6; VAL: integer);
var I: integer;
begin
 if VAR7200<100 then
  begin
   VAR7200:=VAR7200+1;
   VAR7202:=VAR7200;
   with VAR4372[VAR7202] do
    begin
     RC00:=STR1;
     RC06:=STR2;
     RC14:=VAL;
    end;
  end
 else
  VAR7202:=0;
end;

function L13314(STR: STR6; VAL: integer): boolean;
var L: boolean;
begin
 L12262(STR);
 VAR52350:=0;
 L:=false;
 repeat
  VAR52352:=VAR52350;
  with VAR7204[VAR52350] do
   begin
    VAR52354:=VAR4370-RD04;
    if VAR52354<0 then
     VAR52350:=RD00
    else
     if VAR52354>0 then
      VAR52350:=RD02
     else
      begin
       VAR52354:=VAL-RD06;
       if VAR52354<0 then
        VAR52350:=RD00
       else
        if VAR52354>0 then
         VAR52350:=RD02
        else
         L:=true;
      end;
   end;
 until (VAR52350<VAR52352) or L;
 L13314:=L;
end;

procedure L13666(STR: STR6; VAL: UINT);
begin
 L12262(STR);
 if ((VAL<VAR3712[VAR4370].RB06) and (VAL<=32767)) then
  if not L13314(STR,VAL) then
   if VAR52346<1000 then
    begin
     VAR52346:=VAR52346+1;
     VAR52350:=VAR52346;
     with VAR7204[VAR52350] do
      begin
       RD00:=0;
       if VAR52354<0 then
        RD02:=VAR52352
       else
        RD02:=VAR7204[VAR52352].RD02;
       RD04:=VAR4370;
       RD06:=VAL;
       RD10:=VAR52356;
      end;
     with VAR7204[VAR52352] do
      if VAR52354<0 then
       RD00:=VAR52350
      else
       RD02:=VAR52350;
    end
  else
   with VAR7204[VAR52350] do
    RD10:=RD10+VAR52356;
end;

procedure L14576(I: integer);
begin
 with VAR7204[I] do
  VAR52350:=RD02;
 if VAR52350>I then
  while VAR7204[VAR52350].RD00<>0 do
   VAR52350:=VAR7204[VAR52350].RD00;
end;

procedure L15034(STR: STR6; VAL:integer);
begin
 if not L13314(STR,VAL) then
  if VAR52354<0 then
   VAR52350:=VAR52352
  else
   L14576(VAR52352);
end;

procedure L15160;
begin
 VAR52346:=0;
 with VAR7204[0] do
  begin
   RD00:=0;
   RD02:=0;
   RD04:=25;
  end;
end;

procedure L15214(STR: STR6; VAL: integer);
var LSTR: STR6;
begin
 LSTR:=' .    ';
 LSTR[1]:=L12704(STR);
 L12056(LSTR,VAL);
end;

BEGIN

	{$C
		.BLKW 6877 }
	WRITE('?DEC-I-LABELS USED : ');
END.
