t = ScopeData.time;
sigs = ScopeData.signals.values;

utrend = sigs(:,1); % Entrada - Input signal
thetae = sigs(:,2); % Potenci�metro - Potentiometer signal
alphae = sigs(:,3); % Extens�metro - Starin gage signal

% Reconstru��o �ngulo total da barra � Computation of total bar angle
ytrend = thetae*Kp + alphae*Ke;

%Step 1 - Remove the integral effect from the motor shaft angle data by
%differentiating and using a low pass filter

af = 0.8;
Afilt = [1 -af];
Bfilt = (1-af)*[1 -1];
% Filtragem seguida de elimina��o de tend�ncias
% Filtering and detrending
yf = filter(Bfilt,Afilt,ytrend);

u = detrend(utrend);

%Step 2 - Identify the model that relates motor electrical excitation with the motor
%shaft angle;

z = [yf u];
na = 3; % AR part
nb = 2; % X part
nc = na; % MA part
nk = 1; % Atraso puro � pure delay
nn = [na nb nc nk];
th = armax(z,nn) % th is a structure in identification toolbox format

[den1,num1] = polydata(th);

yfsim = filter(num1,den1,u); % Equivalent to idsim(u,th);

%Step 3 - Add Integrator

[num,den] = eqtflength(num1,conv(den1,[1 -1]));
