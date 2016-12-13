function PlotData( statistics, nrFires, AREA_SIZE )
  EmpiricalFireRatio = zeros(nrFires,1);
  ComparisonFireRatio = zeros(nrFires,1);
  for i = 1:nrFires
    EmpiricalFireRatio(i) = statistics(i,1)/AREA_SIZE^2;
    ComparisonFireRatio(i) = ComparisonFire(AREA_SIZE, statistics(i,2))/AREA_SIZE^2;
  end

  EmpiricalFireRatio = sort(EmpiricalFireRatio, 'descend');
  ComparisonFireRatio = sort(ComparisonFireRatio, 'descend');
  ranking = (1:nrFires) ./ nrFires;
  
  size(ranking')
  size(EmpiricalFireRatio)

  loglog(EmpiricalFireRatio, ranking, ComparisonFireRatio, ranking);
%   loglog(EmpiricalFireRatio, ranking');

end

