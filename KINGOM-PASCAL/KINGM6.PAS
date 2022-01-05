{$E+}
{$S+}
type FArray = array [1..12] of integer;

{ F[1..10] - псевдоним, F[11] - баллы, F[12] - год правления }
procedure L65754(var F:FArray);
var	T,U,V1,V2:integer;
	D: file of FArray;
	E: file of FArray;
	O,P,Q,R,S:integer;
	F2:FArray;

procedure L64564;
begin
	if (F2[1] = -1) OR (F2[2] < F2[3]) then begin{TODO}
		for V2 := 1 to 12 do begin {L64654}
			F2[V2] := F2[V2];
		end;
		T := 1; {L65042}
	end;
	E^ := F2; {L65050}
	PUT(E);{TODO}
	for V2 := 1 to 10 do begin
		F2[V2] := F[V2];
	end;
	{WRITE(NM);}
{$C	.BLKW	10} {TODO} {L65300}
	WRITE(' :'); {L65322}
	WRITE(F2[11]);
	WRITE(' ballow za');
	WRITE(F2[12]);
	WRITELN(' let.');
end;

procedure L65504;
begin {L65504}
	if T = 1{TODO} then begin
		F2 := F;
		for V1 := 1 to 12 do begin
			F[V1] := F2[V1]; {L65614}
		end;
		T := 0;
	end;
end;

{ Работа с KIND.DAT }
label 1;
begin {L65754}
1:
	Reset(D,'KING','DAT',O);
	V2 := 0;
	Rewrite(E,'KING','DAT',P);
	if V1 = -1 then begin
		for U := 1 to 12 do begin
			F2[U] := -1;{TODO}
		end;
		for U := 1 to 3 do begin
			E^ := F2; {L66312}
			PUT(E);
		end;
		Close(E);
		goto 1;
	end;
	T := 0;
	WRITELN('
 w rezulxtate analiza rezulxtatow, dostignutyh prawitelqmi   | j f o r i i
 -------------------------------------------------------------------------');
	F2 := F; {L66442}
	V1 := F2[1];
	WRITE(' rekord ustanowil ');
	L64564;
	if V1 = -1 then begin {L66520}
		for U := 1 to 12 do begin
			F2[U] := -1; {L66574}
		end;
		E^ := F2; {L66646}
		PUT(E);{TODO}
		E^ := F2; {L66714}
		PUT(E);{TODO}
{$C	.BLKW	1} {TODO}
	end else begin {L66770}
		L65504;
		GET(D);{TODO}
		F2 := D^; {L67020}
		V1 := F2[1];
		WRITE(' wtoroj rezulxtat ');
		L64564;
		if V1 = -1 then begin {L67076}
			for V2 := 1 to 12 do begin {L67112}
				F2[V2] := -1; {L67152}
			end;
			F2 := F; {L67224}
			PUT(D);{TODO}
		end else begin {L67300}
{$C	.BLKW	1} {TODO}
			L65504;
			PUT(D);{TODO}
			F2 := F; {L67330}
			WRITE(' tretij rezulxtat ');
			L64564;
		end;
{$C	.BLKW	1} {TODO}
	end;
{$C	.BLKW	1} {TODO}
	Close(D);
	Close(E);
end;
