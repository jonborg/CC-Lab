%% - Ganho do potenciometro (Kp)

load('angles_gains.mat');
potenciometro=tensao_pot.signals.values(:,1);
p_time=tensao_pot.time;

umax=max(potenciometro(23130:27330));
umin=min(potenciometro(23130:27330));
Kp=360/(umax-umin);

%% - Ganho do extensómetro (Ke)

load('cc_0_ks.mat')
extensometro=tensao_pot1.signals.values(:,2);
e_time=tensao_pot1.time;
plot(extensometro)

u=zeros(1,15);
u(1)=mean(extensometro(1:4306));
u(2)=mean(extensometro(7087:10350));
u(3)=mean(extensometro(13880:16380));
u(4)=mean(extensometro(18690:22280));
u(5)=mean(extensometro(24560:27170));
u(6)=mean(extensometro(29620:32390));
u(7)=mean(extensometro(34780:37700));
u(8)=mean(extensometro(40120:41980));
u(9)=mean(extensometro(44590:46660));
u(10)=mean(extensometro(49070:53020));
u(11)=mean(extensometro(54610:57980));
u(12)=mean(extensometro(60200:63250));
u(13)=mean(extensometro(65020:67270));
u(14)=mean(extensometro(70290:72700));
u(15)=mean(extensometro(75400:80001));

a=zeros(1,15);
for i=1:15
    a(i)=atan2((i-8)*2.54/4,44.5)*180/pi;
end

P=polyfit(u,a,1);
a1=polyval(P,u);
figure(1);
plot(u,a,'.',u,a1,'R');
title('Regressão Linear para o Ganho Ke');
xlabel('Tensão (V)');
ylabel('Alpha (º)');
legend ('Dados recolhidos','Regressão linear');
Ke=P(1);

%% - Gráficos dos sinais
figure(2)
plot(p_time,potenciometro,e_time,extensometro)
title('Sinais dos sensores');
xlabel('Tempo (s)');
ylabel('Tensão (V)');
legend ('Potenciometro','Extensometro');
[Kp Ke]