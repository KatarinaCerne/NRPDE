h = 0.05;
del = -1:h:1;
[X1,Y1]= meshgrid(del,del);
%l1 = @(x,y)4*exp(-x.^2-y.^2).*(x.^2+y.^2-1);
u = @(x,y)exp(-x.^2-y.^2);
surf(X1,Y1,u(X1,Y1))

