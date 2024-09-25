function [model] = RBF_NN_train(train_x,train_y,option)

if ~isfield(option,'n_center_vec')|| isempty(option.n_center_vec)
    option.n_center_vec=100;
end
if ~isfield(option,'sigma')|| isempty(option.sigma)
    option.sigma=2^0;
end
if ~isfield(option,'lammda')|| isempty(option.lammda)
    option.lammda=2^0;
end


%k means
[idx, C] = kmeans(train_x, option.n_center_vec);

% Calulate sigma 
%[sigma] = max_sigma(C,n_center_vec);



phi_M = kernel_RBF(train_x,C,option.sigma);
	
W = (phi_M'*phi_M + eye(size(phi_M,2))*option.lammda)\(phi_M'*train_y);
model.C = C;
model.W = W;
model.sigma = option.sigma;
model.type_task = option.type_task;
end


function [sigma] = max_sigma(X,h)

Y = X;
r2 = repmat( sum(X.^2,2), 1, size(Y,1) ) ...
	+ repmat( sum(Y.^2,2), 1, size(X,1) )' ...
	- 2*X*Y' ;
	
	sigma2 = max(max(r2));
	
	for i=1:h
		r2(i,i)=sigma2;
	end
	min_sig = min(min(r2));
	sigma = sqrt(min_sig/(2*h));

end


%RBF kernel function
function k = kernel_RBF(X,Y,gamma)
	r2 = repmat( sum(X.^2,2), 1, size(Y,1) ) ...
	+ repmat( sum(Y.^2,2), 1, size(X,1) )' ...
	- 2*X*Y' ;
	gamma = 1/(2*gamma^2);
	k = exp(-r2*gamma); % RBFºË¾ØÕó
end