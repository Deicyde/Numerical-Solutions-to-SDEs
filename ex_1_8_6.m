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

function PlotDerivative(path, N)
    S_05 = path(N/2);
    xs = zeros(1,N/2);
    ys = zeros(1,N/2);
    for i = 1:(N/2)
        h = i/N;
        xs(i) = h;
        ys(i) = (S_05 - path(N/2 + i))/h;
    end
    plot(xs, ys);
end

N = 500;
path = RandomWalk(N);
PlotDerivative(path, N);