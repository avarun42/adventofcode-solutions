twos, threes = File.read_lines("#{__DIR__}/input.txt")
                   .map { |id| id.split("").group_by(&.itself).transform_values(&.size).invert }
                   .reduce({0, 0}) { |counts, map|
                        counts.map_with_index { |count, i| map.has_key?(i+2) ? count + 1 : count }
                   }
puts twos * threes
