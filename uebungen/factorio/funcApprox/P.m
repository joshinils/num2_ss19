function [ p ] = P( b, xk, x )
    b = b(1, :);
    n = length(b);
    p = b(1, n);
    for k = (n-1) : -1 : 1
        p = b(k) + p * (x - xk(k));
    end
end

