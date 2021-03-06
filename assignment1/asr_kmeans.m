load ('train_matrix.mat')
load ('test_matrix.mat');

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

[idx, C] = kmeans(X,  5, 'MaxIter', 1000);
%      a       119     20.273
%      e       130     22.147
%      i       114     19.421
%      o       117     19.932
%      u       107     18.228
 
test_label = zeros(size(testX, 1), 1);

 for i = 1:size(testX, 1)
     minim = Inf;
     index = -1;
     for j = 1:size(C, 1)
         temp = norm(C(j) - testX(i));
         if (temp < minim)
             minim = temp;
             index = j;
         end
     end
     test_label(i) = index;
 end