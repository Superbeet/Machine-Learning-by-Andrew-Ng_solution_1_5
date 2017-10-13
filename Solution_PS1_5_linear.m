clear;
clc;
load quasar_train.csv;
X0 = quasar_train(1, :)';
train = quasar_train(2:end, :);
Y0 = train(1,:)';

m=length(X0);

X=[X0, ones(m,1)];
Y=Y0;

theta=inv(X'*X)*X'*Y0;

y=theta(1,1)*X+theta(2,1);
y=y(:,1);

scatter(X0,Y0,'x');
hold on
plot(X0,y);
hold off