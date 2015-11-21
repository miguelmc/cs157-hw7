function out=swapTwoCitiesProposal(x)

% Randomly selecting two cities and swapping them.

randIndex1 = ceil(rand * numel(x));
randIndex2 = ceil(rand * numel(x));

temp = x(randIndex1);
x(randIndex1) = x(randIndex2);
x(randIndex2) = temp;

out = x;

end