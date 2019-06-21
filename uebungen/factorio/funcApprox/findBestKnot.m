clear all;
close all;
format compact;
format longg;

calcKnot1 = 1847.7;
calcKnot2 = 16350;

KnotInterval = linspace(1, (calcKnot1+calcKnot2)/2);
best = 22.8643526713838;
window = .001;
KnotInterval = linspace(best*(1-window), best*(1+window));

for i=1:length(KnotInterval)
    err(i) = logbApproxNKnot(KnotInterval(i), 1);
end

plot(KnotInterval, err, '.r-');

[m,i] =min(err)

KnotInterval(i)

