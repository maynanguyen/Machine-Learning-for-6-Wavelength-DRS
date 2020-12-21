% Test MCLUT inverse model
% Set [mel] as 0 first
% 2017-12-14
% Yao

clc; close all, clear all
global LUT mua_v musp_v Hb mel n fval01
%load LUT_350_100.mat
load LUT_1mm6Wave.mat
%% Load Hemoglobin Data
cd Chromophores
Hb = importdata('Hb.mat');  % http://omlc.ogi.edu/spectra/hemoglobin/summary.html
mel = importdata('mel.mat'); % http://omlc.ogi.edu/spectra/melanin/eumelanin.html
cd ..

%% Define wavelength range
wvl = linspace(410,650,100); % Must be between 350 and 688 nm
S(:,1) = wvl; %column of wavelengths


wv6=[450 500 550 570 600 650];
% col = {'k','b','r','g','m'}
% col_w_mel = {'k','k','b','b','r','r','g','g','m','m'}
% figure name 'figure'n
%% Define ground truth of parameters
%	params	- parameters:
%		1) BVF				(%)
%		2) Reduced Scattering at 630nm	(cm^-1)
%		3) Reduced Scattering Exponent  (unitless)
%		4) Melanin Concentration Mel	(mg/ml)
%       5) Oxygen Saturation			(%)

global BVF u630 B Mel O2

% change last number to be number of each parameter

% change last number to be number of each parameter
BVF = linspace(1,5,10);%[1 2 3 4 5];% unit is 100% 
u630 = linspace(10,30,10);%[10 15 20 25 30]; % cm^-1
B = linspace(1.3,2.5,10);%[1.3 1.6 1.9 2.2 2.5]; 
Mel = linspace(0,2,10);%0; %[0 0.5 1 1.5 2];%(0,2)
O2 = linspace(60,100,10);%[60 70 80 90 100]; %  unit is 100%


numParams = 5;


%% Determine Error
i = 0;
data_analysis=[];
for iMel = 1:size(Mel,2)    
    for iO2 = 1:size(O2,2)
   %for iMel = 1:size(Mel,2)
        for iB = 1:size(B,2)
            for iMu = 1:size(u630,2)
                for iHb = 1:size(BVF,2)
                  
                    sprintf('The current loop: Oxygen: %0.1f,Mel: %0.1f,B: %0.1f,musp: %0.1f,Hb: %0.1f',O2(iO2),Mel(iMel),B(iB),u630(iMu),BVF(iHb))
                    %run forward LUT
                    DRS_modeled = MC_LUT_forward(wvl, [BVF(iHb) u630(iMu) B(iB) Mel(iMel) O2(iO2)],1);
                    if DRS_modeled(1,1)>0
                        i = i + 1;
                        DRS_simulated_backup(i,:)=DRS_modeled(:,2);
                        data_analysis(i, 1:numParams) = [BVF(iHb), u630(iMu), B(iB),Mel(iMel),O2(iO2)];
                        DRS = DRS_modeled(:,2) + 0.03*randn(1,100)';
                        %plot(wvl,DRS);
                         %For inverse test
                         
                         %To calculate for commercial DRS approx.
                         for j = 1:length(wv6)
                            lambda = wv6(j);
                            wavelengthRange = transpose([DRS_modeled(:,1) DRS]);
                            pdf = normpdf(wavelengthRange(1,:),lambda,40/2.35);
                            Wtd_Avg_Int = (pdf/sum(pdf))* DRS;
                            SixWLs(j,:) = [lambda, Wtd_Avg_Int];
                         end
                         DRS_SixWLs(i,:) = SixWLs(:,2); % Save DRS of all loops
                         DRS_100WLs(i,:) = DRS;
                    end
                end
            end
        end
    end
end
data_analysis_6=data_analysis;


save('Experiment10-4-20_6WLnoise.mat')

%Save wavelengths and DRS
DRS_final_6 = [SixWLs(:,1)'; DRS_SixWLs];
DRS_final_100 = [wvl; DRS_100WLs];
%Parameter values
Parameters = [zeros(1,5); data_analysis(:,1:5)];
% DRS + params
%DRS_params = [DRS_final Parameters];
csvwrite('6WL_DRS_Noise.csv',[DRS_final_6 Parameters]);
csvwrite('100WL_DRS_Noise.csv', [DRS_final_100 Parameters]);

