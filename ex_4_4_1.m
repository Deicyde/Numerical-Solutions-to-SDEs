function y = Bernoulli(x1, p1, x2)
    u = random('Uniform', 0, 1);
    if u <= p1
        y = x1;
    else
        y = x2;
    end
end

function path = RandomWalk(N)
    S_tn = 0;
    step = sqrt(1/N);
    path = zeros(1,N+1);
    path(1) = 0;
    for n = 1:N
        S_tn = S_tn + Bernoulli(-1, 0.5, 1) * step;
        path(n+1) = S_tn;
    end
end

N = 2^10;
X_0 = 100;
W = RandomWalk(N);
path = (W +  sqrt(X_0)).^2;
xs = 0:(1/N):1;
plot(xs,path);
