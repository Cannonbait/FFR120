function graph = GeneratePreferentialGraph( totalNodes, m )
  initialNodes = round(totalNodes*0.1);
  nodesToAdd = totalNodes-initialNodes;
  graph = GenerateERGraph(initialNodes, 1);
  initialConnections = EdgeList(graph);
  numInitialEdges = size((initialConnections),1);
  edgeList = zeros(nodesToAdd*m+numInitialEdges,2);
  edgeList(1:numInitialEdges,:) = initialConnections;
  
  for i=1:nodesToAdd
    candidates = edgeList(edgeList ~= 0);
    numEdges = length(candidates);

    % Calculate nodes to connect new node to
    for j = 1:m
      index = randi(numEdges);
      edgeList((i-1)*m+j+numInitialEdges,:) = [i+initialNodes candidates(index)];
      numEdges = numEdges - length(candidates(candidates == candidates(index)));
      candidates = candidates(candidates ~= candidates(index));
    end
  end
  graph = ListToGraph(edgeList, totalNodes);

end

