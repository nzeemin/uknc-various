Set tt NoQuiet
Set Error Error
Macro Start,Dt,Monit,PPIO,IO
Macro Jmp,Jmin,Jext,Disk,Comp,Trap
Macro Floats,Tabl,Grafuk,Ide,Window
Macro Edit,UpExec,ErMsg,Font,Iddat
Macro Iddat2,Var,Tgraph,Memory,Help
R Link
Basic=//
Dt,Monit,Tabl,Io,PpIo
Trap,Comp,Jmin,Jmp,Jext
Disk,Grafuk,Floats
//
Ide=//
Dt
Ide,Memory
UpExec,Edit,ErMsg
Window,Help,IdDat
IdDat2,Font,Var
TGraph
//

xLINK
Set tt Quiet
                                                                                                  