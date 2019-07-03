function [ x ] = glsSolver( A, b )
  % Loest mit Hilfe der QR-Zerlegung ein lineares Gleichungssystem
  
    [Q,R] = QRzerleg(A);
    c = Q' * b;
    x = backwardSub(R, c);
end
