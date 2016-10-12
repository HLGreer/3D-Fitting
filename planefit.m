function [RMS] = planefit(A) 
    % Hannah Greer - Winter 2016
    % This function fits a dataset (A) to a plane using Least Squares
    % Approximation. Returns the Root Mean Square Error.
    
    % calculate pHat: 
    [x,t] = size(A);
    pHat = (sum(A,2))/t;
    
    % Calculate Z, where Z = Aj - pHat:
    Z = zeros(x,t);
    for j = 1:t
        Z(:,j) = A(:,j) - pHat;
    end
    
    % find eigenvectors using pcaprelim: 
    [evalvec, meanvec, evecmat] = pcaprelim(Z);
    [m,n] = size(evecmat);
    
    % Find the normal vector as the smallest unit vector of eigenvectors:
    N = evecmat(:,n); % smallest eigenvector of the matrix Z
    
    % Calculate the root mean square error:
    e = zeros(t,1);
    Esum = 0;
    for i = 1:t
        e(1,i) = dot(Z(:,i),N); 
    end
    for i=1:t
        Esum = Esum + e(1,i)*e(1,i);
    end
    RMS = sqrt(Esum/t);
end

