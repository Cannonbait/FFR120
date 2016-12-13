function area = GrowTrees( area, GROWTH_RATE)
  newTrees = rand(size(area));
  newTrees = arrayfun(@(x) floor(x+GROWTH_RATE), newTrees);
  area = arrayfun(@(x) min(1,x), newTrees+area);

end

