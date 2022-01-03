{$E+}
{$S+}

var	VAR102:integer;
	VAR104:integer;

procedure L62010(
	var A:real; { Деньги }
	var B:real; { Золото }
	var C:real; { Земля }
	var D:real; { Рабочие }
	var E:real; { Солдаты }
	var F:real;
	G:integer; H:integer; I:integer; J:integer; K:integer;
	L:integer; M:integer; N:integer; O:integer; P:integer;
	Q:integer; R:integer);

var N1,N2,N3,N4,N5,N6:integer;

procedure L61530(var A:real; B:integer; var C:integer);
var T:real;
label 1;
begin
1:
	T := A + (-32000.0);
	if T > 0.0 then begin {L61572}
		F := F + T * FLOAT(B);{TODO}
		A := A - T;
		goto 1;
	end; {L61742}
	C := TRUNC(A);
end;

procedure L57632; external;
procedure L57660(var A:integer; var B:integer; var C:real); external; { Разделяем на тысячи и остаток }

{ Вывод статистики }
begin {L62010}
	L61530(B,G,N1);{TODO}
	L61530(C,H,N2);{TODO}
	L61530(D,I,N3);{TODO}
	L61530(E,J,N4);{TODO}
	L61530(F,K,N5);{TODO}
	L57632;
	WRITE(Q);{TODO}
	WRITE(' god.                      ');
	WRITE(R);{TODO}
	WRITELN('   god prawleniq.');
	WRITE(' 
    w  w a { e m  g o s u d a r s t w e  n a  t e k u } i j  m o m e n t :
---------------------------------------------------------------------------
!  n a i m e n o w a n i e !  koli~estwo  !   stoimostx   !  kurs  birvi  !
---------------------------------------------------------------------------
!  z o l o t o   (  kg   ) !');
	WRITE(N1);
	WRITE(' ! ');
	WRITE(G);
	WRITE(' ! ');
	WRITE(L);
	WRITE(' !
!  z e m l q     (  ga   ) !');
	WRITE(N2);
	WRITE(' ! ');
	WRITE(H);
	WRITE(' ! ');
	WRITE(M);
	WRITE(' !
!  z e r n o     ( tonn  ) !');
	WRITE(N3);
	WRITE(' ! ');
	WRITE(J);
	WRITE(' ! ');
	WRITE(N);
	WRITE(' !
!  r a b o ~ i e ( ~elow ) !');
	WRITE(N4);
	WRITE(' ! ');
	WRITE(K);
	WRITE(' ! ');
	WRITE(O);
	WRITE(' !
!  g w a r d i q ( soldat) !');
	WRITE(N5);
	WRITE(' ! ');
	WRITE(L);
	WRITE(' ! ');
	WRITE(P);
	WRITELN(' !
---------------------------------------------------------------------------');
	WRITELN(CHR(32));
	L57660(N1,N2,A);
	WRITE('w nastoq}ee wremq w kazne -');
	WRITE(N1);
	WRITE(' tysq~ ');
	WRITE(N2);
	WRITELN(' rublej.');
{$C	.BLKW	10} {TODO}
end;

procedure L64564;
var N2,N5,V102,V104:integer;
begin
	if N5 = -1 {OR ??} then begin
		for N2 := 1 to 12 do begin
			{TODO}
{$C	.BLKW	20} {TODO}
		end;
	end;
{$C	.BLKW	18} {TODO}
	{TODO}
	for N2 := 1 to 10 do begin
		{TODO}
{$C	.BLKW	97} {TODO}
	end;
	WRITE(' :'); {L65322}
	WRITE(V102);
	WRITE(' ballow za');
	WRITE(V104);
	WRITELN(' let.');
end;
