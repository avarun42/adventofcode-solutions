containers = []
EGGNOG_VOLUME = 150

contents = File.open('input.txt', 'r') { |f| f.read }

contents.each_line do |line|
  containers.push(line.strip.to_i)
end

containers.sort! { |x,y| y <=> x }

def generate_combos(containers, index, sum, used)
  sum += containers[index]
  used += [containers[index]]
  if sum > EGGNOG_VOLUME
    return []
  elsif sum == EGGNOG_VOLUME
    return used
  else
    possible_combos = []
    (index + 1).upto(containers.length - 1) do |i|
      possible_combos.push(generate_combos(containers, i, sum, used))
    end
    return possible_combos.reject { |combo| combo.empty? }
  end
end

possible_combos = []
containers.each.with_index do |container, index|
  possible_combos.push(generate_combos(containers, index, 0, []))
end
possible_combos.reject! { |combo| combo.empty? }

until possible_combos.none? { |x| x[0].is_a?(Array) }
  combos = []
  possible_combos.each do |combo|
    if combo[0].is_a?(Array)
      combo.each { |x| combos.push(x) }
    else
      combos.push(combo)
    end
  end
  possible_combos = combos
end

min_num_of_containers = possible_combos.min { |a, b| a.length <=> b.length }.length
possible_combos.reject! { |x| x.length != min_num_of_containers }

p possible_combos.length