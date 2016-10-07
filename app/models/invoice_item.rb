class InvoiceItem < ApplicationRecord
  belongs_to :item
  belongs_to :invoice

  def total
    quantity * unit_price
  end
end
