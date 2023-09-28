%% Ejercicio
Num=18;
Den=[1, 2.4, 9];
G=tf(Num,Den)
% Analice el sistema tipo, polos, cuanto vale wn, zeta y K y los parametros
% temporales
%Respuestas
%1.- Sistema de segundo orden
%2.- tiene dos polos y estan en
polos=pole(G)
%El sistema es estable, sus polos son complejos conjugados
% Valores de K, omega_n y zeta
syms omega_n K zeta
eqn=omega_n^2 ==9
omega_n=isolate(eqn,omega_n)
omega_n=3
eqn1=2*omega_n*zeta==2.4
zeta=2.4/6
% El valor de zeta esta entre o y 1, por lo tanto el sistema es
% subamortiguado.
eqn2=K*(omega_n^2)==18
K=18/9
% Respuesta escalon
t = 0:0.001:10;
figure
step(G,t);
grid on
% calculos
omega_d=(omega_n)*sqrt(1-zeta)
beta=atan((omega_d)/(zeta*omega_n))
tr=(pi-beta)/(omega_d)
tp=pi/omega_d
Mp=100*((2.51-2)/(2))
ts2=(4)/(zeta*omega_n)
ts5=(3)/(zeta*omega_n)
%% Usando stepinfo
y=step(G,t);
info = stepinfo(y, t);
%% Diseñe un sistema de segundo orden oscilatorio
K=5
omega_n=4
zeta=0
num=K*(omega_n^2)
den=[1 2*zeta*omega_n omega_n^2]
H=tf(num,den)
figure
step(H,t)
grid on
%% Diseñe un sistema sobre amortiguado con polos en -2 y -13
zeta=2.5
K=2
omega_n=4
%% 
syms s omega_n zeta K

% Ecuación simbólica de un sistema de segundo orden
H = K * (omega_n^2 / (s^2 + 2*zeta*omega_n*s + omega_n^2))
denom=(s^2 + 2*zeta*omega_n*s + omega_n^2)

% Calcular los polos de la ecuación simbólica
polos = solve(denom == 0, s)
zeta=2.5
K=2
polos=eval(polos)
eqn=polos(1)==-2
eqn1=polos(2)==-13
omega_n=isolate(eqn,omega_n)
%omega_n=isolate(eqn1,omega_n)
%%
K=2
omega_n=9.2
zeta=2.5
num=K*(omega_n^2)
den=[1 2*zeta*omega_n omega_n^2]
G2=tf(num,den)
polos1=pole(G2)