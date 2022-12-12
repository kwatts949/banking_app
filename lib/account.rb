class Account
  def initialize
    @transactions = []
  end

  def deposit(transaction)
    transaction.credit = 'true'
    @transactions.push(transaction)
  end

  def withdraw(transaction)
    @transactions.push(transaction)
  end

  def transactions
    p @transactions
    return @transactions
  end
end