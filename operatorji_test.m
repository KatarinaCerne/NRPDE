u = @(x,y) exp(-x.^2 - y.^2); 
%x in y sta vektorja, ker boo vstavili noter X in Y
%u(x,y) pa skalar!!
lu = @(x,y) 4*u(x,y) .* (-1 + x.^2 + y.^2);
bu = @(x,y) 16*u(x,y) .* (2 + x.^4 - 4*y.^2+ y.^4 + 2*x.^2 .* (-2 + y.^2));
% laplace(u,0,0,0.01)
% biharmonic(u,0,0,0.01)

[hl,errl] = find_best_h(u,lu,@laplace,0,0);
[hb,errb] = find_best_h(u,bu,@biharmonic,0,0);

h = 0.05; os = -1:h:1;
[X,Y] = meshgrid(os, os);  %!!!

figure
subplot(2,3,1)       %da na 1. mesto v 2x3 polje
surf(X,Y,lu(X,Y))
title('Laplace')

subplot(2,3,2)       %da na 2. mesto v 2x3 polje
surf(X,Y,laplace(u,X,Y,h))
title('Laplace - aproksimacija')

subplot(2,3,3)       
surf(X,Y,lu(X,Y)-laplace(u,X,Y,h))
title('Laplace - napaka')

subplot(2,3,4)       
surf(X,Y,bu(X,Y))
title('Biharmonièna')

subplot(2,3,5)       
surf(X,Y,biharmonic(u,X,Y,h))
title('Biharmonic - aproksimacija')

subplot(2,3,6)       
surf(X,Y,bu(X,Y)-biharmonic(u,X,Y,h))    
title('Biharmonièna - napaka')

%%%%%%%%%%%%%%%%%%%%%%%%%%
%vektor [a,b,c] je vodoraven, vektor [a;b;c] je navpièen