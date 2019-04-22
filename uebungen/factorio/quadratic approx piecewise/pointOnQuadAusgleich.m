function [ y ] = pointOnQuadAusgleich( y, x )    
    format rat;
    multiple = 1;
    res = [ones(length(x),1), x, x.*x]\y;
    
	nonRound = res;
%    res = round(res);
  
    y = res(1)*ones(length(x), 1) + res(2) * x + res(3) * x.*x;

    fprintf('from %9.2f to %10.2f : ', x(1), x(end));
    fprintf('%6.2f + ', nonRound(1));
    fprintf(' x * %10.2f + ', nonRound(2));
    fprintf(' x^2 * %10.2f   ', nonRound(3));

    fprintf('from %s to %s ', rats(x(1)), rats(x(end)));
    fprintf('%s + ', rats(res(1)));
    fprintf(' x * %s + ', rats(res(2)) );
    fprintf(' x^2 * %s\n', rats(res(3)) );
end % function;

