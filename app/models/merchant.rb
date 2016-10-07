class Merchant < ApplicationRecord
  has_many :invoices
  has_many :items
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
    invoices_by_date(invoice_date).joins(:transactions).
                                   where(transactions: { result: 'success' })
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
end
