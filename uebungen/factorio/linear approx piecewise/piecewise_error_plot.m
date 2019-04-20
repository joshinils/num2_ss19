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


% pieces:  6     multiple = 4;
% from      5.00 to      31.00 plus  11.71 ; div by       6.96    from        5       to       31       plus       12       ; div by        7      
% from     31.00 to     195.00 plus  26.58 ; div by      44.98    from       31       to       195      plus       27       ; div by       45      
% from    196.00 to    1225.00 plus  41.18 ; div by     283.11    from       196      to      1225      plus       41       ; div by       283     
% from   1226.00 to    7660.00 plus  55.73 ; div by    1771.98    from      1226      to      7660      plus       56       ; div by      1772     
% from   7669.00 to   47939.00 plus  70.26 ; div by   11085.96    from      7669      to      47939     plus       70       ; div by      11086    
% from  47992.00 to  300000.00 plus  84.80 ; div by   69375.87    from      47992     to     300000     plus       85       ; div by      69376    
% error: 2.526622




