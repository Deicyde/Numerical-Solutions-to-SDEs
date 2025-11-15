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

function z_vec = CLTUniform(N, NumSamples)
    mu = 0.5;
    sigma = sqrt(1/12);
    z_vec = zeros(1,NumSamples);
    for j = 1:NumSamples
        A = zeros(1,N);
        for i = 1:N
            A(i) = Uniform(0, 1);
        end
        z_vec(j) = (mean(A) - mu)*sqrt(N)/sigma;
    end
end

function z_vec = CLTBernoulli(N,NumSamples)
    mu = 0.5;
    sigma = 0.5;
    z_vec = zeros(1,NumSamples);
    for j = 1:NumSamples
        A = zeros(1,N);
        for i = 1:N
            A(i) = Bernoulli(0, 0.5, 1);
        end
        z_vec(j) = (mean(A) - mu)*sqrt(N)/sigma;
    end
end

function z_vec = CLTExponential(N,NumSamples)
    mu = 0.5;
    sigma = 0.5;
    z_vec = zeros(1,NumSamples);
    for j = 1:NumSamples
        A = zeros(1,N);
        for i = 1:N
            A(i) = Exponential(2);
        end
        z_vec(j) = (mean(A) - mu)*sqrt(N)/sigma;
    end
end

function z_vec = CLTGaussian(N,NumSamples)
    mu = 0;
    sigma = 1;
    z_vec = zeros(1,NumSamples);
    for j = 1:NumSamples
        A = zeros(1,N);
        for i = 1:N
            A(i) = Gaussian();
        end
        z_vec(j) = (mean(A) - mu)*sqrt(N)/sigma;
    end
end

N = 1000; % Number of IID's to test Cental Limit Theorem (S_N -> Z as N -> inf)
NumSamples = 1000; % Number of S_N variables we want to generate to plot distribution (should be standard Gaussian)
hold on
histogram(CLTUniform(N, NumSamples))
figure
histogram(CLTBernoulli(N, NumSamples))
figure
histogram(CLTExponential(N, NumSamples))
figure
histogram(CLTGaussian(N, NumSamples))