$circuit = Hash.new

def number_or_nil(string)
  Integer(string || '')
rescue ArgumentError
  nil
end

def evaluate(wire)
  if number_or_nil(wire).nil?
    wire = find_value(wire)
  end

  return Integer(wire)
end


def find_value(wire)
  unless $circuit[wire].respond_to?(:split)
    return $circuit[wire]
  end

  expression = $circuit[wire].split
  case expression.length
  when 3
    wire1 = expression[0]
    gate = expression[1]
    wire2 = expression[2]

    wire1 = evaluate(wire1)
    wire2 = evaluate(wire2)

    case gate
    when "AND"
      result = wire1 & wire2
    when "OR"
      result = wire1 | wire2
    when "LSHIFT"
      result = wire1 << wire2
    when "RSHIFT"
      result = wire1 >> wire2
    end

    $circuit[wire] = result
  when 2
    gate = expression[0]
    wire1 = expression[1]

    wire1 = evaluate(wire1)

    if gate == "NOT"
      $circuit[wire] = ~wire1
    end
  when 1
    wire1 = expression[0]

    wire1 = evaluate(wire1)

    $circuit[wire] = wire1
  end

  return $circuit[wire]
end

contents = File.open('input.txt', 'r') { |f| f.read }
contents.each_line do |line|
  wire = line[/[>]\s([a-z]+)$/, 1].strip
  value = line[/^(.+)[-]/, 1].strip

  $circuit[wire] = value
end

signalToA = find_value("a")

puts signalToA