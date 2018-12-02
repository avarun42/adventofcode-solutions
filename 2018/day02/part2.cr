require "levenshtein"

words = File.read_lines("#{__DIR__}/input.txt")
words.each_combination(2) do |pair|
    if Levenshtein.distance(pair[0], pair[1]) == 1
        common = String.build(pair[0].size - 1) do |common|
            pair[0].each_char_with_index { |c, i| common << c if pair[1][i] == c }
        end
        puts common
        break
    end
end
