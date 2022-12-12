# Creates a new transaction object
class Transaction
  attr_accessor :amount, :date, :credit

  def initialize(amount, date)
    @amount = amount
    @date = date
  end
end
