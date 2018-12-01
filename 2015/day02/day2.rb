paper_total = 0
ribbon_total = 0

File.open('input.txt', 'r') do |f|
  f.each do |line|
    dimensions = line.split('x')
    dimensions.map!(&:to_i)
    areas = [dimensions[0]*dimensions[1], dimensions[1]*dimensions[2], dimensions[0]*dimensions[2]]
    perimeters = [2*dimensions[0] + 2*dimensions[1], 2*dimensions[1] + 2*dimensions[2], 2*dimensions[0] + 2*dimensions[2]]
    volume = dimensions.reduce(:*)

    paper_needed = 2*areas[0] + 2*areas[1] + 2*areas[2] + areas.min
    paper_total += paper_needed

    ribbon_needed = perimeters.min + volume
    ribbon_total += ribbon_needed
  end
end

puts "#{paper_total} square feet of wrapping paper should be ordered."
puts "#{ribbon_total} feet of ribbon should be ordered."
