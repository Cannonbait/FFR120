function adjacencyMatrix = RemoveFraction( adjacencyMatrix,  f)
  nodesToRemove = round(size(adjacencyMatrix,1) * f);
  for i = 1:nodesToRemove
    index = randi(size(adjacencyMatrix,1));
    adjacencyMatrix(index,:) = [];
    adjacencyMatrix(:, index) = [];
  end
end

