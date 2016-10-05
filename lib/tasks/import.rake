require 'csv'

namespace :import do

  desc "Imports CSV files into ActiveRecord tables"
  task :merchants, [:filename] => :environment do
    Merchant.delete_all
    CSV.foreach('data/merchants.csv', :headers => true) do |row|
      Merchant.create!(row.to_hash)
    end
  end

  task :customers, [:filename] => :environment do
    Customer.delete_all
    CSV.foreach('data/customers.csv', :headers => true) do |row|
      Customer.create!(row.to_hash)
    end
  end

  task :invoices, [:filename] => :environment do
    Invoice.delete_all
    CSV.foreach('data/invoices.csv', :headers => true) do |row|
      Invoice.create!(row.to_hash)
    end
  end

  task :items, [:filename] => :environment do
    Item.delete_all
    CSV.foreach('data/items.csv', :headers => true) do |row|
      Item.create!(row.to_hash)
    end
  end

  task :invoice_items, [:filename] => :environment do
    InvoiceItem.delete_all
    CSV.foreach('data/invoice_items.csv', :headers => true) do |row|
      InvoiceItem.create!(row.to_hash)
    end
  end

  task :transactions, [:filename] => :environment do
    Transaction.delete_all
    CSV.foreach('data/transactions.csv', :headers => true) do |row|
      Transaction.create!(row.to_hash)
    end
  end



end
