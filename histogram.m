num_flips = 5000;

coin_flips = rand(1, num_flips) < 0.5;

running_prob_heads = cumsum(coin_flips) ./ (1:num_flips);

plot(1:num_flips, running_prob_heads);
hold on;

plot([1, num_flips], [0.5, 0.5], 'k--');

xlabel('Number of Coin Flips');
ylabel('Probability of Heads');
title('Sample Probability of Heads in n flips of a simulated coin');

legend('Sample Probability', 'Fair Coin', 'Location', 'southoutside');

grid on;

hold off;

poisspdf2 = @(x, lambda) (lambda.^x)*exp(-lambda)./factorial(x);
x = 0:100;
x = x';
poiss_cdf = @(lambda) [0; cumsum(poisspdf2(x, lambda))];
poissrnd2 = @(lambda)  find(poiss_cdf(lambda) < rand(), 1, 'last')-1;

num_samples = 1000;
lambda = 5;
samples = zeros(num_samples, 1);
for ii = 1:num_samples
    samples(ii) = poissrnd2(lambda);
end

[N, X] = hist(samples, 0:max(samples));
prob_mass = N / sum(N);

bar(X, prob_mass, 'b');
hold on;

pmf = poisspdf2(X, lambda);
plot(X, pmf, 'r', 'LineWidth', 2);

xlabel('Value');
ylabel('Probability');
title('Poisson Distribution and Observed Histogram');
legend('Experimental Histogram', 'Actual Poisson Distribution');
hold off;
