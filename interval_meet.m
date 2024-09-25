%% interval_meet.m 
 
%% Function to compute the meet (or product) of "n" interval type-1 sets, 
%% as described in Theorem 7-2.

%% Written by Nilesh N. Karnik - August 9,1998
%% For use with MATLAB 5.1 or higher.

%% Outputs : "l_out" and "r_out" (scalars) are, respectively, the 
%% left and the right end-points of the result of the "meet" 
%% operation, which is also an interval type-1 set. 
 
%% Inputs : "l" and "r" are both n-vectors, containing, respectively
%% the left and right end-points of the interval type-1 sets, whose
%% "meet" is to be computed. Both the end-points are assumed to be 
%% positive for each set. If "tnorm < 0" (scalar), minimum t-norm 
%% is used, else product is used.


function[l_out,r_out] = interval_meet(l,r,tnorm)

if tnorm < 0,
    l_out = min(l) ;
    r_out = min(r) ;
else
    l_out = prod(l) ;
    r_out = prod(r) ;
end 

return ;
