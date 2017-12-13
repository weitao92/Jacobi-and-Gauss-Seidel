format long e;
W = 0:0.1:2;
radius = 1:21;
n = 20;

D = zeros(n,n);
L = zeros(n,n);
U = zeros(n,n);
    
for row = 1 : 1 : n
   if row - 1 > 0
      L(row, row-1) = 1/2;
   end
        
   D(row,row) = 2;
        
   if row + 1 <= n
      U(row, row+1) = 1/2;
   end
end

A = D - L - U;

for i = 1 : 1 : 21
    w = W(1,i);
    
    SOR = (D - w*L) \ ((1-w)*D + w*U);
    radius(1,i) = max(abs(eig(SOR)));
end

plot(W, radius);