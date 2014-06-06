require 'sinatra'
require 'csv'
require 'shotgun'
require 'pry'
require_relative 'bank'

get '/accounts' do

  @business_checking = BankAccount.new('Business Checking')
  @purchasing_account = BankAccount.new('Purchasing Account')
  erb :accounts
end

get '/accounts/:account' do
  @business_checking = BankAccount.new('Business Checking')
  @purchasing_account = BankAccount.new('Purchasing Account')

  accounts_list = [@business_checking, @purchasing_account]
  accounts_list.each do |acc|
    if params[:account] == acc.account
      @account_details = acc
    end
  end

  erb :show
end
