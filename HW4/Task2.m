clear;
close all;
clc;

SIZE = 10;
PROBABILITY = 0.5;
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
graph

graph = graph'+graph;

r=10;
angle = (0:(pi*2/SIZE):pi*2)';
x = arrayfun(@(x) r*cos(x), angle);
y = arrayfun(@(x) r*sin(x), angle);
coordinates = [x y];
gplot(graph, [x y]);
axis([-r-1 r+1 -r-1 r+1]);

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
figure()
gplot(graph, [x y]);
axis([-r-1 r+1 -r-1 r+1]);