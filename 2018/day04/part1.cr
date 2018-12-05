def get_nums_and_state(line)
    { 
        line.scan(/-?\d+/).map(&.[0].to_i),
        line.includes?("begins shift") ? nil : line.includes?("falls asleep")
    }
end

events, _id = File.read_lines("#{__DIR__}/input.txt")
                  .sort
                  .reduce({ [] of Tuple(Int32, Int32, Bool), -1 }) do |( events, id ), line|
                    nums, state = get_nums_and_state(line)
                    state.nil? ? { events, nums[5] } : { events << { nums[4], id, state }, id }
                  end

asleep_times = events.group_by(&.[1])
                     .transform_values(&.map(&.[0]).in_groups_of(2, 60).flat_map { |( start, end )|
                        (start...end).to_a # Assume alternating sequence of wake and sleep
                     })

guard = asleep_times.max_by(&.[1].size)[0]
most_asleep_time = asleep_times[guard].group_by(&.itself).max_by(&.[1].size)[0]

puts guard * most_asleep_time
