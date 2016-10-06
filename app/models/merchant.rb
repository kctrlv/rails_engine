class Merchant < ApplicationRecord
  has_many :invoices
  has_many :items
  has_many :transactions, through: :invoices

  def revenue
    invoices.map { |invoice| invoice.total }.sum
  end
end
