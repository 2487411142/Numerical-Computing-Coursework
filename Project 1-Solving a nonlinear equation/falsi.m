function r = falsi(f, a, b, tol)

n = 0;
fa = f(a);
fb = f(b);

if sign(fa) * sign(fb) > 0
    disp('function has the same sign at a and b')
    return
end
    c = a - (a-b) * fa / (fa - fb);
    fc = f(c);
    disp(' ');
    disp('   n             c                    f(c)');
    disp('------------------------------------------------------');
    fprintf('%4d %23.15e %23.15e\n', n, c, fc);
    while abs(fc) > tol
        n = n + 1;
        fprintf('%4d %23.15e %23.15e\n', n, c, fc);
        if fa * fc< 0
            b =c;
            fb = f(b);
        else
            a = c;
            fa = f(a);
        end
        c = a - (a-b) * fa / (fa - fb);
        fc = f(c);
    end
    r = c;
end