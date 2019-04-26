n = 5e2;
A = rand(n,n);

%QRzerleg(A); %moooooep
[Q,R] = QRzerleg2(A);
[q,r] = qr(A);

max(max(abs(Q-q)))
