%atribute=1 �����Զ������ø�˹�˺���
%atribute=2 �����Զ�������ŷʽ����
function [S]=similarity(T,atribute)
atr=atribute
switch atr
    case 1
Row = size(T,1);
Col = size(T,2);
for i = 1:Row
    for z= 1:Row
        sum1 = 0;
        for j = 1:Col
            sum1 = sum1 + (T(i,j) - T(z,j))^2;
        end
            S(i,z) = -exp((sum1)/5);%^2
    end
end
    case 2
        Row = size(T,1);
Col = size(T,2);
for i = 1:Row
    for z= 1:Row
        sum1 = 0;
        for j = 1:Col
            sum1 = sum1 + (T(i,j) - T(z,j))^2;
        end
        S(i,z) = -sqrt(sum1);
    end
end
end