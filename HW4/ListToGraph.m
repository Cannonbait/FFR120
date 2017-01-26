function graph = ListToGraph( edgeList, n )
  graph = zeros(n);
  edgeList = edgeList(edgeList ~= 0);
  edgeList = reshape(edgeList,[],2);
  for i = 1:size(edgeList,1)
    x = edgeList(i,1);
    y = edgeList(i,2);
    graph(x,y) = 1;
    graph(y,x) = 1;
  end

end

