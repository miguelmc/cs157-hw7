function out=swapBigDistProposal(x)
    load cities.mat
    
    
    
    % Get biggest edge of all cities
    
    
    randIndex = ceil(rand* (numel(x)-10) );
    
    candidateCities = x(randIndex:randIndex+10);
    
    maxIndex = -1;
    maxDist = inf;
    for i=1:10
        for j=1:10
            currDist = sqrt(sum(candidateCities(i).*candidateCities(j)));
            if currDist > maxDist
                maxDist = currDist;
                maxIndex = i;
            end
        end
    end
    
end