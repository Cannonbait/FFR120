function adjacencyMatrix = RemoveEdges( adjacencyMatrix, sigma)
  for i = 1:numel(adjacencyMatrix)
    if (adjacencyMatrix(i) == 1 && rand < (1-sigma))
      adjacencyMatrix(i) = 0;
    end
  end
  adjacencyMatrix = triu(adjacencyMatrix) + triu(adjacencyMatrix)';
  
end

