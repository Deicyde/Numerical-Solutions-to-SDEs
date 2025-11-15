a = 1229;
b = 1;
c = 2048;
function out = LCG(last_out) % Linear Congruential Generator with parameters a,b,c
    a = 1229;
    b = 1;
    c = 2048;
    out = mod(a*last_out + b, c);
end

N = 1000;
seed = 0;
last_out = seed;
xs = zeros(1,N);
ys = zeros(1,N);
for i = 1:N
    xs(i) = last_out;
    last_out = LCG(last_out);
    ys(i) = last_out;
end
scatter(xs,ys) %Results WITHOUT shuffling
figure

xs = zeros(1,N);
ys = zeros(1,N);
shuffle_arr = zeros(1,20);
rng_var = 0;
for i = 1:20
    last_out = LCG(last_out);
    shuffle_arr(i) = last_out;
end
for i = 1:N
    last_out = LCG(last_out);
    index_rng = mod(last_out,20) + 1; %index we are going to replace
    last_out = LCG(last_out);
    xs(i) = rng_var;
    rng_var = shuffle_arr(index_rng);
    shuffle_arr(index_rng) = last_out;
    ys(i) = rng_var;
end
scatter(xs,ys); %Results WITH shuffling
figure

xs = zeros(1,N);
ys = zeros(1,N);
last_rng = 0;
for i = 1:N
    xs(i) = last_rng;
    last_rng = random('Uniform', 0, 2048);
    ys(i) = last_rng;
end
scatter(xs,ys) %Results with Matlab's Uniform RNG