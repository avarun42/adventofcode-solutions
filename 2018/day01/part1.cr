freq = 0
File.each_line("#{__DIR__}/input.txt") do |line|
    freq += line.to_i
end
puts freq
