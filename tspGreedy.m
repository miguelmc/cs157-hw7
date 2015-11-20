function out=tspGreedy(x)
disp(x)

currLocIndex = ceil(rand*100);
disp(currLocIndex)
nextLocIndex = 1;
lowestLocIndex = 101;
lowestDiff=inf;

a=1:100;
a(1)= x(currLocIndex)

for i=2:100 % indexing into new output a
    for i=1:100 % travsering x to find lowest value
        tempDiff = abs(x(currLocIndex)-x(nextLocIndex));
        if tempDiff < lowestDiff 
            lowestDiff = tempDiff;
            lowestLocIndex = nextLocIndex;
        end
    end
    a(i) = x(nextLocIndex);
    currLocIndex = nextLocIndex;
end

out = a;
end
