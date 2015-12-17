aunts = []
MINIMUM_RANGE_COMPOUNDS = ['cats', 'trees']
MAXIMUM_RANGE_COMPOUNDS = ['pomeranians', 'goldfish']

contents = File.open('input.txt', 'r') { |f| f.read }

contents.each_line do |line|
  aunt = Hash.new
  line.scan(/([a-zA-Z]+):\s([0-9]+)/) do |compound, number|
    aunt[compound] = number.to_i
  end

  aunts.push(aunt)
end
sues = aunts

analysis = File.open('analysis.txt', 'r') { |f| f.read }
analysis.each_line do |line|
  compound = line[/^([a-zA-Z]+):/, 1]
  number = line[/:\s([0-9]+)$/, 1].to_i

  sues = sues.select do |aunt|
    next(true) if aunt[compound].nil?
    if MINIMUM_RANGE_COMPOUNDS.include?(compound)
     next(true) if aunt[compound] > number
    elsif MAXIMUM_RANGE_COMPOUNDS.include?(compound)
      next(true) if aunt[compound] < number
    else
      next(true) if aunt[compound] == number
    end
  end
end

p aunts.index(sues.first) + 1