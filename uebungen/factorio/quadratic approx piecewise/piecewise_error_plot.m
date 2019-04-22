clear all;
%close all;

pieces = (1:20)';

for i=1:length(pieces)
    fprintf('\npieces: %2.f\n',pieces(i));
    err(i) = piecewise_error(pieces(i));
    fprintf('error: %f\n', err(i));
    if err(i) < 1.5
        break
    end
end

pieces = 1:length(err);

%figure;
semilogy(pieces, err, 'k:');
hold on;
plot(pieces, err, '*');
plot(pieces, ones(length(pieces),1)*1, 'b:');
for i=2:10
    plot(pieces, ones(length(pieces),1)*i, 'k:');
end
