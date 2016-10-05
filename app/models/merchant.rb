class Merchant < ApplicationRecord
  has_many :invoices
  has_many :items

  def revenue
    invoices.map { |invoice| invoice.total }.sum
  end
end
