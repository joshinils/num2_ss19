function [ maxErr ] = quadWeightError( nPieces, weightFirst )
    format shortg;
    format compact;


    limit_end = 3e5;
    base = (limit_end)^(1/100);
    logb = @(x) log(x)/log(base);


    x = logspace(0, log10(limit_end), 1e2)';
    y = logb(x);
    

    pieceIndex = floor(linspace(1, length(x), nPieces+1))';
    maxErr = 0;
    for i = 1:nPieces
        xn{i}(1,1) = x( pieceIndex(i) );
        xn{i}(3,1) = x( pieceIndex(i+1) );
        xn{i}(2,1) = (xn{i}(1)*weightFirst + xn{i}(3))/(weightFirst+1); % mitte mitteln, ka ob beste wahl
        yn{i}(:,1) = logb(xn{i});

        an{i}(:,1) = quadCoefficients(xn{i}, yn{i});
        x_quad{i} = x((pieceIndex(i)+1):pieceIndex(i+1));
        y_quad{i} = pointOnQuad(an{i}, x_quad{i});

        err{i} = abs(y((pieceIndex(i)+1):pieceIndex(i+1)) - y_quad{i});
        maxErr = max(maxErr, max(err{i}));
    end
end

