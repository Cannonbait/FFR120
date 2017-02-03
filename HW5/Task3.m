clear;
close all;
clc;

STEPSIZE = 0.01;
NUM_NODES = 100;
f = 0:STEPSIZE:1;
numTestValues = length(f);
statistics = zeros(numTestValues, 4);
numExperiments = 50;

parfor i = 1:numTestValues
  for j = 1:numExperiments
    adjacencyMatrix = GenerateERGraph(NUM_NODES, 0.15);
    adjacencyMatrix = RemoveFraction(adjacencyMatrix, f(i));
    largestCluster = CalculateLargestCluster(adjacencyMatrix);
    statistics(i, 1) = statistics(i, 1) + largestCluster;
  end
end

parfor i = 1:numTestValues
  for j = 1:numExperiments
    adjacencyMatrix = GenerateERGraph(NUM_NODES, 0.15);
    adjacencyMatrix = RemoveHighestDegree(adjacencyMatrix, f(i));
    largestCluster = CalculateLargestCluster(adjacencyMatrix);
    statistics(i, 2) = statistics(i, 2) + largestCluster;
  end
end

parfor i = 1:numTestValues
  for j = 1:numExperiments
    adjacencyMatrix = GeneratePreferentialGraph(NUM_NODES, 5);
    adjacencyMatrix = RemoveFraction(adjacencyMatrix, f(i));
    largestCluster = CalculateLargestCluster(adjacencyMatrix);
    statistics(i, 3) = statistics(i, 3) + largestCluster;
  end
end

parfor i = 1:numTestValues
  for j = 1:numExperiments
    adjacencyMatrix = GeneratePreferentialGraph(NUM_NODES, 5);
    adjacencyMatrix = RemoveHighestDegree(adjacencyMatrix, f(i));
    largestCluster = CalculateLargestCluster(adjacencyMatrix);
    statistics(i, 4) = statistics(i, 4) + largestCluster;
  end
end

statistics = statistics ./ numExperiments;




rValues = linspace(STEPSIZE,1,numTestValues);
figure(1);
clf
plot(rValues,statistics(:,[1 2]))
title('ER graph');
legend('Random','Highest Degree');

figure(2);
plot(rValues,statistics(:,[3 4]))
title('PG graph');
legend('Random','Highest Degree');