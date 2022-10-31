% Script for representing the loss of orhtogonality
fs = {@qr, @qr_classical, @qr_modified, @qr_householder}; % Considering given classical&modified Gram-Schmidt and household reflectors
X = [2,3,4,5,6,7,8,9,10,11];
E = zeros(4, 10); % Considering zero matrix
for n=2:11
    H = hilb(n); % Hilbert(n*n) matrix
    Y = zeros(4); % Zero matrix for errors
    for i = 1:length(fs)
       [Q,R] = fs{i}(H); % Calculating  ||Qt.Q-I|| 
       error = norm(transpose(Q)*Q - eye(length(Q))); % Calculating error
       E(i,n-1) = error;
    end
end
% Single Semilogy Plot
semilogy(X,E(1,:),X,E(2,:), X, E(3,:), X, E(4,:))

xlabel('Hilbert Matrix n*n')
ylabel('Loss of Orthogonality')
legend('QrDecomposition','QrClassical','QrModified', 'QrHouseholder')