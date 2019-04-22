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

% plot

x = logspace(0, log10(limit_end), 1e2)';
%x = linspace(1, limit_end, 5e1)';
y = logb(x);

[x,y]

% change this plot here for overall looks
plot(x, y, 'g');
hold on;

y_approx = zeros(length(x), 1);

pieces = 6;
pieceIndex = floor(linspace(1, length(x), pieces+1))';
pointsForI = [x,y]; pointsForI = pointsForI(pieceIndex, :);
pieceIndex = floor(linspace(0, length(x), pieces+1))';
for i = 1:pieces
	v = (pieceIndex(i)+1) : pieceIndex(i+1);
    y_aus(v', :) = pointOnQuadAusgleich(y(v), x(v));
end


plot(x, y_aus, 'b');

%figure;

error_aus = abs(y - y_aus);
plot(x, error_aus, 'r');


format short;
max_err_aus = max(error_aus)
