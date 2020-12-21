A = csvread('6WL_DRS_Noise_Test_30.csv',1);

BVF = A(:,7);
u630 = A(:,8);
B = A(:,9);
Mel = A(:,10);
O2 = A(:,11);
numParams = 5;
spectra = A(:,1:6);
wvl = [450 500 550 570 600 650];



for i = 1:50
    
k = randperm(30000);
randomDRS = spectra(k(1:1),:);    
    
tic
[y1] = BVFNeuralNetwork(randomDRS);
BVF_time=toc;

tic
[y2] = muspNeuralNetwork(randomDRS);
musp_time=toc;

tic
[y1] = BNeuralNetwork(randomDRS);
B_time=toc;

tic
[y1] = MelNeuralNetwork(randomDRS);
Mel_time=toc;

tic
[y1] = O2NeuralNetwork(randomDRS);
O2_time=toc;
time(i) = BVF_time+musp_time+B_time+Mel_time+O2_time;
end

avg_time = mean(time);
% all spectra results
[BVF_DL] = BVFNeuralNetwork(spectra);
[musp_DL] = muspNeuralNetwork(spectra);
[B_DL] = BNeuralNetwork(spectra);
[Mel_DL] = MelNeuralNetwork(spectra);
[O2_DL] = O2NeuralNetwork(spectra);


results = [BVF_DL'; musp_DL'; B_DL'; Mel_DL'; O2_DL']';
% BVFavg = mean(abs(((BVF_DL-BVF)/BVF)*100));
% muspavg = mean(abs(((musp_DL-musp)/musp)*100));

