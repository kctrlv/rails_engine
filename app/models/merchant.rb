class Merchant < ApplicationRecord
  has_many :invoices
  has_many :items
  has_many :transactions, through: :invoices

  def revenue
    # invoices.map { |invoice| invoice.total }.sum
    byebug

  end

  def merchant_paid_invoice_items
    paid_invoices.map do |invoice|
      InvoiceItem.where(invoice_id: invoice)
    end
  end

  def paid_invoices
    invoices.joins(:transactions).where(transactions: { result: 'success' })
  end
end
