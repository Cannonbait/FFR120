function PlotStatistics( statistics, d, beta, gamma)
  x = 1:size(statistics,1);
  plot(x, statistics(:,1), x, statistics(:,2), x, statistics(:,3));
  legend('Susceptible', 'Infected', 'Resistant');
  xlabel('Time');
  ylabel('Population density');
  title(sprintf('d = %.3f \\beta = %.3f \\gamma = %.3f', d, beta, gamma));
end

