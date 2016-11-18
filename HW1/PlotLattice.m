function PlotLattice(latticeFigure, agents)
  figure(latticeFigure);
  clf;
  axis([0.5 size(agents,2)+0.5 0.5 size(agents,1)+0.5]);
  hold on;
  lineSpec = ['bo'; 'ro'; 'go'];
  for iZ = 1:size(agents,3)
    for iY = 1:size(agents,1)
      for iX = 1:size(agents,2)
        if agents(iY, iX, iZ) > 0
          plot(iX, iY, lineSpec(iZ,:));
        end
      end
    end
  end
  hold off;
  pause(0.01);
end

