class Shift
  attr_reader :key, :date_info, :key_hash

  def initialize(key = Array.new(5){rand(10)}.join, date = DateTime.now.strftime('%d%m%y'))
    @key = key
    @date_info = date
    @hash = create_hash
  end

  def key_breaker
    
  end

end