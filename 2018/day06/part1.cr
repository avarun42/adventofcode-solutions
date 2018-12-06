coordinates = File.read_lines("#{__DIR__}/input.txt").map do |line|
    line.scan(/-?\d+/).map(&.[0].to_i)
end

min_x = coordinates.min_of(&.[0])
min_y = coordinates.min_of(&.[1])
max_x = coordinates.max_of(&.[0])
max_y = coordinates.max_of(&.[1])

grid = (min_x..max_x).to_a.product((min_y..max_y).to_a).map do |x1, y1|
    distances = coordinates.map_with_index { |( x2, y2 ), i| { (x2-x1).abs + (y2-y1).abs, i } }
    closest = distances.count(&.[0].==(distances.min[0])) == 1 ? distances.min[1] : nil
    { x1, y1, closest }
end

infinites = grid.select { | x, y, _ | x == min_x || x == max_x || y == min_y || y == max_y }
                .map(&.[2])
                .uniq

coordinate_counts = grid.group_by(&.[2])
                        .transform_values(&.size)
                        .delete_if { |p, _| p.nil? || infinites.includes?(p) }

puts coordinate_counts.values.max
