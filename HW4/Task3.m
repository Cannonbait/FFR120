close all;
clear;
clc;
m = 5;

VISUALIZE = false;
NODES_TO_ADD = 3500;
INITIAL_NODES = 7;
TOTAL_NODES = NODES_TO_ADD+INITIAL_NODES;
SIZE = NODES_TO_ADD+INITIAL_NODES;
graph = GenerateERGraph(INITIAL_NODES, 1);
initialConnections = EdgeList(graph);
numInitialEdges = size((initialConnections),1);
edgeList = zeros(NODES_TO_ADD*m+numInitialEdges,2);
edgeList(1:numInitialEdges,:) = initialConnections;

if (VISUALIZE)
  VisualizeGraph(ListToGraph(edgeList, TOTAL_NODES));
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
    VisualizeGraph(ListToGraph(edgeList, TOTAL_NODES));
  end
end

graph = ListToGraph(edgeList, TOTAL_NODES);
distributions = CalculateDegreeDistribution(graph);

predictions = TheoreticalPrediction3(SIZE, m);

range = (1:SIZE);


% plot(range, distributions);
loglog(range, distributions, range, predictions);




