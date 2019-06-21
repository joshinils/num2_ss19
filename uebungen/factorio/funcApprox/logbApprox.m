clear all;
close all;
format compact;
format shortg;

% intervall in which to approximate
limit_start = 1;
limit_end = 3e5;
base = (limit_end)^(1/100); % of the log, meaning logb(limit_end) := 100 
logb = @(x) log(x)/log(base);

n = 10; % amount of nodes

% tschebyschow nodes:
k = linspace(1, n, n)';
tk = cos( (2*k -1)/(2*n)*pi )
% according to: https://en.wikipedia.org/wiki/Chebyshev_nodes#Definition
x_i = sort(  (limit_start + limit_end)/2 + (limit_end -limit_start)/2 * cos( (2*k -1)/(2*n)*pi )  )
x_i(1)=22.8643526713838;
f_i = logb(x_i);

%% berechne koeffizienten

%x_i = [1,2,3,4];
%f_i = [1,2,7,9];

f = zeros(length(f_i));
f(:,1) = f_i;
for s = 2:length(f_i)
    for z = 1:(length(f_i)-s+1)
%        fprintf('\nz%d, s%d ', z, s);
        f(z,s) = (f(z+1,s-1) - f(z,s-1) ) / ( x_i(z+s-1) - x_i(z) );
%        x_i(z)
%        x_i(z+s-1)
%        x_i(z+s-1) - x_i(z)
    end
%    fprintf('\n');
end

%% Plot P and points

subplot(2,1,1);
semilogx(x_i, f_i, 'ob', 'DisplayName', 'Tschebyschew Knoten');
hold on;
xP = logspace(log10(1),log10(limit_end), 1e4);
yP = zeros(length(xP),1);
for fehlerIndex=1:length(xP)
    yP(fehlerIndex) = P(f, x_i, xP(fehlerIndex));
end
plot(xP, yP, 'b-', 'DisplayName', 'P(f)(x)');
hold on;
%f_interp = interp1(x_i, f_i, xP)';
%plot(xP, f_interp, '.r-');

%%original function
funcX = logspace(log10(min(xP)), log10(max(xP)), length(xP));
funcY = logb(funcX)';
plot(funcX, funcY, 'g-', 'DisplayName', 'f(x) = logb');

legend('Location','SouthEast');
xlabel('x');
ylabel('y');

title('funktion und approximation');

%% plot error

subplot(2,1,2);
err = abs(funcY - yP);
plot(xP, err, '.r-');
xlabel('x');
ylabel('fehler');
legend('|f-P(f)| = error');
title('fehler');

[max_fehler, fehlerIndex] = max(err)
worstApproxX = xP(fehlerIndex)









