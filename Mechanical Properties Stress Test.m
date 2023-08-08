clear all
A=xlsread('filename');  
le=(length(A)-3);
leng=(80*10^-3);
thick=(4*10^-3);
wid=((A(2,1))*10^-3);
ar=(6*leng)/(wid*thick^2);
eps1=(6*thick)/(leng^2);
stress=((A(1:le+3,2))*ar)/10^6;%inserting the data to two vectors
strain=(((A(1:le+3,1))*10^-3)*eps1);
le2=(length(A)-3);
leng2=(80*10^-3);
thick2=((A(1,4))*10^-3);
wid2=((A(2,4))*10^-3);
ar2=(3*leng2)/(2*wid2*thick2^2);
eps2=(6*thick2)/(leng2^2);
stress2=((A(1:le+3,5))*ar2)/10^6;%inserting the data to two vectors
strain2=(((A(1:le+3,4))*10^-3)*eps2);
%
send=30;
[slopmod1, slopmod2,slopmod3, slopetemp,slopetemp2,slopetemp3] = deal(0);
for bound=12:send
    xmod =strain(1:bound);
    ymod =stress(1:bound); 
    P = polyfit(xmod,ymod,1);
    slopetemp= P(1);
    if slopetemp>=slopmod1
        slopmod1=slopetemp;
    end
    [xmod, ymod] = deal(0);
end
for bound=12:send
    xmod2 =strain2(1:bound);
    ymod2 =stress2(1:bound); 
    P2 = polyfit(xmod2,ymod2,1);
    slopetemp2= P2(1);
    if slopetemp2>=slopmod2
        slopmod2=slopetemp2;
        %k=k+1;
    end
    [xmod2, ymod2] = deal(0);
end

%
utsx1=find((0.0499<=strain)&(strain<=0.0501),1);
utsx2=find((0.0499<=strain2)&(strain2<=0.0501),1);
utsy1=stress(utsx1);
utsy2=stress2(utsx2);
%
disp(['UTS:' num2str(utsy1) ' MPa']);
disp(['UTS:' num2str(utsy2) ' MPa']);
disp(['Young_modulus:' num2str(slopmod1/10^3 ) ' GPa' ]);
disp(['Young_modulus:' num2str(slopmod2/10^3 ) ' GPa' ]);
point=0.3;
ypoint=0.3;
hold on
plot(strain,stress);
plot(strain2,stress2);
%plot(strain3,stress3);
hold off   
xlabel('Strain');
ylabel('Stress(MPa)');
%text(point*strain(le),(ypoint)*stress(le),['Young modulus akulon 66:' num2str(slopmod1/10^3 ) ' [GPa]']);
%text(point*strain(le),(ypoint+0.6)*stress(le),['Young modulus akulon 66 GF30:' num2str(slopmod2/10^3 ) ' [GPa]']);
grid on
legend({'PMMA 4 point','PMMA 3 point'},'Location','northwest','Orientation','vertical')
xlim([0 0.05]);