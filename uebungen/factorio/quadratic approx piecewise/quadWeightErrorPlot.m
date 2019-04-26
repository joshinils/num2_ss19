close all;
clear all;

weights = linspace(0.1,5)';

for i = 1:length(weights)
    err(i,1) = quadWeightError(7, weights(i));
end

plot(weights, err, 'r');
hold on;

plot([1;1], [min(err);max(err)], 'k:');

[~,id] = min(err);
weight = weights(id)
er = err(id)




