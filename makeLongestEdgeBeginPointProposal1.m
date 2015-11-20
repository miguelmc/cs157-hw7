function out=makeLongestEdgeBeginPointProposal1(x)
    load cities.mat
    
    % Get biggest edge of all cities
    
    
    %randIndex = ceil(rand* (numel(x)-10) );
   
    maxIndex = -1;
    maxDist = -inf;
    for i=1:numel(x)-1
        c1 = locs (x(i), :);
        c2 = locs (x(i+1), :);
        currDist = pdist( cat(1, c1, c2), 'euclidean' );
        if currDist > maxDist
            maxDist = currDist;
            maxIndex = i;
        end
    end
    
    for i = 0:maxIndex-1
        if maxIndex+i > numel(x)
            break
        end
        temp = x(maxIndex+i);
        x(maxIndex+i) = x(i+1);
        x(i+1) = temp;
    end
    
    out = x;
end