function bu = biharmonic(u,x,y,h)
% Description:
%  biharmonic computes an approximation for the value of the biharmonic operator
%  applied to a given function at some point in domain
%
% Definition:
%  bu = biharmonic(u,x,y,h)
%
% Input:
%  u    function of two variables
%  x,y  coordinates of the point in domain
%  h    offset (used for approximation) in x and y direction
%
% Output:
%  bu   approximate value of the biharmonic operator applied to u at (x,y)

bu = u(x-2*h,y)+u(x+2*h,y)+u(x,y-2*h)+u(x,y+2*h)-...
    8*(u(x-h,y)+u(x+h,y)+u(x,y-h)+u(x,y+h))+...
    2*(u(x+h,y+h)+u(x+h,y-h)+u(x-h,y+h)+u(x-h,y-h))+...
    20*u(x,y);
bu = bu ./(h.^4);
end