function y = Exponential(lambda)
    u = random('Uniform', 0, 1);
    y = -log(u)/lambda;
end

function y = Bernoulli(x1, p1, x2)
    u = random('Uniform', 0, 1);
    if u <= p1
        y = x1;
    else
        y = x2;
    end
end

function T_is_1 = TelegraphicNoise(T)
    t = 0;
    state = Bernoulli(0, 0.5, 1);
    while t < T
        dt = Exponential(0.5);
        state = 1 - state;
        t = t + dt;
    end
    if state == 0
        T_is_1 = 1;
    else
        T_is_1 = 0;
    end
end

N = 100000;
T = 10;
sum_freq1 = 0;
for i = 0:N
    sum_freq1 = sum_freq1 + TelegraphicNoise(T);
end
avg_freq1 = sum_freq1/N