

f_alpha = @(t) cos(pi/4.*t);
f_beta  = @(t) sin(pi/3.*t);

t = [1;2;3];
y = [2;0;-3];

A = zeros(length(t), 2);
for i = 1:length(t)
	A(i,:) = [f_alpha(t(i)), f_beta(t(i))];
end


x = linAusQR(A, y);
x = ue1_5(A, y);
alpha = x(1); beta =x(2);

hold('on');
plot(t, y, 'ro');

% redefine t coarser for plotting result
t = t(1)-1 : .1 : t(end)+1;

fun = @(t) alpha * f_alpha(t) + beta * f_beta(t);

% plot result
plot(t, fun(t), 'g');