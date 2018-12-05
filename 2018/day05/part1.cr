polymer = File.read_lines("#{__DIR__}/input.txt")[0].chars

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

puts polymer.size
