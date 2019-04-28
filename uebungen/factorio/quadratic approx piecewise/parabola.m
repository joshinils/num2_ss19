classdef parabola
    properties
        a; % scalars, that define the parabola like: a(1) + a(2)*x + a(3)*x*x
        domain; % vector of minX and maxX values for where this parabola is applicable
        fun; % function handle to function it shall approximate in its defined domain
    end % properties
    
    methods
        function this = parabola(fun, domain)
            if isa(fun, 'function_handle')
                this.fun = fun;
            end
            
            if numel(domain) == 2
                this.domain = domain;
            end
            
            %% find best middle point
            maxIter = 1;
            midPointDomain = domain;
            for iter = 1:maxIter
                nMidPoints = 1e3;
                x = linspace(domain(1), domain(2), nMidPoints)';
                y = fun(x);

                % potential middle points
                potMidPt = linspace(midPointDomain(1), midPointDomain(2), nMidPoints);

                maxErr = zeros(nMidPoints, 1); % preallocate
                for i = 1:nMidPoints
                    pointsX = [domain(1); potMidPt(i); domain(2)];
                    pointsY = fun(pointsX);

                    this.a = quadCoefficients(pointsX, pointsY);

                    err = abs(y - this.getY(x));
                    maxErr(i) = max(err);
                end
%                figure;
%                plot(1:nMidPoints, maxErr);

                [~, minI] = min(maxErr);
                dD = ceil(nMidPoints/5);
                midPointDomain = [x(max(minI - dD, 1)), x(min(minI + dD, length(x)))]
            end;

            % actually choose best midpoint
            pointsX = [domain(1); potMidPt(minI); domain(2)];
            pointsY = fun(pointsX);
            this.a = quadCoefficients(pointsX, pointsY);

        end % function parabola
        
        function y = getY(this, x)
            y = this.a(1)*ones(length(x), 1) + this.a(2) * x + this.a(3) * x.*x;
        end %_ function getX
        
        function a = quadCoefficients( x, y )
            if length(x) ~= 3 || length(y) ~= 3
                error('quadCoefficients:: not the right dimensions');
            end

            a = [ones(length(x), 1), x, x.*x] \ y;
        end % function;
    end % methods
end % classdef

