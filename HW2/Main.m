clear;
clc;
LIGHTNING_RATE = 0.5;
GROWTH_RATE = 1;
AREA_SIZE = 3;
TIMESTEPS = 4;

area = zeros(AREA_SIZE);



for iTimestep = 1:TIMESTEPS
  area = GrowTrees(area, GROWTH_RATE);  
  
  area = EstablishFires(area, LIGHTNING_RATE);
  
  area = SpreadFires(area);
  
  area = RemoveFires(area);
  
end






