function [ value, divisor, remainder ] = factorio_log( v )
	
	div = 1;
	divisor = div;
	
	value = v;
	remainder = floor(v / divisor);
	
%	return;
	
	while remainder > 0
		remainder = floor(v / divisor);
		divisor = divisor + div;
	end
	divisor = divisor/6;
	value = floor(v / (divisor));

end % function

