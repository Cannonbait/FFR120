clear;
close all;
clc;
smallWorldExample

SIZE = 5000;
C = 6;
% 
% graph = GenerateCircularGraph(SIZE, C);
% 3/4*(C-2)/(C-1)

graph = A;

CalculateClusteringCoefficient(graph)

VisualizeGraph(graph);