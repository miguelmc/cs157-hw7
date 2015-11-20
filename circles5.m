function out=circles5(x)

i = ceil(rand*20);
 
if rand < .5
    x(i) = x(i) + 1; 
else 
    x(i) = x(i) - 1; 
end

out = x;
end
