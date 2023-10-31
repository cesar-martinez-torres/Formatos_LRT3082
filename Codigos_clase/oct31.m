clear
close all
%% Oscilaciones sostenidas
Kcr=10
num=[1]
den=[1 2 1]
G=tf(num,den)
%Glc=feedback(Kcr*G,1)
polos=pole(G)
T=3.7
L=0.3
Kp=0.3*(T/L)
Ki=0.5/L
Kd=1.7*L
Glc=feedback(Kp*G,1)
figure
step(G)
hold on
step(Glc)
grid on