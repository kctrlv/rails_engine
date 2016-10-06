class Merchant < ApplicationRecord
  has_many :invoices
  has_many :items
  has_many :transactions, through: :invoices
  has_many :customers, through: :invoices

  def revenue
    invoices.map { |invoice| invoice.total }.sum
  end

  def customers_with_pending_invoices
    customers_with_transactions.merge(Transaction.pending).distinct
  end

  def customers_with_transactions
    customers.joins("join transactions on transactions.invoice_id = invoices.id")
  end

  def favorite_customers
    customers.joins(:transactions)
             .merge(Transaction.successful)
             .group(:id)
             .order("transactions.count DESC")
  end

  def favorite_customer
    favorite_customers.take
  end
end
