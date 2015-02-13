function [ z4 ] = getNoLoad( x ,finalW1L1, finalW1L2, finalB1L1, finalB1L2, finalSoftmaxTheta )

z1 = 1./(1+exp(-(finalW1L1*x+finalB1L1)));
z2 = 1./(1+exp(-(finalW1L2*z1+finalB1L2)));
z3 = finalSoftmaxTheta *z2;
z4 = mod(find(z3 == max(z3)), 10);
end

