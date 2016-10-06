require 'rails_helper'

RSpec.describe Merchant, type: :model do
  it { should have_many(:invoices) }

  it { should have_many(:items) }

  it "can calculate its own revenue" do
    merchant       = create(:merchant)
    invoice_1      = create(:invoice, merchant: merchant)
    invoice_2      = create(:invoice, merchant: merchant)
    invoice_item_1 = create(:invoice_item, invoice: invoice_1, quantity: 1, unit_price: 1000)
    invoice_item_2 = create(:invoice_item, invoice: invoice_1, quantity: 1, unit_price: 1500)
    invoice_item_3 = create(:invoice_item, invoice: invoice_2, quantity: 2, unit_price: 200)
    invoice_item_4 = create(:invoice_item, invoice: invoice_2, quantity: 2, unit_price: 300)
    transaction_1  = create(:transaction, invoice: invoice_1, result: "failed")
    transaction_2  = create(:transaction, invoice: invoice_1, result: "success")

    expect(merchant.revenue).to eq(3500.00)
  end
end
