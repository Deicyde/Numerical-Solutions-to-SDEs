function S = findS(h)
    C = [h, h^2/2; h^2/2, h^3/3];
    [V,D] = eig(C); % Note: Cinv = V*D*inv(V)
    S = V*sqrt(D)/V;
end

function Z = Gaussian()
    u1 = random('Uniform', 0, 1);
    u2 = random('Uniform', 0, 1);
    z1 = sqrt(-2*log(u1))*cos(2*pi*u2);
    z2 = sqrt(-2*log(u1))*sin(2*pi*u2);
    Z = [z1;z2];
end

N = 10000;
for h = [0.1, 1, 10]
    samples = zeros(N, 2);
    S = findS(h);
    trace(S)
    for i = 1:N
        X = S*Gaussian();
        samples(i,:) = X;
    end
    sample_covariance = cov(samples)
    expected_covariance = [h, h^2/2; h^2/2, h^3/3] % Should be ~equal to sample covariance
    sample_mean = mean(samples) % Should be ~(0,0)

    ev1 = mean(samples(:,1) .* samples(:,2))
    ev2 = mean(samples(:,1)) * mean(samples(:,2)) % ev1=ev2 if they are X1 and X2 are independent

    var1 = var(samples(:,1) + samples(:,2))
    var2 = var(samples(:,1)) + var(samples(:,2)) % var1=var2 if X1 and X2 are independent
end