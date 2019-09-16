function [list] = admission(theta,X)
  list = zeros(size(X,1),1);
  X = [ones(size(X,1),1),X];
  z = X*theta;
  h = 1./(1 + exp(-1.*z));
  
  idx = find(h >= 0.5);
  list(idx) = 1;
endfunction
