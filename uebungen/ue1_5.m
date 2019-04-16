function [x] = ue1_5(A, y)
	x = (A'*A) ^-1 * A' * y;
end % function