clear;
clc;
load quasar_train.csv;
X = quasar_train(1, :)';
train = quasar_train(2:end, :);
Y = train(1,:)';

m=length(X);
n=1;
alpha=0.1;

theta=zeros(m,n);
t=theta;

for i=1:m
    t(i,1)=theta(i,1)-alpha*(1/(1+exp(-theta'*X))-Y(i,1))*X(i,1);
    theta=t;
end

for i=1:m
    y(i,1)=1/(1+exp(-theta'*X));
end

scatter(X,Y,'x');
hold on
plot(X,y);
hold off