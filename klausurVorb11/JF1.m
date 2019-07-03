function [ output_args ] = JF1( t, x )
    output_args(:,1) = (x(1) - t(:,1))./sqrt((x(1) - t(:,1)).^2 + (x(2) - t(:,2)).^2);
    output_args(:,2) = (x(2) - t(:,2))./sqrt((x(1) - t(:,1)).^2 + (x(2) - t(:,2)).^2);
    output_args(:,3) = -1;
end
