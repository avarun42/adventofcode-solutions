sequence = File.open('input.txt', 'r') { |f| f.read }.strip

50.times do
  sequence.gsub!(/(\d)\1*/) do |s|
    s.length.to_s + $1
  end
end

puts sequence.length