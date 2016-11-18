clc;
AREA_SIZE = 25;
TOTAL_AGENTS = 250;
RATIO = [0.9; 0.09; 0.01];
INITIAL_SUSCEPTIBLE = round(TOTAL_AGENTS*RATIO(1));
INITIAL_INFECTED = round(TOTAL_AGENTS*RATIO(2));
INITIAL_RESISTANT = round(TOTAL_AGENTS*RATIO(3));
INFECTION_RATE = 0.2;
RECOVERY_RATE = 0.005;
MOVEMENT_RATE = 0.3;     % Refered to as d
RATIO_STEPS = 1:10:151;


tic;
agents = InitializeAgents(AREA_SIZE, INITIAL_SUSCEPTIBLE, INITIAL_INFECTED, INITIAL_RESISTANT);
iTimestep = 1;
latticeFigure = figure();
PlotLattice(latticeFigure, agents); 
while sum(sum(agents(:,:,2))) > 0 && iTimestep <= 5000;
  % Movement
  agents = MoveAgents(agents, AREA_SIZE, MOVEMENT_RATE);

  %Disease update
  agents = UpdateDisease(agents, AREA_SIZE, INFECTION_RATE, RECOVERY_RATE);

  PlotLattice(latticeFigure, agents);

  iTimestep = iTimestep + 1;
end
toc;
