%% affinity propagation �㷨ʵ��汾��
clc;clear;close all
addpath('D:\MEGAFile\work\evaluation', 'D:\MEGAFile\work\Complicate','D:\MEGAFile\work\UCI','D:\MEGAFile\work\drawGraph');
addpath('D:\MEGAFile\work\Celldata');
load ('iris.mat');
% data=in_X;
% label=true_labs;
%% ��ز�����ʼ��
Row = size(data,1);
Col = size(data,2);
D = pdist(data); %ŷʽ����
DM=squareform(D); %��D��ԭΪ�������

S=-DM;
%% ƫ�����������
N=size(S,1); %����ĸ���
meds = median(S(:));            %S(:)�ǽ�S����任��һ��ʸ����Ȼ�����median����ȡ��ֵ
mins= min(min(S(:)));
f=[];n=3
%     for n=1:10

for i = 1:N
    S(i,i)=n*meds;                       %S(i,i)��ֵѡȡ�Ծ��ྫ��������Ҫ
end
%% A(i,k)��R(i,k)��Ϣ����
ar_update
result;
%% �������ͼ
%  drawgraph(idx,data);
%% �ⲿ����ָ��
 Evaluation(label,idx);
% 
%  f(n)=mean(silhouette(data,idx));

%    end
% save apimage idx