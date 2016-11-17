function agents = UpdateDisease( agents, areaSize, infectionRate, recoveryRate)
  infectedAgents = agents(:,:,2);
  for iY=1:areaSize
    for iX = 1:areaSize
      for i = 1:infectedAgents(iY,iX)
        if rand() < infectionRate
          agents(iY,iX,2) = agents(iY,iX,2) + agents(iY,iX,1);
          agents(iY,iX,1) = 0;
        end
        
        if rand() < recoveryRate
          agents(iY,iX,2) = agents(iY,iX,2) - 1;
          agents(iY,iX,3) = agents(iY,iX,3) + 1;
        end
      end
    end
  end
end

