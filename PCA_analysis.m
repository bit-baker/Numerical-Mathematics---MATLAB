function [L, Vals, scores] = PCA_analysis(data, MuCovF)
% nandinic_fina1_p3: The below function computes PCA analysis for given data
% Determines the Principle Components, directions and the scores using
% centered data.
% Inputs: It takes 2 inputs, ana rray of data with size samples *
% data_components and a function muConvF which is a handle to a function
% that computes mean adn covariance matrix of the data.
% 
% Outputs: It returns 3 outputs:
%       L: Principal Component Vectors (column vectors) sorted from largest
%           to smallest.
%       V : Principal Directions Matrix
%       Scores : PCA Scores of given data.

[samples, cmpts] = size(data); % Size of the given data
[mu,covar_matrix] = MuCovF(data); % Mean and Covariance MAtrix of teh data

for i=1:cmpts
    data(:,i) = data(:,i) - mu(i); % Centering data component at mean of the data
end

[Vals,Vectrs] = eigs(covar_matrix); % Eigen Values and Eigen Vectors of given CoVariance Matrix
L = diag(Vectrs);
scores = data * Vals; % Computing PCA Scores of given data


