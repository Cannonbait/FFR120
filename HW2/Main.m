LIGHTNING_RATE = 0.1;
GROWTH_RATE = 0.6;
AREA_SIZE = 128;
TIMESTEPS = 100;

area = zeros(AREA_SIZE);



for iTimestep = 1:TIMESTEPS
  area = GrowTrees(area, GROWTH_RATE);
  
  area = EstablishFires(area, LIGHTNING_RATE);
  
  area = SpreadFires(area);
  
  area = RemoveFires(area);
  
end






