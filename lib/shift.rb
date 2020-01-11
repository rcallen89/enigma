class Shift
  attr_reader :key, :date_info, :shifts_table

  def initialize(key = Array.new(5){rand(10)}.join, date = DateTime.now.strftime('%d%m%y'))
    @key = key_verification(key.to_s)
    @date_info = date.to_i
    @shifts_table = create_shifts
  end

  def key_verification(key)
    return key if key != nil && key.length == 5
    until key.length == 5
      key = key.chars.unshift("0").join
    end
    return key
  end

  def key_breaker
    broken_key = []
    @key.chars.each_cons(2) do |breakdown|
      broken_key << breakdown.join.to_i
    end
    broken_key
  end

  def date_manipulator
    (date_info**2).to_s.chars[-4..-1].map {|num| num.to_i}
  end

  def create_shifts
    key_breaker.each_with_index.reduce({}) do |acc, (key_ele, index)|
      acc[(65 + index).chr] = key_ele + date_manipulator[index]
      acc
    end
  end

end
