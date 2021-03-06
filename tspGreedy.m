function out=tspGreedy(i)
load cities.mat

% For our initial ordering, we choose the given city i, and then greedily 
% select the next closest city.   
x = 1:100;
currLocIndex = i;

lowestLocIndex = 101;
lowestDiff=inf;

a=1:100;
a(1)= x(currLocIndex);
x(currLocIndex) = -1;

for i=2:100 % indexing into new output a
    for j=1:100 % travsering x to find lowest value
        
        if (x(j) ~= -1)
            c1 = locs (a(i-1), :);
            c2 = locs (x(j), :);
            currDist = pdist( cat(1, c1, c2), 'euclidean' );
           
            if currDist < lowestDiff 
                lowestDiff = currDist;
                lowestLocIndex = j;
            end
            
        end
    end
    a(i) = x(lowestLocIndex);
    x(lowestLocIndex) = -1;
    lowestDiff = inf;
end

out = a;
end
