rectangles = File.read_lines("#{__DIR__}/input.txt").map do |line|
    line.scan(/-?\d+/).map(&.[0].to_i)
end

pixel_rects = {} of NamedTuple(x: Int32, y: Int32) => Array(Int32)
rectangles.each do |(id, start_x, start_y, width, height)|
    (start_x...(start_x + width)).to_a.each do |x|
        (start_y...(start_y + height)).to_a.each do |y|
            pixel_rects[{x: x, y: y}] = pixel_rects.fetch({x: x, y: y}, [] of Int32) << id
        end
    end
end

ids = rectangles.map { |(id, _)| id }
overlap_pixels = pixel_rects.values.select { |ids| ids.size > 1 }.flatten
puts (ids - overlap_pixels).first
