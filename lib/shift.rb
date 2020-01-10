class Shift
  attr_reader :key, :date_info, :key_hash

  def initialize(key = Array.new(5){rand(10)}.join, date = DateTime.now.strftime('%d%m%y'))
    @key = key
    @date_info = date
  end

  def key_breaker
    broken_key = []
    @key.chars.each_cons(2) do |breakdown|
      broken_key << breakdown.join.to_i
    end
    broken_key
  end

end