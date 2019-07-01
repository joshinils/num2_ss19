format compact;
format shortg;
clear all;
close all;

n = 6;
nPoints = n*100;
more = 0.02*0;
x = linspace(-1-more,1+more,nPoints);

funToInterp = @(t) sin(t*pi);


%% lagrange
subplot(2,1,1);
hold on;

xiEqual = -1 +2* (0:n) ./ n

plot(xiEqual, 1, 'o', 'HandleVisibility','off');
allY = zeros(size(x));
for j=(0:n)+1
    y = lagrangePolynom(j, xiEqual, x);
    allY = allY + y*funToInterp(xiEqual(j));
    plot(x,y, 'HandleVisibility','off');
    axis tight;
end
plot(x, allY, '-g.', 'DisplayName', 'Approximation');
err = abs(funToInterp(x)-allY);
max(err)
plot(x, err, '-r.', 'DisplayName', 'Error');
plot(x, funToInterp(x), '-b', 'DisplayName', 'funToInterp');
legend show;

%% tschebyschow
subplot(2,1,2);
hold on;

xiTsche = -cos((2*(0:n)+1) / (2*n + 2) * pi);

plot(xiTsche, 1, 'o', 'HandleVisibility','off');
allY = zeros(size(x));
for j=(0:n)+1
    y = lagrangePolynom(j, xiTsche, x);
    allY = allY + y*funToInterp(xiTsche(j));
    plot(x,y, 'HandleVisibility','off');
    axis tight;
end
plot(x, allY, '-g.', 'DisplayName', 'Approximation');
err = abs(funToInterp(x)-allY);
max(err)
plot(x, err, '-r.', 'DisplayName', 'Error');
plot(x, funToInterp(x), '-b', 'DisplayName', 'funToInterp');

legend show;


