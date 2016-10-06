class Merchant < ApplicationRecord
  has_many :invoices
  has_many :items
  has_many :transactions, through: :invoices
  has_many :customers, through: :invoices

  def revenue
    merchant_paid_invoice_items.map do |invoice_item|
      invoice_item['quantity'] * invoice_item['unit_price']
    end.reduce(:+).to_f
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
end
