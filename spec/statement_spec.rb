require 'statement'

RSpec.describe 'Statement' do
  it 'prints the header to the console' do
    statement = Statement.new
    expect(statement.print_header).to eq "date || credit || debit || balance"
  end
end