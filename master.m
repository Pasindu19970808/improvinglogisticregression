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

