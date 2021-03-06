%Examples using Iris Data Set

load ('train_matrix.mat')
load ('test_matrix_jag.mat');

X = train_matrix(:, 1:39);
Y = train_matrix(:, 40);
X = table2array(X);
Y = table2array(Y);
X = normalize(X);

testX = test_matrix(:, 1:39);
testY = test_matrix(:, 40);
testX = table2array(testX);
testY = table2array(testY);
testX = normalize(testX);

%Xnew = [min(X);mean(X);max(X)];
k = 5;
metric = 'euclidean';

mdl = kNNeighbors(k,metric);
mdl = mdl.fit(X,Y);

Ypred = mdl.predict(testX);

%Ynew = {'versicolor';'versicolor';'virginica'};
accuracy = accuracy_score(Ypred,testY);
