require "levenshtein"

puts File.read_lines("#{__DIR__}/input.txt")
         .combinations(2)
         .find([] of String) { |( first, second )| Levenshtein.distance(first, second) == 1 }
         .map(&.chars)
         .transpose
         .map(&.uniq)
         .select(&.size.==(1))
         .join(&.first)
