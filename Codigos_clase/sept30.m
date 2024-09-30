%% Análisis de la Respuesta de un Sistema de Primer Orden
clear 
close all
% Un sistema de primer orden puede representarse como:
% H(s) = K / (τs + 1)
% Donde:
% K es la ganancia
% τ (tau) es la constante de tiempo
% s es la variable de Laplace

% Definimos una función de transferencia general de un sistema de primer orden

% Definir variables simbólicas
syms s K tau

% Función de transferencia de un sistema de primer orden
H_s = K / (tau * s + 1);

% Mostrar la función de transferencia
disp('La función de transferencia del sistema de primer orden es:');
pretty(H_s)

%% Paso 1: Estructura de Polo y Cero de un Sistema de Primer Orden

% Para analizar la estructura de polos y ceros, observamos los polos y ceros.
% En la función de transferencia H(s), el sistema tiene:
% - Un polo en s = -1/tau (si tau > 0, es un polo estable)
% - No tiene ceros (el numerador es una constante)
% Si no se encuentra en la forma antes mencionada, hay que "ordenarlo"

% Encontramos el polo del sistema
polo = solve(tau*s + 1 == 0, s);

disp('El polo del sistema de primer orden está ubicado en:');
disp(polo);

%% Paso 2: Forma Ganancia sobre Constante de Tiempo

% La función de transferencia también puede escribirse en la forma de ganancia sobre constante de tiempo:
% H(s) = K / (τs + 1)

% Observamos que:
% - K es la ganancia en estado estacionario del sistema.
% - τ (tau) es la constante de tiempo del sistema, que define la velocidad de respuesta.

disp('El sistema ya está en la forma ganancia sobre constante de tiempo:');
disp('H(s) = K / (τs + 1)');

%% Paso 3: Análisis de la Respuesta Escalon del Sistema

% Elegimos valores específicos para K y tau para realizar la simulación.
K_value = 1; % Ganancia
tau_value = .005; % Constante de tiempo (segundos)

% Definir la función de transferencia usando la función tf de MATLAB
sys = tf(K_value, [tau_value 1]);

% Mostrar la función de transferencia
disp('La función de transferencia del sistema con valores específicos de K y tau es:');
sys

%Gráfica de polos y ceros del sistema con valores específicos
figure;
pzmap(sys)
grid on

% Respuesta escalon
figure;
step(sys);
title('Respuesta Escalón del Sistema de Primer Orden');
xlabel('Tiempo (segundos)');
ylabel('Amplitud');
grid on;

%% Paso 4: Análisis en el Dominio del Tiempo

% Algunas propiedades clave en el dominio del tiempo para un sistema de primer orden incluyen:
% - Constante de tiempo τ: El tiempo que tarda el sistema en alcanzar el 63% de su valor final.
% - Valor en estado estacionario: El valor final de la respuesta escalón es igual a K.

% Calculamos y mostramos estas propiedades.
constante_de_tiempo = tau_value;
valor_estacionario = K_value;

disp(['La constante de tiempo (tau) es: ', num2str(constante_de_tiempo), ' segundos']);
disp(['El valor en estado estacionario es: ', num2str(valor_estacionario)]);

% Añadimos un marcador visual para la constante de tiempo en la gráfica de
% la respuesta escalón
hold on;
yline(valor_estacionario * 0.63, '--r', '63% del Valor Estacionario');
text(1 * constante_de_tiempo, valor_estacionario * 0.63, '\leftarrow Constante de Tiempo (\tau)', 'FontSize', 12);

%% Agregar los puntos 2τ, 3τ, 4τ y 5τ

% Calcular las respuestas en 2τ, 3τ, 4τ y 5τ
times = [1, 2, 3, 4, 5] * constante_de_tiempo;  % Tiempos 2τ, 3τ, 4τ, 5τ
responses = K_value * (1 - exp(-times / constante_de_tiempo));  % Respuesta en esos tiempos

% Marcar los puntos en la gráfica
plot(times, responses, 'bo', 'MarkerFaceColor', 'b');  % Puntos azules en los tiempos 2τ, 3τ, 4τ, 5τ

% Añadir líneas verticales y texto sobre la gráfica de la respuesta
for i = 1:length(times)
    xline(times(i), '--b');  % Líneas verticales en 2τ, 3τ, 4τ, 5τ
    text(times(i), responses(i) + 0.2, ['\tau = ', num2str(i), '\tau'], 'HorizontalAlignment', 'center'); % Etiquetas sobre la gráfica
end

%% Calcular y Mostrar el Tiempo de Subida (Rise Time)

% El tiempo de subida (Rise Time) es el tiempo que tarda la respuesta en ir del 10% al 90% del valor final.
rise_time = tau_value * log(9);  % Tiempo de subida aproximado para un sistema de primer orden
plot(rise_time, K_value * 0.9, 'rs', 'MarkerFaceColor', 'r');  % Marcar el tiempo de subida con un cuadrado rojo
xline(rise_time, '--r');  % Línea vertical para el tiempo de subida
text(rise_time, 0.1, ['Tiempo de Subida: ', num2str(rise_time, '%.2f'), ' s'], 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'center');  % Etiqueta cerca del eje x

%% Calcular y Mostrar el Tiempo de Establecimiento (Settling Time)

% El tiempo de establecimiento (Settling Time) es el tiempo que tarda la respuesta en mantenerse dentro del 2% del valor final.
settling_time = 4 * constante_de_tiempo;  % Tiempo de establecimiento aproximado (4τ)
plot(settling_time, K_value, 'gs', 'MarkerFaceColor', 'g');  % Marcar el tiempo de establecimiento con un cuadrado verde
xline(settling_time, '--g');  % Línea vertical para el tiempo de establecimiento
text(settling_time, 0.1, ['Tiempo de Establecimiento: ', num2str(settling_time, '%.2f'), ' s'], 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'center');  % Etiqueta cerca del eje x

hold off;
