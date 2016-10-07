class Transaction < ApplicationRecord
  belongs_to :invoice
  has_one :merchant, through: :invoice
  has_one :customer, through: :invoice

  scope :pending, -> { where(result: "failed") }
  scope :successful, -> { where(result: "success") }

end
