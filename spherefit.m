function [g,p,RMS] = spherefit(data)
% Hannah Greer - 10136620. Produced for CISC 271 - Winter 2016.
% This function fits a set of data to a sphere using least squares.
% This function relies on helper functions: 
% qrDataPrep() and backSub4x4
% it returns the center (g), the radius (p) and the RMS error

    [A,b] = qrDataPrep(data);
    
    % Find the QR decomposition of A as A=QR: 
    [Q,R] = qr(A,0);
    
    % Multiply the right hand side to get y = Q'b:
    y = (Q.')*b;
    
    % Solve Rx = y by back substitution:
    [x,y,z,sigma] = backsub4x4(R, y);
    g = [x;y;z];
    
    % Calculate radius:
    p = sqrt((x*x + y*y + z*z) - sigma);
    
    % Calculate Root Mean Square Error:
    e = zeros(1,100);
    for j=1:100
        diffvec = data(:,j) - g;
        e(1,j) = norm(diffvec) - p;
    end
    Esum = 0;
    for i=1:100
        Esum = Esum + e(1,i)*e(1,i);
    end
    RMS = sqrt(Esum/100);
    
end

