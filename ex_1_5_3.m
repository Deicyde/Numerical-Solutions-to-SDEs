function z = Gaussian(mean, variance)
    u1 = random('Uniform', 0, 1);
    u2 = random('Uniform', 0, 1);
    z = sqrt(-2*log(u1))*cos(2*pi*u2)*variance + mean;
end

function [x,y] = GenerateY(n)
    x = random('Uniform', 0, 1);
    z = Gaussian(0, 1/n);
    y = x + z;
end

N = 100;
NUM_SAMPLES = 100000;
y_vec = zeros(1,NUM_SAMPLES);
x_vec = zeros(1,NUM_SAMPLES);
for i = 1:NUM_SAMPLES
    [x,y] = GenerateY(N);
    y_vec(i) = y;
    x_vec(i) = x;
end

figure
histogram(y_vec)

mean_square = mean((x_vec - y_vec).^2)

