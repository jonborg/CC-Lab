
%t = input.time;
Kp=35.635;
Ke=-3.8764;


utrend = input.signals.values; % Entrada - Input signal
thetae = output.signals.values(:,1); % Potenci�metro - Potentiometer signal
alphae = output.signals.values(:,2); % Extens�metro - Starin gage signal

% Reconstru��o �ngulo total da barra 
ytrend = thetae*Kp + alphae*Ke;

%to build a model for the motor shaft angle dynamics

af = 0.8;
Afilt = [1 -af];
Bfilt = (1-af)*[1 -1];
% Filtragem seguida de elimina��o de tend�ncias
% Filtering and detrending
yf = filter(Bfilt,Afilt,ytrend);

%remove the tref (average value) of the
%input signal

u = detrend(utrend);

%identify a model for the signal (motor plus bas)
z = [yf u];
na = 4; % AR part
nb = 2; % X part
nc = na; % MA part
nk = 1; % Atraso puro � pure delay
nn = [na nb nc nk];
th = armax(z,nn) % th is a structure in identification toolbox format

%extract from th the vectors of the coefficients of the numerator and
%denominator polynomials of the model
[den1,num1] = polydata(th);

yfsim = filter(num1,den1,u); % Equivalent to idsim(u,th);

%vectors num and den have the coefficients of the numerator and
%denominator polynomials of the transfer function of the model identified for the
%relation between the electrical excitation of the motor and the bar tip.

[num,den] = eqtflength(num1,conv(den1,[1 -1]));

%to make the conversion to the state model parametrized 
[A,B,C,D] = tf2ss(num,den);

yfsim=dlsim(A,B,C,D,u);

% plot(t, u)
% hold on
% plot(t,alphae)
% axis([0 3 0 1.2])






