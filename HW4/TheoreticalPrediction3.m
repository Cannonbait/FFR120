function predictions = TheoreticalPrediction3( k, m )
  predictions = (1:k)-1;
  predictions = arrayfun(@(k) 2*m^2*k^(-2), predictions);


end

