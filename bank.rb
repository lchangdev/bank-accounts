require 'csv'
require 'pry'

class BankAccount

attr_reader :account, :balance
  def initialize(account)
    CSV.foreach('balances.csv', headers: true, header_converters: :symbol) do |row|
      if row[:account] == account
        @account = account
        @balance = row[:balance].to_i
      end
    end

    @transaction_amounts = []
    @transaction_details = []
    CSV.foreach('bank_data.csv', headers: true, header_converters: :symbol) do |row|
      if row[:account] == account
        @transaction_amounts << row[:amount].to_i
        @transaction_details << row.to_hash
      end
    end
  end

  def starting_balance
    balance
  end

  def current_balance
    @transaction_amounts.each do |trans|
      @balance += trans
    end
    @balance
  end

  def summary
    #returns an array of all of the transaction summaries
    transaction_final = []
    @transaction_details.each do |transaction|
      transaction_final << BankTransaction.new(transaction)
    end
    transaction_final

  end

end

class BankTransaction

  attr_reader :date, :amount, :description, :account

  def initialize(transaction)
    @date = transaction[:date]
    @amount = transaction[:amount].to_i
    @description = transaction[:description]
    @account = transaction[:account]
  end

  def deposit?
    #returns true if the transaction was a deposit
    #as opposed to a withdrawal
    if @amount > 0
      return true
    else
      return false
    end

  end

  def withdrawal_deposit
    if deposit? == true
      'Deposit'
    else
      'Withdrawal'
    end
  end

  def summary
    #returns a string describing the transaction

  end
end




