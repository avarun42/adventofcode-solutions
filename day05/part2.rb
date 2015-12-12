num_nice = 0

contents = File.open('input.txt', 'r') { |f| f.read }
contents.each_line do |line|
  next if line.match(/([a-z])([a-z]).*\1\2/).nil?
  next if line.match(/([a-z])[a-z]\1/).nil?
  num_nice += 1
end

puts num_nice