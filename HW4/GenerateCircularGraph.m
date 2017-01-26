function graph = GenerateCircularGraph( SIZE, C)
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
end

