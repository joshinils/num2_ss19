function [Q_final, R, Q] = QRzerleg(A_input)
    A{1} = A_input;
    identity = eye(length(A_input));
    
    Q_final = identity;
    for i = 1:size(A_input, 1)
        fprintf('\niteration %i\n', i);
        y = A{i}(:, i);
        v = y + sign(y(i)) * norm(y) * identity(:, i);
        Q{i} = eye(length(v)) - 2 * (v*v') / (norm(v)^2);
        printQi = Q{i}
        A{i+1} = Q{i}*A{i};
        Q_final = Q{i} * Q_final
    end
    fprintf('\n\n\n');
    celldisp(Q);
    celldisp(A);
    R = Q_final' * A_input
end % function