require 'digest/md5'

key = File.open('input.txt', 'r') { |f| f.read }
key.strip!
answer = 0

loop do
  answer += 1
  hash = Digest::MD5.hexdigest(key + answer.to_s)

  break if hash.start_with?("000000")
end

puts answer