function lu = laplace(u,x,y,h)

lu = u(x+h,y)+u(x-h,y)+u(x,y+h)+u(x,y-h)-4*u(x,y);
lu = lu/(h^2);
end