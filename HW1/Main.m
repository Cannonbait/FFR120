clc;
AREA_SIZE = 100;
TOTAL_AGENTS = 1000;
RATIO = [0.99; 0.01; 0];
INITIAL_SUSCEPTIBLE = TOTAL_AGENTS*RATIO(1);
INITIAL_INFECTED = TOTAL_AGENTS*RATIO(2);
INITIAL_RESISTANT = TOTAL_AGENTS*RATIO(3);
INFECTION_RATE = 0.2;
RECOVERY_RATE = 0.002:0.002:0.02;
MOVEMENT_RATE = 0.3;     % Refered to as d
NUM_TRIALS = 10;


% scatter(agents(:,1), agents(:,2));

statistics = zeros(size(RECOVERY_RATE,2), 1);

% latticeFigure = figure();
% PlotLattice(latticeFigure, agents);

parfor iRecoveryRate = 1:size(RECOVERY_RATE,2)
  for iTrial = 1:NUM_TRIALS
    average = 0;
    agents = InitializeAgents(AREA_SIZE, INITIAL_SUSCEPTIBLE, INITIAL_INFECTED, INITIAL_RESISTANT);
    iTimestep = 1;
    while sum(sum(agents(:,:,2))) > 0 && iTimestep <= 5000;
      % Movement
      agents = MoveAgents(agents, AREA_SIZE, MOVEMENT_RATE);

      %Disease update
      agents = UpdateDisease(agents, AREA_SIZE, INFECTION_RATE, RECOVERY_RATE(iRecoveryRate));

    % %   PlotLattice(latticeFigure, agents);
    %   countSusceptible = sum(sum(agents(:,:,1)));
    %   countInfected = sum(sum(agents(:,:,2)));
    %   countResistant = sum(sum(agents(:,:,3)));
    %   
    %   statistics(iTimestep,:) = [countSusceptible countInfected, countResistant];
      iTimestep = iTimestep + 1;
    end
    average = average + sum(sum(agents(:,:,3)));
  end
  statistics(iRecoveryRate) = average/NUM_TRIALS;
end
% statistics = statistics(1:iTimestep-1,:);
statistics

