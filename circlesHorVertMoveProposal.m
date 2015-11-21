function out=circlesHorVertMoveProposal(x)
% Choosing one random coordinate in x (either a X or Y coordinate), and 
% changing the value by adding or subtracting one.  This moves one circle 
% in the horizantol or vertical direction. 


% Choosing an element at random. i is used to index into x
i = ceil(rand*20);

% There is a 50/50 chance of adding one or subtracting one from coordinate
% x(i)
if rand < .5
    x(i) = x(i) + 1; 
else 
    x(i) = x(i) - 1; 
end

% returning modified array
out = x;

end
