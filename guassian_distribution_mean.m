function [data] = guassian_distribution_mean(nSamp1es, F, mu, sigma)
% nandinic_fina1_p2: The below function determines a dataset given a model
% assuming that all inputs follow Gaussian Distribution.
%
% Inputs: It takes 4 inputs-
% nSamples: Number of samples
% F:  The model Function
% mu: A Column Vector containing the input means of size nInputs
% Sigma: The Covariance Matrix
% Outputs: A single array which contains the data of size samples *
% data_components.
% 
% The model function F The call to this function is outVa1 = F(inVa1) ,where inVa1 is a 
% (nSamp1es X nlnput) array and outVa1 is a (nSamp1es X nData) array.
mu_size = length(mu);
inputs = zeros(nSamp1es, mu_size);
i=1;
while i <= mu_size
    inputs(:,i) = normalRand(nSamp1es, mu(i), sigma(i)); % Computing Gaussian Distribution
    i = i+1;
end
data = F(inputs); % Making use of given function to generate the data
end
