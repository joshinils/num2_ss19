function [Q,R]= qrGivensHesse(H)
% [Q,R]= qrGivensHesse(H)
% Berechnung der QR-Zerlegung einer Matrix H
% die in Hessenbergform vorliegt, d.h. alle Eintraege unterhalb der ersten
% unteren Nebendiagonalen sind null.
% Es werden die n-1 Eintraege der unteren Nebendiagonalen
% durch n-1 Givensrotationen zu Null transformiert

[~,n] = size(H);

for k = 1:n-1   % k-te Spalte wird bearbeitet, d.h. H(k,k+1) muss auf 0 gedreht werden

    % Bestimmung von c = cos(alpha), s = sin(alpha) in der Givensrotation
    % Omega_(k,k+1); Speicherung der c,s in einem Vektor
    [c(k),s(k)] = givensParameter(H(k,k),H(k+1,k));

    % Multiplikation H = Omega_{k,k+1) * H
    % Aenderungen nur in der k-ten und k+1 - ten Zeile
    for j = k:n  % fuer j < k ist H(k,j) = 0 !!
        t1 = H(k,j);
        t2 = H(k+1,j);
        H(k,j)   = c(k)*t1 - s(k)*t2;
        H(k+1,j) = s(k)*t1 + c(k)*t2;
    end

end
R = H;

% Berechnung des Produktes aller Givensrotationen
n1 = n-1; 
n2 = n-2;
Q        =  eye(n);          % Einheitsmatrix
Q(n1,n1) =  c(n1);
Q(n,n)   =  c(n1);
Q(n1,n)  =  s(n1);
Q(n,n1)  = -s(n1);

for k = n2:-1:1,
    k1 = k+1;
    Q(k,k)     = c(k);
    Q(k1,k)    = -s(k);
    q = Q(k1,k1:n);
    Q(k,k1:n)  = s(k)*q;
    Q(k1,k1:n) = c(k)*q;
end
