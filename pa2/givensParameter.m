function [c,s] = givensParameter(xi, xk)
% [c,s] = givensParameter(xi, xk)
%  Berechnung der beiden Parameter c,s einer Givensrotation;
%  [ c s; -s c] ist diejenige 2 x 2 - Drehmatrix, die den Vektor [xi;xk]
%  auf [a; 0] dreht, mit a = +- norm([xi,xk],2)
%  also muss c = xi/a, s = xk/a sein

if (xk == 0)    % nichts zu tun
    c=1; 
    s=0; 
else
   if abs(xk) > abs(xi)
      t = -xi/xk; 
      s = 1/sqrt(1+t^2); 
      c = s*t;
   else
      t = -xk/xi; 
      c = 1/sqrt(1+t^2); 
      s = c*t;
   end
end
