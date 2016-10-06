class Customer < ApplicationRecord
  has_many :invoices
  has_many :transactions, through: :invoices

  # def merchants
  #   transactions.where(result: 'success')
  # end
end
