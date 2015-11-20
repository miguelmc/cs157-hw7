function out=circles2(x)
% Picks the biggest y value and subtracts something

maxIndex = 1; % x values are odd index
currIndex = 2;
for i=4:2:20
    if x(i) > x(currIndex)
        maxIndex = i;
    end
    currIndex = maxIndex;
end
 
x(maxIndex) = x(maxIndex) - 1;

out = x;
end


