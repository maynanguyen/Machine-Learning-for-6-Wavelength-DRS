function E = MC_LUT_fitness(params)
% function E = MC_LUT_fitness(X)
% 
% MC_LUT_FITNESS calculate the sum of squares error between the modeled
%	spectra and the measured spectra with X as the vector of parameters
%	used to create the modeled spectra
%
% INPUT
%	params	= vector of input parameters, given below:
%		1) [Hb]							(mg/ml)
%		2) Reduced Scattering at 630nm	(cm^-1)
%		3) Reduced Scattering Exponent  (unitless)
%
% OUTPUT 
%   E	= value of merit function - % Error (0 - 100)
%  

%% Globals
global spectra
warning off 

%% Create Model
R = MC_LUT_forward(spectra(:,1),params,1);
S = spectra(:,2);
%Experimental data no calibration

%% Find Error
dif = abs(S-R(:,2))./S;
E = mean(dif) * 100;

