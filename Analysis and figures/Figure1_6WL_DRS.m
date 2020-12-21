% Figure for DRS spectra, 6 and 100 wavleength

load("Experiment11-5-20_6WLnoise.mat");
a = DRS_100WLs(1,:);
b = DRS_SixWLs(1,:);

% plot(wvl,a, 'LineWidth',5);
% hold on;
% plot(wv6,b,'g', 'LineWidth',5);
% xlabel("Wavelength (nm)");
% ylabel("Reflectance");

L(1) = plot(wvl, a, '-b', 'LineWidth',3);
hold on;
L(2) = plot(wv6, b, 'k.', 'LineWidth',1, 'MarkerSize', 40);
set(gca,'fontsize',16);
xlabel("Wavelength (nm)");
ylabel("Reflectance");
legend(L, ["100 Wavelengths", "6 Wavelengths"], 'Location', 'best')


% figure();
% plot(wvl, a, '-.b', 'LineWidth',5)
% set(gca,'fontsize',16);
% xlabel("Wavelength (nm)");
% ylabel("Reflectance");




