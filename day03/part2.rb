num_houses = 0
santa_list = { "0, 0" => true }
robo_list = { "0, 0" => true }
x, y = 0, 0
x2, y2 = 0, 0

contents = File.open('input.txt', 'r') { |f| f.read }
contents.each_char.with_index do |char, index|
  if index % 2 == 0
    if char == '^'
      y += 1
    elsif char == 'v'
      y -= 1
    elsif char == '>'
      x += 1
    elsif char == '<'
      x -= 1
    end
    santa_list["#{x}, #{y}"] = true
  else
    if char == '^'
      y2 += 1
    elsif char == 'v'
      y2 -= 1
    elsif char == '>'
      x2 += 1
    elsif char == '<'
      x2 -= 1
    end
    robo_list["#{x2}, #{y2}"] = true
  end
end

santa_list.keep_if { |key, value| value }
robo_list.keep_if { |key, value| value }
house_list = santa_list.merge(robo_list)

num_houses = house_list.size

puts num_houses