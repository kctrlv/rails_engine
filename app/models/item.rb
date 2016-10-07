class Item < ApplicationRecord
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  def self.items_by_invoice
    Item.joins(:invoices).merge(Invoice.successful).group(:id)
  end

  def self.sorted_items_by_revenue
    items_by_invoice.order('sum(invoice_items.quantity * invoice_items.unit_price) DESC')
  end

  def self.sorted_items_by_most_sold
    items_by_invoice.order('sum(invoice_items.quantity) DESC')
  end

  def self.top_items_by_revenue(x)
    sorted_items_by_revenue.take(x)
  end

  def self.top_items_sold(x)
    sorted_items_by_most_sold.take(x)
  end
end
