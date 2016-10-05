require 'csv'

namespace :import do

  desc "Imports CSV files into ActiveRecord tables"
  task :merchants, [:filename] => :environment do
    puts "\t Clearing Merchants\n"
    Merchant.delete_all
    puts "\t Importing Merchants...\n\n"
    CSV.foreach('data/merchants.csv', :headers => true) do |row|
      Merchant.create!(row.to_hash)
    end
  end

  task :customers, [:filename] => :environment do
    puts "\t Clearing Customers\n"
    Customer.delete_all
    puts "\t Importing Customers...\n\n"
    CSV.foreach('data/customers.csv', :headers => true) do |row|
      Customer.create!(row.to_hash)
    end
  end

  task :invoices, [:filename] => :environment do
    puts "\t Clearing Invoices\n"
    Invoice.delete_all
    puts "\t Importing Invoices...\n\n"
    CSV.foreach('data/invoices.csv', :headers => true) do |row|
      Invoice.create!(row.to_hash)
    end
  end

  task :items, [:filename] => :environment do
    puts "\t Clearing Items\n"
    Item.delete_all
    puts "\t Importing Items...\n\n"
    CSV.foreach('data/items.csv', :headers => true) do |row|
      Item.create!(row.to_hash)
    end
  end

  task :invoice_items, [:filename] => :environment do
    puts "\t Clearing InvoiceItems\n"
    InvoiceItem.delete_all
    puts "\t Importing InvoiceItems...\n\n"

    CSV.foreach('data/invoice_items.csv', :headers => true) do |row|
      InvoiceItem.create!(row.to_hash)
    end
  end

  task :transactions, [:filename] => :environment do
    puts "Clearing Transactions\n"
    Transaction.delete_all
    puts "Importing Transactions...\n\n"
    CSV.foreach('data/transactions.csv', :headers => true) do |row|
      Transaction.create!(row.to_hash)
    end
  end

  task rebuild: ["db:drop", "db:create", "db:migrate"]

  task all: ["merchants", "customers", "invoices", "items", "invoice_items", "transactions"]
end
