function largestCluster = CalculateLargestCluster( adjacencyMatrix )
  SIZE = size(adjacencyMatrix,1);
  foundNodes = zeros(SIZE, 1);

  largestCluster = 0;
  
  while (any(find(foundNodes == 0)))
    startingNode = find(foundNodes == 0, 1);
    
    nodeSpread = SpreadRec(startingNode, foundNodes, adjacencyMatrix);
    clusterSize = sum(nodeSpread) - sum(foundNodes);
    if (clusterSize > largestCluster)
      largestCluster = clusterSize;
    end
    foundNodes = nodeSpread;
  end

end

