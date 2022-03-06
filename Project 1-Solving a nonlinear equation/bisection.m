function r = bisection(f,a,b,delta,display)
% The bisection method
% r = bisection(f,a,b,delta,display)
% input:  f is the function handle of f(x)
%         a and b define an interval [a,b] and f(a)f(b) < 0
%         delta is the tolerance
%         display = 1 if step-by-step display is desired,
%                 = 0 otherwise
% output: r is a computed root of f(x)=0
%

fa = f(a); fb = f(b);
if sign(fa)*sign(fb) > 0
   disp('function has the same sign at a and b')
   return
end

n = 1; c = (a+b)/2; fc = f(c); e_bound = abs(b-a)/2;
if display 
   disp(' ');
   disp('   n             c                    f(c)')
   disp('------------------------------------------------------')
   fprintf('%4d %23.15e %23.15e\n', n, c, fc)
end
while e_bound > delta
   n = n+1;
   if fc == 0, r = c; return, end   
   if sign(fa)*sign(fc) < 0  % There is a root in [a,c].
      b  = c; fb = fc;
   else                      % There is a root in [c,b].
      a  = c; fa = fc;
   end  
   c = (a+b)/2; fc = f(c); e_bound = e_bound/2;
   if display, fprintf('%4d %23.15e %23.15e\n', n, c, fc), end
end
r = c;
end
