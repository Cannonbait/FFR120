function partialB = CalculatePartialB( adjacencyMatrix, elements )
  B = CalculateB(adjacencyMatrix);
  partialB = zeros(length(elements));
  subgraph = adjacencyMatrix(elements, elements);
  kg = sum(subgraph);
  k = sum(adjacencyMatrix);
  d = sum(k(elements))/2;
  m = sum(k)/2;
  
  for i = 1:length(elements)
    indexI = elements(i);
    for j = 1:length(elements)
      indexJ = elements(j);
      partialB(i, j) = B(indexI, indexJ) - eq(i, j)*sum(B(elements(i),elements));
    end
  end
end

