T=20;
Freq= 0.4;
fs=50;
B=0.1;

t=(0:1/fs:T)';
u=2*square(2*pi*Freq*t);
%u=prbs(length(t), 'prbs',[0 B]);

% uiopen('C:\Users\Alunos\Desktop\cclab1.slx',1)
set_param('cclab1','SimulationCommand', 'start');