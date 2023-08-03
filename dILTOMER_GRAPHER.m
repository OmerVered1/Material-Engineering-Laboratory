%Diltometer thingy magic by Omer Vered omerve@post.bgu.ac.il
A=xlsread('FileName.xlsx'); %להכניס שם קובץ כאן
len=length(A);
Delta_L_All=A(1:len,3);
Temprature_All=A(1:len,2);
Delta_L_der=diff(Delta_L_All)./diff(Temprature_All); %מחשב את הנגזרת
Delta_L_der(isnan(Delta_L_der)|isinf(Delta_L_der))=0; %מסיר אינסוף ונאן מהנגזרת והופך אותם לאפס

max1 = Delta_L_der(1); %מוצא את טמפרטורת שינוי הפאזה לפי המקסימום של הנגזרת
for i=1:(length(Delta_L_der)-500)
    if Delta_L_der(i)>max1
        max1 = Delta_L_der(i)
    end
end

nigzeret_max= find(Delta_L_der==max1);
Delta_L_alpha=A(1:nigzeret_max,3);
Temprature_alpha=A(1:nigzeret_max,2);
Delta_L_beta=A(nigzeret_max:len-500,3);
Temprature_beta=A(nigzeret_max:len-500,2);
faker_x=A(1:nigzeret_max,2);
faker_y=A(1:nigzeret_max,3);

figure(1) %גרף 1 התארכות כפונקציה של טמפרטורה
hold on
plot(Temprature_All,Delta_L_All,'b-')
plot(faker_x,faker_y,'g-')
xlabel('Temperature(°C)');
ylabel('Delta L(µm)');
%title('הכנס כותרת כאן');     
grid on
hold off


figure(2) %גרף 2 התארכות כפונקציה של הטמפרטורה פאזה ראשונה
[f ,gof] = fit(Temprature_alpha,Delta_L_alpha,'poly1');
plot(f,Temprature_alpha,Delta_L_alpha,'g-')
xlabel('Temperature(°C)');
ylabel('Delta L(µm)');
%title('הכנס כותרת כאן');  
fiteq = evalc(['disp(f)']);     
goodness = evalc(['disp(gof)']);
coef = confint(f,0.95); 
t = tinv((1+0.95)/2, gof.dfe); 
errors = (coef(2,:)-coef(1,:)) ./ (2*t); 
coef_name=coeffnames(f);
for i=1:numcoeffs(f)
    coef_name(i);
table(i,:) = [coef_name(i) errors(i)];
str(i,:) = sprintf(['\\Delta%s = ' char(177) ' %-10.4g' ],table{i,:});  
end
annotation('textbox',[0.14553125 0.470180305131761 0.2130625 0.434119278779473],...
'String',{fiteq,'Errors in coeficients:',str, sprintf('\nR^2 = %f',gof.rsquare)},'FontSize',10,'FontWeight','Light','FitBoxToText','on','LineStyle','none');
grid on

figure(3)  %גרף 3 התארכות כפונקציה של הטמפרטורה פאזה שנייה
[f ,gof] = fit(Temprature_beta,Delta_L_beta,'poly1');
plot(f,Temprature_beta,Delta_L_beta,'b-')
xlabel('Temperature(°C)');
ylabel('Delta L(µm)');
%title('הכנס כותרת כאן');  
fiteq = evalc(['disp(f)']);    
goodness = evalc(['disp(gof)']);
coef = confint(f,0.95); 
t = tinv((1+0.95)/2, gof.dfe); 
errors = (coef(2,:)-coef(1,:)) ./ (2*t); 
coef_name=coeffnames(f);
for i=1:numcoeffs(f)
    coef_name(i);
table(i,:) = [coef_name(i) errors(i)];
str(i,:) = sprintf(['\\Delta%s = ' char(177) ' %-10.4g' ],table{i,:});   
end
annotation('textbox',[0.14553125 0.470180305131761 0.2130625 0.434119278779473],...
'String',{fiteq,'Errors in coeficients:',str, sprintf('\nR^2 = %f',gof.rsquare)},'FontSize',10,'FontWeight','Light','FitBoxToText','on','LineStyle','none');
grid on


figure(4) %גרף 4 הנגזרת של ההתארכות בטמפרטורה כפונרציה של הטמפרטורה
plot(Temprature_All(2:len),Delta_L_der)
xlabel('Temperature(°C)');
ylabel('d\DeltaL / dT');
text(Temprature_All(nigzeret_max)-200,max1,['Maximum point coardinates: \newline (' num2str(Temprature_All(nigzeret_max)) ',' num2str(max1) ')' ])
xlim([0 699]);
grid on


