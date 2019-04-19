close all;
clear all;

fprintf('----------------------------------------------------------------\n');

x = linspace(0, 1e6, 200)';
y_log10 = log10(x);

%% initialize
y_fac10 = zeros(length(x),1);
divisor = y_fac10;
rem = y_fac10;

%% evaluate

for i = 1:length(x)
%	[y_fac10(i, 1), divisor(i, 1), rem(i, 1)] = factorio_log(x(i));	
	[y_fac10(i, 1)] = factorio_log_ausgleich(x(i));	
end


%% plot divisor
figure;
hold on;

needed_divisor = x ./ y_log10;
plot(x, needed_divisor, 'g');

plot(x, divisor, 'ob');

divisor_error = abs(needed_divisor - divisor);
plot(x, divisor_error, ':r');


%% plot results
figure;
hold on;

plot(x, y_log10, 'g');
plot(x, y_fac10, 'ob');
%plot(x, x, '--b');
error = abs(y_log10 - y_fac10);
plot(x, error, ':r');
plot(x, rem, '+y');







