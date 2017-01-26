clear;
clc;
warning('off', 'MATLAB:nchoosek:LargeCoefficient');

SIZE = 1000;
PROBABILITY = 0.01;

graph = GenerateERGraph(SIZE, PROBABILITY);
distributions = CalculateDegreeDistribution(graph);

predictions = TheoreticalPrediction1(SIZE, PROBABILITY);

range = (1:SIZE)-1;

plot(range, distributions, range, predictions);

VisualizeGraph(graph);
