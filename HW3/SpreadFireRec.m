function area = SpreadFireRec( area, y, x )
  if (y > size(area,1))
    y = 1;
  end
  if (y == 0)
    y = size(area,1);
  end
  if (x > size(area,2))
    x = 1;
  end
  if (x == 0)
    x = size(area,2);
  end
  if area(y,x) == 1
    area(y,x) = 2;
    area = SpreadFireRec(area, y+1, x);
    area = SpreadFireRec(area, y-1, x);
    area = SpreadFireRec(area, y, x+1);
    area = SpreadFireRec(area, y, x-1);
  end

end

