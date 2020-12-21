# Machine-Learning-for-6-Wavelength-DRS

Code for machine learning models and Monte Carlo Lookup Table (MCLUT) models to extract physiological parameters from 6 wavelengths of diffuse reflectance. 
Folders:
- Analysis and figures: code to generate figures, calculate errors, determine crosstalk
- Deep Learning MATLAB: functions that contain deep learning models built in MATLAB for time analysis
- DRS simulation and data generation: code to generate diffuse reflectance spectra, split into test/train set, and resulting datasets
- H2O models: H2O machine learning model generation and extraction to get resulting predicted parameters
- MCLUT functions: functions and files required to run MCLUT inverse and forward models. use MCLUTerrors to run the inverse model and extract parameters for results
