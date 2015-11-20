function out=tspGreedy(x)
disp(x)

currLocIndex = rand*100;
disp(ceil(currLocIndex))
nextLocIndex ;
lowestLocIndex;
lowestDiff=inf;


for i=1:100
    for i=1:100
        tempDiff = abs(x(currLocIndex)-x(nextLocIndex));
        if tempDiff < lowestDiff 
            lowestDiff = tempDiff;
            lowestLocIndex = nextLocIndex;
        end
    end
    currLocIndex = nextLocIndex;
end

out = x;
end
