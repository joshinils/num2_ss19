function [alpha, beta] = ue1_5(t, y)

f_alpha = @(t) cos(pi/4.*t);
f_beta  = @(t) sin(pi/3.*t);

A = zeros(length(t), 2);
for i = 1:length(t)
	A(i,:) = [f_alpha(t(i)), f_beta(t(i))];
end

x = (A'*A) ^-1 * A' * y;
alpha = x(1);
beta  = x(2);

end % function