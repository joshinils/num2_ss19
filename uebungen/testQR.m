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

[Q, R] = QRzerleg(A)

Q*R

Q*A

Q' - Q

for i = 1:length(Q)
    norm(Q(i,:))
end

Q * A - R


