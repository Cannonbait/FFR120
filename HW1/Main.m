clear;
clc;
AREA_SIZE = 100;
TOTAL_AGENTS = 100;
RATIO = [0.9; 0.1; 0];
INITIAL_SUSCEPTIBLE = TOTAL_AGENTS*RATIO(1);
INITIAL_INFECTED = TOTAL_AGENTS*RATIO(2);
INITIAL_RESISTANT = TOTAL_AGENTS*RATIO(3);
INFECTION_RATE = 0.2;
RECOVERY_RATE = 0.005;
MOVEMENT_RATE = 0.3;     % Refered to as d


agents = InitializeAgents(AREA_SIZE, INITIAL_SUSCEPTIBLE, INITIAL_INFECTED, INITIAL_RESISTANT);
% scatter(agents(:,1), agents(:,2));

statistics = zeros(5000, 3);
iTimestep = 1;

% latticeFigure = figure();
% PlotLattice(latticeFigure, agents);

while sum(sum(agents(:,:,2))) > 0 && iTimestep <= 5000;
  % Movement
  agents = MoveAgents(agents, AREA_SIZE, MOVEMENT_RATE);
  
  %Disease update
  agents = UpdateDisease(agents, AREA_SIZE, INFECTION_RATE, RECOVERY_RATE);
  
%   PlotLattice(latticeFigure, agents);
  countSusceptible = sum(sum(agents(:,:,1)));
  countInfected = sum(sum(agents(:,:,2)));
  countResistant = sum(sum(agents(:,:,3)));
  
  statistics(iTimestep,:) = [countSusceptible countInfected, countResistant];
  iTimestep = iTimestep + 1;
end

statistics = statistics(1:iTimestep-1,:);
