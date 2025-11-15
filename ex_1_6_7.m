function y = Bernoulli(x1, p1, x2)
    u = random('Uniform', 0, 1);
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

function city = GenerateInitialCity(p)
    if Bernoulli(0, p, 1) == 0
        city = 'E';
    else
        city = 'W';
    end
end

function f = simulate_f1(initial_city, a, b, years)
    city = initial_city;
    f = 0;
    for i = 1:years
        city = step(city, a, b);
        if city == 'W'
            f = f + 1;
        end
    end
    f = f/years;
end

function f = simulate_f2(initial_city, a, b, years)
    city = initial_city;
    f = 0;
    for i = 1:years
        city = step(city, a, b);
        if city == 'E'
            f = f + 1;
        end
    end
    f = f/years;
end

function f = simulate_f3(initial_city, a, b, years)
    city = initial_city;
    f = 0;
    for i = 1:years
        city = step(city, a, b);
        if city == 'E'
            f = f + 1;
        else
            f = f - 1;
        end
    end
    f = f/years;
end

function f = simulate_f4(initial_city, a, b, years)
    city = initial_city;
    f = 0;
    for i = 1:years
        city = step(city, a, b);
        if city == 'E'
            f = f - 1;
        else
            f = f + 1;
        end
    end
    f = f/years;
end

a = 0.1;
b = 0.01;
N = 100;
years = 100;


for p = [0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1, 1/11]
    f1_vec = zeros(1, N);
    f2_vec = zeros(1, N);
    f3_vec = zeros(1, N);
    f4_vec = zeros(1, N);
    for i = 1:N
        f1_vec(i) = simulate_f1(GenerateInitialCity(p), a, b, years);
        f2_vec(i) = simulate_f2(GenerateInitialCity(p), a, b, years);
        f3_vec(i) = simulate_f3(GenerateInitialCity(p), a, b, years);
        f4_vec(i) = simulate_f4(GenerateInitialCity(p), a, b, years);
    end
    fprintf("f1, p=%f, f=%f \n", p, mean(f1_vec));
    fprintf("f2, p=%f, f=%f \n", p, mean(f2_vec));
    fprintf("f3, p=%f, f=%f \n", p, mean(f3_vec));
    fprintf("f4, p=%f, f=%f \n", p, mean(f4_vec));
end

expected_f1 = a/(a+b)
expected_f2 = b/(a+b)
expected_f3 = (a-b)/(a+b)
expected_f4 = (b-a)/(a+b)