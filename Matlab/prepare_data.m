function [data, rain, duration, intensity, period] = prepare_data()
% This function does the following:
% - loads the raw data
% - extracts unique vectors for each variable used in the analysis
% - creates return periods by calling period_compute (see below)
data = readtable('Data/Rainfall Data.csv', "VariableNamingRule", "preserve");
rain = data{:,"Amount of Rainfall (mm)"};
duration = data{:,"Duration (hour)"};
intensity= data{:,"Average Intensity (mm/h)"};
period = period_compute(rain);
end

function per = period_compute(v)
% This function does the following:
% - computes return periods (see equation 2.1 in the paper) 
per = zeros(length(v),1);
for i = 1:length(v)
    k = find(v<v(i));
    per(i) = 1/(1-length(k)/length(v));
end
end