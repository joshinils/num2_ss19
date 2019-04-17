

f_alpha = @(t) cos(pi/4.*t);
f_beta  = @(t) sin(pi/3.*t);

t_anz = 1e3;
t = linspace(1, 30, t_anz)';
y = 42 * cos(pi/4.*t) + 5 * sin(pi/3.*t) + randn(length(t), 1)*50;

A = zeros(length(t), 2);
A(1:length(t), :) = [f_alpha(t), f_beta(t)];

% % test error
% A=[1,5;1,5;1,5];

x = linAusQR(A, y)
x_tr = linAusTransA(A, y)
alpha = x(1); beta =x(2);

% do plot?
if true
	fun = @(t) alpha * f_alpha(t) + beta * f_beta(t);

	hold('on');
	plot(t, y, 'ro');

	% redefine t coarser for plotting result
	t = t(1)-1 : .1 : t(end)+1;

	% plot result
	plot(t, fun(t), 'g','LineWidth', 2);
end

