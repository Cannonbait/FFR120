function adjacencyMatrix = RemoveHighestDegree( adjacencyMatrix, f )
  nodesToRemove = round(size(adjacencyMatrix,1) * f);
  for i = 1:nodesToRemove
    index = find(sum(adjacencyMatrix) == max(sum(adjacencyMatrix)));
    adjacencyMatrix(index(1),:) = [];
    adjacencyMatrix(:, index(1)) = [];
  end

end

