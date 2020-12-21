A = csvread('6WL_DRS_Noise_Test_30.csv',1);

BVF = A(:,7);
u630 = A(:,8);
B = A(:,9);
Mel = A(:,10);
O2 = A(:,11);
numParams = 5;
spectra = A(:,1:6);
wvl = [450 500 550 570 600 650];

%% Load LUT
global LUT mua_v musp_v Hb mel
%load LUT_350_100.mat
% load LUT_MMS2.mat
load LUT_1mm6Wave.mat

%% Load Hemoglobin Data
cd Chromophores
Hb = importdata('Hb.mat');  % http://omlc.ogi.edu/spectra/hemoglobin/summary.html
mel = importdata('mel.mat'); % http://omlc.ogi.edu/spectra/melanin/eumelanin.html
cd ..


%% Determine Error

data_analysis=[];
tic
for i = 1:30000
                    %sprintf('The current loop: Oxygen: %0.1f,Mel: %0.1f,B: %0.1f,musp: %0.1f,Hb: %0.1f',O2(iO2),Mel(iMel),B(iB),u630(iMu),BVF(iHb))
                    %run forward LUT
                    sprintf('Current loop: i=%i', i)
%                         DRS_modeled = MC_LUT_forward(wvl(i,1:6), [BVF(iHb) u630(iMu) B(iB) Mel(iMel) O2(iO2)],1);
%                         %DRS_simulated_backup(i,:)=DRS_modeled(:,2);
% 
%                         if DRS_modeled(1,1)>0
%                         DRS_simulated_backup(i,:)=DRS_modeled(:,2);
%                         data_analysis(i, 1:numParams) = [BVF(iHb), u630(iMu), B(iB),Mel(iMel),O2(iO2)];
                        spectra = A(i,1:6);
                        S = [wvl; spectra]';
                        %run inverse LUT
                        [R params] = MC_LUT_inverse(S);
                       % data_analysis(i, (numParams+1):(numParams*2)) = params(:);
                        DRS_inverse_backup(i,:)=R(:,2);
                        %collect errors of different elements
                         HbC_er(i) = (params(1) - BVF(i))/BVF(i) * 100;
                         u630_er(i) = (params(2) - u630(i))/u630(i) * 100;
                         B_er(i) = (B(i) - params(3))/B(i) * 100;
                         Mel_er(i) = (Mel(i) - params(4))/Mel(i) * 100;
                         O2_er(i) = (O2(i)-params(5))/O2(i)*100;
                        
                        bvfpred(i) = params(1);
                        musppred(i) = params(2);
                        bpred(i) = params(3);
                        melpred(i) = params(4);
                        o2pred(i) = params(5);
                        %data_analysis(i, (numParams*2+1):(numParams*3)) = [HbC_er, u630_er, B_er,Mel_er,O2_er];
                        %error(i) = [HbC_er u630_er B_er Mel_er O2_er];
                        %average the errors b/c independent
                        %mean_er = mean(abs(data_analysis(i, (numParams*2+1):(numParams*3))));
                        %data_analysis(i,numParams*3+1) = mean_er;

toc
end
%toc
errors = [HbC_er; u630_er; B_er; Mel_er; O2_er];
results = [bvfpred; musppred; bpred; melpred; o2pred];
save('10-5-20_noise_results.mat');
