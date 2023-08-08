%3-4 bend comparison
A=xlsread('AKULON.xlsx'); %צריך להחליף שם קובץ
three_point_d=A(7:713,1); %שינויי אורך בכפיפה -3
three_point_F=A(7:713,2); %כוח בכפיפה -3
four_point_d=A(7:713,4);% אורך 4
four_point_F=A(7:713,5); %כוח 4
%dimensions
L_three=80; %מימדים לחישוב
L_four=80;
w=10;
h=4;
%strain calc
three_point_strain =(6*h.*three_point_d)./(L_three^2);
four_point_strain =(6*h.*three_point_d)./(L_three^2);
%stress calc
three_point_stress =(3*L_three.*three_point_F)./(2*w*(h^2));
four_point_stress =(3*L_four.*four_point_F)./(4*w*(h^2));
%plots
hold on
plot(three_point_strain,three_point_stress)
plot(four_point_strain,four_point_stress)
xlabel('strain')
ylabel('stress -[MPa]')
legend({'3-point','4-point'}, 'Location','northwest','Orientation','vertical')
grid on
hold off