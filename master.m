data = load('ex2data1.txt');

X1 = data(:,1);
X2 = data(:,2);
Y = data(:,3);

figure(1)
hold on
plot2(X1,X2,Y)

X = data(:,[1:end - 1]);

initial_theta = zeros(size(X,2) + 1,1);

%test_theta = [-24; 0.2; 0.2];
[h] = sigmoid2(X1,X2,initial_theta);

[J,grad] = costlog(initial_theta,X,Y);

options = optimset('Gradobj','on','MaxIter',400);

[theta,cost] = fminunc(@(t)(costlog(t,X,Y)), initial_theta,options);

[x1,x2,hvals] = plotboundary(theta,X);

figure(1)
contour(x1, x2, hvals,[0.5 1])

[list] = admission(theta,X);

accuracy = mean(double(list == Y));

m = size(X,1);
listJ = zeros(m - 1,3);
%drawing learning curve
for i = 1:m
 
  %collects training set
  initial_theta = zeros(size(X,2) + 1,1);
  Xtrain = X([1:i],:);
  Ytrain = Y([1:i],:);
  
  %collects the fixed cross validation set
  Xval = X([80:end],:);
  Yval = Y([80:end],:);
  
  %finds short version for cost function
  costfunction = @(t)costlog(t,Xtrain,Ytrain);
  
  %obtains theta depending on training set
  options = optimset('Gradobj','on','MaxIter',400);
  [theta] = fmincg(costfunction, initial_theta,options);
  
  %calculates the cost on the training set and adds it to a list
  [Jtrain] = linearRegCost(theta,Xtrain,Ytrain);
  listJ(i,1) = i;
  listJ(i,2) = Jtrain;
  
  %obtains Jcv using earlier found theta
  [Jval] = linearRegCost(theta,Xval,Yval);
  listJ(i,3) = Jval;
end

  figure(2)
  plot(listJ(:,1),listJ(:,2),'b-')
  hold on
  plot(listJ(:,1),listJ(:,3),'r-')


