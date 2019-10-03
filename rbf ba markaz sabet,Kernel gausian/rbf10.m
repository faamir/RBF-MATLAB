 
%RBF
%in baraame shabake asabi RBF baraye darunyabi seri zamani ast.
%seri zamani ba tabdil fourier be shekle mosalasati bayad ijad gardand va dar
%baze mored nazar moshakhas shavand.baze dar in barname [-10,10] ast.
%tedad marakeze sabet ba tavajoh be gaame baze sakhte mishavand.hamchenin dar in barnaame az marakeze
%sabet va kernel Gausian baraye darunyabi estefade gardid.in marakez be surate random ijad
%mishavand.
close all
clear all
clc;
%tolid data test va training dar baaze [-10,10] va gaame 0.1 , 0.05
x=-10:0.05:10;
xt=-10:0.1:10;

%tolid data training
for i=1:length(x)
y(i)=3.99*(cos(pi*x(i)))+0.3*randn;
d=0;
e=0;
e=(e+abs(y(i)-d))/200
end
% tolide 200 markaze random sabet az nemune
index=randperm(numel(x));
v=x(index(1:200));
p=sort(v);
markaz=p';
% sakhte matrix darunyabi baraye data training va taabe kernel e Gausian
p=length(x);
p1=length(markaz);
for i=1:1:p
 
for j=1:1:p1
mu=x(i)-markaz(j);
k=mu^2/0.02;
gtr(i,j)=exp(-0.5*k);
 
end
end
I=eye(200);
lamda=1;
% tanzim factor vazn
W=inv((gtr'*gtr)+ lamda * I)*gtr'*y';
%xt=-10:0.01:10
%yt khoruji matlub ast.
for i=1:length(xt)
yt(i)=3.99*(cos(pi*xt(i)));
test(i,j)=exp(-0.5*k);
 d=0;
e1=0;
e1=(e1+abs(yt(i)-d))/200
end
% sakhte matrix darunyabi baraye data test va taabe kernel e Gausian
p2=length(xt);
for i=1:1:p2
 
for j=1:1:p1
mu=xt(i)-markaz(j);
k=mu^2/.02;
gt(i,j)=exp(-0.5*k);
 
end
end
dtest=gt*W;

% plot haa.
figure;
plot(xt,yt,'b-',xt,dtest,'r');
xlabel('X(test)');
ylabel('Y(test)');
mu = legend('khoruji morede entezar','monhani taghribi',2);

