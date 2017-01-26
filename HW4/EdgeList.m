function list = EdgeList( graph )
  graph = triu(graph);
  list = zeros(sum(graph(:)),2);
  added = 1;
  for i = 1:size(graph,1)
    for j = 1:size(graph,2)
      if graph(i,j) == 1
        list(added,:) = [i j];
        added = added +1;
      end
    end
  end
  

end

