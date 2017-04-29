
This project aims to provide a proof of concept for Soft Biometrics 
as technique for reducing search space when trying to identify/verify 
any individual.

====================================

Two tehniques were used to demonstrate our aim. They are:
a. Similarity Matching
b. Using Neural Networks

Similarity matching technique used three different cost functions:
a. simple difference based approach to calculate cost
b. scaled difference based approach using discriminative power to calculate cost
c. penalty based approach based on discriminative power to calculate cost
sample code
	[a b c] = softSpaceReduce(option1, option2);
	option1 can be either 1, 2 or 3 corresponding to the three different cost functions
	option2 can values from 1 to 58 representing the serial number corresponding to 58 test cases
	whose top three matched values we want to see. Enter 999 to see the total correct answers for all cases.
	a gets the number of correct answers in the first go
	b gets the number of correct answers in the second go
	c gets the number of correct answers in the three go


Neural Network based approach:
sample code
	[a b c] = softSpaceReduceNN(option);
	option can values from 1 to 58 representing the serial number corresponding to 58 test cases
	whose top three matched values we want to see. Enter 999 to see the total correct answers for all cases.
	a gets the number of correct answers in the first go
	b gets the number of correct answers in the second go
	c gets the number of correct answers in the three go

====================================

Other important functions used:

matching(u, option)
	gives the top three ids corresponding to vector 'u' and option is used for selecting the cost function. This function uses cosSim() function.

cosSim(u,v,w,option)
	gives the cost based on similarity matching between 'u' and 'v'. The weights assigned to different attributes and the cost function is selected using option.

====================================

Information regarding other folders:

./Figures 
	contains the various figures and the associated with the study and assocaited .mat files

./SimilarityMatchingData
	contains the .mat data files needed for softSpaceReduce() function

./NeuralNetworkData
	contains the .mat data files needed for softSpaceReduceNN() function

====================================






