function [ x_k, iterMade ] = GaussNewton( x_k, F, JacobianF, fehlerToleranz, maxIter )
%      for k = 0: ... 
%  (1)     ||J_F(x^(k)) \deltax^(k) + F(x^(k))||_2^2 \rightarrow min
%  (2)     setze x^(k+1) = x^(k) + \delta x^(k)
%      end

iterMade = 0;
while iterMade < maxIter && fehlerToleranz <= norm(JacobianF(x_k)' * F(x_k))
    iterMade = iterMade + 1;

    dx = glsSolver(JacobianF(x_k), (-F(x_k)));
    x_k = x_k + dx;
end
