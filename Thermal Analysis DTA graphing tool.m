%DTA THINGY MAGIC
A=xlsread('tamar1.csv');
heat_flow1=A(1:3069,4);%.*(10^-3);
sample_temprature_1=A(1:3069,3);
time1=A(1:3069,1);
furance_temprature_1=A(1:3069,2);
B=xlsread('tamar2.csv');
heat_flow2=B(1:3481,4);%.*(10^-3);
sample_temprature_2=B(1:3481,3);
time2=B(1:3481,1);
furance_temprature_2=B(1:3481,2);
A_x_1=sample_temprature_1(1052:1302);
A_y_1=heat_flow1(1052:1302);
A_x_2=sample_temprature_1(1305:1324);
A_y_2=heat_flow1(1305:1324);
A_x_3=sample_temprature_1(1909:1913);
A_y_3=heat_flow1(1909:1913);
A_x_4=sample_temprature_1(1927:1946);
A_y_4=heat_flow1(1927:1946);
A_x_5=sample_temprature_1(2786:2844);
A_y_5=heat_flow1(2786:2844);
A_x_6=sample_temprature_1(2944:2952);
A_y_6=heat_flow1(2944:2952);
B_x_1=sample_temprature_2(1315:1339);
B_y_1=heat_flow2(1315:1339);
B_x_2=sample_temprature_2(1428:1584);
B_y_2=heat_flow2(1428:1584);
B_x_3=sample_temprature_2(3196:3202);
B_y_3=heat_flow2(3196:3202);
B_x_4=sample_temprature_2(3258:3272);
B_y_4=heat_flow2(3258:3272);
figure(1)
hold on
plot(sample_temprature_1,heat_flow1,'b-')
plot(A_x_1,A_y_1,'g-')
plot(A_x_2,A_y_2,'y-')
plot(A_x_3,A_y_3,'g-')
plot(A_x_4,A_y_4,'y-')
plot(A_x_5,A_y_5,'g-')
plot(A_x_6,A_y_6,'y-')
xlabel('Sample Temperature(°C)');
ylabel('Heat Flow(mW)');
title('mat 1')
grid on
hold off

figure(3)
plot(time1,furance_temprature_1)
xlabel('Time (s)');
ylabel('Furance Temperature(°C)');
grid on

figure(2)
hold on
plot(sample_temprature_2,heat_flow2,'r-')
plot(B_x_1,B_y_1,'g-')
plot(B_x_2,B_y_2,'g-')
plot(B_x_3,B_y_3,'g-')
plot(B_x_4,B_y_4,'g-')
xlabel('Sample Temperature(°C)');
ylabel('Heat Flow(mW)');
title('mat 2')
grid on
hold off
