function [ output_args ] = F1( t, x )
	% x(1) = m_x
	% x(2) = m_y
	% x(3) = r
    output_args = sqrt((t(:,1) -x(1)).^2 + (t(:,2) -x(2)).^2) -x(3);
end
