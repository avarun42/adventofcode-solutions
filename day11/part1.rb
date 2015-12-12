def pass_requirements?(password)
  return  test_straight(password) &&
          test_pairs(password) &&
          password.slice(/[iol]/).nil?
end

def test_straight(password)
  password = password.chars
  x = password.slice_when { |before, after| after != before.next }.to_a
  return x.any? { |el| el.length >= 3 }
end

def test_pairs(password)
  pairs = password.scan(/([a-z])\1/).flatten.map { |el| el + el }
  otherPair = pairs.inject { |memo, pair| memo == pair ? memo : pair }
  return  pairs.length >= 2 &&
          otherPair != pairs[0]
end

password = File.open('input.txt', 'r') { |f| f.read }.strip

password.next! until pass_requirements?(password)

puts password