require_relative 'bank'

business_checking = BankAccount.new('Business Checking')
purchasing_account = BankAccount.new('Purchasing Account')
# business_checking_transactions = BankTransaction.new('Business Checking')
# purchasing_account_transactions = BankTransaction.new('Purchasing Account')

puts "=== Purchasing Account ==="
puts "Starting balance: $#{purchasing_account.balance}"
puts "Ending balance: $#{purchasing_account.current_balance}"

purchasing_account.summary.each do |x|
  puts "$#{x.amount.abs} #{x.withdrawal_deposit} #{x.date} - #{x.description}"
end
puts

puts "=== Business Checking ==="
puts "Starting balance: $#{business_checking.balance}"
puts "Ending balance: $#{business_checking.current_balance}"

business_checking.summary.each do |x|
  puts "$#{x.amount.abs} #{x.withdrawal_deposit} #{x.date} - #{x.description}"
end
puts "========"
