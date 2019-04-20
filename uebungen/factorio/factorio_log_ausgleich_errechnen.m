clear all;	
close all;
format rat;
format compact;

fprintf('--------------------------------------------------------------------\n');

base = 10
%multiple = 1e7

logb = @(x, b) log(x)/log(b)*100/6;

x = logspace(0, log10(1e6), 1e5)';
y = logb(x, base);

%% a*x^3 + b*x^2 + c*x :

order = 6;
A = zeros(length(x), order);
A(:,1) = ones(length(x),1);
A(:,2) = x;

for i= 3:order
	A(:,i) = x.* A(:,i-1);
end
%A = [ones(length(x),1), x, x.*x, x.*x.*x, x.*x.*x.*x, x.*x.*x.*x.*x];
%A = [x, x.*x, x.*x.*x];%, x.*x.*x.*x];

vals = linAusQR(A, y)
abs(vals.^-1) < intmax

format short;
vals
%% with multiple 1e7
% 22037934       
%    26274/83    
%      -27/37180 
%        1/2129358105
min(abs(vals))


%fun10 = @(x) vals(1) * x + vals(2) * x .* x + vals(3) * x .*x .*x; 
%fun10 = @(x) vals(1) + vals(2) *x + vals(3) * x.*x + vals(4) * x.*x .*x + vals(5) * x.*x.*x.*x + vals(6) * x.*x.*x.*x .* x;

%% plot with error

x = logspace(0, 6, 1e3);


y = logb(x, base);
plot(x, y, 'g');
hold on;


y_fun10 = factorio_evaluate_polynom(vals, x);
semilogx(x, y_fun10, 'b');

%figure;

error = abs(y - y_fun10);
plot(x, error, 'r');

format short;
max_errr = max(error)




