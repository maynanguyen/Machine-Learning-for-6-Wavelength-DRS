% Test MCLUT inverse model


clc; close all, clear all
global LUT mua_v musp_v Hb mel n fval01
%load LUT_350_100.mat
load LUT_1mm6Wave.mat
load Experiment10292019_10Values6WL.mat


%% Load Hemoglobin Data
cd Chromophores
Hb = importdata('Hb.mat');  % http://omlc.ogi.edu/spectra/hemoglobin/summary.html
mel = importdata('mel.mat'); % http://omlc.ogi.edu/spectra/melanin/eumelanin.html
cd ..

%% Define wavelength range
wvl = linspace(410,650,100); % Must be between 350 and 688 nm
S(:,1) = wvl; %column of wavelengths

test = csvread( "6WL_DRS_ChangeAll_10ValuesTest30H2O.csv",1);
testDRS = test(:,1:6);
wv6=[450 500 550 570 600 650]';
BVFtruth = test(1:100, 7);
musptruth = test(1:100, 8);
Btruth = test(1:100, 9);
Meltruth = test(1:100, 10);
O2truth = test(1:100, 11);

for j=1:50
    sprintf('j is: %i', j)
    k = randperm(30000);
    randomDRS = testDRS(k(1:100),:); % randomly select 100 spectra
    tic;
    for i=1:100
       
                  SixWLs = [wv6, randomDRS(i,:)'];
                  [R params] = MC_LUT_inverse(SixWLs);      
                  data(i,:) = [R(:,2)' params];
                       
    end
    t(j)=toc;
end

datavector = t(:);

%csvwrite('MCLUTtime1spectra.csv',datavector);