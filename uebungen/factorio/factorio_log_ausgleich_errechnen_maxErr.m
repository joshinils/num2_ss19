function [max_err, n] = factorio_log_ausgleich_errechnen_maxErr(order)
	order
	base = 10;
	%multiple = 1e7

	logb = @(x, b) log(x)/log(b)*100/6;

	x = logspace(0, log10(1e6), 1e3)';
	y = logb(x, base);
	
	%% fill A
	A = zeros(length(x), order);
	A(:,1) = ones(length(x),1);
	A(:,2) = x;

	for i= 3:order
		A(:,i) = x.* A(:,i-1);
	end

	vals = linAusQR(A, y);

	x = logspace(0, 6, 1e3);
	y = logb(x, base);
	y_fun10 = factorio_evaluate_polynom(vals, x);
	
	error = abs(y - y_fun10);
	max_err = max(error);
	n = norm(A);
end % function


