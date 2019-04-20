function [ y ] = pointOnLine( l, r, x )
	[m, b] = gerade(l, r);
	y = m*x + b * ones(length(x), 1);
end % function;

