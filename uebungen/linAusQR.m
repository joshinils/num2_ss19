function [ x ] = linAusQR( A, b )
	[Q1, R1] = qr(A, 0);
	if abs(R1(end, end)) < 1e-10
		error('R1 is too close to singular');
	end
	c1 = Q1' * b;
	x = R1\c1; % oder rückwärts substitution, hab ich aber grad nich parat
end % function

