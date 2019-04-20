clear all;
close all;
format compact;
format shortg;

fprintf('piecewise: go! ++++++++++++++++++++++++++++++++++++++++++++++++++++++++\n');

%base = 10^(3/50);
%limit_end = 1e6;
limit_end = 10000;
base = (limit_end)^(1/100);

logb = @(x) log(x)/log(base);%*100/log10(limit_end);

x = logspace(0, log10(limit_end), 1e3)';
y = logb(x);



% plot

x = logspace(0, log10(limit_end), 1e4)';
%x = linspace(1, limit_end, 5e1)';
y = logb(x);

% change this plot here for overall looks
plot(x, y, 'g');
hold on;

y_approx = zeros(length(x), 1);

pieces = 7;
pieceIndex = floor(linspace(1, length(x), pieces+1))';
pointsForI = [x,y]; pointsForI = pointsForI(pieceIndex, :);
pieceIndex = floor(linspace(0, length(x), pieces+1))';
for i = 1:pieces
	v = (pieceIndex(i)+1) : pieceIndex(i+1);
    y_lin(v', :) = pointOnLine(pointsForI(i,:), pointsForI(i+1,:), x(v));
    y_aus(v', :) = pointOnLineAusgleich(y(v), x(v));
end


plot(x, y_lin, 'b:');

plot(x, y_aus, 'b');

%figure;

error_lin = abs(y - y_lin);
plot(x, error_lin, 'r:');

error_aus = abs(y - y_aus);
plot(x, error_aus, 'r');

difference = abs(y_lin - y_aus);
plot(x, difference, 'y');

mixD = minmax(difference')

format short;
max_err_lin = max(error_lin)
max_err_aus = max(error_aus)
