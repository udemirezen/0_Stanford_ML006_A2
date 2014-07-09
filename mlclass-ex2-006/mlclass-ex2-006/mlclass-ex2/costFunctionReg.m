function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta

cost1 = 0;
grad1 = 0;
[cost1, grad1] = costFunction(theta, X, y);
pen = 0;
pentheta = 0;
theta =  [0;theta(2:end, :);];
for i = 1:1:size(theta)
    pen = pen + (lambda/(2*m))*(theta(i)^2);     
end

J = cost1 + pen;
grad = grad1 + (lambda/m)*theta;
% =============================================================

end
