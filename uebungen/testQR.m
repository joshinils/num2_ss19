clear all;
format compact;
format short;
fprintf('----------------------------------------\n');


A = [4, 1, -2,  2;
     1, 2,  0,  1;
    -2, 0,  3, -2;
     2, 1, -2, -1  ];

% y = A(:,1)
% s = sign(y(1))
% e = zeros(length(y) ,1);
% e(1) = 1;
% alpha = norm(y)
% v = y + sign(y(1)) * alpha * e
% 
% Q = eye(length(v)) - 2 * (v*v') / (norm(v)^2)
% 
% Q*A
% 
% Q*y

[Q, R, Qcellarray] = QRzerleg(A);

fprintf('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n');
Q
R

Q_mal_R = Q*R
QT_mal_R = Q'*R

Q_mal_A = Q*A
QT_mal_A = Q'*A

QT_minus_Q = Q' - Q
QT_mal_Q = Q' * Q

for i = 1:length(Q)
    n(i) = norm(Q(i,:));
end
normenDerSpalten = n

Q_mal_A_minusR = Q * A - R


nicht_symmetrischA = Qcellarray{2} * Qcellarray{1}
nicht_symmetrischB = Qcellarray{1} * Qcellarray{2}




















