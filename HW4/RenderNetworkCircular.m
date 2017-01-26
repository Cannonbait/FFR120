function RenderNetworkCircular( graph )
  figure()
  r=10;
  angle = (0:(pi*2/length(graph)):pi*2)';
  x = arrayfun(@(x) r*cos(x), angle);
  y = arrayfun(@(x) r*sin(x), angle);
  gplot(graph, [x y],'-*');
  axis([-r-1 r+1 -r-1 r+1]);

end

