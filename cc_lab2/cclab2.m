close all
%t = input.time;
Kp=35.635;
Ke=-3.8764;

time = output.time;
utrend = input.signals.values; % Entrada - Input signal
thetae = output.signals.values(:,1); % Potenciómetro - Potentiometer signal
alphae = output.signals.values(:,2); % Extensómetro - Starin gage signal

% Reconstrução ângulo total da barra 
ytrend = thetae*Kp + alphae*Ke;

%to build a model for the motor shaft angle dynamics
%% - differentiation and filtering
af = 0.8;
Afilt = [1 -af];
Bfilt = (1-af)*[1 -1];
% Filtragem seguida de eliminação de tendências
% Filtering and detrending
yf = filter(Bfilt,Afilt,ytrend);
figure(4)
freqz(Bfilt,Afilt,[0.01:100])
%remove the tref (average value) of the
%input signal

u = detrend(utrend);

%% - Model Identification
%identify a model for the signal (motor plus bas)
z = [yf u];
na = 4; % AR part
nb = 2; % X part
nc = na; % MA part
nk = 1; % Atraso puro – pure delay
nn = [na nb nc nk];
th = armax(z,nn) % th is a structure in identification toolbox format

%extract from th the vectors of the coefficients of the numerator and
%denominator polynomials of the model
[den1,num1] = polydata(th);

yfsim = filter(num1,den1,u); % Equivalent to idsim(u,th);
figure(1);hold on;
plot(time,yf,'r');
plot(time,yfsim,'b');
legend('yf','yfsim');
hold off;
%% - Add integrator
%vectors num and den have the coefficients of the numerator and
%denominator polynomials of the transfer function of the model identified for the
%relation between the electrical excitation of the motor and the bar tip.

[num,den] = eqtflength(num1,conv(den1,[1 -1]));

transfer=tf(num,den); %transfer function
figure(2)
bode(transfer)

figure(3);hold on;
poles=pole(transfer);
zer=zero(transfer);
plot(real(poles),imag(poles),'X')
plot(real(zeros),imag(zeros),'O')
legend('poles','zeros');
circle=0:pi/50:2*pi;
plot(cos(circle),sin(circle),'k');
plot(-2:0.02:2,zeros(1,201),'k');
plot(zeros(1,201),-2:0.02:2,'k');
hold off

%to make the conversion to the state model parametrized 
[A,B,C,D] = tf2ss(num,den);

yfss=dlsim(A,B,C,D,u);

% plot(t, u)
% hold on
% plot(t,alphae)
% axis([0 3 0 1.2])







