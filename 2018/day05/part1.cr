polymer = File.read_lines("#{__DIR__}/input.txt")[0].chars
modified = true

while modified
    polymer, modified = polymer.reduce({ [] of Char, false }) do |( polymers, modified ), cur|
        prev = polymers[-1]?
        (prev && prev.downcase == cur.downcase && prev.lowercase? != cur.lowercase?) ?
            { polymers[0...-1], true } :
            { polymers << cur, modified }
    end
end

puts polymer.size
