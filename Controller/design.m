A=A;
B=B;
H=[C;eye(size(A))];
D=zeros(1+length(A(:,1)),1);

R=100;
[K,Sk,pc]=dlqr(A,B,C'*C,R);

G=eye(size(A));
Qe=100*eye(size(A));
Re=1;
[M,P,Z,po]=dlqe(A,G,C,Qe,Re);
[pc';po']

N = inv([A-eye(5,5), B; C,0])*[zeros(5,1);1];
Nx = N(1:5,:);
Nu = N(6,:);
Nbar = Nu+K*Nx;

%% Controlador
sim('controlador')
lambda_c=exp(log(abs(y_c(length(y_c),2)))/length(y_c))
abs(pc)'

%% Observador
sim('observador')
lambda_o=exp(log(abs(x_o(length(x_o),4)))/length(x_o))
abs(po)'

%% Sistema Total
sim('total_sys')

