%%2
clear all
dc176Lu = 1.867e-11;%yr^-1, lutetium decay constant
Hf176Hf177_i_granite = 0.281333;
Hf176Hf177_CHUR = 0.28275;
Lu176Hf177_CHUR_0 = 0.0334;
% Hf176Hf177_CHUR = Hf176Hf177_CHUR_0+ LuLu*
epsHF = ((Hf176Hf177_i_granite/Hf176Hf177_CHUR)-1 )*1e4


t1 = 1.8e9;%Ga
t2 = 2.54e9;%Ga
Hf176Hf177_gneiss = 0.282460;
Lu176Hf177_gneiss = 0.01758;
Hf176Hf177_i_gneiss = Hf176Hf177_gneiss-Lu176Hf177_gneiss*(exp(dc176Lu*t2)-1)
Lu176Hf177_gneiss_t2 = Lu176Hf177_gneiss*exp(dc176Lu*t1)
Hf176Hf177_gneiss_t2 = Hf176Hf177_i_gneiss+Lu176Hf177_gneiss_t2*(exp(dc176Lu*t1)-1)

%% 3
clear all
t = 1.062e9;
Ar40_Ar39 = 29.33;
dc_Ar = 5.543e-10;
J = (1/Ar40_Ar39)*(exp(dc_Ar*t)-1)

%% 4 (incomplete)
%1 mol = 22.414 l in STP conditions
% K_bio = 7.75;%
% K40_bio = K_bio*0.01167;%
% K_fsp = 11.25;
% K40_fsp=K_fsp*0.01167;%
% V_bio = 1964e-8;%in ccSTP/g
% V_fsp = 2744e-8;
% dce = 0.581e-10; 
% dc = 5.5492e-10; 
% W_K40 = 39.96400;
% W_Ar40 = 39.948; %g/mol
% molg_K_bio = (K40_bio/100)
% molg_K_fsp
% molg_Ar_bio = V_bio/(22.414*1e3);%mol/g
% molg_Ar_fsp = V_fsp/(22.414*1e3);%mol/g
% Ar40K40_bio
% Ar40K40_fsp
% % Ar40K40 = (Ar/K)*(WK/WAr)*(XAr40/XK40)
% t = (1/dc)*log(2.6553e-09*(dc/dce)+1)
%% 5
clear all
t = linspace(0,4.5e9,1000)';%yr, time vector from 0 years to 4.5 billion years
dc_U238 = 1.55125e-10;%yr^-1, decay constants for uranium 238 and 235
dc_U235 = 9.8485e-10;%yr^-1
Pb207_U235 = (exp(dc_U235*t)-1);%Ratios X_Y from the decay equation
Pb206_U238 = (exp(dc_U238*t)-1);
figure
hold on
plot(Pb207_U235,Pb206_U238,'k')
plot(Pb207_U235(t == 1e9),Pb206_U238(t == 1e9),'ro')
text(Pb207_U235(t == 1e9),Pb206_U238(t == 1e9),{'    1 Ga'})
plot(Pb207_U235(t == 2e9),Pb206_U238(t == 2e9),'ro')
text(Pb207_U235(t == 2e9),Pb206_U238(t == 2e9),{'    2 Ga'})
plot(Pb207_U235(t == 3e9),Pb206_U238(t == 3e9),'ro')
text(Pb207_U235(t == 3e9),Pb206_U238(t == 3e9),{'    3 Ga'})
plot(Pb207_U235(t == 4e9),Pb206_U238(t == 4e9),'ro')
text(Pb207_U235(t == 4e9),Pb206_U238(t == 4e9),{'    4 Ga'})
plot(Pb207_U235(t == 4.5e9),Pb206_U238(t == 4.5e9),'ro')
text(Pb207_U235(t == 4.5e9),Pb206_U238(t == 4.5e9),{'    4.5 Ga'})
xlabel('^{207}Pb^*/^{235}U')
ylabel('^{206}Pb^*/^{238}U')
%% 6
clear all
Pb207_U235 = 4.8875;
Pb206_U238 = 0.32134;
Pb207_Pb206 = 0.11031;
dc_U238 = 1.55125e-10;%yr^-1, decay constants for uranium 238 and 235
dc_U235 = 9.8485e-10;%yr^-1
t_207 = (1/dc_U235)*log(Pb207_U235+1)
t_206 = (1/dc_U238)*log(Pb206_U238+1)
%estimate is more accurate with higher t length 
%(10^6 here, higher values might crash the program)
t = linspace(0,4.6e9,1e6)';
Pb207_Pb206_table = (1/137.88)*(exp(dc_U235*t)-1)./(exp(dc_U238*t)-1);
Delta = abs(Pb207_Pb206_table-Pb207_Pb206);
t_PbPb = t(Delta == min(Delta))

%% 7
clear all
%Measured ratios
Pb206_Pb204 = 18.757;
Pb207_Pb204 = 15.603;
Pb208_Pb204 = 38.644;
%Initial, known (Canyon diablo) values
Pb206_Pb204_0 = 9.307;
Pb207_Pb204_0 = 10.294;
%slope:
dc_U238 = 1.55125e-10;%yr^-1, decay constants for uranium 238 and 235
dc_U235 = 9.8485e-10;%yr^-1
slope = (Pb207_Pb204-Pb207_Pb204_0)/(Pb206_Pb204-Pb206_Pb204_0)
t = linspace(0,4.6e9,1e6)';
Pb207_Pb206_table = (1/137.88)*(exp(dc_U235*t)-1)./(exp(dc_U238*t)-1);
Delta = abs(Pb207_Pb206_table-slope);
t_Earth = t(Delta == min(Delta))

%% 8
clear all
dc_U238 = 1.55125e-10;%yr^-1, decay constants for uranium 238,235 and thorium 232
dc_U235 = 9.8485e-10;%yr^-1
dc_Th232 = 4.9475e-10;%yr^-1
Pb206_Pb204 = 13.211;
Pb207_Pb204 = 14.401;
Pb208_Pb204 = 33.069;
% Pb208_Pb204_01 = 29.476;
% Pb206_Pb204_01 = 9.307;
% Pb207_Pb204_01 = 10.294;
Pb206_Pb204_02 = 11.152;
Pb207_Pb204_02 = 12.998;
Pb208_Pb204_02 = 31.23;
% m1  = (Pb207_Pb204-Pb207_Pb204_01)/(Pb206_Pb204-Pb206_Pb204_01)
m2  = (Pb207_Pb204-Pb207_Pb204_02)/(Pb206_Pb204-Pb206_Pb204_02);
t = linspace(0,3.7e9,1e6)';
T=3.7e9;%start of the second stage
SK_table = (1/137.88)*(exp(dc_U235*T)-exp(dc_U235*t))./(exp(dc_U238*T)-exp(dc_U238*t));
% plot(t,SK_table,'r')
Delta = abs(SK_table-m2);
t_m = t(Delta == min(Delta))
mu1 = 7.192;
mu = Pb206_Pb204_02+mu1*(exp(dc_U238*T)-exp(dc_U238*t_m))
omega = (Pb208_Pb204-Pb208_Pb204_02)/(exp(dc_Th232*T)-exp(dc_Th232*t_m))
Th232_U238 = omega/mu