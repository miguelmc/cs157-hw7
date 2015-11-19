function out=wideScaleRandomNoiseOneCoordinateProposal(x)
% Changes a random coordinate of x by a random amount at a random scale
% chosen in an exponential fashion from a range at least [.0001,100]

a = [-4:0.01:2];
aindex = rand*601;
%disp(aindex);
r = rand * a(ceil(aindex));
%disp(r);
c = 10^r;
xindex = ceil(rand *numel(x));
k = randn;
x(xindex) = x(xindex)+c*k;
out = x;
end