function [x1,x2,x3,x4] = backsub4x4(R, y)
% Performs back substitution on an upper triangular,
% 4x4 matrix in the form Rx = b, with x unknown.
% This is hard coded for upper triangular,
% 4x4 matrix only.

x4 = y(4)/R(4,4);
x3 = (y(3) - R(3,4)*x4)/R(3,3);
x2 = (y(2) - R(2,3)*x3 - R(2,4)*x4)/R(2,2);
x1 = (y(1) - R(1,2)*x2 - R(1,3)*x3 - R(1,4)*x4)/R(1,1);

end

