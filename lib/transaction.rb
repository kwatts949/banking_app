class Transaction
  def initialize(amount, date)
    @amount = amount
    @date = date
  end

  def amount
    return @amount
  end
end