function newArea = SpreadFires( area )
  newArea = area;
  for iY = 1:size(area,1)
    for iX = 1:size(area,2)
      if area(iY, iX) == 2
        newArea = SpreadFireRec(newArea, iY, iX);
      end
    end
  end
  
end

