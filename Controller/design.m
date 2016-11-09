A=A;
B=B;
H=[C;eye(size(A))];
D=zeros(1+length(A(:,1)),1);

R=1
[K,Sk,pc]=dlqr(A,B,C'*C,R);

G=eye(size(A));
Qe=100*eye(size(A));
Re=1;
[M,P,Z,po]=dlqe(A,G,C,Qe,Re);

sim('c_syst')

