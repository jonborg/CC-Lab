T=60;
Freq= 0.4;
fs=50;

t=(0:1/fs:T)';
u=square(2*pi*Freq*t);

% uiopen('C:\Users\Alunos\Desktop\cclab1.slx',1)
set_param('cclab1','SimulationCommand', 'start');