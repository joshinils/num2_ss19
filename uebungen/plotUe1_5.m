

f_alpha = @(t) cos(pi/4.*t);
f_beta  = @(t) sin(pi/3.*t);

t = [1;2;3];
y = [2;0;-3];
[a,b] = ue1_5(t, y);

plot(t, y);