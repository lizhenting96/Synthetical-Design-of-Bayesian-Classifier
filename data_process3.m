miu1 = [1,-2];
sita1 = [2 0.8;0.8 2];
miu2 = [-1,1];
sita2 = [4 2;2 4];
miu3 = [0,0];
sita3 = [2.5 1.4;1.4 2.5];
prior1 = 0.4;
prior2 = 0.1;
prior3 = 0.5;
cost21 = 1;
cost31 = 2;
cost12 = 6;
cost13 = 5;
cost23 = 3;
cost32 = 4;
[X1,Y1] = meshgrid(-7:0.1:7,-7:0.1:7);
cpdf1 = mvnpdf([X1(:) Y1(:)],miu1,sita1);
cpdf1 = reshape(cpdf1,size(X1));
figure(1);
surf(X1,Y1,cpdf1),axis tight;
hold on;

[X2,Y2] = meshgrid(-7:0.1:7,-7:0.1:7);
cpdf2 = mvnpdf([X2(:) Y2(:)],miu2,sita2);
cpdf2 = reshape(cpdf2,size(X2));
surf(X2,Y2,cpdf2),axis tight;
hold on;

[X3,Y3] = meshgrid(-7:0.1:7,-7:0.1:7);
cpdf3 = mvnpdf([X3(:) Y3(:)],miu3,sita3);
cpdf3 = reshape(cpdf3,size(X3));
surf(X3,Y3,cpdf3),axis tight;
title('类条件概率');

poster1 = cpdf1*prior1./(cpdf1*prior1+cpdf2*prior2+cpdf3*prior3);
poster2 = cpdf2*prior2./(cpdf1*prior1+cpdf2*prior2+cpdf3*prior3);
poster3 = cpdf3*prior3./(cpdf1*prior1+cpdf2*prior2+cpdf3*prior3);
figure(2);
surf(X1,Y1,poster1),axis tight;hold on;
surf(X2,Y2,poster2),axis tight,hold on;
surf(X3,Y3,poster3),axis tight,hold on,title('后验概率');

R1 = cost21*poster2+cost31*poster3;
R2 = cost12*poster1+cost32*poster3;
R3 = cost13*poster1+cost23*poster2;
figure(3);
surf(X1,Y1,R1),axis tight;hold on;
surf(X2,Y2,R2),axis tight;hold on;
surf(X3,Y3,R3),axis tight;hold on;title('风险函数');

R = min(R3,min(R1,R2));
R(R==R1) = 1;
R(R==R2) = 2;
R(R==R3) = 3;
figure(4);
subplot(1,2,1)
surf(X1,Y1,R),axis tight,title('最小风险');
subplot(1,2,2)
surf(X1,Y1,R),view(2),axis tight,title('最小风险X1OX2平面');