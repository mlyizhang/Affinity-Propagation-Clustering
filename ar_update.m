%function [A,R,E] = ar_update(S)
%A(i,k)��R(i,k)��Ϣ����
tic;
N=size(S,1);
A=zeros(N,N);
R=zeros(N,N); % Initialize messages
lam=0.6; % Set damping factor
count = 0;
for iter=1:10000
    Eold = A + R;
    % Compute responsibilities
    Rold=R;
    AS=A+S;
    [Y,I]=max(AS,[],2);% ÿ�е����ֵ��ɵ�������
    for i=1:N
        AS(i,I(i))=-realmax;%��ÿһ�е����ֵ���-1000
    end;
    [Y2,I2]=max(AS,[],2);
    R=S-repmat(Y,[1,N]);%repmat��yת��Ϊ��ÿ�����ֵ��ɵ���sͬ�͵ľ���
    for i=1:N
        R(i,I(i))=S(i,I(i))-Y2(i);
    end;
    R=(1-lam)*R+lam*Rold; % Dampen responsibilities
    % Compute availabilities
    Aold=A;
    Rp=max(R,0);
    for k=1:N
        Rp(k,k)=R(k,k);
    end;
    A=repmat(sum(Rp,1),[N,1])-Rp;%repmatΪ���ƣ�sum(,1)��������ӣ����������
    dA=diag(A);%�Խ���
    A=min(A,0);
    for k=1:N
        A(k,k)=dA(k);
    end;
    A=(1-lam)*A+lam*Aold; % Dampen availabilities

    %�жϵ����������Ӽ��β��仯ʱ������forѭ��
    E = A + R;
    if diag(Eold) == diag(E)
        count = count + 1;
        if count == 10   %terminate the algorithm when these decisions did not change for 10 iterations.
            break;
        end
    else
        count=0;
    end
end
toc;