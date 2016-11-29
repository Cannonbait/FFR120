function area = GenerateForrest( areaSize, numberOfTrees )
  area = zeros(areaSize);
  treeIndexes = randperm(areaSize*areaSize, numberOfTrees);
  for index = 1:numberOfTrees
    area(treeIndexes(index)) = 1;
  end
end

