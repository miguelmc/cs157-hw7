function out=swapTwoNeighboringCitiesProposal(x)

    randIndex = ceil(rand * (numel(x)-1));
    %randIndex2 = ceil(rand * numel(x));
    
    temp = x(randIndex);
    x(randIndex) = x(randIndex + 1);
    x(randIndex + 1) = temp;
    
    out = x;
end