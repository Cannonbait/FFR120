function agents = MoveAgents( agents, areaSize, movementUrge )
  tempAgents = agents;
  for iZ = 1:size(agents,3)
    for iY = 1:size(agents,1)
      for iX = 1:size(agents,2)
        for agent = 1:tempAgents(iY, iX, iZ)
          if (rand() < movementUrge)
            dirSeed = rand();
            if (dirSeed < 0.25 && iY > 1)
              agents(iY,iX, iZ) = agents(iY,iX, iZ)-1;
              agents(iY-1, iX, iZ) = agents(iY-1,iX,iZ)+1;
            elseif (dirSeed < 0.5 && iY < areaSize)
              agents(iY,iX, iZ) = agents(iY,iX, iZ)-1;
              agents(iY+1, iX, iZ) = agents(iY+1,iX, iZ)+1;
            elseif (dirSeed < 0.75 && iX > 1)
              agents(iY,iX, iZ) = agents(iY,iX, iZ)-1;
              agents(iY, iX-1, iZ) = agents(iY,iX-1, iZ)+1;
            elseif (iX < areaSize)
              agents(iY,iX, iZ) = agents(iY,iX, iZ)-1;
              agents(iY, iX+1, iZ) = agents(iY,iX+1, iZ)+1;
            end
          end
        end
      end
    end
  end
end

