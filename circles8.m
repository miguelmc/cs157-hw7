function out=circles8(x)

i = ceil(rand*20);

if mod(i,2) == 1 %starting at x
   X = i;
   Y = i+1;
else
   X = i-1; 
   Y = i;
end
 
if rand < .5
    x(X) = x(X) + 1; 
else 
    x(X) = x(X) - 1; 
end

if rand < .5
    x(Y) = x(Y) + 1; 
else 
    x(Y) = x(Y) - 1; 
end

out = x;
end