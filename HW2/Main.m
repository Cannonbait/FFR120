clear;
clc;
LIGHTNING_RATE = 0.2;
GROWTH_RATE = 0.3;
AREA_SIZE = 9;
TIMESTEPS = 20;

area = zeros(AREA_SIZE);



for iTimestep = 1:TIMESTEPS
  VisualizeArea(area);
  area = GrowTrees(area, GROWTH_RATE);
  VisualizeArea(area);
  area = EstablishFires(area, LIGHTNING_RATE);
  VisualizeArea(area);
  area = SpreadFires(area);
  VisualizeArea(area);
  area = RemoveFires(area);
  VisualizeArea(area);
  
end






