guard_id = -1
guard_sleep_events = File.read_lines("#{__DIR__}/input.txt").sort.map do |line|
    nums = line.scan(/-?\d+/).map(&.[0].to_i)
    if line.includes? "begins shift"
        guard_id = nums[5]
        next
    end
    starts_sleep = line.includes? "falls asleep"
    {nums[4], guard_id, starts_sleep}
end

guard_sleep_times = guard_sleep_events.compact.group_by(&.[1]).transform_values do |sleep_events|
    abort("something wrong") if sleep_events.size.odd? # should fall asleep then wake up
    sleep_events.in_groups_of(2, {60, -1, false}).flat_map do |(first, second)|
        (first[0]...second[0]).to_a
    end
end

most_common_sleep = guard_sleep_times.flat_map { |id, times| times.map { |time| {time, id} } }
                                     .group_by(&.itself)
                                     .max_by(&.[1].size)
                                     .first

puts most_common_sleep[0] * most_common_sleep[1]
