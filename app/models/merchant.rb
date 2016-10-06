class Merchant < ApplicationRecord
  has_many :invoices
  has_many :items
  has_many :transactions, through: :invoices

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
end
