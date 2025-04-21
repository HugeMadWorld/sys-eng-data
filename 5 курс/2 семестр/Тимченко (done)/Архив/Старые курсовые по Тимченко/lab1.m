Vx = 5;
Vy = 0;
psi = 0.035; %рад

q21=-0.0341;
q31=0.000232;
r21 = 0.465;
r31=-0.0109;
s21=0.00194;
s31=0.000189;
k1 = -1.7;
k2 = 10;
dt = 1;
del_t = 1;
%psi(i)=psiZ

a(i-1) = (psi(i+1)-psiZ)*k1+((psi(i+1)-psiZ)/del_t)*k2
b(i) = b(i-1) + (r21*w(i)+q21*b(i-1)+s21*Vx*a(i-1))*del_t
w(i) = w(i-1) + (r31*w(i-1)+q31*Vx*b(i-1)+s31*((Vx^2)*a(i-1)))*del_t
psi(i) = psi(i-1)+w(i-1)*del_t
fi_c(i) = fi_c(i-1)+(psi(i)-w(i))*del_t
Vx(i) = V*sin(fi_c(i))
Vy(i) = V*cos(fi_c(i))
X(i-1) = X(i)*Vx(i)*dt
Y(i-1) = Y(i)*Vy(i)*dt