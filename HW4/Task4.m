clear;
close all;
clc;

SIZE = 10;
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

graph = graph'+graph;


numEdges = SIZE*C/2;

for i = 1:numEdges
  if (rand() < PROBABILITY)
    index = randperm(SIZE, 2);
    smaller = min(index(1), index(2));
    bigger = max(index(1), index(2));
    graph(smaller, bigger) = 1;
  end
end

graph = sign(graph'+graph);