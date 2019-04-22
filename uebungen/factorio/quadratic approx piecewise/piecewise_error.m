function [ max_err_aus ] = piecewise_error( pieces )

    format longg;
%    base = 10;
    limit_end = 3e5;
%    base = 10^(3/50);
    base = (limit_end)^(1/100);

    logb = @(x) log(x)/log(base);%*100/log10(limit_end);

    x = floor(logspace(.7, log10(limit_end), 1e4)');
    y = logb(x);

%     y = (0:100)';
%     x = base.^y;
%     x = round(x);
%     x = removeDuplicate(x, x)
%     y = logb(x);

    pieceIndex = floor(linspace(0, length(x), pieces+1))';
    y_aus = -1e9*ones(length(x), 1); % preallocate
    for i = 1:pieces
        v = (pieceIndex(i)+1) : pieceIndex(i+1);
        y_aus(v', :) = pointOnQuadAusgleich(y(v), x(v));
    end

    max_err_aus = max(abs(y - y_aus));

end % function
