clear;
close all;
clc;
smallWorldExample
SIZE = 11;
C = 4;

% graph = GenerateCircularGraph(SIZE, C);

graph = A;

CalculatePathStatistics(graph)

VisualizeGraph(graph);


