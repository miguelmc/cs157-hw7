function x=denoiseQuadratic(inp,k)
% Given an input image inp, and a scaling factor k, returns the optimal
% quadratic denoising of the image, as specified in the handout

n = size(inp);

%A = [1, -1];
%B = [1; -1];

res = NaN(n);
A = zeros(n);
B = zeros(n);

A(1,1) = 1;
A(1,2) = -1;

B(1,1) = 1;
B(2,1) = -1;

fourierA = abs(fft2(A)).^2;
fourierB = abs(fft2(B)).^2;
fourierInp = fft2(inp);

% for i = 1:n(1)
%     for j = 1:n(2)
% %         res(i,j) = ifft( fourierInp(i,j) ./ (k*( fourierA(i,j) + fourierB(i,j) ) + 1) );
%         res(i,j) = ifft( fourierInp(i,j) ./ (k*( fourierA(i,j) + fourierB(i,j) ) + 1) );
% 
%     end
% end

x = real(ifft2( fourierInp ./ (k*( fourierA + fourierB) + 1))) ;


% x = real(res);