function [ X ] = mygauseidel( A, b, x0, tol, Niter)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
[n,n] = size(A);
Results = [];
finished = 0;
X = x0;
xs = A \ b;

k = 1;

while k <= Niter
    R = A * X - b;
    maxR = 0;
    
    for i = 1 : 1 : n
        if abs(R(i,1)) > maxR
            maxR = abs(R(i,1));
        end
    end
    
    error = X - xs;
    maxE = 0;
    
    for i = 1 : 1 : n
        if abs(error(i,1)) > maxE
            maxE = abs(error(i,1));
        end
    end
    
    Results = [Results; k, maxR, maxE];
    
    for i = 1 : 1 : n
        temp = b(i,1);
        for j = 1 : 1 : i - 1
            temp = temp - A(i,j) * X(j,1);
        end
        for j = i + 1 : 1 : n          
            temp = temp - A(i,j) * x0(j,1);       
        end
        
        X(i,1) = temp / A(i,i);
    end
    
    diff = X - x0;
    maxD = 0;
    for i = 1 : 1 : n
        if abs(diff(i,1)) > maxD
            maxD = abs(diff(i,1));
        end
    end
    
    maxX = 0;
    for i = 1 : 1 : n
        if abs(X(i,1)) > maxX
            maxX = abs(X(i,1));
        end
    end
    
    if (maxD / maxX) < tol
        finished = 1;
        break;
    end
    
    k = k + 1;
    x0 = X;
    
end

if finished == 1
    
else 
    disp('Jacobi failed to converge after maximum iterations');
end

disp(Results);

end

