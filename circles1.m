function out=circles1(x)
% Picks the biggest x value and subtracts something

maxIndex = 1; % x values are odd index
currIndex = 1;
for i=3:2:20
    if x(i) > x(currIndex)
        maxIndex = i;
    end
    currIndex = maxIndex;
end

x(maxIndex) = x(maxIndex) - 1;

out = x;
end


