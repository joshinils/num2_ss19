function [ a ] = quadCoefficients( x, y )
	if length(x) ~= 3 || length(y) ~= 3
        error('quadCoefficients:: not the right dimensions');
	end
	
    a = [ones(length(x), 1), x, x.*x] \ y;
end % function;

