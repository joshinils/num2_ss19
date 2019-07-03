function x = backwardSub(R,b)
% 
% x = backwardSub(R,b)
% Input:
% R: upper triangular squared matrix
% b: column vector
% Output:
% x: x = R*b

    %% Error handling

    [m1, n1] = size(R);
    [v,~] = size(b);
    if m1 > n1
        R = R(1:n1, :);
        [m1, n1] = size(R);
    elseif m1 < n1
        error('i aint doing that \n');
    elseif v ~= n1
        error('Dimensional Error. Your Matrix is an [%d x %d] and your vector a [%d x 1].\n',m1, n1, v) ;
    end

    %% function


    x = zeros(n1, 1);
    if abs(R(n1, n1)) > eps
        x(n1) = b(n1)/R(n1, n1);
    else
        error('i aint doing that \n');
    end
    
    
    for j = m1-1:-1:1
        if abs(R(j,j)) > eps
            x(j) = (b(j) - (R(j, (j+1):end) * x((j+1):end) ) ) / R(j,j); %./, da beide terme als einzelne Zahlen gesehen werden sollen
        else
            fprintf('Arithmetic operation not possible, matrix element is too small! = %e\n', R(j,j));
        end
    end
end %function
