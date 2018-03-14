function [U,X,Y,A,B]=resiPoissonDif(a,b,c,d,F,Gab,Gcd,Gac,Gbd,J,K)

dx = (b-a)/(J+1);
dy = (d-c)/(K+1);
d2 = dx^2*dy^2/(2*(dx^2+dy^2));
thetax = d2/dx^2;
thetay = d2/dy^2;

[X,Y] = meshgrid(a:dx:b, c:dy:d);

A1 = ones(J*K,1);
A2 = (-thetax)*ones(J*K-1,1);
A3 = (-thetay)*ones(J*K-3,1);
A4 = (-thetax)*ones(J*K-1,1);
A5 = (-thetay)*ones(J*K-3,1);


for i=1:J*K-1
    if mod(i,J)==0:
        A2(i)=0;
    end
end



end