%% Función de transferencia (Polos y zeros)
clear
close all
num= 1;
den = [2,3,4];
sys = tf(num,den)
polos=pole(sys)
%%
R=15 %Ohms
L= 0.3 %H
C=0.05 %F
num1=[1/C 0]
den1=[1 1/(R*C) 1/(L*C)]
sys1=tf(num1,den1)
polos1=pole(sys1)
%% Forma cero-polo-ganancia
zeros = 0;
poles = [1-1i 1+1i 2];
gain = -2;
sys2 = zpk(zeros,poles,gain)
%% Graficar polos y ceros
figure
pzmap(sys)
hold on
pzmap(sys1)
pzmap(sys2)
grid on



