p File.read_lines("#{__DIR__}/input.txt").reduce(0) { |freq, line| freq + line.to_i }
