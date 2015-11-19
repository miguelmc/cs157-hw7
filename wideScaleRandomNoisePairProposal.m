function out=wideScaleRandomNoisePairProposal(x)
% Changes two random coordinates 2i-1 and 2i of x by a random amount at a 
% random scale chosen in an exponential fashion from a range at least
% [.0001,100] 

a = [-4:0.01:2];
aindex = rand*601;
%disp(aindex);
r = rand * a(ceil(aindex));
%disp(r);
c = 10^r;
xindex = ceil(rand *numel(x));
if mod(xindex,2) == 1
    k = randn;
    x(xindex) = x(xindex)+c*k;
    k = randn;
    x(xindex+1) = x(xindex+1)+c*k; 
else 
    k = randn;
    x(xindex) = x(xindex)+c*k;
    k = randn;
    x(xindex-1) = x(xindex-1)+c*k; 
end 
out = x;
end