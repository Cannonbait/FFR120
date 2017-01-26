clear;
close all;
clc;
smallWorldExample

SIZE = 100;
PROBABILITY = 0;
C = 100;

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

graph = A;

CalculateClusteringCoefficient(graph)
% 3/4*(C-2)/(C-1)

r=10;
angle = (0:(pi*2/size(graph,1)):pi*2)';
x = arrayfun(@(x) r*cos(x), angle);
y = arrayfun(@(x) r*sin(x), angle);
coordinates = [x y];
gplot(graph, [x y]);
axis([-r-1 r+1 -r-1 r+1]);