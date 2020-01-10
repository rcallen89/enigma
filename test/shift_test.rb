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

    x = DateTime.now.strftime('%d%m%y')
    assert_equal 5, @shift.key.length
    assert_equal x, @shift.date_info
  end

  def test_can_pass_own_values
    assert_equal "01234", @shift2.key
    assert_equal "100120", @shift2.date_info
  end

  def test_key_can_be_broken_down_to_consecutive_arrays
  
  end
end