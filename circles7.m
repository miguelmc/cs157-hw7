function out=circles1(x)
% Picks the smallest x value and adds something

minIndex = 1; % x values are odd index
currIndex = 1;
for i=3:2:20
    if x(i) < x(currIndex)
        minIndex = i;
    end
    currIndex = minIndex;
end

x(minIndex) = x(minIndex) + 1;

out = x;
end