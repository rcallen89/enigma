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


    assert_equal expected, @enigma.message_shifter(message, "02715", "040895")
  end

  def test_encrypt_message_encrypts_and_returns_hash
    skip
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

    assert_equal ["b", "c", "d", "e"], @enigma.letter_shifter(array, [1, 1, 1, 1])
    assert_equal ["b", "c", ",", "e"], @enigma.letter_shifter(array2, [1, 1, 1, 1])
  end

end