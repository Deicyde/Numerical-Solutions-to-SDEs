function s = step()
    u = random('Uniform', 0, 1);
    if u <= 0.5
        s = 1;
    else
        s = -1;
    end
end

function RandomWalk(len)
    walk = zeros(1,len);
    y = 0;
    for i = 1:len
        walk(i) = y;
        y = y + step();
    end
    x = linspace(0,len);
    plot(x,walk);
end

RandomWalk(100)