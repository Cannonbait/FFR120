function agents = InitializeAgents( areaSize, susceptibles, infected, recovered)
  agents = zeros(areaSize, areaSize, 3);
  susceptiblePositions = randi(areaSize, susceptibles,2);
  agents(:,:,1) = GenerateLattice(susceptiblePositions, areaSize);
  
  infectedPositions = randi(areaSize, infected,2);
  agents(:,:,2) = GenerateLattice(infectedPositions, areaSize);
  
  
  recoveredPositions = randi(areaSize, recovered,2);
  agents(:,:,3) = GenerateLattice(recoveredPositions, areaSize);
end

