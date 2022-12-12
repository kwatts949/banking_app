class Statement
  def initialize
    @balance = 0
  end

  def display(transactions)
    print_header
    print_transactions(transactions)
  end

  def print_transactions(transactions)
    p transactions
    transactions.map do |transaction|
      if transaction.credit == 'true'
        p "#{transaction.date} || #{transaction.amount} || #{@balance}"
      end
    end
  end

  def print_header
    return "date || credit || debit || balance"
  end
end