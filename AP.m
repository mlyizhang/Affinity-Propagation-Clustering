%% affinity propagation 算法实验版本。
clc;clear;close all
addpath('D:\MEGAFile\work\evaluation', 'D:\MEGAFile\work\Complicate','D:\MEGAFile\work\UCI','D:\MEGAFile\work\drawGraph');
addpath('D:\MEGAFile\work\Celldata');
load ('iris.mat');
% data=in_X;
% label=true_labs;
%% 相关参数初始化
Row = size(data,1);
Col = size(data,2);
D = pdist(data); %欧式距离
DM=squareform(D); %将D还原为距离矩阵

S=-DM;
%% 偏向参数的设置
N=size(S,1); %对象的个数
meds = median(S(:));            %S(:)是将S矩阵变换成一个矢量，然后调用median函数取中值
mins= min(min(S(:)));
f=[];n=3
%     for n=1:10

for i = 1:N
    S(i,i)=n*meds;                       %S(i,i)的值选取对聚类精度至关重要
end
%% A(i,k)和R(i,k)信息迭代
ar_update
result;
%% 绘出聚类图
%  drawgraph(idx,data);
%% 外部评价指标
 Evaluation(label,idx);
% 
%  f(n)=mean(silhouette(data,idx));

%    end
% save apimage idx