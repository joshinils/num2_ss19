function [y, l] = invVectorIteration(A, x0, mu, tol, maxIt)
    x(:, 1) = x0;
    y(:, 1) = x(:, 1) / norm(x(1));
%    y(:, 2) = x(:, 1) / norm(x(1));
    
    E = eye(size(A));
    for k = 1 : maxIt
%        y(:, (k+1))
        x(:, k+1) = (y(:, k)\(A - E*mu))';
%        f = 1/( y(:, k)' * x(:, k+1) ) + mu
        l(k+1) = 1/( y(:, k)' * x(:, k+1) ) + mu;
        y(:, k+1) = x(:, k+1) / norm(x(:, k+1));
        y(:, k+1) = y(:, k+1) / norm(y(:, k+1)); %hmm
        if norm( A * y(:, k)  -  l(k) * y(:, k) ) < tol
            break;
        end
    end

end % function

