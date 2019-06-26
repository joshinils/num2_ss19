clear all;
close all;
format compact;
format longg;

%% calculate initial nodes
% intervall in which to approximate
limit_start = 1;
limit_end = 3e5;
base = (limit_end)^(1/100); % of the log, meaning logb(limit_end) := 100 
logb = @(x) log(x)/log(base);

n = 10; % amount of nodes

% tschebyschow nodes:
k = linspace(1, n, n)';
% according to: https://en.wikipedia.org/wiki/Chebyshev_nodes#Definition
x_i = sort(  (limit_start + limit_end)/2 + (limit_end -limit_start)/2 * cos( (2*k -1)/(2*n)*pi )  )

minErr = 1e30;
minTry = 9;
maxTry = 10;

%%
for repeats = 1:1
    for nodeNr = 1:n
        window = 1;
        nodeMinErr = 1e30;
        for i=1:maxTry
            window = window * .9;
            KnotInterval = linspace(x_i(nodeNr)*(1-window), x_i(nodeNr)*(1+window), 10);

            err = zeros(length(KnotInterval), 1);
            for j=1:length(KnotInterval)
                x_i(nodeNr) = KnotInterval(j);
                err(j) = logbApproxNKnot(x_i, 1:n);
            end
            close;
            plot(KnotInterval, err, '.r-');

            [m,mi] = min(err);
            fprintf('node%i, try%i, m%f, i%i\n', nodeNr, i, m, mi);

            x_i(nodeNr) = KnotInterval(mi);
            if minErr     > m; minErr     = m; end
            if nodeMinErr > m; nodeMinErr = m; end
            if nodeMinErr == minErr && i >= minTry
                break;
            end
        end % i
        fprintf('\n');
    end % nodeNr
    x_i
%    pause
end % repeats





