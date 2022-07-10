G = 5;
T=2;
T0=3;
k1=T/(G*T0);
Ti1=T;
s =tf('s');
plant = G/(1+s*T); 
piController=((k1*s)+(1/Ti));
sys = 1/(1+(s*T0));
sysPi=plant*piController;
[y,t3]=step(feedback(plant,1));
f1=figure;
plot(t3,y);
f55=figure;
stepplot(feedback(plant,1));
f2=figure;
stepplot(feedback(sysPi,1));
f3=figure;
stepplot(feedback(sys,1));
Mp=0.165;
Tr=0.009;
zeta=-log(Mp)/sqrt(pi*pi-log(Mp));
w0=(pi-acos(zeta))/(Tr*sqrt(1-zeta*zeta));
%w0=250;

a1=1;
a2=5;
b0=3;
ratio=(1/(2*zeta*w0));
Ti=a1-ratio;
Td=(a2/Ti)-ratio;
k=(w0*Ti)/(2*zeta*b0);
n=Td/ratio;
plant = b0/(1+(a1*s)+(a2*s*s));
pid=k*(1+(Ti+ratio)*s+((Ti*Td)+(Ti*ratio))*(s*s))/((Ti*s)+(Ti*ratio)*(s*s));
syst=plant*pid;
sys=(w0*w0)/((w0*w0)+(2*zeta*w0*s)+(s*s));
fefiplant=figure;
stepplot(plant);
fefisys=figure;
stepplot(sys);
fefisyst=figure;
stepplot(feedback(syst,1));
