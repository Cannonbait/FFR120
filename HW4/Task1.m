clear;
clc;
warning('off', 'MATLAB:nchoosek:LargeCoefficient');

SIZE = 1030;
PROBABILITY = 0.5;

graph = GenerateERGraph(SIZE, PROBABILITY);
distributions = CalculateDegreeDistribution(graph);

predictions = TheoreticalPrediction(SIZE, PROBABILITY);

range = (1:SIZE)-1;

plot(range, distributions, range, predictions);