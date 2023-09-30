%A script for solving Homework set 1 for the course 
%Isotope geochemistry 2023
%1
clear all
%sample data:
LuHf=[0.01178 0.005213 0.04029]';
HfHf=[0.282567 0.282342 0.283543]';
p = polyfit(LuHf,HfHf,1);%fit a 1st order polynomial
disp('    Slope     Intercept')
disp(p)
figure(1)
hold on
plot(LuHf,HfHf,'ko')%just to check if the points are visually correct
x = linspace(0,1.10*max(LuHf));
plot(x,p(1)*x+p(2),'k')
xlim([0,1.10*max(LuHf)])
% ylim([min(HfHf),max(HfHf)])
ylabel('^{176}Hf/^{177}Hf')
xlabel('^{176}Lu/^{177}Hf')
hold off
%p(1) is the slope, p(2) is the constant term
lambda_t1 = 1.867e-11;%yr-1, half life of the system
t=log(p(1)+1)/lambda_t1;
disp('    Age')
disp(t)
%% 2
clear all
%Granite present day 87Rb/86Sr and 87Sr/86Sr
GRbSr_1=0.6770;
GSrSr_1=0.7319;
lambda_Rb = 1.393e-11;%yr^-1, half life of ^87Rb
t2=1150e6;%yr
%assumed GSrSr_0
GSrSr_0a = 0.708954467092587;
%GRbSr at t2
GRbSr_t2 = GRbSr_1*exp(lambda_Rb*t2)
%GSrSr at t2
GSrSr_t2 = GSrSr_0a+GRbSr_t2*(exp(t2*lambda_Rb)-1)
%b
r_87Rb86Sr = [0.6770 2.876]';
r_87Sr86Sr = [0.7319 0.7763]';
%plot(RbSr,SrSr,'kx')
p2 = polyfit(r_87Rb86Sr,r_87Sr86Sr,1)
t3 = log(p2(1)+1)/lambda_Rb
%d
r_87Rb86Sr_d = [0.6770 1.471 2.876]';
r_87Sr86Sr_d = [0.7319 0.7395 0.7763]';
p2d = polyfit(r_87Rb86Sr_d,r_87Sr86Sr_d,1)
figure(3)
hold on
plot(r_87Rb86Sr_d,r_87Sr86Sr_d,'ko')
x = linspace(0,2.876);
plot(x,p2(1)*x+p2(2),'k')
hold off
ylabel('^{87}Sr/^{86}Sr')
xlabel('^{87}Rb/^{86}Sr')

%% 3
clear all
%parent isotope always on x axis
% Sample 180Hf/184W 182W/184W
% M      0.0155     0.864412
% NM-1   14.4       0.865583
% NM-2   10.0       0.865279
% NM-3   6.90       0.864925
t_ss = 4.568e9;%years ago, age of the solar system
hl_182Hf = 8.90e6;%yr
dc = log(2)/hl_182Hf; 
t_met = 4.5627e9;%years ago, age of the meteorite
HfW = [0.0155 14.4 10.0 6.90];
WW = [0.864412 0.865583 0.865279 0.864925];
p3 = polyfit(HfW,WW,1);
WW_0 = p3(2);
HfHf_0 = p3(1);
disp('   182Hf/180Hf         182W/184W')
disp(p3)
figure(4)
hold on
plot(HfW,WW,'ko')
x3=linspace(0,15);
plot(x3,p3(1)*x3+p3(2),'k')
%ylabel('^{182}W/^{184}W')
% ylabel('\epsilon^{182W}')
ylabel('^{182}W/^{184}W')
xlabel('^{180}Hf/^{184}W')
xlim([0,1.10*max(HfW)])
% ylim([min(HfHf),max(HfHf)])
%c)
HfHf_ssys = HfHf_0*exp(dc*(t_ss-t_met))

%% 4
Rb = 175.3;% ppm
Sr = 11.11;% ppm
dc_Rb = 1.393e-11;
Sr87Sr86 = 0.833844;
Sr87Sr86i = 0.703;
% W_Sr = 87.62;%u
W_Sr = (0.557*83.9134+9.861*85.9092+6.991*86.9089+82.59*87.9056)/100;%u
W_Rb = 85.4678;%u
X86Sr = 0.06991;
X87Rb = 0.2783;

Rb87Sr86 = ((Rb/W_Rb)*X87Rb)/((Sr/W_Sr)*X86Sr)
t_model = log(((Sr87Sr86-Sr87Sr86i)/Rb87Sr86)+1)/dc_Rb

%% 5
clear all
Nd143Nd144_CC=0.512020;
Sm = 9.03;%ppm, concentrations
Nd = 47.9;%ppm
XSm147 = 0.1499;%isotope abundances
XNd143 = 0.1217;
W_Sm = 150.36;%u, molecular masses
W_Nd = 144.242;%u 
Sm147Nd144_CC =((Sm/W_Sm)*XSm147)/((Nd/W_Nd)*XNd143);%147Sm to 144Nd ratio
dc  =6.524e-12;%decay constant of Sm 147
t_s = 560e6;%age
%CHUR-values (primitive mantle substitutes)
Nd143Nd144_PM = 0.512638;
Sm147Nd144_PM = 0.1967;
%DM-values
Nd143Nd144_DM = 0.513114;
Sm147Nd144_DM = 0.222;
%Model ages

T_CHUR=(1/dc)*log((Nd143Nd144_CC-Nd143Nd144_PM)/(Sm147Nd144_CC-Sm147Nd144_PM)+1)
T_DM=(1/dc)*log((Nd143Nd144_CC-Nd143Nd144_DM)/(Sm147Nd144_CC-Sm147Nd144_DM)+1)







