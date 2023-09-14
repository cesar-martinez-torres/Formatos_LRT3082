%% Ft motor DC
J=0.01
B=0.1
Ke=0.01
Kt=0.01
R=1
L=0.5
G=tf([1],[L R])
H=tf([1],[J B])
Far=G*Kt*H
F=feedback(Far,Ke)
pole(F)
step(F)