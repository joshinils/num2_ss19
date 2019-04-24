function [Q, R] = QRzerleg(A)
    y = A(:, 1);
    v = y + sign(y(1)) * norm(y) * eye(length(y), 1);
    Q = eye(length(v)) - 2 * (v*v') / (norm(v)^2);
    R = Q*A
    if size(A, 1) > 1
        [Qn, Rn] = QRzerleg(R(2:end, 2:end))
        Qn = [1,                    zeros(1, length(Qn));
              zeros(length(Qn), 1),                   Qn  ];
        Q = Qn * Q;
    end
    R = Q*A;
end % function