function [musp mua] = optprop(lambda, params)
% function [lambda mus g mua] = getMieScatter(lambda, CHb, scatsize, scatdensity)
% 
% OPTPROP gives musp(lambda) and mua(lambda) for given parameters.
%
% INPUT
%	lambda = vector of wavelengths to evaluate (nm)
%	params = vector of input parameters, given below:
%		1) BVF				(mg/ml)
%		2) Reduced Scattering at 630nm	(cm^-1)
%		3) Reduced Scattering Exponent  (unitless)
%		4) Melanin Concentration Mel	(mg/ml)
%       5) Oxygen Saturation			(%)
%
% OUTPUT 
%   musp			= vector of musp(lambda)
%   mua				= vector of mua_d(lambda)
%     
global Hb mel
%% Load Hemoglobin Data
% cd Chromophores
% Hb = importdata('Hb.mat');  % http://omlc.ogi.edu/spectra/hemoglobin/summary.html
% mel = importdata('mel.mat'); % http://omlc.ogi.edu/spectra/melanin/eumelanin.html
% cd ..

%% Load Hemoglobin Data
Hbw = Hb(:,1);				% Wavelengths
Hbe_o = Hb(:,2);			% Oxy
Hbe_d = Hb(:,3);			% Deoxy

%% Get oxy & deoxy mua
Hbext_o     = interp1(Hbw,Hbe_o,lambda);			% Oxy Extinction Coeff
Hbext_d     = interp1(Hbw,Hbe_d,lambda);			% Deoxy Extinction Coeff
mua_oxy     = (log(10) * Hbext_o) / 64458;	
mua_deoxy   = (log(10) * Hbext_d) / 64458;
%% Total blood mua
params(5)=params(5)/100;
mua_blood	= 150*(params(5)*mua_oxy + (1-params(5))*mua_deoxy);
%% Absorption due to hemoglobin
params(1)=params(1)/100;
mua_hb		= params(1) * (mua_blood);

%% Get musp
musp		= params(2)*(lambda/630).^(-params(3));

%% Absorption due to melanin
mel_ext		= interp1(mel(:,1),mel(:,2),lambda);
mua_mel		= params(4) * mel_ext;

%% Get mua
mua			= mua_hb + mua_mel;
 
% 1 layer: Pigment Packaging
% C_pack		= (1-exp(-2*mua_blood*params(6)))./(2*mua_blood*params(6));
% 
% %% Absorption due to hemoglobin
% mua_hb		= params(2) * (C_pack .* mua_blood);

% 2 layer: Separate Hb and mel