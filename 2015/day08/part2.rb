totalCharsOfCode = 0
totalCharsOfNewCode = 0

contents = File.open('input.txt', 'r') { |f| f.read }

contents.each_line do |line|
  numCharsOfCode = line.length

  numCharsOfNewCode = numCharsOfCode + 4 #account for quotes on either end

  until line.slice!(/\\\\/).nil? #account for escaped backslashes
    numCharsOfNewCode += 2
  end

  until line.slice!(/\\"/).nil? #account for escaped double-quote characters
    numCharsOfNewCode += 2
  end

  until line.slice!(/\\x/).nil? #account for escaped hexadecimal sequences
    numCharsOfNewCode += 1
  end

  totalCharsOfCode += numCharsOfCode
  totalCharsOfNewCode += numCharsOfNewCode
end

puts totalCharsOfNewCode - totalCharsOfCode