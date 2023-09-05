%% Control 5sep
clear all
close all
% Función de transferencia
num=[10]
den=[-8 1]
G=tf(num,den)%primer orden
num1=[1]
den1=[1 0 1]
G1=tf(num1,den1)%segundo orden
%% Polos
poG=pole(G)
poG1=pole(G1)
%% Grafica de polos y zeros
figure
pzmap(G)
grid on
figure
pzmap(G1)
grid on
%% respuesta a un escalon
figure
step(G)
figure
step(G1)
