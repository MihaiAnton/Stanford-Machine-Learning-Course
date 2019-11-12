function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%
disp('============================');
% You need to return the following variables correctly.
C = 0.3;
sigma = 0.1;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%
return
bestPred = -1;
bestC = -1;
bestSigma = -1;

choices = [0.01 0.03 0.1 0.3 1 3 10 30];

for i = 1:8,
  
  C = choices(i)
  for j = 1:8,
    sigma = choices(j)
    model = svmTrain(X,y,C,@(x1, x2) gaussianKernel(x1, x2, sigma));
    
    predictions = svmPredict(model,Xval);
    
    score = mean(double(predictions ~= yval));
    if bestPred == -1 || score < bestPred,
      bestPred = score;
      bestC = C;
      bestSigma = sigma;
    endif
    
    disp('-------score: ');disp(score);disp(' sigma: ');disp(sigma);disp(' C: ');disp(C);
    
  endfor
  
endfor
C = bestC;
sigma = bestSigma;


disp('best sigma: ');disp(sigma);disp('best C: ');disp(C);


% =========================================================================

end
