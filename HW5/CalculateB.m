function B = CalculateB( adjacencyMatrix)
  k = sum(adjacencyMatrix);
  m = sum(k)/2;
  B = adjacencyMatrix-k'*k/ (2*m);
end

