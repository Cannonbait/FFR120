function [ Q, grouping ] = SubSplit( adjacencyMatrix, elements )
  B = CalculatePartialB(adjacencyMatrix, elements)
  [eigenVectors, eigenValues] = eig(B);
  eigenValues(end)
  largestEigenVector = eigenVectors(:, size(eigenVectors, 2));
  grouping = sign(largestEigenVector);
  Q = CalculateQ(adjacencyMatrix, eigenVectors, eigenValues, elements);
end

