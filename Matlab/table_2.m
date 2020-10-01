function output = table_2(x, y, z, t)
% This function does the following:
% - estimates IDF curves by calling function idf_fit3 (see below)
% - produces a table of estimated parameters (point estimate and 0.95 confidence interval)
% Note: The estimation in done separately for the return periods contained in vector t
coef1 = coeffvalues(idf_fit3(x, y, z, t(1)));
ci1 = confint(idf_fit3(x, y, z, t(1)));
coef2 = coeffvalues(idf_fit3(x, y, z, t(2)));
ci2 = confint(idf_fit3(x, y, z, t(2)));
coef3 = coeffvalues(idf_fit3(x, y, z, t(3)));
ci3 = confint(idf_fit3(x, y, z, t(3)));
coef4 = coeffvalues(idf_fit3(x, y, z, t(4)));
ci4 = confint(idf_fit3(x, y, z, t(4)));
est1 = [coef1(1), ci1(1,1), ci1(2,1), coef1(2), ci1(1,2), ci1(2,2), coef1(3), ci1(1,3), ci1(2,3)];
est2 = [coef2(1), ci2(1,1), ci2(2,1), coef2(2), ci2(1,2), ci2(2,2), coef2(3), ci2(1,3), ci2(2,3)];
est3 = [coef3(1), ci3(1,1), ci3(2,1), coef3(2), ci3(1,2), ci3(2,2), coef3(3), ci3(1,3), ci3(2,3)];
est4 = [coef4(1), ci4(1,1), ci4(2,1), coef4(2), ci4(1,2), ci4(2,2), coef4(3), ci4(1,3), ci4(2,3)];
output = [est1; est2; est3; est4];
output = transpose(output);
output = array2table(output);
output.Properties.VariableNames = {'T=2 years' 'T=5 years' 'T=10 years' 'T=20 years'};
output.Properties.RowNames = {'a' 'a_lower' 'a_upper' 'b' 'b_lower' 'b_upper' 'c' 'c_lower' 'c_upper'};
end

function [out1, out2] = idf_fit3(x, y, z, t)
% This function does the following:
% - estimates IDF curves with 3 parameters (see equation 2.3 in the paper)
% - stores the result (locally) as two structures, one with estimates and one with goodness of fit measures
% Notes:
% - for each value of t, I truncate the data that occur once every t(i) years or more
% - the truncation is on the basis of variable x which is not used in the estimation
threshold = quantile(x, 1 - 1/t);
y = y(x > threshold);
z = z(x > threshold);
ft = fittype( 'c/(x+a)^b', 'independent', 'x', 'dependent', 'y' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.Lower = [-0.5 -Inf -Inf];
opts.StartPoint = [0.5 0.5 0.5];
[out1, out2] = fit( y, z, ft, opts );
end