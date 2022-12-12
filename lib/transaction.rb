class Transaction
  attr_accessor :credit
  
  def initialize(amount, date)
    @amount = amount
    @date = date
  end

  def amount
    return @amount
  end

  def date
    return @date
  end
end