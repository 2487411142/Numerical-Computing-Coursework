function yy = spline_pval(t,y,h,z,xx)

n = length(t);
m = length(xx);
for k = 1:m
for i = 1:n - 1
if (xx(k) - t(i + 1)) <= 0
break
end
end
B = - h(i) * z(i+1) / 6 - h(i) * z(i) / 3 + (y(i+1) - y(i)) / h(i);
D = (z(i+1) - z(i)) / (6 * h(i));
yy(k) = y(i) + (xx(k)-t(i)) * (B+(xx(k)-t(i))*(z(i)/2+(xx(k)-t(i))*D));
end