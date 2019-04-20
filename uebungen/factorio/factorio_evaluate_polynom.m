function [ result ] = factorio_evaluate_polynom( vals, x )
	result = vals(1) ;
	x_single = x;
	for i=2:length(vals)
		result = result + vals(i) * x;
		x = x .* x_single;
	end
end % function

