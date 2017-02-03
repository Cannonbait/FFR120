clear;
clc;
communityExample;

graphPlot = plot(graph(adjacencyMatrix));
%   highlight(graphPlot, 1:5, 'NodeColor', 'g');

[Q, grouping] = Split(adjacencyMatrix);
sprintf('%0.6f',Q)

elementsA = find(grouping == -1);
elementsB = find(grouping == 1);

[Q, groupingA] = SubSplit(adjacencyMatrix, elementsA);
% [Q, groupingB] = SubSplit(adjacencyMatrix, elementsB);


highlight(graphPlot, elementsA, 'NodeColor', 'g');
highlight(graphPlot, elementsB, 'NodeColor', 'r');


