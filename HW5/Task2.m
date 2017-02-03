clear;
close all;
clc;




Beta = 1;
Gamma = 0.2;
UPPERLIMIT = 2;
STEPSIZE = 0.01;
R = 0:STEPSIZE:UPPERLIMIT;
numTestValues = length(R)
statistics = zeros(numTestValues, 1);
numExperiments = 20;

parfor i = 1:numTestValues
  sigma = 1/ (1+1/R(i));
  for j = 1:numExperiments
    adjacencyMatrix = GenerateERGraph(100, 0.05);
    adjacencyMatrix = RemoveEdges(adjacencyMatrix, sigma);
    largestCluster = CalculateLargestCluster(adjacencyMatrix);
    statistics(i) = statistics(i) + largestCluster;
  end
end
statistics = statistics ./ numExperiments;

rValues = linspace(STEPSIZE,UPPERLIMIT,numTestValues);
figure(2);
clf
plot(rValues,statistics)