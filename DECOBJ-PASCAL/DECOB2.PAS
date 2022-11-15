{$E+}
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
    RA10: integer;  { index in VAR3712 }
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
  VAR00: array [0..15] of CHSTATE;
  VAR20: array [1..20] of RECA14;
  VAR400: integer;
  VAR402: RECG;
  VAR1414: RECG;
  VAR2426: boolean;
  GAP0: array [1..3] of integer;
  VAR2436: RECE50;
  VAR2506: RECE50;
  VAR2556: RECE50;
  VAR2626: RECE50;

procedure L01000; external;
procedure L01304(var RECIO: RECF; CHN: integer; CHS: CHSTATE); external;
procedure L01522(var RECIO: RECF; var VAL: integer); external;
procedure L02020(var RECIO: RECF; VAL: char); external;
procedure L02276(var RECIO: RECF); external;

procedure L03004(var RECIO: RECF; var RECBLK: RECG);
var I,J: integer;

function L02554: integer;
begin
  with RECBLK do begin
    L01522(RECIO, J);
    RG1004 := (RG1004 + J) MOD 256;
  end;
  L02554 := J;
end;

function L02714: integer;
begin
  L02714 := L02554 + L02554 * 256;
end;

begin {L03004}
  with RECBLK do begin
    repeat
      RG1004 := 0;
    until L02554 = 1;
    I := L02554;
    I := L02714;
    RG00 := I - 6;
    RG04[1] := L02714;
    {$C
      MOV 4(R3), 2(R3) } {RG02 := RG04[1];}
    for I := 1 to RG00 do begin
      RG04[I] := L02554;
    end;
    I := L02554;
    if RG1004 <> 0 then;
    RG1006 := 0;
    RG1010 := false;
  end;
end;

function L03350(var RECBLK: RECG): integer;
begin
  with RECBLK do begin
    RG1006 := RG1006 + 1;
    L03350 := RG04[RG1006];
    RG1010 := RG1006 >= RG00;
  end;
end;

function L03462(var RECBLK: RECG): integer;
begin
  L03462 := L03350(RECBLK) + L03350(RECBLK) * 256;
end;

function L03550(CH: char): integer;
begin
  if CH = ' ' then
    L03550:=0
  else
    if (('A' <= CH) and (CH <= 'Z')) then
      L03550 := ORD(CH) - ORD('A') + 1
    else
      if CH='$' then
        L03550 := 27
      else
        if CH='.' then
          L03550 := 28
        else
          if (('0' <= CH) and (CH <= '9')) then
            L03550 := ORD(CH) - ORD('0') + 30
          else
            L03550 := 29;
end;

function L04072(CH1, CH2, CH3: char): integer;
begin
  L04072 := (L03550(CH1) * 40 + L03550(CH2)) * 40 + L03550(CH3);
end;

function L04222(VAL: integer): char;
begin
  if VAL = 0 then
    L04222 := ' '
  else
    if ((1 <= VAL) and (VAL <= 26)) then
      L04222 := CHR(VAL - 1 + ORD('A'))
    else
      if VAL = 27 then
        L04222 := '$'
      else
        if VAL = 28 then
          L04222 := '.'
        else
          if ((30 <= VAL) and (VAL <= 39)) then
            L04222 := CHR(VAL - 30 + ORD('0'))
          else
            L04222 := '?';
end;

procedure L04544(R50NUM1,R50NUM2: integer; var R50STR: STR6);
var I: integer; J: UINT;
begin
  J := R50NUM1;
  for I := 3 downto 1 do begin
    R50STR[I] := L04222(J MOD 40);
    J:=J DIV 40;
  end;
  J := R50NUM2;
  for I := 6 downto 4 do begin
    R50STR[I] := L04222(J MOD 40);
    J := J DIV 40;
  end;
end;

function L05122(VAL: integer): integer;
begin
  L05122 := VAL MOD 256;
end;

function L05160(VAL: integer): integer;
begin
  L05160 := VAL DIV 256;
end;

procedure L05216(var RECBLK: RECG; var RECDATA: RECE50);
begin
  L04544(L03462(RECBLK), L03462(RECBLK), RECDATA.RE02);
end;

procedure L05306(var RECBLK: RECG; var RECDATA: RECE50);
var I,J: integer;
begin
  with RECBLK do
    with RECDATA do begin
      L05216(RECBLK, RECDATA);
      I := L03462(RECBLK);
      J := L05122(I);
      {$C
        MOV RECDATA(SP),R0
        MOVB J(SP),RE12(R0) }
      J := L05160(I);
      {$C
        MOV RECDATA(SP),R0
        MOVB J(SP),RE10(R0) }
      RE22 := L03462(RECBLK);
   end;
end;

procedure L05506(var RECBLK: RECG; var RECDATA: RECE50);
begin
  with RECBLK do
    with RECDATA do begin
      if RG1006 = 0 then begin
        RE24 := L03462(RECBLK);
        RE32 := RE24;
      end;
      RE30 := RE32;
      RE26 := RE30 MOD 2;
      if (RG1006 + 1) = RG00 then
        RE26 := 1;
      if RE26 = 0 then
        RE34 := L03462(RECBLK)
      else
        RE34 := L03350(RECBLK);
      RE32 := RE24 - 2 + RG1006;
    end;
end;

procedure L05740(var RECBLK: RECG; var RECDATA: RECE50);
var I,J: integer;
begin
  with RECBLK do
    with RECDATA do begin
      I := L03462(RECBLK);
      J := L05122(I) MOD 128;
      {$C
        MOV RECDATA(SP), R0
        MOVB J(SP), RE36(R0) }
      RE40 := L05122(I) DIV 128;
      RE42 := L05160(I) - 4 + RE24;
      RE02 := '******';
      if RE36 in [RLDGR,RLDGDR,RLDGAR,RLDGADR,RLDLCD,RLDPDR,RLDPAR,RLDPADR] then
        L05216(RECBLK,RECDATA);
      RE44 := 0;
      if RE36 in [RLDIR,RLDIDR,RLDGAR,RLDGADR,RLDLCD,RLDLCM,RLDPAR,RLDPADR] then
        RE44 := L03462(RECBLK);
      if RE36 = RLDCR then begin
        RE46 := VAR400;
      repeat
        VAR400 := VAR400 + 1;
        if VAR400 > 20 then
          VAR400 := 1;
        J := L03350(RECBLK);
        with VAR20[VAR400] do begin
          RA00 := J;
          if J = 14 then begin
            L05216(RECBLK, RECDATA);
            RA02 := RECDATA.RE02;
          end else
            if J = 15 then begin
              RA10 := L03350(RECBLK);
              RA12 := L03462(RECBLK);
            end else
              if J = 16 then
                RA12:=L03462(RECBLK);
        end;
      until ((J = 10) or (J = 11));
    end;
  end;
end;

procedure L06772(var RECIO: RECF);
begin
  with VAR402 do begin
    with VAR2436 do begin
      if VAR2426 and RG1010 then begin
        RE00 := RLD;
        VAR2426 := false;
      end else begin
        while RG1010 do begin
          VAR402 := VAR1414;
          if RG02 <> ENDMOD then
            L03004(RECIO, VAR1414);
        end;
        {$C
          MOVB 2(3), @%2 } {RE00 := RG02;}
        case RG02 of
          GSD: L05306(VAR402,VAR2436);
          ENDGSD: begin
            RG1010 := true;
            VAR2426 := false;
          end;
          TXT: begin
            L05506(VAR402,VAR2436);
            with VAR1414 do begin
              if (not VAR2426) and RG1010 then
                L03004(RECIO,VAR1414);
              if RG02 = RLD then begin
                if not VAR2426 then begin
                  L05740(VAR1414, VAR2436);
                  VAR2426 := true;
                end;
                if (RE36 in [RLDIR,RLDGR,RLDIDR,RLDGDR,RLDGAR,RLDGADR,RLDLIM,RLDPDR,RLDPAR,RLDPADR,RLDCR])  and VAR2426 then
                  if RE42 = RE30 then begin
                    if RE40 = 1 then
                      if RE26 = 0 then begin
                        VAR402.RG1006 := VAR402.RG1006 - 1;
                        VAR402.RG1010 := false;
                        VAR2436.RE32 := VAR2436.RE32 - 1;
                      end;
                    RE00 := RLD;
                    VAR2426 := false;
                  end else
                    if RE42 = (RE30 + 1) then
                      if RE26 = 0 then begin
                        RE26 := 1;
                        VAR402.RG1006 := VAR402.RG1006 - 1;
                        VAR402.RG1010 := false;
                        VAR2436.RE32 := VAR2436.RE32 - 1;
                      end;
              end;
            end;
          end;
          RLD:
            if VAR2426 then
              VAR2426 := false
            else
              L05740(VAR402,VAR2436);
          ENDMOD:
        end;
      end;
    end;
  end;
end;

procedure L10104(var RECIO: RECF);
begin
  L06772(RECIO);
  VAR2506.RE00 := VAR2556.RE00;
  VAR2506.RE02 := VAR2556.RE02;
  VAR2506.RE10 := VAR2556.RE10;
  VAR2506.RE12 := VAR2556.RE12;
  VAR2506.RE22 := VAR2556.RE22;
  VAR2506.RE24 := VAR2556.RE24;
  VAR2506.RE26 := VAR2556.RE26;
  VAR2506.RE30 := VAR2556.RE30;
  VAR2506.RE32 := VAR2556.RE32;
  VAR2506.RE34 := VAR2556.RE34;
  VAR2506.RE36 := VAR2556.RE36;
  VAR2506.RE40 := VAR2556.RE40;
  VAR2506.RE42 := VAR2556.RE42;
  VAR2506.RE44 := VAR2556.RE44;
  VAR2506.RE46 := VAR2556.RE46;
  VAR2556 := VAR2626;
  VAR2626 := VAR2436;
end;
