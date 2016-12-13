clear;
clc;
LIGHTNING_RATE = 1;
GROWTH_RATE = 1/100;
AREA_SIZE = 128;
TIMESTEPS = 1000;
GOAL_FIRES = 100;
N = [8 16 32 64 128 256 512];
statistics = zeros(GOAL_FIRES, size(N,2));


parfor iArea = 1:size(N,2)
  areaStats = zeros(100,1)
  area = zeros(N(iArea));
  nrFires = 1;
  while nrFires <= GOAL_FIRES
  %   VisualizeArea(area);
    area = GrowTrees(area, GROWTH_RATE);
  %   VisualizeArea(area);
    area = EstablishFires(area, LIGHTNING_RATE);
    area = SpreadFires(area);
    if (sum(area(:) == 2) > 0)
      areaStats(nrFires) = sum(area(:) == 2);
      nrFires = nrFires+1;
    end
  %   VisualizeArea(area);
    area = RemoveFires(area);
  %   VisualizeArea(area);
  end
  statistics(:,iArea) = areaStats;
end





