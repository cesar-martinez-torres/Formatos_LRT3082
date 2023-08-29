%%funcion de transferencia MRA
m=5;
k=2.1;
b=0.2;
num=[1];
den=[m,b,k]
F=tf(num,den)
% Respuesta escalón
step(F)