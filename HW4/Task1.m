clear;
clc;
warning('off', 'MATLAB:nchoosek:LargeCoefficient');

SIZE = 100;
PROBABILITY = 0.5;

graph = GenerateERGraph(SIZE, PROBABILITY);
distributions = CalculateDegreeDistribution(graph);

predictions = TheoreticalPrediction(SIZE, PROBABILITY);

range = (1:SIZE)-1;

plot(range, distributions, range, predictions);

figure();
r=1000;  % radius
angle = (0:(pi*2/SIZE):pi*2)';
x = arrayfun(@(x) r*cos(x), angle);
y = arrayfun(@(x) r*sin(x), angle);
coordinates = [x y];
gplot(graph, [x y]);
