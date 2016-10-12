# 3D-Fitting
Functions created for the use of fitting 3D cartesian point data to 3D models. 

Spherefit.m : Fits raw data to a sphere. Relies on qrDataPrep.m and backsub4x4.m
qrDataFit.m : Takes an N-by-3 Matrix with Raw Coordinate Data and Produces a QR decomposable form of the data. 
backsub4x4.m : Performs back substitution on a 4x4 Matrix. 

planefit.m : Fits a data set to a plane using Least Squares Regression. Returns the error metric.

Originally produced for CISC 271, Scientific Computing, at Queen's University, Canada. Algorithms adapted from Class Notes for CISC 271, by
Dr. Randy Ellis. Implementation by Hannah Greer, Winter 2016. 
Since adapted for other personal usage. 
