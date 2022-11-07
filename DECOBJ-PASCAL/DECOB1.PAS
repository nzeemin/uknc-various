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

procedure L01000;
var	SP000: array[0..38] of integer;
	SP114: array[1..4] of integer;
	SP126: integer;
begin
	for SP126 := 1 to 4 do begin
		SP114[SP126] := 0;
	end;
	{$C
		MOV	SP, R2
		ADD	#0, R2
		MOV	SP, R3
		ADD	#78, R3
		MOV	#057032, (R3)	;TODO
		MOV	#050553, 2(R3)	;TODO
		EMT	237		; .RCTRLO
		MOV	#512, @#38
		MOV	SP, R1
	L01160:
		MOV	R2, -(SP)
		MOV	R3, -(SP)
		CLR	-(SP)
		EMT	228		; .CSIGEN
		MOV	R1, SP
		BLO	L01160
	}
	for SP126 := 0 to 15 do begin
		VAR00[SP126] := CHST0;
	end;
end;

procedure L01304(var SP06: RECF; var SP04: integer; SP02: CHSTATE);
begin
	if VAR00[SP04] <> CHST0 then begin
	end else begin
		with SP06 do begin
			RF04 := SP04;
			RF02 := 0;
			RF02 := 0;
			if SP02 = CHST1 then begin
				RF06 := -1;
				RF1010 := 1;
			end else if SP02 = CHST2 then begin
				RF06 := 0;
				RF1010 := 1;
			end;
		end;
		VAR00[SP04] := SP02;
	end;
end;

procedure L01522(var SP16: integer; SP20: PRECF);
var SP00: array[0..5] of integer;
begin
	with SP20^ do begin
		if VAR00[RF04] = CHST1 then begin
			if RF1010 = 512 then begin
				RF06 := RF06 + 1;
				RF02 := 0;
				RF00 := false;
				{$C
					MOV SP, R0
					ADD #0, R0
					MOV R3, R1
					ADD #8, R1
					MOV #2048, (R0)
					MOVB 4(R3), (R0)
					MOV 6(R3), 2(R0)
					MOV R1, 4(R0)
					MOV #256, 6(R0)
					CLR	8(R0)
					EMT 253
					BHIS L01716
					MOVB @#52, R0
					MOV	R0, 2(R3)
					BNE L01716
					INC	0(R3)
				L01716:
				}
				RF1010 := 0;
			end;
			RF1010 := RF1010 + 1;
			SP16 := ORD(RF10[RF1010]);
			if SP16 < 0 then
				SP16 := SP16 + 256;
		end;
	end;
end;

procedure L02020(var SP20: RECF; SP16: integer);
var SP00: array[0..5] of integer;
begin
	with SP20 do begin
		if VAR00[RF04] = CHST2 then begin
			RF10[RF1010] := CHR(16);
			RF1010 := RF1010 + 1;
			if RF1010 > 512 then begin
				RF02 := 0;
				RF00 := false;
				{$C
					MOV SP, R0
					ADD #0, R0
					MOV R3, R1
					ADD #8, R1
					MOV #2304, (R0)
					MOVB 4(R3), (R0)
					MOV 6(R3), 2(R0)
					MOV R1, 4(R0)
					MOV #256, 6(R0)
					CLR 8(R0)
					EMT 253
					BHIS L02250
					MOVB @#52, R0
					MOV R0, 2(R3)
					BNE L02250
					INC	0(R3)
				L02250:
				}
				RF06 := RF06 + 1;
				RF1010 := 1;
			end;
		end;
	end;
end;

procedure L02276(var SP02: RECF);
begin
	with SP02 do begin
		if VAR00[RF04] = CHST0 then begin
		end else begin
			if VAR00[RF04] = CHST2 then begin
				while RF1010 <> 1 do begin
					L02020(SP02, 0);
				end;
				VAR00[RF04] := CHST0;
			end;
		end;
	end;
end;
