{$E+}
{$S+}
type FArray = array [1..12] of integer;

{ F[1..10] - псевдоним, F[11] - баллы, F[12] - год правления }
procedure L65754(var F:FArray);
var	T,U,V1,V2:integer;
	D: file of FArray;
	E: file of FArray;
	N:array[1..10] of char;
	F2:FArray;

procedure L64564;
begin
	if (F2[1] = -1) OR (F2[11] < F[11]) then begin {L64572}
		for U := 1 to 12 do begin {L64654}
			F2[U] := F[U];
		end;
		T := 1; {L65042}
	end;
	E^ := F2; {L65050}
	PUT(E);
	for U := 1 to 10 do begin {L65120}
		N[U] := CHR(F2[U]);
	end;
	WRITE(N); {L65300}
	WRITE(' :'); {L65322}
	WRITE(F2[11]);
	WRITE(' ballow za');
	WRITE(F2[12]);
	WRITELN(' let.');
end;

procedure L65504;
begin {L65504}
	if T = 1 then begin
		F2 := D^; {L65526}
		for U := 1 to 12 do begin {L65554}
			F[U] := F2[U]; {L65614}
		end;
		T := 0; {L65742}
	end;
end;

{ Работа с KIND.DAT }
label 1,2;
begin {L65754}
1:
	Reset(D,'KING','DAT',V1); {L65764}
	V2 := 0;
	Rewrite(E,'KING','DAT',V2); {L66046}
	if V1 = -1 then begin
		for U := 1 to 12 do begin
			F2[U] := -1;
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
	F2 := D^; {L66442}
	V1 := F2[1];
	WRITE(' rekord ustanowil ');
	L64564;
	if V1 = -1 then begin {L66520}
		for U := 1 to 12 do begin
			F2[U] := -1; {L66574}
		end;
		E^ := F2; {L66646}
		PUT(E);
		E^ := F2; {L66714}
		PUT(E);
		goto 2;
	end; {L66770}
	L65504;
	GET(D);
	F2 := D^; {L67020}
	V1 := F2[1];
	WRITE(' wtoroj rezulxtat ');
	L64564; {L67070}
	if V1 = -1 then begin {L67076}
		for U := 1 to 12 do begin {L67112}
			F2[U] := -1; {L67152}
		end;
		E^ := F2; {L67224}
		PUT(E); {L67250}
		goto 2;
	end; {L67300}
	L65504;
	PUT(D);
	F2 := D^; {L67330}
	WRITE(' tretij rezulxtat ');
	L64564;
2:
	Close(D);
	Close(E);
end;
