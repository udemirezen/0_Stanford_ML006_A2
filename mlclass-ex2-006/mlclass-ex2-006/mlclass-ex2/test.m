clc;
m = length(y); % number of training examples
X = [ones(20,1) (exp(1) * sin(1:1:20))' (exp(0.5) * cos(1:1:20))'];
  y = sin(X(:,1) + X(:,2)) > 0;
theta = [0.25 0.5 -0.5]';
h = sigmoid(X*theta);
J = (1/m)*(-y'* log(h) - (1 - y)'*log(1-h));
[JJ,grad] = costFunction(theta, X, y);

theta =  [0;theta(2:end, :);];
pen=0;
pentheta = 0;
lambda = 0.1;

for i = 1:1:size(theta)
    pen = pen + (theta(i)^2);
    pentheta = pentheta + theta(i);
end

pen = pen * (lambda/(2*m));
pentheta = pentheta * (lambda/m);
disp(pen)
disp(pentheta)
penpen = (lambda/(2*m))*theta'*theta;

   out = sprintf('%0.5f ', costFunctionReg([0.25 0.5 -0.5]', X, y, 0.1));
   out1 = sprintf('%0.5f ', lrCostFunction([0.25 0.5 -0.5]', X, y, 0.1));
   gr = (1/m)*(X'*(h-y))
   gr = gr + (lambda/m)*theta
   grr = grad +  (lambda/m)*theta