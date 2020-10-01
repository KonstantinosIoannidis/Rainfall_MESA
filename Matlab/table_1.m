function output = table_1(x, y, z)
% This function does the following:
% - computes descriptives statistics of three variables
% - produces a table of the statistics
maximums = [max(x), max(y), max(z)];
minimums = [min(x), min(y), min(z)];
means = [mean2(x), mean2(y), mean2(z)];
sds = [std(x), std(y), std(z)];
q25s = [quantile(x, 0.25), quantile(y, 0.25), quantile(z, 0.25)];
q50s = [quantile(x, 0.50), quantile(y, 0.50), quantile(z, 0.50)];
q75s = [quantile(x, 0.75), quantile(y, 0.75), quantile(z, 0.75)];
output = [maximums; minimums; means; sds; q25s; q50s; q75s];
output = array2table(round(output, 2));
output.Properties.VariableNames = {'Amount (R)' 'Duration (D)' 'Intensity (I)'};
output.Properties.RowNames = {'Maximum' 'Minimum' 'Mean' 'SD' '1st quantile' '2nd quantile' '3rd quantile'};
end