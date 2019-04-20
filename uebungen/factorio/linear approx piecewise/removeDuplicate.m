function [ a, b ] = removeDuplicate( a, b )

	if numel(a) ~= length(a)  ||  numel(a) ~= numel(b)
		return;
	end
	
	pairs=[a(:), b(:)];
	
	index=length(a);
	while index > 0;
		q=pairs(index,:);
		found=false;
		for i=1:index-1
			if pairs(i,:)==q
				found=true;
				break;
			end
		end
		if found
			pairs(index,:)=[];
		end
		index=index-1;
	end
	a=pairs(:,1);
	b=pairs(:,2);
end % function

