function distribution = CalculateDegreeDistribution( graph )
  numberEdges = sum(graph);
  n = length(numberEdges);
  distribution = zeros(n, 1);
  
  for i = 1:n
    distribution(i) = sum(numberEdges==(i-1));
  end
  distribution = distribution ./ n;
  


end

