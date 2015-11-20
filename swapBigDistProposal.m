function out=swapBigDistProposal(x)
    load cities.mat
    
    % Get biggest edge of all cities
    
    
    randIndex = ceil(rand* (numel(x)-10) );
   
    maxIndex = -1;
    maxDist = -inf;
    for i=randIndex:randIndex+9
        c1 = locs (x(i), :);
        c2 = locs (x(i+1), :);
        currDist = pdist( cat(1, c1, c2), 'euclidean' );
        if currDist > maxDist
            maxDist = currDist;
            maxIndex = i;
        end
    end
    
    minDist = inf;
    minIndex = -1;
    for i = 1:numel(x)
        if i ~= maxIndex
            c1 = locs (x(maxIndex), :);
            c2 = locs (x(i), :);
            currDist = pdist( cat(1, c1, c2), 'euclidean' );
            
            if currDist < minDist
                minDist = currDist;
                minIndex = i;
            end
        end
    end
    %minIndex
    %maxIndex
    
    %randIndex = ceil(rand*numel(x));
    
    temp = x(minIndex);
    x(minIndex) = x(maxIndex+1);
    x(maxIndex+1) = temp;
    
    out = x;
end