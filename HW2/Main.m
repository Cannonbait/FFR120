clear;
clc;
LIGHTNING_RATE = 0.6;
GROWTH_RATE = 1/200;
AREA_SIZE = 128;
TIMESTEPS = 10000;

area = zeros(AREA_SIZE);
statistics = zeros(TIMESTEPS, 2);
nrFire = 1;


for iTimeStep = 1:TIMESTEPS
%   VisualizeArea(area);
  area = GrowTrees(area, GROWTH_RATE);
%   VisualizeArea(area);
  area = EstablishFires(area, LIGHTNING_RATE);
  area = SpreadFires(area);
  if (sum(area(:) == 2) > 0)
    statistics(nrFire,1) = sum(area(:) == 2);
    statistics(nrFire,2) = sum(area(:) > 0);
    nrFire = nrFire+1;
  end
%   VisualizeArea(area);
  area = RemoveFires(area);
%   VisualizeArea(area);
end




