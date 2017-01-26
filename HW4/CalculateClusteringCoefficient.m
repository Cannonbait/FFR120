function coefficient = CalculateClusteringCoefficient( graph )
  numTriangles = trace(graph^3)/2;
  numVertices = arrayfun(@(x) x*(x-1)/2, sum(graph));
  numVertices = sum(numVertices);
  coefficient = numTriangles/numVertices;
end

