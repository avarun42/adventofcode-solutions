reindeer = []

contents = File.open('input.txt', 'r') { |f| f.read }

contents.each_line do |line|
  cur_reindeer = [] # speed, fly_time, rest_time, fly_time_remaining, rest_time_remaining, distance_flown, and points
  line.scan(/[0-9]+/) do |num|
    num = num.to_i
    cur_reindeer.push(num)
  end
  cur_reindeer.push(cur_reindeer[1]) #fly_time_remaining
  cur_reindeer.push(0) #rest_time_remaining
  cur_reindeer.push(0) #distance_flown
  cur_reindeer.push(0) #points

  reindeer.push(cur_reindeer)
end

2503.times do
  reindeer.each do |cur_reindeer|
    if cur_reindeer[3] > 0 #fly_time_remaining
      cur_reindeer[5] += cur_reindeer[0] #distance_flown += speed
      cur_reindeer[3] -= 1
      cur_reindeer[4] = cur_reindeer[2] if cur_reindeer[3] == 0 #rest_time_remaining
    elsif cur_reindeer[4] > 0 #rest_time_remaining
      cur_reindeer[4] -= 1
      cur_reindeer[3] = cur_reindeer[1] if cur_reindeer[4] == 0
    end
  end

  winning_reindeer = []
  max_speed = reindeer.transpose[5].max
  reindeer.each_with_index { |cur, index| winning_reindeer.push(index) if cur[5] >= max_speed }

  winning_reindeer.each { |index| reindeer[index][6] += 1 }
end

scores = reindeer.transpose[6]

puts scores.max