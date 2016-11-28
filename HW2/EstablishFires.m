function area = EstablishFires( area, LIGHTNING_RATE )
  newFires = rand(size(area));
  newFires = arrayfun(@(x) floor(x+LIGHTNING_RATE), newFires);
  newFires = newFires .* area;
  area = newFires+area;
end

