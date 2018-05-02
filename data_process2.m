miu1 = [1,-2];
sita1 = [2 0.8;0.8 2];
miu2 = [-1,1];
sita2 = [4 2;2 4];
prior1 = 0.9;
prior2 = 0.1;
cost21 = 6;
cost12 = 1;
[X1,Y1] = meshgrid(-7:0.1:7,-7:0.1:7);
cpdf1 = mvnpdf([X1(:) Y1(:)],miu1,sita1);
cpdf1 = reshape(cpdf1,size(X1));
figure(1);
surf(X1,Y1,cpdf1),axis tight;
hold on;

[X2,Y2] = meshgrid(-7:0.1:7,-7:0.1:7);
cpdf2 = mvnpdf([X2(:) Y2(:)],miu2,sita2);
cpdf2 = reshape(cpdf2,size(X2));
surf(X1,Y1,cpdf2),axis tight;
title('类条件概率');

poster1 = cpdf1*prior1./(cpdf1*prior1+cpdf2*prior2);
poster2 = cpdf2*prior2./(cpdf1*prior1+cpdf2*prior2);
figure(2);
surf(X1,Y1,poster1),axis tight;hold on;
surf(X2,Y2,poster2),axis tight,title('后验概率');

R1 = cost21*poster2;
R2 = cost12*poster1;
figure(3);
surf(X1,Y1,R1),axis tight;hold on;
surf(X2,Y2,R2),axis tight,title('风险函数');

R = R1-R2;
R(R>0) = 2;
R(R<=0) = 1;
figure(4);
subplot(1,2,1)
surf(X1,Y1,R),axis tight,title('最小风险');
subplot(1,2,2)
surf(X1,Y1,R),view(2),axis tight,title('最小风险X1OX2平面');