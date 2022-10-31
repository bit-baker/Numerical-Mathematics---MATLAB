% Script that prouces the time needed to compute the LU factoriztion for
% random square matrices(n = 10 to 1000)

pow = 4;
max = power(10,pow); 
Y = zeros(10,max);  
X = round(logspace(1, pow,50)); % determining matrix sizes using logspace 

for k=1:length(X)
    n = X(k);
    A = rand(n,n) + n * eye(n); % Random Strictly Diagonally Dominant Matrix
    tic         % Timer
    lu(A);      % LU Decomposition
    Y(n)= toc;  % Timer
    
end

Y_plot = zeros(length(X)); %  EmpiricalData
Y_trend =  zeros(length(X)); % AnalyticalData
for i=1:length(X)
    Y_plot(i) = Y(X(i));
    x = X(i);
    Y_trend(i) = (2*x^3)/6 ; % Computing time
end

scaling_factor = 1E-9; % Scaling Factor 
% Plot
loglog(X,Y_plot,X,Y_trend,X,Y_trend*scaling_factor) % Plotting using loglog scale

ylabel('Log(Time Taken)')
xlabel('Log(MatrixSize)')
legend('Empirical Trend','Analytical Trend','Scaled Analytical Trend (1E-9)')