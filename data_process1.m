normal_data = [-3.9847, -3.5549, -1.2401, -0.9780, -0.7932, -2.8531, -2.7605, -3.7287, -3.5414, -2.2692, -3.4549, -3.0752, -3.9934, -0.9780, -1.5799, -1.4885, -0.7431 , -0.4221 , -1.1186, -2.3462, -1.0826, -3.4196, -1.3193, -0.8367, -0.6579, -2.9683];
abnormal_data = [2.8792, 0.7932, 1.1882, 3.0682, 4.2532, 0.3271,0.9846,2.7648,2.6588];
ave_normal = mean(normal_data);
ave_abnormal = mean(abnormal_data);
sita_normal = std(normal_data);
sita_abnormal = sqrt(var(abnormal_data));


X1 = -6:0.01:6;
X2 = -6:0.01:6;
prior1 = 0.9;
prior2 = 0.1;
cost12 = 1;
cost21 = 6;
cpdf1 = normpdf(X1,ave_normal,sita_normal);
cpdf2 = normpdf(X1,ave_abnormal,sita_abnormal);
figure(1);
plot(X1,cpdf1);hold on;
plot(X2,cpdf2)
title('类条件概率'),legend('Normal','Abnormal'),xlabel('X'),ylabel('p');

poster1 = cpdf1*prior1./(cpdf1*prior1+cpdf2*prior2);
poster2 = cpdf2*prior2./(cpdf1*prior1+cpdf2*prior2);
figure(2);
plot(X1,poster1);hold on;
plot(X2,poster2);
title('后验概率'),legend('Normal','Abnormal'),xlabel('X'),ylabel('p');

R1 = cost21*poster2;
R2 = cost12*poster1;
figure(3);
plot(X1,R1);hold on;
plot(X2,R2);
title('风险函数'),legend('Normal','Abnormal'),xlabel('X'),ylabel('Risk');

R = R1-R2;
R(R>0) = 2;
R(R<=0) = 1;
figure(4);
plot([-6:0.01:6],R);
title('最小风险'),xlabel('X'),ylabel('Classification');

poster = poster1-poster2;
poster(poster>0) = 1;
poster(poster<=0) = 2;
figure(5);
plot([-6:0.01:6],poster);
title('不考虑风险'),xlabel('X'),ylabel('Classification');