% Определение диапазона координат
x_range = linspace(-5, 5, 100);
y_range = linspace(-5, 5, 100);

% Создание сетки точек
[x, y] = meshgrid(x_range, y_range);

% Вычисление модуля отображения
z_real = (-2*sin(x).^2.*sinh(y).^2.*sqrt(cos(x).^2.*sinh(y).^2+sin(x).^2.*cosh(y).^2)+2*cos(x).^2.*cosh(y).^2.*sqrt(cos(x).^2.*sinh(y).^2+sin(x).^2.*cosh(y).^2)+4*cos(x).*cosh(y).*sqrt(cos(x).^2.*sinh(y).^2+sin(x).^2.*cosh(y).^2)+2*sqrt(cos(x).^2.*sinh(y).^2+sin(x).^2.*cosh(y).^2))./((-2*cos(x).*sin(x).*cosh(y).*sinh(y)-2*sin(x).*sinh(y)).^2+sin(x).^4.*sinh(y).^4-2*cos(x).^2.*sin(x).^2.*cosh(y).^2.*sinh(y).^2-4*cos(x).*sin(x).^2.*cosh(y).*sinh(y).^2-2*sin(x).^2.*sinh(y).^2+cos(x).^4.*cosh(y).^4+4*cos(x).^3.*cosh(y).^3+6*cos(x).^2.*cosh(y).^2+4*cos(x).*cosh(y)+1);

imaginary_part = (4*cos(x).*sin(x).*cosh(y).*sinh(y).*sqrt(cos(x).^2.*sinh(y).^2+sin(x)^2.*cosh(y).^2)+4*sin(x).*sinh(y).*sqrt(cos(x).^2.*sinh(y).^2+sin(x).^2.*cosh(y).^2))./((-2*cos(x).*sin(x).*cosh(y).*sinh(y)-2*sin(x).*sinh(y)).^2+sin(x).^4.*sinh(y).^4-2*cos(x).^2.*sin(x).^2.*cosh(y).^2.*sinh(y).^2-4*cos(x).*sin(x).^2.*cosh(y).*sinh(y).^2-2*sin(x).^2.*sinh(y).^2+cos(x).^4.*cosh(y).^4+4*cos(x).^3.*cosh(y).^3+6*cos(x).^2.*cosh(y).^2+4*cos(x)*cosh(y)+1);

% Вычисление значения функции n(x, y)
n_values = sqrt(real(z_real).^2 + imag(imaginary_part).^2);

% Построение карты цветов
figure;
colormap('jet'); 

% Выбор цветовой карты (можно изменить на другую)
scatter(x(:), y(:), 30, n_values(:), 'filled');
colorbar;

% Установка ограничений для цветовой шкалы
clim([0, 10]);

% Ограничение осей для лучшего отображения
axis([-5 5 -5 5]);

% Отображение сетки
grid on;
