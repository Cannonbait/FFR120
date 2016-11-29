function VisualizeArea( area)
  if sum(area(:) == 2) > 0
    map = [0, 0, 0.0
      0, 1, 0
      1, 0, 0];
  elseif sum(area(:) == 1) > 0
    map = [0, 0, 0.0
      0, 1, 0];
  else
    map = [0, 0, 0.0];
  end
  imagesc(area);
  colormap(map);
  pause(0.1);
  

end

