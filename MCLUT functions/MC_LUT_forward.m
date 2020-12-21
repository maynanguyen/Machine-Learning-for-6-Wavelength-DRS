function R = MC_LUT_forward(lambda, params, flag)
% function E = MC_LUT_inverse(S)
% 
% MC_LUT_FORWARD is the LUT based forward model that generates a spectrum
%	at the wavelength specified in LAMBDA with the parameters specified 
%	in PARAMS
%
% INPUT
%	lambda	- wavelength (nm)
%	params	- parameters:
%		1) Concentration Hb				(mg/ml)
%		2) Reduced Scattering at 630nm	(cm^-1)
%		3) Reduced Scattering Exponent  (unitless)
%		4) Melanin Concentration Mel	(mg/ml)
%       5) Oxygen Saturation			(%)
%
% OUTPUT 
%   R		- Modeled Spectrum
% Yao Zhang 12/12/2017 Added restriction

%% Globals
global LUT mua_v musp_v Hb mel
%load LUT_1mm6Wave.mat
 %% Find musp & mua
[musp, mua] = optprop(lambda, params);

LUTOver=0;
R = zeros(length(lambda),2);

if (nargin < 3)
    flag=0;  % default do not plot if beyond LUT range
    %% Prevent Values Outside LUT
    if max(musp < min(musp_v)) | max(musp > max(musp_v)) | max(mua < min(mua_v)) | max(mua > max(mua_v))
        LUTOver=1;
    else
    %% Create Spectra
        R(:,1) = lambda;
        R(:,2) = interp2(mua_v, musp_v, LUT', mua, musp,'cubic');
    end
else
    %% Prevent Values Outside LUT
    musp(musp < min(musp_v))	= min(musp_v);
    musp(musp > max(musp_v))	= max(musp_v);

    mua(mua < min(mua_v))		= min(mua_v);
    mua(mua > max(mua_v))		= max(mua_v);
    
    if flag
        R(:,1) = lambda;
        R(:,2) = interp2(mua_v, musp_v, LUT', mua, musp,'cubic');
    end
end
