rectangles = File.read_lines("#{__DIR__}/input.txt").map do |line|
    line.scan(/-?\d+/).map(&.[0].to_i)
end

pixel_rects = Hash(NamedTuple(x: Int32, y: Int32), Int32).new(0)
num_overlaps = 0
rectangles.each do |(_id, start_x, start_y, width, height)|
    (start_x...(start_x + width)).to_a.each do |x|
        (start_y...(start_y + height)).to_a.each do |y|
            pixel_rects[{x: x, y: y}] = pixel_rects[{x: x, y: y}] + 1
            if pixel_rects[{x: x, y: y}] == 2
                num_overlaps += 1
            end
        end
    end
end

puts num_overlaps
