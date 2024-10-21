%% 
clear 
close all
k=2.5
tau=1.5
num=[k]
den=[tau 1]
FT=tf(num,den)%planta
%estable?
figure
pzmap(FT)
grid on
% Si es estable, cumple desempeño?, tss=2.3s
figure
step(FT)
grid on
% No cumple desempeño, tss=6s..
% Parte superior de la estructura de ctrl, c(s)=ganancia proporcional=1
c=16
ftlca=series(c,FT)
ftlc=feedback(ftlca,1)
% Verificar
figure
step(FT)
hold on
step(ftlc)
grid on
