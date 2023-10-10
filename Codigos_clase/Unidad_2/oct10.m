close all
G=tf([1],[5 1])
polo=pole(G)
figure
step(G)
grid on
syms tau s 
eqn=tau*s+1==0
solve(eqn,s)
%%
figure
rlocus(G)
grid on
pause()%%
close all
G=tf([1],[1 5 2])
polo=pole(G)
figure
step(G)
grid on
syms tau s 
eqn=tau*s+1==0
solve(eqn,s)
%%
figure
rlocus(G)
grid on
GLC=feedback(G,5.75)