tw = 25;
ts = 10;
alpha = 0.97;
m = 20;
c = 12;
l = 22;
lf = 300;
hf = 3700;

wav_file = ["a1.wav", "a2.wav", "a3.wav", "a4.wav", "e1.wav", "e2.wav", "e3.wav", "e4.wav", "i1.wav", "i2.wav", "i3.wav", "i4.wav", "o1.wav", "o2.wav", "o3.wav", "o4.wav", "u1.wav", "u2.wav", "u3.wav", "u4.wav"];
test_wav = ["a5.wav", "e5.wav", "i5.wav", "o5.wav", "u5.wav"];
labels = ["a", "e", "i", "o", "u"];
train_matrix = table();


for i=1:size(wav_file, 2)
    [speech, fs] = audioread(strcat("sample_jag/", wav_file(i)));
    [coeff, delta, deldelta, loc] = mfcc(speech, fs, "LogEnergy", "ignore");
    mat = cat(2, coeff, delta, deldelta);
    mat = array2table(mat);
    sz = size(mat, 1);
    temp = char.empty;
    temp(1:sz, 1:1) = char(labels(ceil(i/4)));
    mat.label = temp;
    train_matrix = [train_matrix; mat];
end