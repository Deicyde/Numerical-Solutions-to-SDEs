function y = Uniform(a,b)
    y = random('Uniform', a, b);
end

function y = Bernoulli(x1, p1, x2)
    u = Uniform(0,1);
    if u <= p1
        y = x1;
    else
        y = x2;
    end
end

function y = Exponential(lambda)
    u = Uniform(0,1);
    y = -log(u)/lambda;
end

function y = Gaussian()
    u1 = Uniform(0,1);
    u2 = Uniform(0,1);
    y = sqrt(-2*log(u1))*cos(2*pi*u2);
end

function mse_avg = LLNUniform(N, NumSamples)
    mu = 0.5;
    mse_vec = zeros(1,NumSamples);
    for j = 1:NumSamples
        A = zeros(1,N);
        for i = 1:N
            A(i) = Uniform(0, 1);
        end
        mse_vec(j) = (mean(A) - mu)^2;
    end
    mse_avg = mean(mse_vec);
end

function mse_avg = LLNBernoulli(N,NumSamples)
    mu = 0.5;
    mse_vec = zeros(1,NumSamples);
    for j = 1:NumSamples
        A = zeros(1,N);
        for i = 1:N
            A(i) = Bernoulli(0, 0.5, 1);
        end
        mse_vec(j) = (mean(A) - mu)^2;
    end
    mse_avg = mean(mse_vec);
end

function mse_avg = LLNExponential(N,NumSamples)
    mu = 0.5;
    mse_vec = zeros(1,NumSamples);
    for j = 1:NumSamples
        A = zeros(1,N);
        for i = 1:N
            A(i) = Exponential(2);
        end
        mse_vec(j) = (mean(A) - mu)^2;
    end
    mse_avg = mean(mse_vec);
end

function mse_avg = LLNGaussian(N,NumSamples)
    mu = 0;
    mse_vec = zeros(1,NumSamples);
    for j = 1:NumSamples
        A = zeros(1,N);
        for i = 1:N
            A(i) = Gaussian();
        end
        mse_vec(j) = (mean(A) - mu)^2;
    end
    mse_avg = mean(mse_vec);
end

N = 1000; % Number of IID's to test Law of Large numbers (mse -> 0 as N -> inf)
NumSamples = 100; % Number of A_N variables we want to generate to estimate expected value (A_N - mu)^2
mse_bernoulli = LLNBernoulli(N, NumSamples)
mse_uniform = LLNUniform(N, NumSamples)
mse_exponenital = LLNExponential(N, NumSamples)
mse_gaussian = LLNGaussian(N, NumSamples)