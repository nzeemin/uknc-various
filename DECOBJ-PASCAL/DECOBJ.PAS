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
    RA02: STR6;
    RA10: integer;  {INDEX IN VAR3712}
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
    RE02: STR6;  {SYMBOL NAME}
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
  end;

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
  VAR52346: integer; {LABELS - number of labels used}
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
  VAR53426: integer; {MRKEDINSTR}
  VAR53430: integer;
  VAR53432: UINT;
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
procedure L01304(var RECIO: RECF1012; CHN: integer; CHS: CHSTATE); external;
procedure L01522(var RECIO: RECF1012; var VAL: integer); external;
procedure L02020(var RECIO: RECF1012; VAL: char); external;
procedure L02276(var RECIO: RECF1012); external;

procedure L03004(var RECIO: RECF1012; var RECBLK: RECG1012); external;
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
  I := 1;
  while ((I<6) and (STR[I] <> '\')) do begin
    L10442(STR[I]);
    I := I + 1;
    if ((I = 6) and (STR[6] <> '\')) then
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
  VAR52346 := 0;
  with VAR7204[0] do begin
    RD00 := 0;
    RD02 := 0;
    RD04 := 25;
  end;
end;

procedure L15214(STR: STR6; VAL: integer);
var LSTR: STR6;
begin
  LSTR := ' .    ';
  LSTR[1] := L12704(STR);
  L12056(LSTR, VAL);
end;

procedure L15350(STR: STR6; VAL: UINT);
var I: integer;
begin
 case VAR2676 of
  0: L13666(STR,VAL);
  1: begin
      VAR52356:=VAR52356+[VS6];
      L13666(STR,VAL);
     end;
  2: if STR=STRABS then
      L11032(VAL)
     else
      if not L13314(STR,VAL) then
       L15214(STR,VAL)
      else
       with VAR7204[VAR52350] do
        if VS0 in RD10 then
         L12056(VAR4372[RD20].RC00,0)
        else
         begin
          L10442(L12704(STR));
          if VAL<=4095 then
           L10442('.');
          L11032(VAL);
         end;
 end;
end;

procedure L16302;
begin
 if VAR2676=0 then
  VAR53426:=VAR53426+1
 else
  if VAR2676=1 then
   with VAR7204[VAR53412] do
    RD10:=RD10+[VS10];
end;

procedure L16470;
begin
 if VAR2676=0 then
  VAR53430:=VAR53430+1
 else
  if VAR2676=1 then
   with VAR7204[VAR53412] do
    RD10:=RD10+[VS7];
end;

procedure L16656;
begin
 if L13314(VAR53402,VAR53410) then
  with VAR7204[VAR52350] do
   begin
    if VAR2676=2 then
     if not (VS11 in RD10) then
      begin
       RD10:=RD10+[VS11];
       if VS0 in RD10 then
        begin
         for VAR7202:=1 to 100 do
          with VAR4372[VAR7202] do
           if VAR53402=RC06 then
            if RC14=VAR53410 then
             begin
              L10516;
              L11602(RC00);
              L10562('::\   ');
              L10562('      ');
             end;
        end
       else
        begin
         L15350(VAR53402,VAR53410);
         L10442(':');
         L10544;
        end;
       L10544;
       L10544;
       L10544;
       L10562('; \   ');
       if VS10 in RD10 then
        L10562('+I \  ')
       else
        L10562('   \  ');
       if VS7 in RD10 then
        L10562('-I \  ')
       else
        L10562('   \  ');
       if VS2 in RD10 then
        L10442('D')
       else
        L10442(' ');
       L10442(' ');
       if VS1 in RD10 then
        L10442('@')
       else
        L10442(' ');
       L10442(' ');
       if VS3 in RD10 then
        L10442('C')
       else
        L10442(' ');
       L10442(' ');
       if VS4 in RD10 then
        L10442('J')
       else
        L10442(' ');
       L10442(' ');
       if VS5 in RD10 then
        L10442('B')
       else
        L10442(' ');
       L10516;
      end;
    VAR53412:=VAR52350;
    VAR53414:=RD10*[VS1,VS2,VS3,VS4,VS5,VS7,VS10];
   end;
   L14576(VAR52350);
   L12262(VAR53402);
   with VAR7204[VAR52350] do
    if RD04=VAR4370 then
     VAR53424:=RD06
    else
     VAR53424:=-1;
end;

procedure L21124(var VAL:integer);
begin
 with VAR20[VAL] do
  begin
   VAL:=VAl-1;
   if VAL<1 then
    VAL:=20;
   if RA00<=6 then
    L21124(VAL);
   if RA00<=9 then
    L21124(VAL);
  end;
end;

procedure L21312(A,B: integer);
var I,J: integer; CH: char;
begin
 J:=B-1;
 if J<1 then
  J:=20;
 if A=J then
  with VAR20[B] do
   case RA00 of
    14: L11602(RA02);
    15: L15350(VAR3712[RA10].RB00,RA12);
    16: L11032(RA12);
   end
 else
  begin
   I:=J;
   L21124(I);
   if I<>A then
    L21312(A,I);
   with VAR20[B] do
    if RA00=9 then
     L10562('^C\   ')
    else
     begin
      case RA00 of
       1: CH:='+';
       2: CH:='-';
       3: CH:='*';
       4: CH:='/';
       5: CH:='&';
       6: CH:='!';
       8: CH:='-';
      end;
      L10442(CH);
     end;
   L21312(I,J);
  end;
end;

procedure L22314(A: integer);
var I,J,K: integer;
begin
 I:=A;
 repeat
  J:=I;
  I:=I+1;
  if I>20 then
   I:=1;
  K:=VAR20[I].RA00;
 until ((K=10) or (K=11));
 L21312(A,J);
end;

procedure L22640;

function L22542(VAL: UINT): boolean;
begin
  L22542 := ((32 <= VAL) and (VAL <= 95));
end;

begin
 case VAR2506.RE00 of
  TXT: if L22542(VAR2506.RE34) then
        begin
         L10442('''');
         L10442(CHR(VAR2506.RE34));
        end
       else
        if L22542(L05122(VAR2506.RE34)) and L22542(L05160(VAR2506.RE34)) then
         begin
          L10442('"');
          L10442(CHR(L05122(VAR2506.RE34)));
          L10442(CHR(L05160(VAR2506.RE34)));
         end
        else
         L11032(VAR2506.RE34);
  RLD: case VAR2506.RE36 of
        RLDIR: L15350(VAR53402,VAR2506.RE44);
        RLDIDR: begin
                 L16302;
                 L11032(VAR2506.RE44);
                end;
        RLDGR: L12056(VAR2506.RE02,0);
        RLDGDR: begin
                 L16302;
                 L12056(VAR2506.RE02,0);
                end;
        RLDGAR: L12056(VAR2506.RE02,VAR2506.RE44);
        RLDGADR: begin
                  L16302;
                  L12056(VAR2506.RE02,VAR2506.RE44);
                 end;
        RLDPDR: begin
                 L16302;
                 L15350(VAR2506.RE02,0);
                end;
        RLDPAR: L15350(VAR2506.RE02,VAR2506.RE44);
        RLDPADR: begin
                  L16302;
                  L15350(VAR2506.RE02,VAR2506.RE44);
                 end;
        RLDCR: L22314(VAR2506.RE46);
       end;
 end;
end;

procedure L23736;
begin
  VAR53432 := VAR2506.RE34;
{$C
  CLR      R1
  MOV      #<TBEND-TBBEG>,R0
1$:  MOV      R1,R2
  ADD      R0,R2
  ASR      R2
  ADD      #000007,R2
  BIC      #000007,R2
  CMP      R2,R0
  BEQ      3$
  CMP      <TBBEG-8>(R2),<VAR2506+^O34>(R5)
  BHI      2$
  MOV      R2,R0
  BR       1$
2$:  MOV      R2,R1
  BR       1$
3$:  ADD      #<TBBEG-10>,R0
  MOV      (R0)+,VAR53434(R5)
  MOV      (R0)+,VAR53436(R5)
  MOV      (R0)+,VAR53440(R5)
  MOV      (R0)+,<VAR53440+2>(R5)
  MOV      #"  ,<VAR53440+4>(R5)
  JMP      TBEND
  .RADIX  8
TBBEG:  .WORD  170000,14
  .ASCII  /*FPT/
  .WORD  160000,12
  .ASCII  /SUB /
  .WORD  150000,12
  .ASCII  /BISB/
  .WORD  140000,12
  .ASCII  /BICB/
  .WORD  130000,12
  .ASCII  /BITB/
  .WORD  120000,12
  .ASCII  /CMPB/
  .WORD  110000,12
  .ASCII  /MOVB/
  .WORD  106700,15
  .ASCII  /    /  ; MFPS
  .WORD  106600,1
  .ASCII  /MTPD/
  .WORD  106500,1
  .ASCII  /MFPD/
  .WORD  106400,15
  .ASCII  /    /  ; MTPS
  .WORD  106300,1
  .ASCII  /ASLB/
  .WORD  106200,1
  .ASCII  /ASRB/
  .WORD  106100,1
  .ASCII  /ROLB/
  .WORD  106000,1
  .ASCII  /RORB/
  .WORD  105700,1
  .ASCII  /TSTB/
  .WORD  105600,1
  .ASCII  /SBCB/
  .WORD  105500,1
  .ASCII  /ADCB/
  .WORD  105400,1
  .ASCII  /NEGB/
  .WORD  105300,1
  .ASCII  /DECB/
  .WORD  105200,1
  .ASCII  /INCB/
  .WORD  105100,1
  .ASCII  /COMB/
  .WORD  105000,1
  .ASCII  /CLRB/
  .WORD  104400,10
  .ASCII  /TRAP/
  .WORD  104000,10
  .ASCII  /EMT /
  .WORD  103400,5
  .ASCII  /BCS /
  .WORD  103000,5
  .ASCII  /BCC /
  .WORD  102400,5
  .ASCII  /BVS /
  .WORD  102000,5
  .ASCII  /BVC /
  .WORD  101400,5
  .ASCII  /BLOS/
  .WORD  101000,5
  .ASCII  /BHI /
  .WORD  100400,5
  .ASCII  /BMI /
  .WORD  100000,5
  .ASCII  /BPL /
  .WORD  077000,13
  .ASCII  /SOB /
  .WORD  075040,15
  .ASCII  /    /
  .WORD  075030,2
  .ASCII  /FDIV/
  .WORD  075020,2
  .ASCII  /FMUL/
  .WORD  075010,2
  .ASCII  /FSUB/
  .WORD  075000,2
  .ASCII  /FADD/
  .WORD  074000,6
  .ASCII  /XOR /
  .WORD  073000,7
  .ASCII  /ASHC/
  .WORD  072000,7
  .ASCII  /ASH /
  .WORD  071000,7
  .ASCII  /DIV /
  .WORD  070000,7
  .ASCII  /MUL /
  .WORD  060000,12
  .ASCII  /ADD /
  .WORD  050000,12
  .ASCII  /BIS /
  .WORD  040000,12
  .ASCII  /BIC /
  .WORD  030000,12
  .ASCII  /BIT /
  .WORD  020000,12
  .ASCII  /CMP /
  .WORD  010000,12
  .ASCII  /MOV /
  .WORD  007000,15
  .ASCII  /    /
  .WORD  006300,1
  .ASCII  /ASL /
  .WORD  006200,1
  .ASCII  /ASR /
  .WORD  006100,1
  .ASCII  /ROL /
  .WORD  006000,1
  .ASCII  /ROR /
  .WORD  005700,1
  .ASCII  /TST /
  .WORD  005600,1
  .ASCII  /SBC /
  .WORD  005500,1
  .ASCII  /ADC /
  .WORD  005400,1
  .ASCII  /NEG /
  .WORD  005300,1
  .ASCII  /DEC /
  .WORD  005200,1
  .ASCII  /INC /
  .WORD  005100,1
  .ASCII  /COM /
  .WORD  005000,1
  .ASCII  /CLR /
  .WORD  004700,1
  .ASCII  /CALL/
  .WORD  004000,6
  .ASCII  /JSR /
  .WORD  003400,5
  .ASCII  /BLE /
  .WORD  003000,5
  .ASCII  /BGT /
  .WORD  002400,5
  .ASCII  /BLT /
  .WORD  002000,5
  .ASCII  /BGE /
  .WORD  001400,5
  .ASCII  /BEQ /
  .WORD  001000,5
  .ASCII  /BNE /
  .WORD  000400,5
  .ASCII  /BR  /
  .WORD  000300,1
  .ASCII  /SWAB/
  .WORD  000277,0
  .ASCII  /SCC /
  .WORD  000276,14
  .ASCII  /    /
  .WORD  000270,0
  .ASCII  /SEN /
  .WORD  000267,14
  .ASCII  /    /
  .WORD  000264,0
  .ASCII  /SEZ /
  .WORD  000263,14
  .ASCII  /    /
  .WORD  000262,0
  .ASCII  /SEV /
  .WORD  000261,0
  .ASCII  /SEC /
  .WORD  000260,14
  .ASCII  /    /
  .WORD  000257,0
  .ASCII  /CCC /
  .WORD  000256,14
  .ASCII  /    /
  .WORD  000250,0
  .ASCII  /CLN /
  .WORD  000247,14
  .ASCII  /    /
  .WORD  000244,0
  .ASCII  /CLZ /
  .WORD  000243,14
  .ASCII  /    /
  .WORD  000242,0
  .ASCII  /CLV /
  .WORD  000241,0
  .ASCII  /CLC /
  .WORD  000240,0
  .ASCII  /NOP /
  .WORD  000230,4
  .ASCII  /SPL /
  .WORD  000210,15
  .ASCII  /    /
  .WORD  000207,0
  .ASCII  /RETU/
  .WORD  000200,2
  .ASCII  /RTS /
  .WORD  000100,1
  .ASCII  /JMP /
  .WORD  000007,15
  .ASCII  /    /
  .WORD  000006,0
  .ASCII  /RTT /
  .WORD  000005,14
  .ASCII  /RESE/
  .WORD  000004,14
  .ASCII  /IOT /
  .WORD  000003,14
  .ASCII  /BPT /
  .WORD  000002,0
  .ASCII  /RTI /
  .WORD  000001,14
  .ASCII  /WAIT/
  .WORD  000000,14
  .ASCII  /HALT/
  .RADIX  10
TBEND:
}
end;

procedure L30060;
var LOC00,LOC02,LOC04,LOC06,LOC10,LOC12,LOC14: integer; LOC16,LOC17: boolean;

 function L25600(REC: RECE50): boolean;
 begin
  with REC do
   L25600:=((RE00=TXT) or (RE00=RLD) and (RE36 in [RLDLCD,RLDLCM,RLDLIM])) and (RE26=0);
 end;

 function L26010(REC: RECE50): boolean;
 begin
  with REC do
   L26010:=(RE00=TXT) and (RE26=0) and ((RE34 and 1)<>0);
 end;

 procedure L26156(VAL: UINT);
 var I: integer;
 begin
  I:=VAL DIV 8;
  LOC00:=(I DIV 2)*2;
  LOC02:=I and 1;
  LOC04:=VAL and 7;
  VAR52356:=[VS2];
  if VAL=27B then
   VAR52356:=[VS1];
 end;

 procedure L26426;
 begin
  L26156(VAR53432 and 77B);
 end;

 procedure L26502;
 begin
  L26156((VAR53432 DIV 100B) and 77B);
  LOC10:=LOC00;
  LOC12:=LOC02;
  LOC14:=LOC04;
 end;

 procedure L27360;

  procedure L26624;
  begin
   if LOC04=7 then
    L10562('PC\   ')
   else
    if LOC04=6 then
     L10562('SP\   ')
    else
     begin
      L10442('R');
      L11032(LOC04);
     end;
  end;

  procedure L27042;
  begin
   L10442('(');
   L26624;
   L10442(')');
  end;

  procedure L27122;
  begin
   L10104(VAR52366);
   if ((VAR2506.RE00=TXT) and (LOC00=6) and (LOC04=7)) then
    L15350(VAR53402,VAR53410+2+VAR2506.RE34)
   else
    L22640;
   VAR53410:=VAR53410+2;
  end;

 begin
  if LOC02<>0 then
   L10442('@');
  if ((LOC04=7) and ((LOC00=2) or (LOC00=6)) and L25600(VAR2556)) then
   case LOC00 of
    2: begin
        L10442('#');
        L27122;
       end;
    6: L27122;
   end
  else
   case LOC00 of
    0: L26624;
    2: begin
        L27042;
        L10442('+');
       end;
    4: begin
        L10442('-');
        L27042;
       end;
    6: begin
        L27122;
        L27042;
       end;
   end
 end;

begin
 L23736;
 VAR53410:=VAR53410+2;
 L26502;
 L26426;
 if VAR53436=TY12 then
  begin
   if LOC12=0 then
    if LOC10=0 then
     if LOC04=LOC14 then
      if ((LOC00=2) or (LOC00=4)) then
       VAR53436:=TY15;
   if ((LOC14=7) and ((LOC10 and 3)=0)) then
    VAR53436:=TY15;
   if ((LOC04=7) and ((LOC00 and 3)=0)) then
    VAR53436:=TY15;
   LOC16:=(LOC10=6) or (LOC10=2) and (LOC14=7);
   LOC17:=(LOC00=6) or (LOC00=2) and (LOC04=7);
   if LOC16 or LOC17 then
    begin
     if not L25600(VAR2556) then
      VAR53436:=TY15;
     if LOC16 and LOC17 then
      if not L25600(VAR2626) then
       VAR53436:=TY15;
    end;
   if ((010000B<=VAR53434) and (VAR53434<070000B)) then
    begin
     if ((LOC10=6) or (not LOC16) and (LOC00=6)) then
      if L26010(VAR2556) then
       VAR53436:=TY15;
     if (LOC00=6) and LOC16 then
      if L26010(VAR2626) then
       VAR53436:=TY15;
    end;
  end;
 if VAR53434=071000B then
  if (LOC14 and 1)<>0 then
   VAR53436:=TY15;
 if ((VAR53434=000100B) or (VAR53434=004000B)) then
  if ((LOC02=0) and (LOC00<=2)) then
   VAR53436:=TY15;
 if VAR53436 in [TY01,TY06,TY07] then
  begin
   if ((LOC04=7) and ((LOC00 and 3)=0)) then
    VAR53436:=TY15;
   if LOC00=6 then
    if not L25600(VAR2556) then
     VAR53436:=TY15;
  end;
 if VAR53436=TY15 then
  begin
   L16470;
   L10544;
   L10442(' ');
   L22640;
  end
 else
  if VAR53436=TY14 then
   begin
    L10544;
    L10442(' ');
    L11032(VAR53432);
   end
  else
   begin
    L10544;
    L11602(VAR53440);
    if VAR53434=000207B then
     L10562('RN\   ');
    L10544;
    case VAR53436 of
     TY02: begin
            L26426;
            LOC00:=0;
            LOC02:=0;
            L27360;
           end;
     TY01: begin
            L26426;
            if VAR53434=000100B then
             VAR52356:=[VS4];
            if VAR53434=004700B then
             VAR52356:=[VS3];
            L27360;
           end;
     TY06: begin
            L26502;
            LOC00:=0;
            LOC02:=0;
            L27360;
            L10562(', \   ');
            L26426;
            if VAR53434=004000B then
             VAR52356:=[VS3];
            L27360;
           end;
     TY07: begin
            L26426;
            L27360;
            L10562(', \   ');
            L26502;
            LOC00:=0;
            LOC02:=0;
            L27360;
           end;
     TY12: begin
            L26502;
            L27360;
            L10562(', \   ');
            L26426;
            L27360;
           end;
     TY05: begin
            LOC06:=VAR53432 and 377B;
            if LOC06>=128 then
             LOC06:=LOC06-256;
            VAR52356:=[VS5];
            L15350(VAR53402,LOC14*2+VAR53410);
           end;
     TY13: begin
            L26502;
            LOC00:=0;
            LOC02:=0;
            L27360;
            L10562(', \   ');
            LOC06:=VAR53432 and 77B;
            VAR52356:=[VS5];
            L15350(VAR53402,VAR53410-LOC14*2);
           end;
     TY10: L11032(L05122(VAR53432));
    end;
   end;
 L10516;
end;

procedure L35532;
var LOC00: array [1..60] of char; LOC74,LOC76: integer;
    LOC100: boolean; LOC101: char; LOC102,LOC104: integer;

 function L33406(VAL: UINT):boolean;
 begin
  L33406:=(32<=VAL) and (VAL<=127) or (VAL=7) or (VAL=9) or (VAL=13) or (VAL=10) or (VAL=12) or (VAL=128) or (VAL=0);
 end;

 procedure L33720;
 begin
  if LOC74>0 then
   begin
    L10544;
    if ((LOC00[LOC74]<>CHR(0)) or (LOC74=1)) then
     L10562('.ASCII')
    else
     begin
      L10562('.ASCIZ');
      LOC74:=LOC74-1;
     end;
    L10544;
    LOC101:='"';
    for LOC76:=1 to LOC74 do
     if LOC00[LOC76]=LOC101 then
      LOC101:='/';
    if LOC00[1]>=' ' then
     L10442(LOC101);
    for LOC76:=1 to LOC74 do
     begin
      if LOC00[LOC76]>=' ' then
       L10442(LOC00[LOC76])
      else
       begin
        if LOC76>1 then
         if LOC00[LOC76-1]>=' ' then
          L10442(LOC101);
        L10442('<');
        LOC102:=ORD(LOC00[LOC76]);
        if LOC102<0 then
         LOC102:=LOC102+256;
        L11032(LOC102);
        L10442('>');
        if LOC76<LOC74 then
         if LOC00[LOC76+1]>=' ' then
          L10442(LOC101);
       end;
     end;
    if LOC00[LOC74]>=' ' then
     L10442(LOC101);
    L10516;
   end;
  LOC74:=0;
 end;

 procedure L35326(VAL: integer);
 begin
  LOC74:=LOC74+1;
  LOC00[LOC74]:=CHR(VAL);
  if ((LOC74>=60) or (VAL=0) or (VAL=128)) then
   L33720;
  VAR53410:=VAR53410+1;
 end;

begin
 LOC100:=false;
 if (VAR53410+3)<=VAR53424 then
  if VAR2556.RE00=TXT then
   if L33406(L05122(VAR2506.RE34)) and (L05122(VAR2506.RE34)<>0) and
      ((VAR2506.RE26=1) or L33406(L05160(VAR2506.RE34)) and (L05160(VAR2506.RE34)<>0)) and
      L33406(L05122(VAR2556.RE34)) then
    begin
     LOC74:=0;
     L35326(L05122(VAR2506.RE34));
     if VAR2506.RE26=0 then
      L35326(L05160(VAR2506.RE34));
     L10104(VAR52366);
     repeat
      L35326(L05122(VAR2506.RE34));
      if VAR2506.RE26=1 then
       L10104(VAR52366)
      else
       begin
        VAR2506.RE26:=1;
        VAR2506.RE30:=VAR2506.RE30+1;
        VAR2506.RE34:=L05160(VAR2506.RE34);
       end;
     until ((VAR2506.RE00<>TXT) or (not L33406(L05122(VAR2506.RE34))) or (VAR53410>=VAR53424));
     VAR53400:=true;
     L33720;
     LOC100:=true;
    end;
 if not LOC100 then
  begin
   L10544;
   if VAR53424=(VAR53410+1) then
    if VAR2506.RE26=0 then
     begin
      LOC104:=L05160(VAR2506.RE34);
      VAR2506.RE34:=L05122(VAR2506.RE34);
      VAR2506.RE26:=1;
      VAR53400:=true;
     end;
   if VAR2506.RE26=0 then
    L10442(' ')
   else
    begin
     L10562('.BYTE\');
     L10544;
     L16470;
    end;
   L22640;
   L10516;
   VAR53410:=2-VAR2506.RE26+VAR53410;
   if VAR53400 then
    begin
     VAR2506.RE30:=VAR2506.RE30+1;
     VAR2506.RE34:=LOC104;
    end;
  end;
end;

procedure L37004(STR: STR6; VAL: integer);
begin
 if (VAR53402<>STR) or (VAL<>VAR53410) then
  L10516;
 if VAR53402<>STR then
  begin
   L12262(VAR53402);
   VAR3712[VAR4370].RB10:=VAR53410;
   L10544;
   if STRABS<>STR then
    L10562('.ASECT')
   else
    begin
     L10562('.CSECT');
     L10544;
     L11602(STR);
    end;
   L10516;
   VAR53402:=STR;
   L12262(VAR53402);
   VAR53410:=VAR3712[VAR4370].RB10;
  end;
 if VAL<>VAR53410 then
  begin
   L10562('. = \ ');
   L15214(STR,VAL);
   L10516;
   VAR53410:=VAL;
  end;
end;

BEGIN {L37702}
  VAR53462 := [BIT2,BIT3,BIT5,BIT6];
  VAR53472 := [BIT3,BIT5];
  repeat begin
    L01000;
    VAR2626.RE12 := [];
    VAR400 := 1;
    VAR4366 := 0;
    VAR7200 := 0;
    L15160;
    VAR53426 := 0;
    VAR53430 := 0;
    for VAR2676 := 0 to 2 do begin
      L01304(VAR52366, 3, CHST1);
      L01304(VAR2700, 0, CHST2);
      VAR402.RG1010 := true;
      VAR2426 := false;
      L03004(VAR52366, VAR1414);
      L10104(VAR52366);
      L10104(VAR52366);
      VAR53400 := false;
      VAR53456 := 0;
      repeat begin {L40250}
        if not ORD(VAR53400) and 1 <> 0 then
          L10104(VAR52366);
        VAR53400 := false;
        if VAR53456 = 0 then begin
          if (VAR2506.RE00 <> GSD) OR (VAR2506.RE10 <> GSDGSN) OR (BIT3 IN VAR2506.RE12) then begin
            L10516;
            VAR53456 := 0;
          end;
          case VAR2506.RE00 of
            GSD: begin {L40500}
              case VAR2506.RE10 of
                GSDMN: begin {L40536}
                  L10544;
                  L10562('.ENABL');
                  L10544;
                  L10562('LC\   ');
                  L10516;
                  L10544;
                  L10562('.NLIST');
                  L10544;
                  L10562('BEX\  ');
                  L10516;
                  L10516;
                  L10544;
                  L10562('.TITLE');
                  L10544;
                  L10562(VAR2506.RE02);
                  L10516;
                end;
                GSDTA: begin {L41004}
                  VAR53446 := VAR2506.RE02;
                  VAR53454 := VAR2506.RE22;
                end;
                GSDGSN: begin {L41040}
                  if BIT3 IN VAR2506.RE12 then begin
                    if VAR53456 = 0 then begin {L41104}
                      L10544;
                      L10562('.GLOBL');
                      L10544;
                      L11602(VAR2506.RE02);
                      VAR53456 := 1;
                    end else begin
                      L10442(',');
                      L10544;
                      L11602(VAR2506.RE02);
                      VAR53456 := VAR53456 + 1;
                    end;
                    if VAR53456 >= 6 then begin
                      L10516;
                      VAR53456 := 0;
                    end;
                  end else begin
                    case VAR2676 of {L41276}
                      0: {L41334}
                        if VAR53402 <> STRABS then begin
                          L13120(VAR2506.RE02, VAR53402, VAR2506.RE22);
                          if VAR7202 <> 0 then begin
                            VAR52356 := [VS0];
                            if VAR2506.RE22 and 1 <> 0 then begin
                              VAR52356 := VAR52356 + [VS2];
                            end;
                            L13666(VAR53402, VAR2506.RE22);
                            if L13314(VAR53402, VAR2506.RE22) then
                              VAR7204[VAR52350].RD20 := VAR7202;
                          end;
                        end;
                      2: {L41736}
                        if VAR53402 = STRABS then begin {L41772}
                          L12056(VAR2506.RE02, 0);
                          L10562(' == \ ');
                          L11032(VAR2506.RE22);
                          L10516;
                        end else begin {L42066}
                          if ORD(not L13314(VAR53402, VAR2506.RE22)) <> 0 then begin
                            L37004(VAR53402, VAR2506.RE22);
                            L16656;
                          end else begin
                          end;
                        end;
                    end;
                  end;
                end;
                GSDPSN: begin {L42224}
                  if VAR2506.RE02 = STRABS then begin
                    L10516;
                    L10544;
                    L10562('.ASECT');
                    L10544;
                    L10544;
                    L10516;
                    if VAR2506.RE22 <> 0 then begin
                      L10544;
                      L10562('.BLKB\');
                      L10544;
                      L11032(VAR2506.RE22);
                      L10516;
                    end;
                    VAR53402 := STRABS;
                    VAR53410 := VAR2506.RE22;
                  end else begin
                    L12262(VAR2506.RE02);
                    VAR3712[VAR4370].RB06 := VAR2506.RE22;
                    L10516;
                    L10544;
                    if (VAR2506.RE12 = VAR53462) or ((VAR2506.RE02 = '      ') and (VAR2506.RE12 = VAR53472)) then begin
                      L10562('.CSECT');
                      L10544;
                      L11602(VAR2506.RE02);
                    end else begin
                      L10562('.PSECT');
                      L10544;
                      L11602(VAR2506.RE02);
                      if VAR2506.RE12 <> VAR53472 then begin
                        if (BIT4 in VAR2506.RE12) then begin
                          L10562(', RO\ ');
                        end else begin
                        end;
                        if (BIT7 in VAR2506.RE12) then begin
                          L10562(', D\  ');
                        end else begin
                        end;
                        if (BIT2 in VAR2506.RE12) then begin
                          L10562(', OVR\');
                        end else begin
                        end;
                        if (BIT5 in VAR2506.RE12) then begin
                        end else begin
                          L10562(', ABS\');
                        end;
                        if (BIT6 in VAR2506.RE12) then begin
                          L10562(', GBL\');
                        end else begin
                        end;
                      end;
                    end;
                    L10516;
                    VAR53402 := VAR2506.RE02;
                    VAR53410 := 0;
                    L15214(VAR2506.RE02, 0);
                    L10442(':');
                    if VAR2506.RE22 <> VAR3712[VAR4370].RB12 then begin
                      L10544;
                      L10562('.BLKB\');
                      L10544;
                      L11032(VAR2506.RE22);
                      VAR53410 := VAR2506.RE22;
                    end;
                    L10516;
                  end;
                end;
                GSDPVI: begin {L43770}
                  L10544;
                  L10562('.IDENT');
                  L10544;
                  L10442('/');
                  L10562(VAR2506.RE02);
                  L10442('/');
                  L10516;
                end;
              end;
            end;
            TXT: begin
              L16656;
              if VAR2506.RE30 <> VAR53410 then begin
                L10516;
                L10562('.ERROR');
                L10442(' ');
                L11032(VAR53410);
                L10562(' ; BAD');
                L10562(' LOCTN');
                L10516;
                L37004(VAR53402, VAR2506.RE30);
              end;
              if ((VAR53410 and 1) = 0) and (VAR2506.RE26 = 0) or
                (VAR53414 <> [VS2]) and not (VS7 in VAR53414) and
                not (VS10 in VAR53414) and not (VAR53410 + 1 <> VAR53424) then begin
                L30060;
              end else begin {L44610}
                L35532;
              end;
            end;
            RLD: begin
              case VAR2506.RE36 of
                RLDLCD: begin
                  L37004(VAR2506.RE02, VAR2506.RE44);
                  L15034(VAR53402, VAR53410);
                  L12262(VAR53402);
                  with VAR7204[VAR52350] do begin
                    if RD04 = VAR4370 then
                      VAR53424 := RD06
                    else
                      VAR53424 := -1;
                  end;
                  VAR53412 := 0;
                  VAR53414 := [];
                end;
                RLDLCM: begin {L45126}
                  L16656;
                  if VAR2506.RE44 <= VAR53424 then
                    VAR53460 := VAR2506.RE44 - VAR53410
                  else begin
                    VAR53460 := VAR53424 - VAR53410;
                    VAR53400 := true;
                  end;
                  if (VAR53460 < 0) or (16 < VAR53460) then begin
                    L10562('  . = ');
                    L12056('.     ', VAR53460);
                    L10516;
                  end else begin
                    if VAR53460 and 1 = 0 then begin
                      L10544;
                      L10562('.BLKW ');
                      L10544;
                      L11032(VAR53460 div 2);
                      L10516
                    end else begin {L45452}
                      if VAR53460 = 1 then begin {L45466}
                        if (VAR53410 and 1) <> 0 then begin
                          L10544;
                          L10562('.EVEN\');
                          L10516;
                        end else begin {L45544}
                          L10544;
                          L10562('.ODD\ ');
                          L10516;
                        end;
                      end else begin {L45604}
                        L10544;
                        L10562('.BLKB ');
                        L10544;
                        L11032(VAR53460);
                        L10516;
                      end;
                    end;
                  end;
                  VAR53410 := VAR53410 + VAR53460; {L45654}
                end;
                RLDIR, RLDGR, RLDIDR, RLDGDR, RLDGAR, RLDGADR,
                RLDPDR, RLDPAR, RLDPADR, RLDCR: begin
                  L16656;
                  L10544;
                  if VAR2506.RE40 = 0 then begin
                    L10442(' '); {L45710}
                  end else begin
                    L10562('.BYTE\');
                    L10544;
                  end;
                  VAR52356 := [VS1];
                  L22640;
                  L10516;
                  VAR53410 := 2 - VAR2506.RE40 + VAR53410;
		end;
		RLDLIM: begin
                  L16656;
                  L10544; {L46040}
                  L10562('.LIMIT');
                  L10516;
                  L10104(VAR52366);
                  VAR53410 := 4 + VAR53410;
                end;
                {RLDLIM, RLDPR, RLD13: L46122}
              end;
            end;
            ENDMOD: begin {L46170}
              if VAR2676 = 2 then begin
                WRITE('?DEC-I-LABELS USED : '); {L46204}
                WRITELN(VAR52346:4);
                if L13314(STRABS, 0) then ;
                VAR52350 := VAR52352; {L46302}
                VAR53456 := 0;
                repeat
                  if VAR53456 = 6 then begin
                    WRITELN;
                    VAR53456 := 0;
                  end;
                  with VAR7204[VAR52350] do
                    if not (VS11 in RD10) then begin {L46440}
                      L37004(VAR3712[RD04].RB00, RD06);
                      L16656;
                    end;
                  L14576(VAR52350); {L46550}
                until VAR52350 = 0;
                if VAR53456 <> 0 then
                  WRITELN; {L46604}
                WRITE('?DEC-I-MRKED INSTR : '); {L46610}
                WRITELN(VAR53426:4);
                WRITE('?DEC-I-MKD NO INST : ');
                WRITELN(VAR53430:4);
              end;
              L10516; {L46704}
              L10544;
              L10562('.END\ ');
              L10544;
              if (VAR53446 <> STRABS) or (VAR53454 <> 1) then begin
                VAR52356 := [VS4]; {L47034}
                L15350(VAR53446, VAR53454);
              end;
              L10516; {L47112}
            end;
          end;
        end;
      end until VAR2506.RE00 = ENDMOD; {TODO L47142}
      L02276(VAR2700); {L47156}
      L02276(VAR52366);
    end;
    {TODO}

  end until false;
END.
