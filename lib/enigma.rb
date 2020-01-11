class Enigma

  def initialize
    @char_array = ("a".."z").to_a << " "
  end

  def encrypt(message, key = Array.new(5){rand(10)}.join, date = DateTime.now.strftime('%d%m%y'))
    {encryption: joiner(message_shifter(message, key, date)),
    key: key,
    date: date}
  end

  def decrypt(message, key = Array.new(5){rand(10)}.join, date = DateTime.now.strftime('%d%m%y'))
    {decryption: joiner(message_shifter(message, key, date, "d")),
    key: key,
    date: date}
  end

  def message_breakdown(message)
    char_slices = []
    message.downcase.chars.each_slice(4) {|mess_break| char_slices << mess_break}
    char_slices
  end

  def message_shifter(message, key, date, flag = "e")
    shift_info = Shift.new(key, date)
    broken_message = message_breakdown(message)
    broken_message.map.with_index do |char_slice, index|
      letter_shifter(char_slice, shift_info.shifts_table.values, flag)
    end
  end

  def letter_shifter(array, shift_amounts, flag)
    array.map.with_index do |char, index|
      if @char_array.include?(char)
        if flag == "e"
          shifted = @char_array.rotate(shift_amounts[index])
          char_index = @char_array.index(char)
          char = shifted[char_index]
        else
          shifted = @char_array.rotate(shift_amounts[index])
          char_index = shifted.index(char)
          char = @char_array[char_index]
        end
      else
        char
      end
    end
  end

  def joiner(broken_message)
      broken_message.flatten.join
  end

end