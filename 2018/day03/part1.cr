rectangles = File.read_lines("#{__DIR__}/input.txt").map do |line|
    line.scan(/-?\d+/).map(&.[0].to_i)
end

pixel_rects = Hash(Tuple(Int32, Int32), Int32).new(0)
rectangles.each do |( _id, start_x, start_y, width, height )|
    (start_x...(start_x + width)).to_a.product((start_y...(start_y + height)).to_a) do |x, y|
        pixel_rects[{x, y}] = pixel_rects[{x, y}] + 1
    end
end

puts pixel_rects.values.count(&.>(1))
