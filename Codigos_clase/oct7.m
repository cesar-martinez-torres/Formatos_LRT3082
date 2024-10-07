% Script para descomponer en fracciones parciales paso a paso
% Definir los polinomios del numerador y denominador
numerador = [5, 3];      % Coeficientes de 5x + 3
denominador = [1, 1, -2]; % Coeficientes de (x - 1)(x + 2)

% Paso 1: Mostramos la fracción original
fprintf('Fracción original: \n');
disp(poly2sym(numerador) / poly2sym(denominador));

% Paso 2: Factorizar el denominador (usando symbolic toolbox)
fprintf('\nPaso 2: Factorizar el denominador\n');
syms x;
den_sym = poly2sym(denominador, x); % Convertir el denominador a simbólico
factores = factor(den_sym);         % Factorizar simbólicamente
disp(factores);

% Paso 3: Descomposición en fracciones parciales utilizando residue
fprintf('\nPaso 3: Descomposición en fracciones parciales\n');

% Residue devuelve los coeficientes de las fracciones parciales
% r: residuos (los numeradores de las fracciones parciales)
% p: raíces del denominador (factores lineales)
% k: coeficientes del cociente si existe un término polinómico
[r, p, k] = residue(numerador, denominador);

% Paso 4: Construcción de las fracciones parciales
fprintf('\nPaso 4: Fracciones parciales obtenidas\n');
fraccion_parcial = 0; % Variable para almacenar la suma de fracciones parciales

for i = 1:length(r)
    fprintf('Fracción parcial: %f / (x - (%f))\n', r(i), -p(i));
    fraccion_parcial = fraccion_parcial + r(i) / (x - p(i));
end

% Mostrar las fracciones parciales
disp(fraccion_parcial);

% Paso 5: Verificación - suma de las fracciones parciales
fprintf('\nPaso 5: Verificar la suma de las fracciones parciales\n');
fraccion_suma = simplify(fraccion_parcial);
disp(fraccion_suma);

fprintf('\nFracción original expresada como suma de fracciones parciales:\n');
disp(fraccion_suma);

% Paso 6: Comparar la fracción parcial con la original
fprintf('\nComparación entre la fracción original y la suma de fracciones parciales:\n');
original = poly2sym(numerador) / poly2sym(denominador);
if simplify(original - fraccion_suma) == 0
    fprintf('¡La descomposición es correcta!\n');
else
    fprintf('Error en la descomposición.\n');
end
