function [ m, b ] = gerade( l, r )
	% slope
	m = (r(2) - l(2)) / (r(1) - l(1));	
	b = -m * l(1) + l(2);
%    fprintf('-------------------------------------------\n');

end % function

