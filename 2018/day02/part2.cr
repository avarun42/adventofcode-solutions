puts File.read_lines("#{__DIR__}/input.txt")
         .map(&.chars)
         .combinations(2)
         .map(&.transpose.map(&.uniq).select(&.size.==(1)).flatten)
         .max_by(&.size)
         .join
