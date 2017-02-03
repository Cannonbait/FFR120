function Q = CalculateQ( adjacencyMatrix, eigenVectors, eigenValues, grouping)
  k = sum(adjacencyMatrix);
  m = sum(k)/2;
  Q = 0;
  for i=1:length(eigenValues)
     Q = Q + dot(eigenVectors(:,i),grouping)^2*eigenValues(i,i);
  end
  Q = Q/(4*m);
end

