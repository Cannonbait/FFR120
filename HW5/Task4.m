clear;
close all;
clc;

STEPSIZE = 0.01;
NUM_NODES = 100;
f = 0:STEPSIZE:1;
numTestValues = length(f);
statistics = zeros(numTestValues, 6);
numExperiments = 50;
prob = 0.15;
m = 5;


figure();
adjacencyMatrix = GenerateERGraph(NUM_NODES, prob);
degreeDistribution = CalculateDegreeDistribution(adjacencyMatrix);
excessDistribution = CalculateExcessDegreeDistribution(adjacencyMatrix);
xValues1 = 1:length(degreeDistribution);
xValues2 = 1:length(excessDistribution);

plot(xValues1, degreeDistribution, xValues2, excessDistribution);

title('ER graph');
legend('Degree Distribution','Excess Distribution');
figure();
adjacencyMatrix = GeneratePreferentialGraph(NUM_NODES, m);
degreeDistribution = CalculateDegreeDistribution(adjacencyMatrix);
excessDistribution = CalculateExcessDegreeDistribution(adjacencyMatrix);
xValues1 = 1:length(degreeDistribution);
xValues2 = 1:length(excessDistribution);
plot(xValues1, degreeDistribution, xValues2, excessDistribution);
title('PG graph');
legend('Degree Distribution','Excess Distribution');





parfor i = 1:numTestValues
  for j = 1:numExperiments
    adjacencyMatrix = GenerateERGraph(NUM_NODES, prob);
    adjacencyMatrix = RemoveFraction(adjacencyMatrix, f(i));
    largestCluster = CalculateLargestCluster(adjacencyMatrix);
    statistics(i, 1) = statistics(i, 1) + largestCluster;
  end
end

parfor i = 1:numTestValues
  for j = 1:numExperiments
    adjacencyMatrix = GenerateERGraph(NUM_NODES, prob);
    adjacencyMatrix = RemoveHighestDegree(adjacencyMatrix, f(i));
    largestCluster = CalculateLargestCluster(adjacencyMatrix);
    statistics(i, 2) = statistics(i, 2) + largestCluster;
  end
end

parfor i = 1:numTestValues
  for j = 1:numExperiments
    adjacencyMatrix = GenerateERGraph(NUM_NODES, prob);
    adjacencyMatrix = RemoveRandomNeighbour(adjacencyMatrix, f(i));
    largestCluster = CalculateLargestCluster(adjacencyMatrix);
    statistics(i, 3) = statistics(i, 3) + largestCluster;
  end
end

parfor i = 1:numTestValues
  for j = 1:numExperiments
    adjacencyMatrix = GeneratePreferentialGraph(NUM_NODES, m);
    adjacencyMatrix = RemoveFraction(adjacencyMatrix, f(i));
    largestCluster = CalculateLargestCluster(adjacencyMatrix);
    statistics(i, 4) = statistics(i, 4) + largestCluster;
  end
end

parfor i = 1:numTestValues
  for j = 1:numExperiments
    adjacencyMatrix = GeneratePreferentialGraph(NUM_NODES, m);
    adjacencyMatrix = RemoveHighestDegree(adjacencyMatrix, f(i));
    largestCluster = CalculateLargestCluster(adjacencyMatrix);
    statistics(i, 5) = statistics(i, 5) + largestCluster;
  end
end

parfor i = 1:numTestValues
  for j = 1:numExperiments
    adjacencyMatrix = GeneratePreferentialGraph(NUM_NODES, m);
    adjacencyMatrix = RemoveRandomNeighbour(adjacencyMatrix, f(i));
    largestCluster = CalculateLargestCluster(adjacencyMatrix);
    statistics(i, 6) = statistics(i, 6) + largestCluster;
  end
end

statistics = statistics ./ numExperiments;




rValues = linspace(STEPSIZE,1,numTestValues);
figure();
clf
plot(rValues,statistics(:,1:3))
title('ER graph');
legend('Random','Highest Degree', 'Remove random neighbour');

figure();
plot(rValues,statistics(:,4:6))
title('PG graph');
legend('Random','Highest Degree', 'Remove random neighbour');