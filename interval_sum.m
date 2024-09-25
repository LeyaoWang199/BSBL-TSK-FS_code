%% interval_sum.m 

%% Function to compute an affine combination of "n" interval type-1 
%% sets, as described in Theorem 7-4.

%% Written by Nilesh N. Karnik - August 9,1998
%% For use with MATLAB 5.1 or higher.

%%  "sum_{i=1}^n alpha_i F_i + beta"
 
%% Outputs : "c_sum" and "s_sum" (scalars) are, respectively, the 
%% center and spread of the result of the sum. 

%% Inputs : "c" and "s" are both n-vectors, containing the centers and 
%% spreads of the "n" interval type-1 sets. All the spreads 
%% should be positive. "alpha" is an n-vector containing the coefficients 
%% of the "n" sets in the affine combination (see Theorem 7-4), and 
%% "beta" (scalar) is a crisp constant that is added to the affine
%% combination. This result is true for any t-norm.


function[c_sum,s_sum] = interval_sum(c,s,alpha,beta)

c_sum = sum(alpha .* c) + beta ;
s_sum = sum(abs(alpha .* s)) ;


return ;