%initial guess, unfortunately far from the origin (rows are legs and hips; columns are points in time)
x0=1000*randn(2,20);

epsilons=[1.5 1 .1 .01 .001 .0001 .00001 .000001];% .0000001 .00000001]; %maybe need this
for eps=epsilons,
    disp(sprintf('Epsilon %d', eps));
    x0=localSearch(@twop,@wideScaleRandomNoiseMix3Proposal,x0,eps,-1,1,5,eps*5);
end
