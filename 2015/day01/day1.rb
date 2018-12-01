floor = 0
basement_entered = false

contents = File.open('input.txt', 'r') { |f| f.read }
contents.each_char.with_index(1) do |char, index|
  floor += char == '(' ? 1 : -1
  if !basement_entered && floor < 0
    basement_entered = true
    puts "Santa entered the basement at character position #{index}."
  end
end

puts floor