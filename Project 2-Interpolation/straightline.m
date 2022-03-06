function [a,b] = straightline(x, y)

m = length(x);
if m ~= length(y)
    disp('Vectors length mismatch');
    return;
end

sig_x = sum(x);
sig_y = sum(y);
sig_xx = x'*x;
sig_xy = sum(dot(x,y));
a = (m*sig_xy - sig_x*sig_y)/(m*sig_xx - sig_x*sig_x);
b = (sig_xx*sig_y - sig_x*sig_xy)/(m*sig_xx - sig_x*sig_x);
