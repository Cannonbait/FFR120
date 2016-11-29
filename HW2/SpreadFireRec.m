function area = SpreadFireRec( area, y, x )
  y = mod(y, size(area,1))+1;
  x = mod(x, size(area,2))+1;
  if area(y,x) == 1
    area(y,x) = 2;
    area = SpreadFireRec(area, y+1, x);
    area = SpreadFireRec(area, y-1, x);
    area = SpreadFireRec(area, y, x+1);
    area = SpreadFireRec(area, y, x-1);
  end

end

