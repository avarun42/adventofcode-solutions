freq = 0
freqs = Set{freq}

File.read_lines("#{__DIR__}/input.txt").map(&.to_i).cycle do |num|
    freq += num
    if freqs.includes? freq
        puts freq
        break
    end
    freqs.add freq
end
