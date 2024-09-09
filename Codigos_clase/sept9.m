clear all
clc
G=tf([1],[1 4 3])
H=tf([1],[1 2])
FT=series(G,H)
FT1=feedback(G,H)
FT2=feedback(G,1)
%% Funciones de transferencia simbolicas
syms s K
R(s) = (2*s^2 + 5*s + 1) / (s^3 + 7*s^2 +2*s + 7)  
C(s)=K
