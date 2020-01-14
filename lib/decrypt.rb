require_relative './enigma'

enigma = Enigma.new

to_decode = File.open(ARGV[0], "r") {|file| file.read}

decoded_info = enigma.decrypt(to_decode, *ARGV[2..3])

writer = File.open(ARGV[1], "w") {|file| file.write(decoded_info[:decryption])}

p "Created #{ARGV[1]} with the key #{decoded_info[:key]} and date #{decoded_info[:date]}"