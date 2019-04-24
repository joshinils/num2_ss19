clear all;	
close all;
format rat;
format compact;

fprintf('--------------------------------------------------------------------\n');

base = 10
multiple = 11100

logb = @(x, b) log(x)/log(b);

x = logspace(0, 6, 1e5)';
y = logb(x, base)*multiple;

%% a*x^3 + b*x^2 + c*x :

A = [ones(length(x),1), x, x.*x, x.*x.*x];%, x.*x.*x.*x];
%A = [x, x.*x, x.*x.*x];%, x.*x.*x.*x];

vals = linAusQR(A, y)
abs(vals.^-1) < intmax

format short;
vals


%fun10 = @(x) vals(1) * x + vals(2) * x .* x + vals(3) * x .*x .*x; 
fun10 = @(x) vals(1) + vals(2) *x + vals(3) * x.*x + vals(4) * x.*x .*x;% + vals(5) * x.*x.*x.*x;


%% plot with error

x = logspace(0, 6, 1e3);


y = logb(x, base);
semilogx(x, y, 'g');
hold on;


y_fun10 = fun10(x)/multiple;
semilogx(x, y_fun10, 'b');

%figure;

error = abs(y - y_fun10);
plot(x, error, 'r');

format short;
max_errr = max(error)




