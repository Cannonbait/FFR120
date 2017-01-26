close all;
clear;
clc;

Network1;
Network2;
Network3;

graph1 = ListToGraph(network1, max(network1));
graph2 = ListToGraph(network2, max(network2));
graph3 = ListToGraph(network3, max(network3));

VisualizeGraph(graph1);
VisualizeGraph(graph2);
VisualizeGraph(graph3);
% 
% CalculateClusteringCoefficient(graph1)
% CalculateClusteringCoefficient(graph2)
% CalculateClusteringCoefficient(graph3)



% distributions1 = CalculateDegreeDistribution(graph1);
% range1 = (1:max(network1));
% 
% distributions2 = CalculateDegreeDistribution(graph2);
% range2 = (1:max(network2));
% 
% distributions3 = CalculateDegreeDistribution(graph3);
% range3 = (1:max(network3));
% loglog(range1, distributions1, range2, distributions2, range3, distributions3);
% 
CalculatePathStatistics(graph1)
CalculatePathStatistics(graph2)
CalculatePathStatistics(graph3)
