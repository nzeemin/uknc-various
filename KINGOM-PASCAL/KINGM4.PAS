{$E+}
{$S+}

procedure L57660(var A:integer; var B:integer; var C:real); external; { Разделяем на тысячи и остаток }

procedure L60060(K,B,C,D,E,F:real);
var T1,T2,T3,T4,T5,T6,T7:integer;
begin
{$C	NOP} {TODO}
	L57660(T1,T2,K);
	if B > 32000.0 then
		B := 32000.0;
	T3 := TRUNC(B);
	if C > 32000.0 then
		C := 32000.0;
	T4 := TRUNC(C);
	if D > 32000.0 then
		D := 32000.0;
	T5 := TRUNC(D);
	if E > 32000.0 then
		E := 32000.0;
	T6 := TRUNC(E);
	if F > 32000.0 then
		F := 32000.0;
	T7 := TRUNC(F);
	WRITE('
             k a p i t a l :');
	WRITE(T1);
	WRITE(' tys.');
	WRITE(T2);
	WRITE(' rub.
             ---------------------------------------------------------
             z o l o t o   (  kg  )');
	WRITE(T3);
	WRITE('
             z e m l q     (  ga  )');
	WRITE(T4);
	WRITE('
             z e r n o     ( tonn )');
	WRITE(T5);
	WRITE('
             r a b o ~ i e ( ~el. )');
	WRITE(T6);
	WRITE('
             g w a r d i q ( sol. )');
	WRITELN(T7);
end;
