function [ x ] = linAusQR( A, b )
	[Q, R1] = qr(A,0);
	c1 = Q' * b;
	x = c1\R1;
end % function

