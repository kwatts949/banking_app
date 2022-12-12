class Account
  def initialize
    @transactions = []
  end

  def deposit(transaction)
    @transactions.push(transaction)
  end

  def transactions
    return @transactions
  end
end