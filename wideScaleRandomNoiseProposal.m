function out=wideScaleRandomNoiseProposal(x)
% Changes all coordinates of x by a random amount at a random scale chosen
% in an exponential fashion from a range at least [.0001,100]

% We are randomly picking a radius in the range of [.0001,100].  To do
% this, we are doing this by calculating 10 to the power of r, where r is a
% value in the range of [-4,2] in inclusive. 

% Creating an array of numbers ranging from -4 to 2 inclusive at 0.01
% increments 
a = -4:0.01:2;

% Generating a random index of the number of elements in a (the ceiling
% call makes the index an integer)
aindex = ceil(rand*numel(a));

% Getting the expontent value r in the array a at aindex and multiplying 
% it by rand to make r truly random 
r = rand * a(aindex);

% c is the radius (10 to the power of r)
c = 10^r;


% adding c times k to each element, x(i), in x from i = 0 to number of 
% elements in x, where c is the radius and k is our randomly chosen 
% positive or negative number (regenerated for each element) 
for i = 1: numel(x)
    k = randn;
    x(i) = x(i)+c*k;
end

% returning modified array
out = x;

end
