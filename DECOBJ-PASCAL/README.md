# DECOBJ-PASCAL Восстановленный исходник утилиты DECOBJ на Паскале

Здесь лежит набор из трёх PAS-файлов - это восстановленный исходник утилиты DECOBJ.

Утилита DECOBJ позволяет по объектному модулю (.OBJ) получить его исходный код на языке MACRO-11 - по сути, дизассемблировать модуль в ассемблерный код.

Автор утилиты неизвестен.

Утилита написана на Паскале ДВК (OMSI Pascal 1) и предназначалась для советских PDP11-совместимых машин - таких как ДВК и УКНЦ.

Восстановление исходника утилиты выполнено через дизассемблирования (см. [DECOBJ/DECOBJ.MAC](https://github.com/nzeemin/uknc-various/blob/master/DECOBJ/DECOBJ.MAC)) и затем ручное декодирование в исходник на Паскале. Эту работу выполнили Алексей Кислый (Alex_K) и Никита Зимин (nzeemin).


## Сборка из исходников

Сборка выполняется в среде RT-11.
Также это можно сделать под Windows, используя [RT-11 simulator](http://emulator.pdp-11.org.ru/RT-11/distr/) Дмитрия Патронова.

Последовательность сборки (см. <code>!compilelink.bat</code>) - команды вводимые в командной строке RT-11:
 - `RU PASCAL DECOB1,DECOB1=DECOB1.PAS`
 - `RU PASCAL DECOB2,DECOB2=DECOB2.PAS`
 - `RU PASCAL DECOBJ,DECOBJ=DECOBJ.PAS`
 - `MACRO/LIST:DK: DECOB1.MAC`
 - `MACRO/LIST:DK: DECOB2.MAC`
 - `MACRO/LIST:DK: DECOBJ.MAC`
 - `LINK DECOB1,DECOB2,DECOBJ,PASCAL /EXE:DECOBJ.SAV /MAP:DECOBJ.MAP`

Полученный SAV-файл имеет отличие от оригинала в одном байте:

`00000028: E6 E8` - это в заголовке различие в длине на одно слово из-за другой версии линковщика


## Ссылки
- [Обсуждение реверса на форуме](https://zx-pk.ru/threads/34762-dizasm-decobj.html)
