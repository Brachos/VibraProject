function [q,qdot,q2dot] =Newmark_fun(M,K,C,h,gamma,beta,nbNodes)
tmax=10;
t=0:h:tmax;
%matrice composed of the load vectors for each time step
p=zeros(nbNodes*6-16,length(t));
p(8,1:find(t==0.01))=4000;
%avant l'impact la structure est au repos, tous les déplacements sont égaux
%à zéros.
q=zeros(nbNodes*6-16,length(t));
qdot=zeros(nbNodes*6-16,length(t));
q2dot=zeros(nbNodes*6-16,length(t));
q(:,1)=0;
qdot(:,1)=0;
q2dot(:,1)=((p(:,1)-K*q(:,1)-C*qdot(:,1)).'*M^(-1)).';
%compute the prediction
S=M+h*gamma*C+h^2*beta*K;
for i=1:length(t)-1
    qpred=q(:,i)+h*qdot(:,i)+(0.5-beta)*h^2*q2dot(:,i);
    qdotpred=qdot(:,i)+(1-gamma)*h*q2dot(:,i);
    q2dot(:,i+1)=((p(:,i+1)-C*qdotpred-K*qpred).'*S^(-1)).';
    qdot(:,i+1)=qdotpred+h*gamma*q2dot(:,i+1);
    q(:,i+1)=qpred+h^2*beta*q2dot(:,i+1);
end

end

