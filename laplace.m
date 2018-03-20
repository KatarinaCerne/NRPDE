function lu = laplace(u,x,y,h)
% Description:
%  laplace computes an approximation for the value of the laplace operator
%  applied to a given function at some point in domain
%
% Definition:
%  lu = laplace(u,x,y,h)
%
% Input:
%  u    function of two variables
%  x,y  coordinates of the point in domain
%  h    offset (used for approximation) in x and y direction
%
% Output:
%  lu   approximate value of the laplace operator applied to u at (x,y)

lu = u(x+h,y)+u(x-h,y)+u(x,y+h)+u(x,y-h)-4*u(x,y);
lu = lu ./(h.^2); % h je vektor (hx, hy)
% v bistvu sta tudi x in y vektorja (ko rišemo, vstavimo noter X in Y iz
% meshgrida
end