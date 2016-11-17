clear;
clc;
AREA_SIZE = 100;
TOTAL_AGENTS = 1;
RATIO = [0; 1; 0];
INITIAL_SUSCEPTIBLE = TOTAL_AGENTS*RATIO(1);
INITIAL_INFECTED = TOTAL_AGENTS*RATIO(2);
INITIAL_RESISTANT = TOTAL_AGENTS*RATIO(3);
INFECTION_RATE = 1;
RECOVERY_RATE = 0;
MOVEMENT_URGE = 1;     % Refered to as d


agents = InitializeAgents(AREA_SIZE, INITIAL_SUSCEPTIBLE, INITIAL_INFECTED, INITIAL_RESISTANT);
% scatter(agents(:,1), agents(:,2));

% latticeFigure = figure();
% PlotLattice(latticeFigure, agents);

randomWalk = zeros(1000, 2);

% while sum(sum(agents(:,:,2))) > 0
for i = 1:1000
  % Movement
  agents = MoveAgents(agents, AREA_SIZE, MOVEMENT_URGE);
  [x,y] = ind2sub(AREA_SIZE, find(agents(:,:,2)));
  randomWalk(i,:) = [x y];
  
  %Disease update
%   agents = UpdateDisease(agents, AREA_SIZE, INFECTION_RATE, RECOVERY_RATE);
  
%   PlotLattice(latticeFigure, agents);
  
end
