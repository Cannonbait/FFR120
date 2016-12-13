function area = EstablishFires( area, LIGHTNING_RATE )
  if rand() < LIGHTNING_RATE
    x = randi(size(area,2));
    y = randi(size(area,1));
    if area(y,x) == 1
      area(y,x) = 2;
    end
  end
end

