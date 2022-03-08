function [force_length_regression] = get_muscle_force_length_regression()
%%% TASK 2

% Input Parameters
% data(:,1): samples of an independent variable
% data(:,2): corresponding samples of a dependent variable

% Output
% force_length_regression: the genered Gaussian model

%     WRITE CODE HERE
%      1) Use WebPlotDigitizer to extract force-length points
%     from Winters et al. (2011) Figure 3C, which is on Learn. Click
%     "View Data", select all, cut, and paste below. 
%     2) Normalize the data so optimal length = 1 and peak = 1. 
%     3) Return a Regression object that  uses Gaussian basis functions.

% Define data points
data = readtable('wpd_datasets.csv', 'NumHeaderLines', 2);
data = data{:, [1 2]};
% Normalization
data(:, 1) = normalize(data(:,1)) + 1;
data(:,2) = normalize(data(:,2), 'range');

% Regression with "fit" function with "gauss2" option as model type
force_length_regression = fit(data(:, 1), data(:, 2), 'gauss2');
% plot(force_length_regression, data(:,1), data(:,2));

end
