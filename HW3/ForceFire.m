function area = ForceFire( area )
  trees = find(area > 0);
  area(trees(randperm(size(trees,1),1))) = 2;
  area = SpreadFires(area);
end

