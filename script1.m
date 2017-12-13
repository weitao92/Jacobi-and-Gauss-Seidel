N = [50,100,200];

format long e;

for i = 1 : 1 : 3
    n = N(i);
    
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
    
    MJ = D \ (L + U);
    disp(max(abs(eig(MJ))));
    
    b = zeros(n,1);
    for j = 1 : 1 : n
        if j == 1
            b(j,1) = 1;
        else
            b(j,1) = 2;
        end
    end
    
    x0 = zeros(n,1);
    Niter = 30;
    tol = 1.0000000000e-05;
    myjacobi(A,b,x0,tol,Niter);
end



