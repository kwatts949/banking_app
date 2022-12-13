require_relative './transaction'
require_relative './statement'

# Main class & user interface
class Account
  attr_reader :transactions

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
end
