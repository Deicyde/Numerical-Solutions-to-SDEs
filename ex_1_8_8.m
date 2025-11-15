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

function new_path = ConstructBrownianBridge(path, N)
    new_path = zeros(1,N+1);
    for i=1:(N+1)
        new_path(i) = path(i) - path(N+1)*((i-1)/N);
    end
end

function half_path = GetHalfPath(path, N)
    half_path = zeros(1, 1 + N/2);
    S_ti = 0;
    step = sqrt(1/N);
    half_path(1) = 0;
    for i = 1:(N/2)
        X_i = (path(2*i) - path(2*i - 1))/step;
        X_ip1 = (path(2*i + 1) - path(2*i))/step;
        S_ti = S_ti + (X_i + X_ip1)*step;
        half_path(i+1) = S_ti;
    end
end

N = 100;
path = RandomWalk(N);
path = ConstructBrownianBridge(path, N);
xs = 0:(1/N):1;
plot(xs,path); 
hold on
path2 = GetHalfPath(path, N);
xs = 0:(2/N):1;
plot(xs,path2);