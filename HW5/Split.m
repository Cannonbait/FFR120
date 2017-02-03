function [ Q, grouping ] = Split( adjacencyMatrix )
  B = CalculateB(adjacencyMatrix);
  [eigenVectors, eigenValues] = eig(B);
  largestEigenVector = eigenVectors(:, size(eigenVectors, 2));
  grouping = sign(largestEigenVector);
  Q = CalculateQ(adjacencyMatrix, eigenVectors, eigenValues, grouping);
end

