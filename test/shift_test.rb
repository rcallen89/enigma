require_relative './test_helper'
require_relative '../lib/shift'
require 'mocha/minitest'

class ShiftTest < Minitest::Test 
  def setup
    @shift = Shift.new
    @shift2 = Shift.new("01234", "100120")
  end

  def test_it_exists_with_default_values_random_with_todays_date
    assert_instance_of Shift, @shift

    @shift.stubs(:date_info => 100120)
    
    assert_equal 5, @shift.key.length
    assert_equal 100120, @shift.date_info
  end

  def test_can_pass_own_values
    assert_equal "01234", @shift2.key
    assert_equal 100120, @shift2.date_info
  end

  def test_key_can_be_broken_down_to_consecutive_arrays
    expected = [01, 12, 23, 34]

    assert_equal expected, @shift2.key_breaker
  end

  def test_date_can_be_return_last_4_of_squared_amount_in_array
    expected = [4, 4, 0, 0]

    assert_equal expected, @shift2.date_manipulator
  end

  def test_broken_keys_can_be_added_to_date_array_returned_as_hash
    expected = {"A" => 5, "B" => 16, "C" => 23, "D" => 34}

    assert_equal expected, @shift2.create_shifts
  end
end