function [ x ] = linAusSVD( A, b )
    [U,S,V] = svd(A);
    
    tol = sqrt(numel(A))*eps * S(1,1);
    
    x = zeros(size(A,2),1);
    for i = 1:length(x)
        if S(i,i) < tol
            break;
        end
        x = x + (U(:,i)' * b / S(i,i)) * V(:,i);
    end
end

