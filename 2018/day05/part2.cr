base_polymer = File.read_lines("#{__DIR__}/input.txt")[0].chars

unit_types = Set.new(base_polymer.map(&.upcase))
min_polymer_length = unit_types.min_of do |unit_type|
    polymer = base_polymer.reject(&.==(unit_type)).reject(&.==(unit_type.downcase))
    loop do
        new_polymer = [] of Char
        skip = false
        polymer.each_cons(2) do |(first, second)|
            if skip
                skip = false
            elsif first.downcase == second.downcase && first.lowercase? != second.lowercase?
                skip = true
            else
                new_polymer << first
            end
        end
        new_polymer << polymer[-1] unless skip
        break unless new_polymer.size < polymer.size
        polymer = new_polymer
    end
    polymer.size
end

puts min_polymer_length
