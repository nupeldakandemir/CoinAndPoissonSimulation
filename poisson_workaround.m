% Work around for poissrnd for students who do not have the 
% statistics toolbox installed

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% This function returns the probabilities evaluated for each point in
% x for a specific lambda. Note that there is a limitation on the range 
% of x due to the use of the factorial command

% If factorial is not defined in your matlab, uncomment the next line
% factorial = @(x) prod(x:-1:1);
poisspdf2 = @(x, lambda) (lambda.^x)*exp(-lambda)./factorial(x);
x = 0:100;
x = x';
poiss_cdf = @(lambda) [0; cumsum(poisspdf2(x, lambda))];

% This function returns a scalar sampled from the poisson distribution
% Vectors are not supported for this anonymous function
poissrnd2 = @(lambda)  find(poiss_cdf(lambda) < rand(), 1, 'last')-1;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% % Example of how to use  use poissrnd2 - create an vector and sample
% % each individual scalar
% testVec = zeros(10000,1);
% myLambda = 2;
% for ii=1:10000
%     testVec(ii) = poissrnd2(myLambda);
% end
% 
% % Example of how to use poisspdf2
% tmpPDF = poisspdf2(0:100, myLambda);
% 
% 
% 
% counts = hist(testVec, 0:100);
% counts = counts ./sum(counts);
% figure,bar(0:100, counts)
% hold on
% plot(0:100,tmpPDF, 'r')
% hold off
% axis([0 20 0 .2])




