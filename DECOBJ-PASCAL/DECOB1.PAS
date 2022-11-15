{$E+}
{$S+}

type
  CHSTATE = (CHST00, CHST01, CHST02);

  RECF = record
    RF00: boolean; {ERROR}
    RF02: integer; {CODE OF ERROR}
    RF04: integer; {CHANNEL}
    RF06: integer; {BLOCK}
    RF10: array [1..512] of char; {BUFFER}
    RF1010: integer; {POINTER TO RF10}
  END;

var
  VAR00: array[0..15] of CHSTATE;

procedure L01000;
var  DEVSPC: array[0..38] of integer;
  DEFEXT: array[1..4] of integer;
  I: integer;
begin
  for I := 1 to 4 do begin
    DEFEXT[I] := 0;
  end;
  {$C
    MOV  SP, R2
    ADD  #DEVSPC, R2
    MOV  SP, R3
    ADD  #DEFEXT, R3
    MOV  #^ROBJ, @R3
    MOV  #^RMAC, 2(R3)
    .MCALL .RCTRLO
    .RCTRLO
    MOV  #^O1000, @#^O46
    MOV  SP, R1
    .MCALL .CSIGEN
  L01160:
    .CSIGEN  R2,R3,#0
    MOV  R1, SP
    BLO  L01160
  }
  for I := 0 to 15 do begin
    VAR00[I] := CHST00;
  end;
end;

procedure L01304(var RECIO: RECF; CHN: integer; CHS: CHSTATE);
begin
  if VAR00[CHN] <> CHST00 then begin
  end else begin
    with RECIO do begin
      RF04 := CHN;
      RF02 := 0;
      RF02 := 0;
      if CHS = CHST01 then begin
        RF06 := -1;
        RF1010 := 512;
      end else if CHS = CHST02 then begin
        RF06 := 0;
        RF1010 := 1;
      end;
    end;
    VAR00[CHN] := CHS;
  end;
end;

procedure L01522(var RECIO: RECF; var VAL: integer);
var AREA: array[0..5] of integer;
begin
  with RECIO do begin
    if VAR00[RF04] = CHST01 then begin
      if RF1010 = 512 then begin
        RF06 := RF06 + 1;
        RF02 := 0;
        RF00 := false;
        {$C
          MOV SP, R0
          ADD #AREA, R0
          MOV R3, R1
          ADD #RF10, R1
          .MCALL .READW
          .READW R0,RF04(R3),R1,#256,RF06(R3)
          BCC L01716
          MOVB @#52, R0
          MOV R0, RF02(R3)
          BNE L01716
          INC RF00(R3)
        L01716:
        }
        RF1010 := 0;
      end;
      RF1010 := RF1010 + 1;
      VAL := ORD(RF10[RF1010]);
      if VAL < 0 then
        VAL := VAL + 256;
    end;
  end;
end;

procedure L02020(var RECIO: RECF; VAL: char);
var AREA: array[0..5] of integer;
begin
  with RECIO do begin
    if VAR00[RF04] = CHST02 then begin
      RF10[RF1010] := VAL;
      RF1010 := RF1010 + 1;
      if RF1010 > 512 then begin
        RF02 := 0;
        RF00 := false;
        {$C
          MOV SP, R0
          ADD #AREA, R0
          MOV R3, R1
          ADD #RF10, R1
          .MCALL .WRITW
          .WRITW R0,RF04(R3),R1,#256,RF06(R3)
          BCC L02250
          MOVB @#52, R0
          MOV R0, RF02(R3)
          BNE L02250
          INC RF00(R3)
        L02250:
        }
        RF06 := RF06 + 1;
        RF1010 := 1;
      end;
    end;
  end;
end;

procedure L02276(var RECIO: RECF);
begin
  with RECIO do begin
    if VAR00[RF04] = CHST00 then begin
    end else begin
      if VAR00[RF04] = CHST02 then begin
        while RF1010 <> 1 do begin
          L02020(RECIO, CHR(0));
        end;
      end;
      VAR00[RF04] := CHST00;
    end;
  end;
end;
