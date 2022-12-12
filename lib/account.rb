class Account
  def initialize
    @transactions = []
    @statement = Statement.new
  end

  def deposit(transaction)
    transaction.credit = 'true'
    @transactions.push(transaction)
  end

  def withdraw(transaction)
    @transactions.push(transaction)
  end

  def print_statement
    @statement.display(@transaction)
  end

  def transactions
    p @transactions
    return @transactions
  end
end