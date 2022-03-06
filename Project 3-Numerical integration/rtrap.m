function [Ir, count] = rtrap(f, a, b, dif)
n = 0;
h = b - a;
old = 0;
new = h/2 * (f(a) + f(b));
count = 2;
while abs(new - old) > dif
    n = n + 1;
    h = h / 2;
    old = new;
    new = old / 2 + h * sum(f(a+h : 2*h : b-h));
    count = count + 2^(n-1);
end
Ir = new;