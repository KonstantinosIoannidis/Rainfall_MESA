% This the only file that needs to execute.

% Loads data and gets it ready for analysis
[data, rain, duration, intensity, period] = prepare_data();

% Create Table 1
table1 = table_1(rain, duration, intensity);

% Create Figure 1
figure
figure_1(intensity, duration)

% Create Table 2
returns = [2, 5.5, 11.2, 18.2];
table2 = table_2(rain, duration, intensity, returns);

% Create Table 3
table3 = table_3(duration, period, intensity);

% Create Figure 2
figure
figure_2(table2)

% Create Figure 3
figure
figure_3(table3)

% Create Figure 4
figure_4(rain, duration, intensity, returns, 100, 10000);