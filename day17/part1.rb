containers = []
EGGNOG_VOLUME = 150

contents = File.open('input.txt', 'r') { |f| f.read }

contents.each_line do |line|
  containers.push(line.strip.to_i)
end

containers.sort! { |x,y| y <=> x }

def num_combos(containers, index, sum)
  sum += containers[index]
  if sum > EGGNOG_VOLUME
    return 0
  elsif sum == EGGNOG_VOLUME
    return 1
  else
    num_combinations = 0
    (index + 1).upto(containers.length - 1) do |i|
      num_combinations += num_combos(containers, i, sum)
    end
    return num_combinations
  end
end

num_combinations =  0
containers.each.with_index do |container, index|
  num_combinations += num_combos(containers, index, 0)
end

p num_combinations