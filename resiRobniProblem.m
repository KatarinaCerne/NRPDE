function [x,y] = resiRobniProblem(a,b,p,q,r,alpha,beta,n)
% Opis:
%  resiRobniProblem uporabi diferencno metodo za izracun numericne resitve
%  navadne diferencialne enacbe -(p(x) y')' + q(x) y = r(x) na intervalu
%  (a,b) pri robnih pogojih y(a) = alpha in y(b) = beta
%
% Definicija:
%  [y,x] = resiRobniProblem(a,b,p,q,r,alpha,beta,n)
%
% Vhodni podatki:
%  a, b         robova intervala, na katerem resujemo enacbo,
%  p, q, r      funkcije, ki nastopajo v enacbi,
%  alpha, beta  robni vrednosti resitve,
%  n            parameter, ki doloca na koliko podintervalov je razdeljen
%               interval [a,b]
%
% Izhodna podatka:
%  y            seznam dolzine n+1, ki predstavlja priblizek za resitev
%               robnega problema v n+1 ekvidistantno razporejenih tockah na
%               intervalu [a,b],
%  x            seznam dolzine n+1, ki predstavlja ekvidistantno
%               razporejene tocke na intervlau [a,b]

%problema v n+1 ekvidistantno razporejenih to�kah na intervalu [a,b]

h = (b-a)/n; %dol�ina podintervala
x = a:h:b; %dol�ine n+1

%to sta vektorja dol�ine n+1
vek_q = q(x);
vek_r = r(x);

vek_p = zeros(n);
for i = 1:n
    vek_p(i) = p(x(i)+h/2);
end


B = zeros(n-1);
for i=1:n-1
    B(i)=vek_r(i+1)*h^2;
end
B(1)=B(1)+alpha*vek_p(1);
B(n-1)=B(n-1)+beta*vek_p(n);

nadd = zeros(1,n-1);
di = zeros(1,n-1);
podd = zeros(1,n-1);

for i = 1:n-1
   nadd(i) = -vek_p(i); %sicer no�emo elementa vek_p(1), ampak je ok, ker ga bo spdiags odrezal
   di(i) = vek_p(i+1)+vek_p(i)+vek_q(i+1)*h^2; 
   podd(i) = -vek_p(i+1); %no�emo vek_p(n), ampak ga bo spdiags odrezal
    
end

Bb = zeros(n-1,3);
Bb(:,1)=podd;
Bb(:,2)=di;
Bb(:,3)=nadd;

A = full(spdiags(Bb,[-1,0,1],n-1,n-1));
y_p = A\B;

y = zeros(n+1,1);
y(1) = alpha;
y(n+1) = beta;

for i=2:n
   y(i)=y_p(i-1); 
end


end

%matrike A=[1,2,3:4,5,6;7,8,9] ... ; pomeni novo vrstico
%A(:,1) ... 1. stolpec
%A(1,:) ... 1. vrstica