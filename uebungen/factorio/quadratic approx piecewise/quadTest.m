clear all;
close all;
format shortg;
format compact;


limit_end = 3e5;
base = (limit_end)^(1/100);
logb = @(x) log(x)/log(base);


x = logspace(0, log10(limit_end), 1e6)';
y = logb(x);

plot(x, y, 'g');
hold on;

%    pieceIndex = floor(linspace(0, length(x), pieces+1))';
%    y_aus = -1e9*ones(length(x), 1); % preallocate
%    for i = 1:pieces
%        v = (pieceIndex(i)+1) : pieceIndex(i+1);
%        y_aus(v', :) = pointOnLineAusgleich(y(v), x(v));
%    end


nPieces = 7;
pieceIndex = floor(linspace(1, length(x), nPieces+1))';
weightFirst = 1.58484848484849;
maxErr = 0;
for i = 1:nPieces
    xn{i}(1,1) = x( pieceIndex(i) );
    xn{i}(3,1) = x( pieceIndex(i+1) );
    xn{i}(2,1) = (xn{i}(1)*weightFirst + xn{i}(3))/(weightFirst+1); % mitte mitteln, ka ob beste wahl
    yn{i}(:,1) = logb(xn{i});
    
    an{i}(:,1) = quadCoefficients(xn{i}, yn{i});
    x_quad{i} = x((pieceIndex(i)+1):pieceIndex(i+1));
    y_quad{i} = pointOnQuad(an{i}, x_quad{i});
    
    plot(x_quad{i}, y_quad{i}, 'b');
    plot(xn{i}, yn{i}, 'bo' )
    
    err{i} = abs(y((pieceIndex(i)+1):pieceIndex(i+1)) - y_quad{i});
    maxErr = max(maxErr, max(err{i}));
    plot(x_quad{i}, err{i}, 'r.');
%    format rat;
    an{i}
end
maxErr

return;
figure;
plot(x_quad{1}, y_quad{1}, 'b');
hold on;
plot(xn{1}, yn{1}, 'bo' );
plot(x_quad{1}, y(1:length(x_quad{1})),'g');
plot(x_quad{1}, err{1},'r');
plot([x_quad{1}(1), max(x_quad{1})],[1,1],'k:')
m = max(err{1})




