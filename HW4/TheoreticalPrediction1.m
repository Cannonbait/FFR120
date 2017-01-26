function predictions = TheoreticalPrediction1( n, p )
  predictions = (1:n)-1;
  predictions = arrayfun(@(k) nchoosek((n-1),k)*p^k*(1-p)^(n-1-k), predictions);
end

