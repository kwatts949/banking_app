require_relative './transaction'
require_relative './statement'

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
    @statement.display(@transactions)
  end

  def transactions
    @transactions
  end
end

=begin
account = Account.new

transaction_1 = Transaction.new(1000, "10-01-2023")
transaction_2 = Transaction.new(2000, "13-01-2023")
transaction_3 = Transaction.new(500, "14-01-2023")

account.deposit(transaction_1)
account.deposit(transaction_2)
account.withdraw(transaction_3)

account.print_statement
=end