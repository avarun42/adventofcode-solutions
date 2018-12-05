puts File.read_lines("#{__DIR__}/input.txt")
         .map(&.to_i)
         .cycle
         .reduce({ 0, Set(Int32).new }) { |( freq, freqs ), num|
            freqs.includes?(freq) ? break freq : { freq+num, freqs.add(freq) }
         }
