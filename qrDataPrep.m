function [A,b] = qrDataPrep(raw_data, N)
% Originally produced for Assignment 3 - CISC 271 - Winter 2016
% Takes the raw data provided in Assignment 3 (CISC 271 - Winter 2016)
% and produces the A and b for the equation of Ax=b for later QR
% decoposition and least squares solution.

% need to find Ax=b equation, where A is [-2xj^T 1].
A = cat(2,zeros(N,3),ones(N,1));
for j=1:N
    for i=1:3
        A(j,i) = raw_data(i,j)*(-2);
    end
end

% Now create b for the equation
b = zeros(N,1);
for j=1:N
    b(j) = -(raw_data(:,j))'*(raw_data(:,j));
end

end

