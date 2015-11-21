function out=swapTwoNeighboringCitiesProposal(x)

% Randomly selecting a city and then swapping it with a city in which they
% share an edge.  

randIndex = ceil(rand * (numel(x)-1));

temp = x(randIndex);
x(randIndex) = x(randIndex + 1);
x(randIndex + 1) = temp;

out = x;

end