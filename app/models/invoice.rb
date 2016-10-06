class Invoice < ApplicationRecord
  belongs_to :customer
  belongs_to :merchant

  has_many :transactions
  has_many :invoice_items
  has_many :items, through: :invoice_items

  def total
    invoice_items.map do |invoice_item|
      invoice_item.total
    end.reduce(:+) #if paid_in_full?
  end

  def paid_in_full?
    transactions.exists?(result: "success")
  end
end
