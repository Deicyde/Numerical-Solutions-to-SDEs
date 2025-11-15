rng('default')

function y = U(a,b)
    y = random('Uniform', a, b);
end

function y = Bernoulli(x1, p1, x2)
    u = U(0,1);
    if u <= p1
        y = x1;
    else
        y = x2;
    end
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

N = 10000;
uniform_vars = zeros(N,1);
bernoulli_vars = zeros(N,1);
exponential_vars = zeros(N,1);
gaussian_vars = zeros(N,1);
for i = 1:N
    uniform_vars(i,1) = U(0,1);
    bernoulli_vars(i,1) = Bernoulli(0, 0.5, 1);
    exponential_vars(i,1) = Exponential(2);
    gaussian_vars(i,1) = Gaussian();
end

hold on
histogram(uniform_vars)
figure
histogram(bernoulli_vars)
figure
histogram(exponential_vars)
figure
histogram(gaussian_vars)

uniform_variance = var(uniform_vars) %expected: 1/12 = 0.833
uniform_mean = mean(uniform_vars) %expected: 1/2 = 0.5

bernoulli_variance = var(bernoulli_vars) %expected: 1/4 = 0.25
bernoulli_mean = mean(bernoulli_vars) %expected: 1/2 = 0.5

exponential_variance = var(exponential_vars) %expected: 1/4 = 0.25
exponential_mean = mean(exponential_vars) %expected: 1/2 = 0.5

gaussian_variance = var(gaussian_vars) %expected: 1
gaussian_mean = mean(gaussian_vars) %expected: 0