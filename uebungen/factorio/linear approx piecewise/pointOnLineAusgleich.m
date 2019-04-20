function [ y ] = pointOnLineAusgleich( y, x )    
    format rat;
    multiple = 4;
    res = [ones(length(x),1), x]\y;
    
%    res(1) = multiple * res(1);
    res(2) = multiple/res(2);
    
    nonRound = res;
    res = round(res);
    
%    y = res(1)*ones(length(x), 1)/multiple + (x / res(2)) * multiple;% + res(3) *x.*x;
    y = res(1)*ones(length(x), 1) + (x / res(2)) * multiple;% + res(3) *x.*x;

    fprintf('from %9.2f to %10.2f ', x(1), x(end));
    fprintf('plus %6.2f', nonRound(1));
    fprintf(' ; div by %10.2f    ', nonRound(2));

    fprintf('from %s to %s ', rats(x(1)), rats(x(end)));
    fprintf('plus %s', rats(res(1)));
    fprintf(' ; div by %s\n', rats(res(2)));
end % function;

