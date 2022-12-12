class Statement
  def initialize
    @balance = 0
    @transactions_list = []
  end

  def display(transactions)
    print_header
    if transactions.empty?
      print_empty
    else
      print_transactions(transactions)
      @transactions_list.reverse.map do |transaction|
      p transaction
      end
    end
  end

  def print_transactions(transactions)
    transactions.map do |transaction|
      if transaction.credit == 'true'
        @balance += transaction.amount
        @transactions_list << "#{transaction.date} || #{convert(transaction.amount)} || || #{convert(@balance)}"
      else
        @balance -= transaction.amount
        @transactions_list << "#{transaction.date} || || #{convert(transaction.amount)} || #{convert(@balance)}"
      end
    end
  end

  def print_header
    p "date || credit || debit || balance"
  end

  def print_empty
    p "  ||  ||  || #{convert(@balance)}"
  end

  private

  def convert(value)
    return sprintf('%.2f', value)
  end

end