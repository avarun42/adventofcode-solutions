num_houses = 0
house_list = { "0, 0" => true }
x, y = 0, 0

contents = File.open('input.txt', 'r') { |f| f.read }
contents.each_char do |char|
  if char == '^'
    y += 1
  elsif char == 'v'
    y -= 1
  elsif char == '>'
    x += 1
  elsif char == '<'
    x -= 1
  end

  house_list["#{x}, #{y}"] = true;
end

house_list.keep_if { |key, value| value }
num_houses = house_list.size

puts num_houses