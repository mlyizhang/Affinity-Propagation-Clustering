%% ���������
fprintf('����������%d   \n',iter);
E=R+A; % Pseudomarginals
I=find(diag(E)>0);
K=length(I);% Indices of exemplars
[tmp c]=max(E(:,I),[],2);
% K=length(unique(c))
c(I)=1:K;                 %%�滻�������ڵ�λ��
idx=I(c); % Assignments   %%�ҳ�N������������Ӧ�����ĵ�
m=0;
for i=unique(idx)'
    m=m+1
    idx(find (idx==i))=m;
end
disp('AP���������£�\n');
disp('------------------');
fprintf('����Ϊ��%d   \n',K);
% fprintf('������ĵ���������Ķ�Ӧ�����£�\n');
% disp('-----------------------------');
% counter = 0;
% for i=1:K
%     m=I(i); 
%     Set(Row,Col) = 0;
%     disp('-----------------------------');
%     fprintf('�� %d �����ĵ�: E(%d)=%6.4f \n',i,m,E(m,m));
%     disp('-----------------------------');
%     
%     Count(K) = 0;
%     for j=1:N
%         n = idx(j);      %%������������Ӧ�����ĵ�λ��
%         if(n == m) 
%             fprintf('S�е� %d ��������۵������ĵ��� \n',j);   %%��ӡ�˴����ĵ���������������
%             counter = counter + 1;
%             Set(counter,:) = T(j,:);
%         end
%     end
%     Count(i) = counter;
% end
% Number(K) = 0;
% Number(1) = Count(1);
% for i = 2:K
%     Number(i) = Count(i) - Count(i - 1);  %����ÿ��������ĵ���
% end
% %% ����Sil��Ч��ָ��
% Sil(N,1) = 0;
% for i = 1 : N
%     Tcopy = repmat(T(i,:),N,1); %�õ����� Tcopy ������ȫ��Ϊ T ������i������ 
%     Cha = Tcopy - T;
%     for j = 1 : N
%         PF(j,1) = Cha(j,:) * Cha(j,:)'; %ƽ����
%     end
%     Dist = sqrt(PF);
%     for t = 1:K
%         SU(t,1) = 0;
%         Ave(t,1) = 0;
%     end
%     
%     for z = 1 : K
%         if z == 1 
%             for k = 1 : Count(z)
%               SU(z) = Dist(k) + SU(z);
%             end
% %             Ave(z) = SU(z) / Number(z);
%         else
%             for n = (Count(z - 1) + 1) : Count(z)
%                 SU(z) = Dist(n) + SU(z);
%             end
% %             Ave(z) = SU(z) / Number(z);
%         end
%     end
% %     SU
%     for z = 1 : K
%         if c(i) == z
%             if Number(z)==1
%                 at=0;
%             else
%             Ave(z) = SU(z) / (Number(z) - 1);
%             at = Ave(z);
%             end
%         else
%             Ave(z) = SU(z) / Number(z);
%         end
%     end
%     Ave(c(i)) = 100000;
%     bt = min(Ave);
%     Sil(i,1) = (bt - at) / max(at , bt);       
% end
% Silhouette = sum(Sil) / N