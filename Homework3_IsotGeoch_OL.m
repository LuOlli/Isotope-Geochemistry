%%2
alpha = (30+1000)/(1+1000)
Tlnalpha = 1000*log(alpha)
eps = (alpha - 1)*1e3
%% 3
%abundances:
O16 = 0.9976206;
O17 = 0.0003790;
O18 = 0.0020004;
H1 = 0.99984426;
D = 0.00015574;

HD18O = H1*D*O18
D218O = D*D*O18

H216O = H1*H1*O16;
HD16O = H1*D*O16;
H217O = H1*H1*O17;
H218O =  H1*H1*O18;
%D/H = (155.76 ± 0.08) × 10−6 (Hagemann et al. 1970) 
% 18O/16O = (2005.20 ± 0.45) × 10−6 (Baertschi 1976).
% There are four primary isotopologues of water: 
% H216O (about 99.731%), 
% HD16O (about 0.003789%),
% H217O (0.037%) 
% and H218O (about 0.2%)6. 
%https://www.nature.com/articles/sdata2018302
%% 4

%% 5
A= [0.1 -0.63];
% B = [];
T= 300;
Delta = A*1e6/T^2
1000*log(Delta)
dS_gal = -4.5;
dS_sph = -5.8;
a_sph_gal = dS_sph-dS_gal;
Klnalpha = 1000*log(a_sph_gal)