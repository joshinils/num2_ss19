function [Q, R] = QRzerleg2(A)
    R = zeros(size(A));
    Q = eye(size(A,1),size(A,1));
    for i = 1:(size(A, 1)-1)
        v = A(:,1);
        v(1) = v(1) + sign(v(1)) * norm(v);
        Q(:,i:end) = Q(:,i:end) - (Q(:,i:end) * (2*(v)/(v'*v))) * v'; %hmm_v3
        A = A - 2*(v)/(v'*v)*(v'*A);
        
        % copy relevant bits of A into final R
        R(i,i:end) = A(1,:);
        
        % remove known bits from A
        A(1,:) = [];
        A(:,1) = [];
    end
    R(end, end) = A(end, end);
end % function