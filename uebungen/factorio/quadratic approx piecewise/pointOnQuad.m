function [ y ] = pointOnQuad( a, x )    
    y = a(1)*ones(length(x), 1) + a(2) * x + a(3) * x.*x;
end % function;

