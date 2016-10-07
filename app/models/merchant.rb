class Merchant < ApplicationRecord
  has_many :invoices
  has_many :items
  has_many :invoice_items, through: :invoices
  has_many :transactions, through: :invoices
  has_many :customers, through: :invoices

  def revenue
    merchant_paid_invoice_items.map do |invoice_item|
      invoice_item['quantity'] * invoice_item['unit_price']
    end.reduce(:+)
  end

  def revenue_by_date(invoice_date)
    paid_invoice_items_by_date(invoice_date).map do |invoice_item|
      invoice_item['quantity'] * invoice_item['unit_price']
    end.reduce(:+)
  end

  def paid_invoice_items_by_date(invoice_date)
    paid_invoices_by_date(invoice_date).map do |invoice|
      InvoiceItem.where(invoice_id: invoice)
    end.flatten
  end

  def paid_invoices_by_date(invoice_date)
    invoices_by_date(invoice_date).joins(:transactions)
                                  .where(transactions: { result: 'success' })
  end

  def invoices_by_date(invoice_date)
    invoices.where(created_at: invoice_date)
  end

  def merchant_paid_invoice_items
    paid_invoices.map do |invoice|
      InvoiceItem.where(invoice_id: invoice)
    end.flatten
  end

  def paid_invoices
    invoices.joins(:transactions).where(transactions: { result: 'success' })
  end

  def customers_with_pending_invoices
    customers_with_transactions.merge(Transaction.pending).distinct
  end

  def customers_with_transactions
    customers.joins("join transactions on transactions.invoice_id = invoices.id")
  end

  def favorite_customers
    customers.joins(:transactions).merge(Transaction.successful).group(:id)
  end

  def sorted_favorite_customers
    favorite_customers.order("transactions.count DESC")
  end

  def favorite_customer
    sorted_favorite_customers.take
  end

  def self.total_revenue_by_date(date)
    joins(invoices: [:invoice_items, :transactions])
      .where(invoices: { created_at: date },
             transactions: { result: 'success' })
             .sum("invoice_items.unit_price * invoice_items.quantity")
  end

  def self.merchants_by_invoice_items
    Merchant.joins(:invoice_items).merge(Invoice.successful).group(:id)
  end

  def self.sorted_merchants_by_revenue
    merchants_by_invoice_items.order('sum(invoice_items.quantity * invoice_items.unit_price) DESC')
  end

  def self.sorted_merchants_by_most_sold
    merchants_by_invoice_items.order('sum(invoice_items.quantity) DESC')
  end

  def self.top_items_by_revenue(x)
    sorted_merchants_by_revenue.take(x)
  end

  def self.top_items_sold(x)
    sorted_merchants_by_most_sold.take(x)
  end
end
