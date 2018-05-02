# Synthetical-Design-of-Bayesian-Classifier
Bayesian decision, Minimum risk, Normal distribution

Bayesian estimation is one of the main parameter estimation methods in probability density estimation. It treats the parameters to be estimated as random variables. All you have to do is estimate the distribution of the parameters based on the observation data, combining a class condition probability P(X|ω_i) and a priori probability P(ω_i ) to estimate a posterior probability of the parameter P(ω_i |X). 
In addition, the minimum risk Bayesian decision need to consider the loss function and select the classification method of minimum risk synthetically. 
In this experiment, we mainly consider the normal distribution of data, and discuss the Bayesian decision under higher dimensional samples and more categories.

In all three programs, the conditional probability density function is assumed to be normal distribution. And most of the data have been set in advance, including loss, average, variance, covariance matrix, etc. Therefore, some improvement is still required if the codes need to be used in some other cases as a function.
data_process1 is for one-dimensional, two-class sample data.
data_process2 is for two-dimensional, two-class sample data.
data_process3 is for two-dimensional, three-class sample data.
