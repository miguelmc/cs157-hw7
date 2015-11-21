function out=circlesDiagonalMoveProposal(x)
% Choosing one random coordinate pair in x (cooresponding X and Y 
% coordinates), and changing the values of the coordinate pair by adding or
% subtracting one from each coordinate.  This moves one circle in the 
% diagonal direction (like packing the circles into the square more 
% tightly.)  


% Choosing an integer at random. 
i = ceil(rand*20);

% If the random coordinate i is odd, then i is the X coordinate and we need
% to modified the corresponding Y coordinate.  WLOG for if i is even.
if mod(i,2) == 1
   X = i;
   Y = i+1;
else
   X = i-1; 
   Y = i;
end
 
% For the X coordinate, there is a 50/50 chance of adding one or 
% subtracting one from element x(X)
if rand < .5
    x(X) = x(X) + 1; 
else 
    x(X) = x(X) - 1; 
end

% For the Y coordinate, there is a 50/50 chance of adding one or 
% subtracting one from element x(Y)
if rand < .5
    x(Y) = x(Y) + 1; 
else 
    x(Y) = x(Y) - 1; 
end

% Returning modified array
out = x;

end