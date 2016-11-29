function numberOfBurningTrees = ComparisonFire( areaSize, numberOfTrees )
  area = GenerateForrest(areaSize, numberOfTrees);
  area = ForceFire(area);
  numberOfBurningTrees = sum(area(:) == 2);
end

