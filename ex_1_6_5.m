function y = U(a,b)
    y = random('Uniform', a, b);
end

function y = Bernoulli(x1, p1, x2)
    u = U(0,1);
    if u <= p1
        y = x1;
    else
        y = x2;
    end
end

function city = step(city, a, b)
    if city == 'E'
        if Bernoulli(0, a, 1) == 0
            city = 'W';
        else
            city = 'E';
        end
    else
       if Bernoulli(0, b, 1) == 0
            city = 'E';
       else
            city = 'W';
       end
    end
end

function final_city = simulate(initial_city, a, b, years)
    city = initial_city;
    for i = 1:years
        city = step(city, a, b);
    end
    final_city = city;
end

years = 100;
N = 10000;
a = 0.1;
b = 0.01;
W_end_E = 0;
W_end_W = 0;
E_end_E = 0;
E_end_W = 0;
for i = 1:N
    if simulate('E', a, b, years) == 'E'
        E_end_E = E_end_E + 1;
    else
        E_end_W = E_end_W + 1;
    end
    if simulate('W', a, b, years) == 'W'
        W_end_W = W_end_W + 1;
    else
        W_end_E = W_end_E + 1;
    end
end

E2E = E_end_E / N
E2W = E_end_W / N
W2E = W_end_E / N
W2W = W_end_W / N
expected_final_distribution = [b/(a+b), a/(a+b)]