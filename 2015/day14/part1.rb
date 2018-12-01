reindeer = []

contents = File.open('input.txt', 'r') { |f| f.read }

contents.each_line do |line|
  cur_reindeer = [] # speed, fly_time, rest_time, time_remaining, and distance_flown
  line.scan(/[0-9]+/) do |num|
    num = num.to_i
    cur_reindeer.push(num)
  end
  cur_reindeer.push(2503) #time_remaining
  cur_reindeer.push(0) #distance_flown

  reindeer.push(cur_reindeer)
end

reindeer.each do |cur_reindeer|
  while cur_reindeer[3] > 0 #time_remaining
    time_to_fly = cur_reindeer[3] < cur_reindeer[1] ? cur_reindeer[3] : cur_reindeer[1] #compare time_remaining against fly_time
    cur_reindeer[4] += time_to_fly * cur_reindeer[0] #time * speed = distance_flown
    cur_reindeer[3] -= (time_to_fly + cur_reindeer[2]) #time_to_fly + rest_time
  end
end

times = reindeer.transpose[4]

puts times.max