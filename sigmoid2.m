function [h] = sigmoid2(X1,X2,theta)
  X = [ones(size(X1,1),1),X];
  
  z = X*theta;
  
  h = 1./(1 + exp(-1.*z));
endfunction
