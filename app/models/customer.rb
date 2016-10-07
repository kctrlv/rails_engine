class Customer < ApplicationRecord
  has_many :invoices
  has_many :transactions, through: :invoices
  has_many :merchants, through: :invoices

  def favorite_merchants
    merchants.joins(:transactions).merge(Transaction.successful).group(:id)
  end

  def sorted_favorite_merchants
    favorite_merchants.order("transactions.count DESC")
  end

  def favorite_merchant
    sorted_favorite_merchants.take
  end
end
