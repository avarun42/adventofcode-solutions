num_lit = 0
lights = Hash.new

for i in 0..999
  for j in 0..999
    lights["#{i}, #{j}"] = 0
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
        lights["#{i}, #{j}"] += 1
      end
    end
  when "turn off"
    for i in x1..x2
      for j in y1..y2
        lights["#{i}, #{j}"] -= 1 unless lights["#{i}, #{j}"] < 1
      end
    end
  when "toggle"
    for i in x1..x2
      for j in y1..y2
        lights["#{i}, #{j}"] += 2
      end
    end
  end
end

lights.each do |key, value|
  num_lit += value
end

puts num_lit