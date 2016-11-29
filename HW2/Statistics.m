function [burningTrees, totalTrees] = Statistics( area )
  burningTrees = sum(area(:) == 2)
  totalTrees = sum(area(:) > 0)


end

