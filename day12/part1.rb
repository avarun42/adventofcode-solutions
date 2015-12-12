numSum = 0

contents = File.open('input.txt', 'r') { |f| f.read }

contents.each_line do |line|
  line.scan(/[-\d]+/) do |num|
    numSum += num.to_i
  end
end

puts numSum