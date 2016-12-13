function graph = GenerateERGraph( n, p )
  graph = floor(rand(n) + p);
  graph(triu(graph,1)==0) = 0;
  graph = graph + graph';
  graph = sparse(graph);
end

