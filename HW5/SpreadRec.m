function foundNodes = SpreadRec( node, foundNodes, adjacencyMatrix)
  foundNodes(node) = 1;
  candidates = find(adjacencyMatrix(node, :) == 1);
  
  for i = 1:length(candidates)
    if (foundNodes(candidates(i)) == 0)
      foundNodes = SpreadRec(candidates(i), foundNodes, adjacencyMatrix);
    end
  end

end

