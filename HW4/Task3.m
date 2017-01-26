close all;
clear;
clc;
m = 2;

VISUALIZE = false;
NODES_TO_ADD = 5;
INITIAL_NODES = m*2;
SIZE = NODES_TO_ADD+INITIAL_NODES;
graph = GenerateERGraph(INITIAL_NODES, 1);
initialConnections = EdgeList(graph);
numInitialEdges = size((initialConnections),1);
edgeList = zeros(NODES_TO_ADD*m+numInitialEdges,2);
edgeList(1:numInitialEdges,:) = initialConnections;

if (VISUALIZE)
  RenderNetworkCircular(graph);
end


for i=1:NODES_TO_ADD
  candidates = edgeList(edgeList ~= 0);
  numEdges = length(candidates);
  
  % Calculate nodes to connect new node to
  for j = 1:m
    index = randi(numEdges);
    edgeList((i-1)*m+j+numInitialEdges,:) = [i+INITIAL_NODES candidates(index)];
    numEdges = numEdges - length(candidates(candidates == candidates(index)));
    candidates = candidates(candidates ~= candidates(index));
  end
  
  if (VISUALIZE)
    RenderNetworkCircular(graph);
  end
end
% 
% distributions = CalculateDegreeDistribution(graph);
% 
% predictions = TheoreticalPrediction3(SIZE, m);
% 
% range = (1:SIZE)-1;
% 
% loglog(range, distributions, range, predictions);




