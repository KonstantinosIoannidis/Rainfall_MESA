function [] = figure_4(x, y, z, t, rep, size)
% This function does the following:
% - produces a matrix of 12 scatter plots
% - each scatter plot is between a parameter and the achieved R^2
output = monte_carlo(x, y, z, t, rep, size);
output = table2array(output);
subplot(2,6,1)
scatter(output(:,1),output(:,4), 'blue'); xlabel('a'); ylabel('R Squared')
subplot(2,6,2)
scatter(output(:,2),output(:,4), 'blue'); xlabel('b');ylabel('R Squared')
subplot(2,6,3)
scatter(output(:,3),output(:,4), 'blue'); xlabel('c');ylabel('R Squared')
subplot(2,6,4)
scatter(output(:,5),output(:,8), 'green'); xlabel('a');ylabel('R Squared')
subplot(2,6,5)
scatter(output(:,6),output(:,8), 'green'); xlabel('b');ylabel('R Squared')
subplot(2,6,6)
scatter(output(:,7),output(:,8), 'green'); xlabel('c');ylabel('R Squared')
subplot(2,6,7)
scatter(output(:,9),output(:,12), 'red'); xlabel('a');ylabel('R Squared')
subplot(2,6,8)
scatter(output(:,10),output(:,12), 'red'); xlabel('b');ylabel('R Squared')
subplot(2,6,9)
scatter(output(:,11),output(:,12), 'red'); xlabel('c');ylabel('R Squared')
subplot(2,6,10)
scatter(output(:,13),output(:,16), 'cyan'); xlabel('a');ylabel('R Squared')
subplot(2,6,11)
scatter(output(:,14),output(:,16), 'cyan'); xlabel('b');ylabel('R Squared')
subplot(2,6,12)
scatter(output(:,15),output(:,16), 'cyan'); xlabel('c');ylabel('R Squared')
sgtitle('Scatter plots of parameters and R2')
end

function output =  monte_carlo(x, y, z, t, rep, size)
% This function does the following:
% - performs sensitivity analysis by calling sensitivity
% - stores the output (locally) as a table
[a1, b1, c1, r1] = sensitivity(x, y, z, t(1), rep, size, -0.5,-0.4, 0.3, 0.5, 4, 5);
[a2, b2, c2, r2] = sensitivity(x, y, z, t(2), rep, size, -0.5, 1, 0.5, 1, 10, 15);
[a3, b3, c3, r3] = sensitivity(x, y, z, t(3), rep, size, -0.5, 1, 0.4, 1, 13, 17);
[a4, b4, c4, r4] = sensitivity(x, y, z, t(4), rep, size, -0.5, 1, 0.4, 1, 19, 24);
temp1 = [a1; b1; c1; r1];
temp2 = [a2; b2; c2; r2];
temp3 = [a3; b3; c3; r3];
temp4 = [a4; b4; c4; r4];
output = [temp1; temp2; temp3; temp4];
output = transpose(output);
output = array2table(output);
output.Properties.VariableNames = {'a (T=2)' 'b (T=2)' 'c (T=2)' 'R2 (T=2)' 'a (T=5)' 'b (T=5)' 'c (T=5)' 'R2 (T=5)' 'a (T=10)' 'b (T=10)' 'c (T=10)' 'R2 (T=10)' 'a (T=20)' 'b (T=20)' 'c (T=20)' 'R2 (T=20)'};
end

function[a_opt ,b_opt, c_opt, r_opt] = sensitivity(x, y, z, n, rep, size, amin, amax, bmin, bmax, cmin, cmax)
% This function does the following:
% - chooses the parameter set that achieves the highest R^2 for each iteration by calling rsquared
% - iterates the above step as many times as specified in "rep"
% - the real data that each model is compared to follow the truncation of main estimation 
% - stores the output (locally) as a table
threshold = quantile(x, 1 - 1/n);
y = y(x > threshold);
z = z(x > threshold);
a_opt = zeros(1, rep);
b_opt = zeros(1, rep);
c_opt = zeros(1, rep);
r_opt = zeros(1, rep);
for i = 1:rep
    [a, b, c, r] = rsquared(y, z, size, amin, amax, bmin, bmax, cmin, cmax);
    [value k] = max(r);
    a_opt(i) = a(k);
    b_opt(i) = b(k);
    c_opt(i) = c(k);
    r_opt(i) = r(k);
end
end

function[a, b, c, r] = rsquared(x, y, size, amin, amax, bmin, bmax, cmin, cmax)
% This function does the following:
% - computes R^2 of goodness fit on data (x,y) to a model with randomly drawn parameters
% - the parameters are drawn from appropriate uniform distributions  
% - the bounds of the uniform distributions are given in the last 6 inputs
% - the computation is executed as many times as specified in "size"
% - stores the output (locally) as a table
a = unifrnd(amin, amax, 1, size);
b = unifrnd(bmin, bmax, 1, size);
c = unifrnd(cmin, cmax, 1, size);
r = zeros(1, size);
yhat = zeros(length(x), size);
for i = 1:size
    sse = 0;
    sst = 0;
    for j = 1:length(x)
        yhat(j, i) = c(i)/((x(j)+a(i))^b(i));
        sse = sse + (y(j)-yhat(j,i))^2;
        sst = sst + (y(j)-mean(y))^2;
    end
    r(i) = 1 - sse/sst;
end
end