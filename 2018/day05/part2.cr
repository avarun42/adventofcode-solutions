base_polymer = File.read_lines("#{__DIR__}/input.txt")[0].chars
unit_types = base_polymer.map { |unit| { unit.upcase, unit.downcase } }.to_set

min_polymer_length = unit_types.min_of do |(unit_uppercase, unit_lowercase)|
    polymer = base_polymer.reject(&.==(unit_uppercase)).reject(&.==(unit_lowercase))
    modified = true
    while modified
        polymer, modified = polymer.reduce({ [] of Char, false }) do |(polymers, modified), cur|
            prev = polymers[-1]?
            (prev && prev.downcase == cur.downcase && prev.lowercase? != cur.lowercase?) ?
                { polymers[0...-1], true } :
                { polymers << cur, modified }
        end
    end
    polymer.size
end

puts min_polymer_length
