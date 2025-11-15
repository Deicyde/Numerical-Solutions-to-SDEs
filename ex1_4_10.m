rng('default')

function y = U(a,b)
    y = random('Uniform', a, b);
end

function y = Exponential(lambda)
    u = U(0,1);
    y = -log(u)/lambda;
end

function m = MeanGreaterThan(vec, a)
    m = mean(vec(vec>a));
end

N = 10000;
lambda = 0.5;
exponential_vars = zeros(N,1);
for i = 1:N
    exponential_vars(i,1) = Exponential(lambda);
end

avg_0 = MeanGreaterThan(exponential_vars, 0)
avg_1 = MeanGreaterThan(exponential_vars, 1)
avg_2 = MeanGreaterThan(exponential_vars, 2)
avg_3 = MeanGreaterThan(exponential_vars, 3)
avg_4 = MeanGreaterThan(exponential_vars, 4)