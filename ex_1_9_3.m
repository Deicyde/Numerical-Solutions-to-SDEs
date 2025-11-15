function y = U(a,b)
    y = random('Uniform', a, b);
end

function y = Exponential(lambda)
    u = U(0,1);
    y = -log(u)/lambda;
end

function y = Gaussian()
    u1 = U(0,1);
    u2 = U(0,1);
    y = sqrt(-2*log(u1))*cos(2*pi*u2);
end

N = 100;
NBins = 30;
uniform_vars = zeros(N,1);
exponential_vars = zeros(N,1);
gaussian_vars = zeros(N,1);
for i = 1:N
    uniform_vars(i,1) = U(0,1);
    exponential_vars(i,1) = Exponential(2);
    gaussian_vars(i,1) = Gaussian();
end

uniform_dist = makedist("Uniform", "lower",0, "upper",1);
exponential_dist = makedist("Exponential", "mu", 0.5);
gaussian_dist = makedist("Normal", "mu", 0, "sigma", 1);
% Output Description: Should be all zeros.
% 0 = Test Passed (Does not reject null hypothesis)
% 1 = Tets Fauled (Reject null hypothesis)
uniform_05_test = chi2gof(uniform_vars, "NBins", 30, "CDF", uniform_dist, "Alpha", 0.05)
uniform_01_test = chi2gof(uniform_vars, "NBins", 30, "CDF", uniform_dist, "Alpha", 0.01)
exponential_05_test = chi2gof(exponential_vars, "NBins", 30, "CDF", exponential_dist, "Alpha", 0.05)
exponential_01_test = chi2gof(exponential_vars, "NBins", 30, "CDF", exponential_dist, "Alpha", 0.01)
gaussian_05_test = chi2gof(gaussian_vars, "NBins", 30, "CDF", gaussian_dist, "Alpha", 0.05)
gaussian_01_test = chi2gof(gaussian_vars, "NBins", 30, "CDF", gaussian_dist, "Alpha", 0.01)