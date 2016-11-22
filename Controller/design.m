A=A;
B=B;
H=[C;eye(size(A))];
D=zeros(1+length(A(:,1)),1);

R=1;
[K,Sk,pc]=dlqr(A,B,C'*C,R);

G=eye(size(A));
Qe=100*eye(size(A));
Re=1;
[M,P,Z,po]=dlqe(A,G,C,Qe,Re);
%% Controlador
sim('controlador')
lambda_c=exp(log(abs(y_c(length(y_c),2)))/length(y_c))
abs(pc)'

%% Observador
sim('observador')
lambda_o=exp(log(abs(x_o(270,4)))/270)
abs(po)'
%% Sistema Total
sim('total_sys')

