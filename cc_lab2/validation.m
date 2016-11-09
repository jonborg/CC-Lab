%% Escolhe um workspace a testar
%load('2a_sim_prbs_B_0.1/workspace.mat');
Kp=35.7244;
Ke=-3.8587;
u1=u;
y1=Kp*output.signals.values(:,1)+Ke*output.signals.values(:,2);
y1=180/pi*unwrap(pi/180*y1);
time1=output.time;
%% Escolhe outro workspace para identificar o sistema
load('1a_sim_square_Freq_0.4Hz/workspace.mat');
identificacao
%% Testa a identificação com o sinal do primeiro workspace carregado
yfss=dlsim(A,B,C,D,u1);
figure(5)
hold on 
plot(time1,y1,'r');
plot(time1,yfss,'b');
legend('ytrend','yfss');
xlabel ('Tempo (s)');
ylabel('Tensão (V)');