function output = table_3(x, y, z)
% This function does the following:
% - estimates IDF curves by calling function idf_fit4 (see below)
% - produces a table of estimated parameters (point estimate and 0.95 confidence interval)
coef = coeffvalues(idf_fit4(x, y, z));
ci = confint(idf_fit4(x, y, z));
output = [coef; ci];
output = transpose(output);
output = array2table(output);
output.Properties.VariableNames = {'Estimate' 'Lower95' 'Upper95'};
output.Properties.RowNames = {'a' 'b' 'K' 'd'};
end

function [out1, out2] = idf_fit4(x, y, z)
% This function does the following:
% - estimates IDF curves with 4 parameters (see equation 2.8 in the paper)
% - stores the result (locally) as two structures, one with estimates and one with goodness of fit measures
ft = fittype( '(c * y^d)/(x+a)^b', 'independent', {'x', 'y'}, 'dependent', 'z' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.Lower = [0 0 0 0];
opts.StartPoint = [0.5 0.5 0.5 0.5];
[out1, out2] = fit( [x, y], z, ft, opts );
end