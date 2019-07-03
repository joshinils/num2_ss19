function [Q, R] = QRzerleg(A)
  %% QR Zerlegung mit Householderreflexionen
  
    R = zeros(size(A));
    Q = eye(size(A, 1), size(A, 1));
    
    for i = 1:(min(size(A)))
        v = A(:, 1);
        s = sign(v(1)); % sign(0) == 0
        if s == 0
            s = 1;
        end
        v(1) = v(1) + s * norm(v);
        Q(:,i:end) = (Q(:, i:end)' - 2*v/(v'*v) *(v'*Q(:, i:end)') )' ; 
        A = A - 2*(v)/(v'*v)*(v'*A);
        
        % copy relevant bits of A into final R
        R(i,i:end) = A(1,:);
        
        % remove known bits from A
        A(1,:) = [];
        A(:,1) = [];
    end
end % function
