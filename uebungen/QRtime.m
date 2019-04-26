n = 5e2;
A = rand(n,n);

%QRzerleg(A); %moooooep
[Q,R] = QRzerleg2(A);
[q,r] = qr(A);

qErr = max(max(abs(Q-q)))
rErr = max(max(abs(R-r)))
aErr = max(max(abs(A - Q*R)))
