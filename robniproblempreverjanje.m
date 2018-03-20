format long 
alpha = -2;
beta = 3;
n = 5;
a = -1;
b = 1;

p = @(t) 1+t.^2;
q = @(t) t.^2;
r = @(t) -1*ones(1,n+1);

[x,y] = resiRobniProblem(a,b,p,q,r,alpha,beta,n);
