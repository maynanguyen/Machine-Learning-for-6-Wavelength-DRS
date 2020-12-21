function [R params] = MC_LUT_inverse(S)
% function E = MC_LUT_inverse(S)
% 
% MC_LUT_INVERSE extracts the parameters from the spectrum S using
%	a LUT based inverse model
%
% INPUT
%	S	- Measured spectra. S(:,1) = wavelengths in nanometers. 
%							S(:,2) = reflectance values.
%
% OUTPUT 
%   R		- Modeled Spectra (fit)
%	params  - Extracted parameters:
%		1) [Hb]							(mg/ml)
%		2) Reduced Scattering at 630nm	(cm^-1)
%		3) Reduced Scattering Exponent  (unitless)
%  

%% Global Variables
global spectra
spectra = S;

%% Initialize
	%[Hb]	mus630	 B      Mel    Oxygen(%)
X0 = [1     15		1         1       60];
lb = [0.5    5		1         0       40];
ub = [8     40	   2.5       2.5       100];

%% Optimization
options = optimset('MaxFunEvals',5000,'MaxIter',5000,'TolX',5E-8, ...
	'TOlFun',5E-8,'display','off','algorithm','interior-point');
params = fmincon(@MC_LUT_fitness,X0,[],[],[],[],lb,ub,[],options);

%% get parameters
R = MC_LUT_forward(spectra(:,1),params,1);
