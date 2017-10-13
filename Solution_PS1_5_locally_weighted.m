clear;
clc;
load quasar_train.csv;
X = quasar_train(1, :)';
train = quasar_train(2:end, :);
Y = train(1,:)';

m=length(X);
n=1;
w=zeros(m,1);
tau=5;

W=zeros(m,m);
y=zeros(m,1);
theta=zeros(n,m);

for j=1:m
    for i=1:m
        w(i,1)=exp(-(X(j,1)-X(i,1))^2/(2*(tau^2)));
        W(i,i)=(1/2)*w(i,1);
    end
    theta(:,j)=inv(X'*W*X)*X'*W*Y;
end

X=X(:,1);
y=X*theta;
y=diag(y);
scatter(X,Y,'x');
hold on
plot(X,y);
hold off