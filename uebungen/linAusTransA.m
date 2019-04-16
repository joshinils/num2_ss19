function [x] = linAusTransA(A, y)
	x = (A'*A) ^-1 * A' * y;
end % function