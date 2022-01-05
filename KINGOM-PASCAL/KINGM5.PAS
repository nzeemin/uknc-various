{$E+}
{$S+}

procedure L62010(
	var MN:real; { Деньги }
	var GD:real; { Золото }
	var C:real; { Земля }
	var D:real; { Зерно }
	var E:real; { Рабочие }
	var F:real; { Солдаты }
	G:integer; H:integer; I:integer; J:integer; K:integer;
	L:integer; M:integer; N:integer; O:integer; P:integer;
	YR:integer; { Год }
	YN:integer); { Год правления }

var N1,N2,N3,N4,N5:integer;

procedure L61530(var X:real; var Y:integer; var Z:integer);
var T:real;
label 1;
begin
1:
	T := X + (-32000.0);
	if T > 0.0 then begin {L61572}
		F := MN + T * FLOAT(Y); {L61620}
		X := X - T;
		goto 1;
	end; {L61742}
	Z := TRUNC(X);
end;

procedure L57632; external;
procedure L57660(var A:integer; var B:integer; var C:real); external; { Разделяем на тысячи и остаток }

{ Вывод статистики }
begin {L62010}
	L61530(GD,G,N1);{TODO}
	L61530(C,H,N2);{TODO}
	L61530(D,I,N3);{TODO}
	L61530(E,J,N4);{TODO}
	L61530(F,K,N5);{TODO}
	L57632;
	WRITE(YR);
	WRITE(' god.                      ');
	WRITE(YN);
	WRITELN('   god prawleniq.');
	WRITE(' 
    w  w a { e m  g o s u d a r s t w e  n a  t e k u } i j  m o m e n t :
---------------------------------------------------------------------------
!  n a i m e n o w a n i e !  koli~estwo  !   stoimostx   !  kurs  birvi  !
---------------------------------------------------------------------------
!  z o l o t o   (  kg   ) !');
	WRITE(N1);
	WRITE(' ! ');
	WRITE(N4);
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
	L57660(N1,N2,MN);
	WRITE('w nastoq}ee wremq w kazne -');
	WRITE(N1);
	WRITE(' tysq~ ');
	WRITE(N2);
	WRITELN(' rublej.');
end;
