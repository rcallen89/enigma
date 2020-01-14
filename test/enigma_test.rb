require_relative './test_helper'
require_relative '../lib/enigma'
require 'mocha/minitest'

class EnigmaTest < Minitest::Test
  def setup
    @enigma = Enigma.new
  end

  def test_enigma_exists_with_starting_attributes
    assert_instance_of Enigma, @enigma
  end

  def test_message_can_be_broken_down
    message = "hello world"
    expected = [["h", "e", "l", "l"], 
                 ["o", " ", "w", "o"],
                 ["r", "l", "d"]]

    assert_equal expected, @enigma.message_breakdown(message)
  end

  def test_message_will_adjust_casing
    message = "HELLO world"
    expected = [["h", "e", "l", "l"], 
                 ["o", " ", "w", "o"],
                 ["r", "l", "d"]]

    assert_equal expected, @enigma.message_breakdown(message)
    
  end

  def test_message_can_be_shifted
    message = "hello world"

    expected = [["k", "e", "d", "e"], 
              ["r", " ", "o", "h"],
              ["u", "l", "w"]]


    assert_equal expected, @enigma.message_shifter(message, [3, 27, 73, 20], "e")
  end

  def test_encrypt_message_encrypts_and_returns_hash
    expected = {
                  encryption: "keder ohulw",
                  key: "02715",
                  date: "040895"
                }

    assert_equal expected, @enigma.encrypt("hello world", "02715", "040895")
  end

  def test_letter_can_be_shifted
    array = ['a', 'b', 'c', 'd']
    array2 = ['a', 'b', ',', 'd']

    assert_equal ["b", "c", "d", "e"], @enigma.letter_shifter(array, [1, 1, 1, 1], "e")
    assert_equal ["b", "c", ",", "e"], @enigma.letter_shifter(array2, [1, 1, 1, 1], "e")
  end

  def test_broken_message_can_be_joined
    broken = [["k", "e", "d", "e"], 
              ["r", " ", "o", "h"],
              ["u", "l", "w"]]

    assert_equal "keder ohulw", @enigma.joiner(broken)
  end

  def test_encrypt_can_ignore_punctuation
    expected = {
                  encryption: "keder ohulw!",
                  key: "02715",
                  date: "040895"
                }

    assert_equal expected, @enigma.encrypt("hello world!", "02715", "040895")
  end

  def test_encryption_can_change_casing
    expected = {
                  encryption: "keder ohulw",
                  key: "02715",
                  date: "040895"
                }

    assert_equal expected, @enigma.encrypt("hello WORLD", "02715", "040895")
  end

  def test_encryption_can_handle_smaller_messages
    expected = {
                  encryption: "ked",
                  key: "02715",
                  date: "040895"
                }

    assert_equal expected, @enigma.encrypt("hel", "02715", "040895")
  end

  def test_letters_can_be_uncoded
    scrambled = ["b", "c", "d", "e"]

    assert_equal ['a', 'b', 'c', 'd'], @enigma.letter_shifter(scrambled, [1, 1, 1, 1], "d")
  end

  def test_letters_can_be_uncoded_with_punctuation
    scrambled = ["b", "c", ",", "e"]

    assert_equal ['a', 'b', ',', 'd'], @enigma.letter_shifter(scrambled, [1, 1, 1, 1], "d")
  end

  def test_message_can_be_decrypted
    expected = {
                  decryption: "hello world",
                  key: "02715",
                  date: "040895"
                }

                # require 'pry'; binding.pry

    assert_equal expected, @enigma.decrypt("keder ohulw", "02715", "040895")
  end

  def test_encoded_message_can_be_cracked

    expected = {
                  decryption: "hello world end",
                  date: "291018",
                  key: "08304"
                }
                
    assert_equal expected, @enigma.crack("vjqtbeaweqihssi", "291018")
  end

end