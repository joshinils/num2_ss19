clear all;
close all;
format compact;
format longg;

% kreisparameter
rr = 4;
mx= 100;
my= 10;

th = (0:pi/500:2*pi / 4)';
r = ((rand(length(th),1)-.5)/8 + ones(length(th),1)) * rr;
xunit = r .* cos(th) + mx;
yunit = r .* sin(th) + my;

t = [xunit, yunit];

plot([t(:,1);t(1,1)], [t(:,2);t(1,2)], 'r.');
axis equal

F = @(x) F1(t, x);
JF = @(x) JF1(t, x);

% startvektor
x = [mx, my, rr]';

[x, iters] = GaussNewton( x, F, JF, 1e-10, 1e4 )

circle(x(3), x(1), x(2) );
hold on;
plot(x(1), x(2), 'ro');
plot(mx, my, 'b.');
