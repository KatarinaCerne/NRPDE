function bu = biharmonic(u,x,y,h)

bu = u(x-2*h,y)+u(x+2*h,y)+u(x,y-2*h)+u(x,y+2*h)-8*(u(x-h,y)+u(x+h,y)+u(x,y-h)+u(x,y+h))+2*(u(x+h,y+h)+u(x+h,y-h)+u(x-h,y+h)+u(x-h,y-h))+20*u(x,y);
bu = bu/(h^4);
end