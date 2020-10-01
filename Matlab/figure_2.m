function[] = figure_2(x)
% This function does the following:
% - plots IDF curves using the parameters contained in the input table
table = table2array(x);
x = linspace(0.5, 12);
y1 = zeros(1, length(x));
y2 = zeros(1, length(x));
y3 = zeros(1, length(x));
y4 = zeros(1, length(x));
for i = 1:100
y1(i) = table(7,1)/(x(i)+table(1,1))^table(4,1);
y2(i) = table(7,2)/(x(i)+table(1,2))^table(4,2);
y3(i) = table(7,3)/(x(i)+table(1,3))^table(4,3);
y4(i) = table(7,4)/(x(i)+table(1,4))^table(4,4);
end
plot(x, y1, 'b', x, y2, 'g', x, y3, 'r', x, y4, 'c')
xlabel('Rainfall duration (in hrs)')
ylabel('Rainfall intensity (in mm/h)')
title('IDF curves for T = 2, 5, 10 and 20 years')
legend('T_r=2 years','T_r=5 years','T_r=10 years','T_r=20 years')
end