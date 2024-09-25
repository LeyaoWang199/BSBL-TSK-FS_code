function [y] = RBF_NN_predict(test_x, model)


phi_M = kernel_RBF(test_x,model.C,model.sigma);

yy = phi_M*model.W;
y=[];

switch lower(model.type_task)
    case {'regression'}
      
        y=yy;
    case {'classification'}
       
        [~, y]=max(yy');
	case {'binary classification'}
			%s = 1 ./ (1 + exp(-yy));
			y = sign(yy);
end


end


%RBF kernel function
function k = kernel_RBF(X,Y,gamma)
	r2 = repmat( sum(X.^2,2), 1, size(Y,1) ) ...
	+ repmat( sum(Y.^2,2), 1, size(X,1) )' ...
	- 2*X*Y' ;
	gamma = 1/(2*gamma^2);
	k = exp(-r2*gamma); % RBFºË¾ØÕó
end