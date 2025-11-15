function y = U(a,b)
    y = random('Uniform', a, b);
end

function batch_avg = MakeBatch(N)
    batch_sum = 0;
    for i = 1:N
        batch_sum = batch_sum + U(0,1);
    end
    batch_avg = batch_sum/N;
end

M = 20;
N = 100;
batches = zeros(1,M);
for i = 1:M
    batches(i) = MakeBatch(N);
end
sigma_hat = std(batches);
mu_hat = mean(batches)
t = 2.86; % from table 1.9.1 where n=20;
a = t*sigma_hat/sqrt(M)
min = mu_hat - a
max = mu_hat + a