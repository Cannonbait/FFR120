close all;
clear;
clc;
m = 5;

VISUALIZE = true;
NODES_TO_ADD = 100;
INITIAL_NODES = m*5;
INITIAL_CONNECTIVITY = 0.1;

graph = zeros(NODES_TO_ADD+INITIAL_NODES);
graph(1:INITIAL_NODES, 1:INITIAL_NODES) = GenerateERGraph(INITIAL_NODES, INITIAL_CONNECTIVITY);

if (VISUALIZE == true)
  RenderNetworkCircular(graph);
end


for i=1:NODES_TO_ADD
  toAdd = zeros(m,1);
  edgeList = EdgeList(graph);
  numEdges = length(edgeList);
  
  % Calculate nodes to connect new node to
  for j = 1:m
    index = randi(numEdges);
    toAdd(j) = edgeList(index);
    numEdges = numEdges - length(edgeList(edgeList == edgeList(index)));
    edgeList = edgeList(edgeList ~= edgeList(index));
  end
  
  % Connect new node to old nodes
  for j = 1:m
    graph(INITIAL_NODES+i,toAdd(j)) = 1;
    graph(toAdd(j), INITIAL_NODES+i) = 1;
  end
  if (VISUALIZE == true)
    RenderNetworkCircular(graph);
  end
  

end



