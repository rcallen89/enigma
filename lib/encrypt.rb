require_relative './enigma'

enigma = Enigma.new

to_encode = File.open(ARGV[0], "r") {|file| file.read}

encoded_info = enigma.encrypt(to_encode, *ARGV[2..3])

writer = File.open(ARGV[1], "w") {|file| file.write(encoded_info[:encryption])}

p "Created #{ARGV[1]} with the key #{encoded_info[:key]} and date #{encoded_info[:date]}"