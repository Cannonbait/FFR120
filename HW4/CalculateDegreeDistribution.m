function distributions = CalculateDegreeDistribution( graph )
  numberEdges = sum(graph);
  n = length(numberEdges);
  distributions = zeros(n, 1);
  
  for i = 1:n
    distributions(i) = sum(numberEdges==(i-1));
  end
  distributions = distributions ./ n;
  


end

