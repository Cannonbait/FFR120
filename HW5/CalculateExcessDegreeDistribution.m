function distribution = CalculateExcessDegreeDistribution( graph )
  degreeDistribution = CalculateDegreeDistribution(graph);
  numberEdges = sum(graph);
  numberNodes = size(graph,1);
  distribution = zeros(numberNodes, 1);
  for i=1:(numberNodes)
    k = i-1;
    distribution(i) = (k+1)* degreeDistribution(i)/mean(sum(graph));
  end
end

