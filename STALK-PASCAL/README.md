# STALK-PASCAL ��������������� �������� "��������" �� �������

����� ����� STALK1.PAS - ��� ��������������� �������� ����, ������� ���������� "�������" ��� "����" (���� ���� ���������
STALK.SAV, PIKNIK.SAV ��� ZONA.SAV) � ��������������� ��� ��������� PDP11-����������� ����� ? ����� ��� ��� � ����.
��� ���� � ����� ������� (Rogue-like), �������� �� �����������, �� ������� ������� ���������� "������ �� �������".

����, ��-��������, ������� � ����� 1980-�, ����� ���� ? ����������� ����������� �� ���������� - ������������� ��������� ������ ��������:
<code>*** (�)��������� ���� "����������"***</code>

������� ��� ����������� ��� ���� � ���� ����� �� MACRO-11 ? ��. [STALK.MAC](https://github.com/nzeemin/uknc-various/blob/master/STALK/STALK.MAC), ��������� ���������� ����-�-����.
����� ��� �� ���������� ������������ �������� �� �������.

������������ ���������� ���� ��� ������ ��������� - ���������� �����-�� ������, ����� ��� ��������� � ���-8. ������� ��� ����������� ��������� � ���������� �������� ������� ������ - ��. ��������� StalkPatcher.

������������������ ������ (��. !compilelink.bat):
 - ������������� RANDU.MAC -> RANDU.OBJ ? ��� ����� ���� ��������� �� ���������� �������� (FORLIB.OBJ), ������������ ��� ��������� ��������� �����.
 - ���������� ������� �� ��������� STALK1.PAS ������� ���� STALK1.MAC.
 - StalkPatcher ����������� STALK1.MAC � STALK1P.MAC, ��������� ��������� ����� � �������� � ������ �����������.
 - � ������ STALK1P.MAC ������������� BLK000.INC ? �������� �� ������� ���������� ����� ����, ���������� STALKP.MAC.
 - ���������� STALKP.MAC ����� MACRO.
 - ����������: <code>LINK/STACK:1000 STALKP,FRANDU,PASCAL</code>, ���������� ������� STALK1.SAV

������� ���������� ������ zx-pk.ru �� ������ � ��������� � �������� ��������������!