class Invoice < ApplicationRecord
  belongs_to :customer
  belongs_to :merchant

  has_many :transactions
  has_many :invoice_items

  def total
    
  end

  def has_transactions?
    !transactions.empty?
  end

  def paid_in_full?
    has_transactions? && transactions.any? do |transaction|
      transaction.result == "success"
    end
  end
end
