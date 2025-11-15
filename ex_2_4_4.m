function y = U(a,b)
    y = random('Uniform', a, b);
end

function y = Gaussian()
    u1 = U(0,1);
    u2 = U(0,1);
    y = sqrt(-2*log(u1))*cos(2*pi*u2);
end

%KL short for Karhunen-Loeve Expansion
function phi = KLPhi(n, t, T)
    phi = (2*sqrt(2*T)/((2*n + 1)*pi)) * sin((2*n + 1)*pi*t/(2*T));
end

function [xs,ys] = KLExpansion(N, T, num_ts)
    Zs = zeros(1,N);
    ys = zeros(1,num_ts+1);
    for i = 1:N
        Zs(i) = Gaussian();
    end
    dt = T/num_ts;
    for i = 0:num_ts
        t = i*dt;
        sum = 0;
        for n = 1:N
            sum = sum + Zs(n)*KLPhi(n-1,t,T);
        end
        ys(i+1) = sum;
    end
    xs = 0:dt:T;
end

N = 100;
num_ts = 2^11;
T = 1;
dt = 1/num_ts;
[xs,ys] = KLExpansion(N, T, num_ts);

velocities = zeros(size(ys));
for i = 1:num_ts
    dW = ys(i+1) - ys(i);
    velocities(i) = dW/dt;
end

plot(xs, velocities);