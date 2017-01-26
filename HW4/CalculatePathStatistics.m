function [ results ] = CalculatePathStatistics( graph )
  SIZE = size(graph,1);
  PATHS_TO_FIND = SIZE*(SIZE-1)/2;
  foundPaths = zeros(SIZE);

  
  average = 0;
  diameter = 1;
  pathsFound = 0;
  calculatedGraph = zeros(SIZE);
  calculatedGraph(logical(eye(size(calculatedGraph)))) = 1;
  
  while pathsFound < PATHS_TO_FIND
    calculatedGraph = calculatedGraph*graph;
    paths = sign(calculatedGraph);
    paths(logical(eye(size(paths)))) = 0;
    paths((paths - foundPaths) <= 0 ) = 0;
    foundPaths = foundPaths + paths;
    numPathsFound = sum(sum(paths))/2;
    average = average + diameter*numPathsFound;
    pathsFound = pathsFound + numPathsFound;
    diameter = diameter + 1;
  end
  diameter = diameter - 1;
  average = average/PATHS_TO_FIND;
  results = [average diameter];


end

