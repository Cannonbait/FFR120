function lattice = GenerateLattice( positions, areaSize )
  lattice = zeros(areaSize);
  for i = 1:size(positions,1)
    lattice(positions(i,1),positions(i,2))=lattice(positions(i,1),positions(i,2))+1;
  end
end

