function [best_h, min_error] = find_best_h(u,op,opa,x,y)
% najde najbolj�i mo�en h za aproksimacijo operatorja pri neki (x,y) to�ki v
% domeni
%
% best_h = find_best_h(u,op,opa,x,y)
%
%  u          funkcija 2 spremenljivk
%  op         diferencialni operator
%  opa        aproksimacija operatorja
%  x,y        koordinate to�ke v domeni
%
%  best_h     h pri katerem je napaka |op-opa| najmanj�a
%  min_error  napaka |op-opa| pri najbolj�em h

hmin = 10; hmax = 10^5;
H = 1 ./ linspace(hmin,hmax,hmax/hmin); 
%vektor oblike (1/hmin, 1/bla, ..., 1/hmax)
%i��emo, kateri od teh je najbolj�i
best_h = 0; min_error = 10^6;
for i=1:hmax/hmin
    h = H(i);
    if abs(op(x,y) - opa(u,x,y,h)) < min_error
        best_h = h; min_error = abs(op(x,y) - opa(u,x,y,h));
    end
end
end