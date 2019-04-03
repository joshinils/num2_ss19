% -------------------------------------------------------------------------
% Matlab-Skript, Numerik II, Uebungsblatt1, Beispiel
% Plot der Funktion f: R^2 -> R;  (x1,x2) -> x1^2 + x2^2   
%       Frank Hausser, 4/2008
%--------------------------------------------------------------------------


% 1. Schritt: 
% Erzeuge Gitter von Punkten (x1i,y2i), an denen f ausgwertet werden sollen:
% dabei ist x1i eine Matrix, die die x1-Werte an allen Gitterpunkten enthaelt
% analog isr x2i eine Matrix, die die x2-Werte an allen Gitterpunkten enthaelt

numpoints = 10;   % Anzahl Gitterpunkte in x1 bzw. in x2 Richtung
x1        = linspace(-2,2,numpoints); % Vektor von x1-Werten
x2        = linspace(-2,2,numpoints); % Vektor von x2-Werten
[x1i,x2i] = meshgrid(x1,x2);          % meshgrid(..) erzeugt die Matrizen

% 2. Schritt: 
% Berechne die Matrix fi der Funktionswerte an den Gitterpunkten: 

fi = x1i .* x1i + x2i.*x2i ; % .* bewirkt komponentenweise Multiplikation


% 3. Schritt: 
% 3d - Plot der Funktion f(x1,x2)

figure(1)           %neues Fenster wird aufgemacht, falls Figure 1 noch nicht vorhanden
                     % schliessen mit close(1) im Command-Window 
mesh(x1i,x2i,fi); % Plotbefehl; auch meshc(...)
pause      % Es geht erst nach druecken der return-Taste weiter

figure(2)           %neues Fenster wird aufgemacht
surf(x1i,x2i,fi); % alternativer Plotbefehl; auch surfc(...)
shading interp;   % kontinuierlicher Farbverlauf, keine Gitterlinien 
axis off         % keine Achsen
colorbar; 


xlabel('x_1');                       % Achsenbeschriftung
ylabel('x_2');
zlabel('f(x_1,x_2)');
title('f(x_1,x_2) = x_1^2 + x_2^2'); %Titel
shg        % show graphic, Bild geht in den Vordergrund
pause      % Es geht erst nach druecken der return-Taste weiter

% 4. Schritt
% Isolinien der Funktion f(x1,x2)

figure(3)                  % neues Fenster wird aufgemacht
contourf(x1i,x2i,fi);    % Plot-Befehl
title('Isolinien der Funktion f(x_1,x_2) = x_1^2 + x_2^2');
colorbar
shg



