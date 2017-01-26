clear;
close all;
clc;

SIZE = 10;
PROBABILITY = 0.5;
C = 4;


graph = GenerateCircularGraph(SIZE, C);

VisualizeGraph(graph);

numEdges = SIZE*C/2;

for i = 1:numEdges
  if (rand() < PROBABILITY)
    index = randperm(SIZE, 2);
    smaller = min(index(1), index(2));
    bigger = max(index(1), index(2));
    graph(smaller, bigger) = 1;
  end
end

graph = sign(graph'+graph);
VisualizeGraph(graph);