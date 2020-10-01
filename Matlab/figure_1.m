function [] = figure_1(x, y)
% This function does the following:
% - produce a scatter plot of two vectors
scatter(x,y)
title('Fig. 1 Scatter plot of rainfall duration-intensity')
xlabel('Average intensity (in mm/hrs)')
ylabel('Event Duration (in hrs)')
end