require 'set'
num_nice = 0
DISALLOWED = Set.new ["ab", "cd", "pq", "xy"]

contents = File.open('input.txt', 'r') { |f| f.read }
contents.each_line do |line|
  next if DISALLOWED.any? do |word|
    line.include?(word)
  end
  next if line.count("aeiou") < 3
  next if line.match(/(.)\1{1,}/).nil?
  num_nice += 1
end

puts num_nice