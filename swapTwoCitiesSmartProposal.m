function out=swapTwoCitiesSmartProposal(x)

    load cities.mat

    randIndex = ceil(rand*(numel(x)-1));
    
    minDist = inf;
    minIndex = -1;
    for i = 1:numel(x)
        c1 = locs (x(randIndex), :);
        c2 = locs (x(i), :);
        currDist = pdist( cat(1, c1, c2), 'euclidean' );

        if currDist < minDist
            minDist = currDist;
            minIndex = i;
        end
    end
    
    
    temp = x(randIndex+1);
    x(randIndex + 1) = x(minIndex);
    x(minIndex) = temp;
    
    out = x;
end