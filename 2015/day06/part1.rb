num_lit = 0
lights = Hash.new

for i in 0..999
  for j in 0..999
    lights["#{i}, #{j}"] = false
  end
end

contents = File.open('input.txt', 'r') { |f| f.read }
contents.each_line do |line|
  command = line[/(\D*)\d+[,]\d+/, 1].strip
  x1 = line[/(\d+)[,](\d+)\s/, 1]
  y1 = line[/(\d+)[,](\d+)\s/, 2]
  x2 = line[/(\d+)[,](\d+)$/, 1]
  y2 = line[/(\d+)[,](\d+)$/, 2]

  case command
  when "turn on"
    for i in x1..x2
      for j in y1..y2
        lights["#{i}, #{j}"] = true
      end
    end
  when "turn off"
    for i in x1..x2
      for j in y1..y2
        lights["#{i}, #{j}"] = false
      end
    end
  when "toggle"
    for i in x1..x2
      for j in y1..y2
        lights["#{i}, #{j}"] ^= true
      end
    end
  end
end

lights.keep_if { |key, value| value }
num_lit = lights.size

puts num_lit