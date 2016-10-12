function [A,b] = qrDataPrep(raw_data, N)
% Originally produced for Assignment 3 - CISC 271 - Winter 2016.
% Takes raw data points as a N by 3 matrix (each row containing the x, y,
% and z coordinates for a point) and produces the A Matrix and b vector for
% the equation of Ax=b for later QR decomposition and least squares 
% solution.
% Adapted from Class Notes for CISC 271, by Dr. Randy Ellis.

% Need to find Ax=b equation, where A is [-2xj^T 1].
A = cat(2,zeros(N,3),ones(N,1));
for j=1:N
    for i=1:3
        A(j,i) = raw_data(i,j)*(-2);
    end
end

% Now create b for the equation.
b = zeros(N,1);
for j=1:N
    b(j) = -(raw_data(:,j))'*(raw_data(:,j));
end

end

