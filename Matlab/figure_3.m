function[] = figure_3(s)
% This function does the following:
% - 3Dplots an IDF surface using the parameters contained in the input table
s = table2array(s);
fh = @(x,y) (s(3,1)*(y.^s(4,1)))/((x+s(1,1)).^s(2,1));
fsurf(fh, [0, 12, 1, 100])
title('IDF curve with duration, intensity and return period')
xlabel('Duration (in hrs)')
ylabel('Return Period (in years)')
zlabel('Intensity (in mm/hrs)')
end