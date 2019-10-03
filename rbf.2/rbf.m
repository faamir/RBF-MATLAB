%in baraame shabake asabi RBF baraye darunyabi seri zamani ast.
%seri zamani ba tabdil fourier be shekle mosalasati bayad ijad gardand va dar
%baze mored nazar moshakhas shavand.baze dar in barname [-1,1] ast.hamchenin
%dar in barnaame az taabe gausi va taabe e multiqadric baraye darunyabi
%estefade shode ast.

x = -10:0.3:10; 
y = sin(3.14*x); 
xi = -10:0.05:10; 

%Matlab
yi = interp1(x,y,xi); 
 plot(x,y,'o',xi,yi, xi, sin(3.14*xi),'r'); title('RBF interpolation');

%RBF

op=rbfcreate(x, y,'RBFFunction', 'gaussian'); rbfcheck(op);
%op=rbfcreate(x, y,'RBFFunction', 'multiquadric', 'RBFConstant', 2); rbfcheck(op);

fi = rbfinterp(xi, op);



