order = (1:5)';
errors = zeros(length(order), 2);

for i = 1:length(order)
	[e,n] = factorio_log_ausgleich_errechnen_maxErr(order(i));
	errors(i,1) = e;
	errors(i,2) = n;
end

plot(order, errors(:, 1), 'xb');
plot(order, errors(:, 2), '.r');

