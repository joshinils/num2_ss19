clear all;
close all;

limit_end = 3e5;
base = (limit_end)^(1/100);
logb = @(x) log(x)/log(base);

x = floor(logspace(.7, log10(limit_end), 1e4)');
y = logb(x);

pieces = 6;
pieceIndex = floor(linspace(1, length(x), pieces+1))'

for i = 1:pieces
    p(i) = parabola(logb, x(pieceIndex(i:(i+1))));
end

plot(x, y, 'k');
hold on;

maxErr = 0;
for i = 1:length(p)
    x = linspace(p(i).domain(1), p(i).domain(2), 1e3)';
    y = p(i).getY(x);
    err = abs(y-logb(x));
    maxErr = max(max(err), maxErr);
    plot(x, y, 'b');
    plot(x, err, 'r');
end
maxErr

plot([0,limit_end], [1,1], 'k:');







