class Statement
  def initialize
    @balance = 0
  end

  def display(transactions)
    print_header
    if transactions.empty?
      p "  ||  ||  || #{convert(@balance)}"
    else
      print_transactions(transactions)
    end
  end

  def print_transactions(transactions)
    transactions.map do |transaction|
      if transaction.credit == 'true'
        @balance += transaction.amount
        p "#{transaction.date} || #{convert(transaction.amount)} ||  || #{convert(@balance)}"
      else
        @balance -= transaction.amount
        p "#{transaction.date} ||  || #{convert(transaction.amount)} || #{convert(@balance)}"
      end
    end
  end

  def print_header
    p "date || credit || debit || balance"
  end

  def convert(value)
    return sprintf('%.2f', value)
  end
end