tw = 25;
ts = 10;
alpha = 0.97;
m = 20;
c = 12;
l = 22;
lf = 300;
hf = 3700;

wav_file = 'a.wav';
[speech, fs] = audioread(wav_file);

[coeff, delta, deldelta, loc] = mfcc(speech, fs, "LogEnergy", "ignore");

mat = cat(2, coeff, delta, deldelta);

%temp = ones(35, 1);
mat = array2table(mat);

temp(1:35, 1:1) = char('a');
mat.label = temp;