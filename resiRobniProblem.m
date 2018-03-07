function [x,y] = resiRobniProblem(a,b,p,q,r,alpha,beta,n)
%x ... seznam dolžine n+1, ki predstavlja ekvidistantno razporejene toèke
%na intervalu [a,b]
%y ... seznam dolžine n+1, ki predstavlj približek za rešitev robnega
%problema v n+1 ekvidistantno razporejenih toèkah na intervalu [a,b]

h = (b-a)/n;
x = a:h:b;

nadd = zeros(1,n+1);
di = zeros(1,n+1);
podd = zeros(1,n+1);
b = zeros(1,n+1);

%b(1) = r(x(1))*h^2-

for i=1:n
   podd(i)= -p(x(i)-h/2);
   nadd(i)=-p(x(i)+h/2);
   di(i)=p(x(i)-h/2)+p(x(i)+h/2)+h^2*q(x(i));
   b(i)=r(x(i))*h^2;
end
podd = podd(2:n+1);
nadd = nadd(1:n);

A1=diag(nadd,1);
A2=diag(podd,-1);
A3=diag(di);
A=A1+A2+A3;





end