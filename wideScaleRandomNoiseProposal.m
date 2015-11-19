function out=wideScaleRandomNoiseProposal(x)
% Changes all coordinates of x by a random amount at a random scale chosen
% in an exponential fashion from a range at least [.0001,100]

a = [-4:0.01:2];
aindex = rand*601;
%disp(aindex);
r = rand * a(ceil(aindex));
%disp(r);
c = 10^r;
for i = 1: numel(x)
    k = randn;
    x(i) = x(i)+c*k;
end
out = x;
end
