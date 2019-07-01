function [ y ] = lagrangePolynom( j, knoten, x )
    y = ones(size(x));
    for i = 1:length(knoten)
        if j == i ; continue; end;
        y = y .* (x-knoten(i)) ./ (knoten(j)-knoten(i));
    end
end % function

