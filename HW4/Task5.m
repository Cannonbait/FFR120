clear;
close all;
clc;
smallWorldExample
SIZE = 11;
PROBABILITY = 0;
C = 4;

graph = zeros(SIZE);
for i = 1:C/2
  for j = 1:SIZE
    x = j + i;
    if x > SIZE
      x = x - SIZE;
    end
    graph(x, j) = 1;
    
    x = j - i;
    if x < 1
      x = x + SIZE;
    end
    
    graph(x, j) = 1;
    
  end
end


% graph = A;



SIZE = size(graph,1);
PATHS_TO_FIND = SIZE*(SIZE-1)/2;
foundPaths = zeros(SIZE);

average = 0;


r=10;
angle = (0:(pi*2/size(graph,1)):pi*2)';
x = arrayfun(@(x) r*cos(x), angle);
y = arrayfun(@(x) r*sin(x), angle);
coordinates = [x y];
gplot(graph, [x y]);
axis([-r-1 r+1 -r-1 r+1]);


diameter=1;
pathsFound = 0;
while pathsFound < PATHS_TO_FIND
  paths = graph^diameter;
  paths = sign(paths);
  paths(logical(eye(size(paths)))) = 0;
  paths((paths - foundPaths) <= 0 ) = 0;
  foundPaths = foundPaths + paths;
  numPathsFound = sum(sum(paths))/2;
  average = average + diameter*numPathsFound;
  pathsFound = pathsFound + numPathsFound;
  diameter = diameter + 1;
end
diameter = diameter - 1
average = average/PATHS_TO_FIND
