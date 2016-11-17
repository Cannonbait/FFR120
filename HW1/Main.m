clc;
AREA_SIZE = 100;
TOTAL_AGENTS = 1000;
RATIO = [0.99; 0.01; 0];
INITIAL_SUSCEPTIBLE = TOTAL_AGENTS*RATIO(1);
INITIAL_INFECTED = TOTAL_AGENTS*RATIO(2);
INITIAL_RESISTANT = TOTAL_AGENTS*RATIO(3);
INFECTION_RATE = 0.1:0.1:1;
MOVEMENT_RATE = 0.3;     % Refered to as d
NUM_TRIALS = 10;
RATIO_STEPS = 1:10:151;

% scatter(agents(:,1), agents(:,2));

statistics = zeros(size(INFECTION_RATE,2), size(RATIO_STEPS,2));

% latticeFigure = figure();
% PlotLattice(latticeFigure, agents);
tic;

for iBeta = 1:size(INFECTION_RATE,2)
  infectionRate = INFECTION_RATE(iBeta);
  recoveryRate = infectionRate ./ RATIO_STEPS;
  for iRecoveryRate = 1:size(recoveryRate,2)
    average = 0;
    for iTrial = 1:NUM_TRIALS
      agents = InitializeAgents(AREA_SIZE, INITIAL_SUSCEPTIBLE, INITIAL_INFECTED, INITIAL_RESISTANT);
      iTimestep = 1;
      while sum(sum(agents(:,:,2))) > 0 && iTimestep <= 5000;
        % Movement
        agents = MoveAgents(agents, AREA_SIZE, MOVEMENT_RATE);

        %Disease update
        agents = UpdateDisease(agents, AREA_SIZE, infectionRate, recoveryRate(iRecoveryRate));

        iTimestep = iTimestep + 1;
      end
      average = average + sum(sum(agents(:,:,3)));
    end
    statistics(iBeta,iRecoveryRate) = average/NUM_TRIALS;
  end
end
% statistics = statistics(1:iTimestep-1,:);
statistics
toc;
