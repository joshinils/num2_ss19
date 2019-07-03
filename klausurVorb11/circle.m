function [ h ] = circle( r, x, y )

    if nargin == 1
        x = 0;
        y = 0;
    elseif nargin == 2
        param = x;
        x = 0;
        y = 0;
    end

    hold on;
    th = 0:pi/500:2*pi;
    xunit = r * cos(th) + x;
    yunit = r * sin(th) + y;
    if nargin ~= 2
        h = plot(xunit, yunit);
    else
        h = plot(xunit, yunit, param);        
    end
    hold off;

end

