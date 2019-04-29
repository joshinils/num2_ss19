clear all;
close all;
format compact;
format shortg;

profile clear;
profile on;

limit_end = 3e5;
base = (limit_end)^(1/100);
log_base = log(base);
logb = @(x) log(x)/log_base;

x = floor(logspace(0, log10(limit_end), 1e4)');
y = logb(x);

%endIndex = logspace(log10(2), log10(length(x)), 1e1)';
endIndex = linspace(1, length(x), 1e1)';

for i = 1:length(endIndex)
    p(i) = parabola(logb, [1, endIndex(i)]);
end

maxErr = 0;
for i = 1:length(p)
    x = linspace(p(i).domain(1), p(i).domain(2), 1e3)';
    y = p(i).getY(x);
    err{i} = abs(y-logb(x));
    maxErr(i) = max(err{i})
    dom = p(i).domain
    L(i) = p(i).domain(2);
    if maxErr(i) > 1.2
        break;
    end
end
%maxErr

profile off;


figure; hold on;
plot([min(maxErr), max(maxErr)], [1,1], 'k:');
plot(linspace(min(maxErr), max(maxErr), length(maxErr)), maxErr, 'r+');
plot(linspace(min(maxErr), max(maxErr), length(maxErr)), maxErr, 'r');

figure; hold on;
plot(L, maxErr, 'k+');
plot([L(1), L(end)], [1,1], 'k:');
plot(L, maxErr, 'k');

profile viewer;





