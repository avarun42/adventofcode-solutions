coordinates = File.read_lines("#{__DIR__}/input.txt").map do |line|
    line.scan(/-?\d+/).map(&.[0].to_i)
end

min_x = coordinates.min_of(&.[0])
min_y = coordinates.min_of(&.[1])
max_x = coordinates.max_of(&.[0])
max_y = coordinates.max_of(&.[1])

grid = (min_x..max_x).to_a.product((min_y..max_y).to_a).map do |x1, y1|
    coordinates.reduce(0) { |total, ( x2, y2 )| total + (x2-x1).abs + (y2-y1).abs }
end

puts grid.count(&.<(10000))
