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
            maxIter = 2;
            midPointDomain = domain;
            for iter = 1:maxIter
                nMidPoints = 1e2;
                x = linspace(domain(1), domain(2), nMidPoints)';
                y = fun(x);

                % potential middle points
                domainLength = (midPointDomain(2) - midPointDomain(1))*0.3;
                potMidPt = linspace(midPointDomain(1) + domainLength, midPointDomain(2) - domainLength, nMidPoints);

                maxErr = zeros(nMidPoints, 1); % preallocate
                pointsX = [domain(1); 1e99; domain(2)];
                pointsY = fun(pointsX);
                for i = 1:nMidPoints
                    pointsX(2) = potMidPt(i);
                    pointsY(2) = fun(pointsX(2));

                    this.a = this.quadCoefficients(pointsX, pointsY);

                    err = abs(y - this.getY(x));
                    maxErr(i) = max(err);
                end
%                figure;
%                plot(1:nMidPoints, maxErr);

                [~, minI] = min(maxErr);
                dD = ceil(nMidPoints/5);
                midPointDomain = [x(max(minI - dD, 1)), x(min(minI + dD, length(x)))];
            end

            % actually choose best midpoint
            pointsX = [domain(1); potMidPt(minI); domain(2)];
            pointsY = fun(pointsX);
            this.a = this.quadCoefficients(pointsX, pointsY);
        end % function parabola
        
        function y = getY(this, x)
            y = this.a(1)*ones(length(x), 1) + this.a(2) * x + this.a(3) * x.*x;
        end %_ function getX
        
        function a = quadCoefficients(this, x, y )
%            if length(x) ~= 3 || length(y) ~= 3
%                error('quadCoefficients:: not the right dimensions');
%            end
            A = [[1;1;1], x, x.*x];

            a = A \ y;
            
            a = round(a);
        end        
    end % methods
end % classdef

