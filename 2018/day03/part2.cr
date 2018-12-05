rectangles = File.read_lines("#{__DIR__}/input.txt").map do |line|
    line.scan(/-?\d+/).map(&.[0].to_i)
end

pixel_rects = {} of Tuple(Int32, Int32) => Array(Int32)
rectangles.each do |( id, start_x, start_y, width, height )|
    (start_x...(start_x + width)).to_a.product((start_y...(start_y + height)).to_a) do |x, y|
        pixel_rects[{x, y}] = pixel_rects.fetch({x, y}, [] of Int32) << id
    end
end

ids = rectangles.map { |( id, _ )| id }
overlap_pixels = pixel_rects.values.select { |ids| ids.size > 1 }.flatten
puts (ids - overlap_pixels).first
