rng(0); %set seed

A = rand(3);
A = A*A';

[V,D] = eig(A);

randDaempfung = 100000;
v = V(:,1)
d = D(1,1)
x0 = V(:,1) + (rand(length(V),1) -.5)/randDaempfung;
mu = D(1) + (rand() -.5)/randDaempfung;
tol = 1e-10;
maxIt = 100;


[y, l] = invVectorIteration(A, x0, mu, tol, maxIt);

eY = y - repmat(V(:, 1), 1, size(y, 2))
eL = l - repmat(D(1, 1), 1, length(l))

y(:,end)
l(end)
