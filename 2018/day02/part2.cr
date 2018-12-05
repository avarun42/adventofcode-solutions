require "levenshtein"

words = File.read_lines("#{__DIR__}/input.txt")

first, second = words.combinations(2)
                     .find(words.first(2)) { |pair| Levenshtein.distance(pair[0], pair[1]) == 1 }
                     .map(&.chars)

common_chars = first.zip(second).map(&.to_set).select(&.size.==(1)).join(&.first)
puts common_chars
