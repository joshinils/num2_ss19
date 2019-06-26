function [ p ] = P( b, xk, x )
    n = size(b, 2);
    p = b(1, n);
    for k = (n-1) : -1 : 1
        p = b(1, k) + p * (x - xk(k));
    end
end

