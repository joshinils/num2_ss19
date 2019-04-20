
logb = @(x, base) log(x)/log(base);


limit_end = 2^20;

x = logspace(0,log10(limit_end), 1e3);
y_10 = logb(x, 10)*100/log10(limit_end);
y_11 = logb(x, 10^(3/50));

plot(x, y_10);
hold on;
plot(x, y_11);


