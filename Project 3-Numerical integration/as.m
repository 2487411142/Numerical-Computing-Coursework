function numl = as(f, a, b, delta, level, level_max, fa, fb, fc)
global as_count;
h = b - a;
c = (a + b) / 2;
I1 = h * (fa + 4*fc + fb) / 6;
level = level + 1;
d = (a + c) / 2;
e = (c + b) / 2;
fd = f(d);
fe = f(e);
I2 = h * (fa + 4*fd + 2*fc + 4*fe + fb) / 12;
as_count = as_count + 2;
if level >= level_max
    numl = I2;
else
    if abs(I2 - I1) <= 15*delta
        numl = I2 + (I2 - I1) / 15;
    else
        numl = as(f, a, c, delta/2, level, level_max, fa, fc, fd) +...
                as(f, c, b, delta/2, level, level_max, fc, fb, fe);
    end
end