function adjacencyMatrix = RemoveRandomNeighbour( adjacencyMatrix, f )
  nodesToRemove = round(size(adjacencyMatrix,1) * f);
  for i = 1:nodesToRemove
    randomNodeIndex = randi(size(adjacencyMatrix,1));
    
    candidates = find(adjacencyMatrix(randomNodeIndex,:) == 1);
    if (numel(candidates) > 0)
      candidatesIndex = randi(numel(candidates),1);
      index = candidates(candidatesIndex);
      adjacencyMatrix(index(1),:) = [];
      adjacencyMatrix(:, index(1)) = [];
    else 
      adjacencyMatrix(randomNodeIndex,:) = [];
      adjacencyMatrix(:, randomNodeIndex) = [];
    end
  end

end

