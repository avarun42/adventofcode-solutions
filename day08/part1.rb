totalCharsOfCode = 0
totalCharsOfString = 0

contents = File.open('input.txt', 'r') { |f| f.read }

contents.each_line do |line|
  numCharsOfCode = line.length

  numCharsOfString = numCharsOfCode - 2 #account for quotes on either end

  until line.slice!(/\\\\/).nil? #account for escaped backslashes
    numCharsOfString -= 1
  end

  until line.slice!(/\\"/).nil? #account for escaped double-quote characters
    numCharsOfString -= 1
  end

  until line.slice!(/\\x/).nil? #account for escaped hexadecimal sequences
    numCharsOfString -= 3
  end

  totalCharsOfCode += numCharsOfCode
  totalCharsOfString += numCharsOfString
end

puts totalCharsOfCode - totalCharsOfString